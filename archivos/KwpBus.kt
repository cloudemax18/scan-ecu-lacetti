package kwp

import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

/**
 * NO COMPILADO NI PROBADO. Capa de E/S K-Line para Android (usb-serial-for-android).
 * Todo acceso al puerto pasa por [transaccion]; el Tester Present solo se envía si el bus está libre.
 */
interface SerialIo {
    fun write(data: ByteArray)
    /** Lee como máximo [max] bytes esperando hasta [timeoutMs]. Devuelve vacío si no llegó nada. */
    fun read(max: Int, timeoutMs: Int): ByteArray
}

fun checksum(b: ByteArray, len: Int = b.size): Int {
    var s = 0
    for (i in 0 until len) s += b[i].toInt() and 0xFF
    return s and 0xFF
}

/** Trama KWP corta: [0x80|n, ecu, tester, datos..., checksum] (n <= 63). */
fun trama(ecu: Int, tester: Int, vararg datos: Int): ByteArray {
    val n = datos.size
    val f = ByteArray(3 + n + 1)
    f[0] = (0x80 or n).toByte(); f[1] = ecu.toByte(); f[2] = tester.toByte()
    for (i in 0 until n) f[3 + i] = datos[i].toByte()
    f[f.size - 1] = checksum(f, f.size - 1).toByte()
    return f
}

class KwpBus(
    private val io: SerialIo,
    private val scope: CoroutineScope,
    val ecu: Int,
    val tester: Int = 0xF1,
) {
    private val lock = Mutex()
    private var tpJob: Job? = null
    var log: (String) -> Unit = {}

    /** Envía [req], descarta el eco y devuelve la trama de respuesta completa (sin eco) o null. */
    suspend fun transaccion(req: ByteArray, timeoutMs: Long = 500): ByteArray? =
        lock.withLock { withContext(Dispatchers.IO) { intercambio(req, timeoutMs) } }

    fun iniciarTesterPresent(periodoMs: Long = 2000) {
        tpJob?.cancel()
        val tp = trama(ecu, tester, 0x3E)
        tpJob = scope.launch {
            while (isActive) {
                delay(periodoMs)
                if (lock.tryLock()) {            // si hay una transacción en curso, se salta este ciclo
                    try { withContext(Dispatchers.IO) { intercambio(tp, 300) } } finally { lock.unlock() }
                }
            }
        }
    }

    fun detenerTesterPresent() { tpJob?.cancel(); tpJob = null }

    // ---- bajo nivel (llamar siempre dentro de IO y con el lock tomado) ----

    private fun drenar() {
        var n = 0
        while (n++ < 20 && io.read(64, 2).isNotEmpty()) { /* descartar */ }
    }

    private fun leerExacto(n: Int, finMs: Long): ByteArray? {
        val out = ByteArray(n); var got = 0
        while (got < n) {
            val resto = (finMs - System.currentTimeMillis()).toInt()
            if (resto <= 0) return null
            val b = io.read(n - got, minOf(resto, 50))
            System.arraycopy(b, 0, out, got, b.size); got += b.size
        }
        return out
    }

    private fun intercambio(req: ByteArray, timeoutMs: Long): ByteArray? {
        Thread.sleep(5)                // separación mínima entre peticiones (P3min)
        drenar()
        io.write(req)
        var fin = System.currentTimeMillis() + timeoutMs
        val eco = leerExacto(req.size, fin) ?: return null
        if (!eco.contentEquals(req)) { drenar(); return null }
        while (true) {
            val fmt = leerExacto(1, fin) ?: return null
            val len0 = fmt[0].toInt() and 0x3F
            val hdr = if (len0 == 0) 4 else 3
            val cab = leerExacto(hdr - 1, fin) ?: return null
            val n = if (len0 == 0) cab[2].toInt() and 0xFF else len0
            val cuerpo = leerExacto(n + 1, fin) ?: return null
            val t = fmt + cab + cuerpo
            if (checksum(t, t.size - 1) != (t.last().toInt() and 0xFF)) { drenar(); return null }
            val pendiente = n >= 3 && (t[hdr].toInt() and 0xFF) == 0x7F && (t[hdr + 2].toInt() and 0xFF) == 0x78
            if (pendiente) { fin = System.currentTimeMillis() + 3000; continue }   // responsePending
            return t
        }
    }
}
