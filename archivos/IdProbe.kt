package kwp

import kotlinx.coroutines.delay

/**
 * NO COMPILADO NI PROBADO. Sonda de SOLO LECTURA: ReadDataByLocalIdentifier (0x21)
 * para los identificadores que usa el programa original con distintas ECUs.
 * Úsala con la sesión abierta (StartCommunication + Tester Present), coche parado.
 */
data class ResultadoId(val id: Int, val estado: String, val datos: ByteArray?)

object IdProbe {
    val IDS = listOf(0x01, 0x02, 0x03, 0x04, 0x11, 0x20, 0xF0, 0xF1, 0xFB)

    suspend fun sondear(bus: KwpBus, ids: List<Int> = IDS): List<ResultadoId> {
        val res = ArrayList<ResultadoId>()
        for (id in ids) {
            val t = bus.transaccion(trama(bus.ecu, bus.tester, 0x21, id))
            res.add(
                if (t == null) ResultadoId(id, "sin respuesta", null)
                else {
                    val hdr = if ((t[0].toInt() and 0x3F) == 0) 4 else 3
                    val sid = t[hdr].toInt() and 0xFF
                    when {
                        sid == 0x61 && (t[hdr + 1].toInt() and 0xFF) == id ->
                            ResultadoId(id, "OK ${t.size - hdr - 3} bytes de datos", t.copyOfRange(hdr + 2, t.size - 1))
                        sid == 0x7F -> ResultadoId(id, "NRC 0x%02X".format(t[hdr + 2].toInt() and 0xFF), null)
                        else -> ResultadoId(id, "respuesta inesperada ${t.joinToString(" ") { "%02X".format(it) }}", null)
                    }
                }
            )
            delay(100)
        }
        return res
    }
}
