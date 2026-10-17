package kwp

import kotlinx.coroutines.*
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import java.util.concurrent.atomic.AtomicBoolean

/** Acceso serial KWP. La implementación de SerialIo debe compartir el flujo RX de la app. */
interface SerialIo {
    fun write(data: ByteArray)
    fun read(max: Int, timeoutMs: Int): ByteArray
}

fun checksum(b: ByteArray, len: Int = b.size): Int {
    require(len in 0..b.size)
    var s = 0
    for (i in 0 until len) s += b[i].toInt() and 0xFF
    return s and 0xFF
}

/** Construye una trama KWP corta con checksum aditivo. */
fun trama(ecu: Int, tester: Int, vararg datos: Int): ByteArray {
    require(ecu in 0..255 && tester in 0..255 && datos.size <= 63)
    val f = ByteArray(4 + datos.size)
    f[0] = (0x80 or datos.size).toByte()
    f[1] = ecu.toByte()
    f[2] = tester.toByte()
    datos.forEachIndexed { i, b -> require(b in 0..255); f[3 + i] = b.toByte() }
    f[f.lastIndex] = checksum(f, f.lastIndex).toByte()
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
    private val closed = AtomicBoolean(false)
    var log: (String) -> Unit = {}

    suspend fun transaccion(req: ByteArray, timeoutMs: Long = 700): ByteArray? =
        lock.withLock { withContext(Dispatchers.IO) { intercambio(req, timeoutMs) } }

    /** Omite el ciclo si el bus está ocupado; no se cruza con una transacción. */
    fun iniciarTesterPresent(periodoMs: Long = 2000) {
        tpJob?.cancel()
        tpJob = scope.launch {
            while (isActive && !closed.get()) {
                delay(periodoMs)
                if (lock.tryLock()) {
                    try {
                        withContext(Dispatchers.IO) {
                            intercambio(trama(ecu, tester, 0x3E), 350)
                        }
                    } catch (e: Exception) {
                        log("TesterPresent error: ${e.message ?: e.javaClass.simpleName}")
                    } finally {
                        lock.unlock()
                    }
                } else log("TesterPresent omitido: bus ocupado")
            }
        }
    }

    fun detenerTesterPresent() { tpJob?.cancel(); tpJob = null }
    fun close() { closed.set(true); detenerTesterPresent() }

    private fun drenar() {
        var total = 0
        while (total < 512) {
            val b = io.read(minOf(64, 512 - total), 2)
            if (b.isEmpty()) break
            total += b.size
        }
        if (total > 0) log("RX previo descartado: $total bytes")
    }

    private fun leerExacto(n: Int, finMs: Long): ByteArray? {
        val out = ByteArray(n)
        var got = 0
        while (got < n) {
            val remaining = (finMs - System.currentTimeMillis()).toInt()
            if (remaining <= 0) return null
            val b = io.read(n - got, minOf(remaining, 50))
            if (b.isEmpty()) continue
            val copy = minOf(b.size, n - got)
            System.arraycopy(b, 0, out, got, copy)
            got += copy
        }
        return out
    }

    private fun intercambio(req: ByteArray, timeoutMs: Long): ByteArray? {
        require(timeoutMs > 0)
        Thread.sleep(5)
        drenar()
        log("TX ${req.hex()}")
        io.write(req)
        var fin = System.currentTimeMillis() + timeoutMs

        // El eco depende del adaptador. Si el primer byte ya es distinto al formato TX,
        // se trata como inicio de respuesta; si coincide, exigimos el eco completo exacto.
        var primerByteRespuesta: ByteArray? = null
        val primerByte = leerExacto(1, fin) ?: run {
            log("Timeout esperando eco/respuesta")
            return null
        }
        if (primerByte[0] == req[0]) {
            val restoEco = leerExacto(req.size - 1, fin) ?: run {
                log("Eco TX parcial")
                return null
            }
            val eco = primerByte + restoEco
            if (!eco.contentEquals(req)) {
                log("Eco TX ambiguo/no coincidente: ${eco.hex()}; transacción abortada")
                drenar()
                return null
            }
            log("Eco TX confirmado")
        } else {
            primerByteRespuesta = primerByte
            log("Adaptador sin eco TX detectable; leyendo respuesta directamente")
        }

        var pendientes = 0
        while (true) {
            val fmt = primerByteRespuesta ?: leerExacto(1, fin) ?: return null
            primerByteRespuesta = null
            val shortLength = fmt[0].toInt() and 0x3F
            val header = if (shortLength == 0) 4 else 3
            val restHeader = leerExacto(header - 1, fin) ?: return null
            val payloadLength = if (shortLength == 0) restHeader[2].toInt() and 0xFF else shortLength
            if (payloadLength == 0) {
                log("Trama KWP con longitud cero")
                return null
            }
            val body = leerExacto(payloadLength + 1, fin) ?: return null
            val frame = fmt + restHeader + body
            val expected = checksum(frame, frame.lastIndex)
            val actual = frame.last().toInt() and 0xFF
            if (expected != actual) {
                log("Checksum inválido RX ${frame.hex()} esperado=%02X recibido=%02X".format(expected, actual))
                return null
            }
            val payloadStart = header
            val isPending = payloadLength >= 3 &&
                (frame[payloadStart].toInt() and 0xFF) == 0x7F &&
                (frame[payloadStart + 2].toInt() and 0xFF) == 0x78
            if (isPending) {
                if (++pendientes > 5) {
                    log("Demasiadas respuestas 7F xx 78")
                    return null
                }
                fin = maxOf(fin, System.currentTimeMillis() + 3000)
                log("Respuesta pendiente 7F xx 78; esperando respuesta final")
                continue
            }
            log("RX ${frame.hex()} checksum=OK")
            return frame
        }
    }

    private fun ByteArray.hex() = joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
}
