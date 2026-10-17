package com.cheviexplorer.android.kwp

import kotlinx.coroutines.delay

data class ResultadoId(val id: Int, val estado: String, val datos: ByteArray?)

object IdProbe {
    /** IDs exploratorios; no constituyen un mapa confirmado de parámetros de ECU. */
    val IDS = listOf(0x01, 0x02, 0x03, 0x04, 0x11, 0x20, 0xF0, 0xF1, 0xFB)

    suspend fun sondear(bus: KwpBus, ids: List<Int> = IDS): List<ResultadoId> {
        val resultados = ArrayList<ResultadoId>()
        for (id in ids) {
            val frame = bus.transaccion(trama(bus.ecu, bus.tester, 0x21, id))
            val resultado = when {
                frame == null -> ResultadoId(id, "sin respuesta/timeout/checksum", null)
                else -> {
                    val fmt = frame.firstOrNull()?.toInt()?.and(0xFF) ?: 0
                    val header = if ((fmt and 0x3F) == 0) 4 else 3
                    if (frame.size <= header + 1) {
                        ResultadoId(id, "trama demasiado corta", null)
                    } else {
                        val payload = frame.copyOfRange(header, frame.lastIndex)
                        val sid = payload[0].toInt() and 0xFF
                        when {
                            sid == 0x61 && payload.size >= 2 && (payload[1].toInt() and 0xFF) == id ->
                                ResultadoId(id, "respuesta positiva; ${(payload.size - 2).coerceAtLeast(0)} bytes de datos", payload.copyOfRange(2, payload.size))
                            sid == 0x7F && payload.size >= 3 ->
                                ResultadoId(id, "NRC 0x%02X".format(payload[2].toInt() and 0xFF), null)
                            else -> ResultadoId(id, "respuesta inesperada ${frame.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }}", null)
                        }
                    }
                }
            }
            resultados.add(resultado)
            delay(100)
        }
        return resultados
    }
}
