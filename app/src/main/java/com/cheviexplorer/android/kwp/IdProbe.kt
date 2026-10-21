package com.cheviexplorer.android.kwp

import com.cheviexplorer.android.KwpProtocol
import kotlinx.coroutines.delay

data class ResultadoId(val id: Int, val estado: String, val datos: ByteArray?)

/**
 * Parses a 0x21 response defensively. KwpBus already checks the wire checksum;
 * this second check keeps the parser safe for alternate callers and unit tests.
 */
internal fun parsearRespuesta(id: Int, frame: ByteArray?, ecuAddress: Int): ResultadoId {
    if (frame == null) return ResultadoId(id, "sin respuesta/timeout/checksum", null)

    val checked = KwpProtocol.findResponse(frame, expectedSource = ecuAddress)
        ?: return ResultadoId(id, "trama KWP inválida, truncada o dirección inesperada", null)
    if (!checked.valid) return ResultadoId(id, "checksum inválido", null)

    val payload = checked.payload
    if (payload.isEmpty()) return ResultadoId(id, "payload vacío", null)

    val sid = payload[0].toInt() and 0xFF
    return when {
        sid == 0x61 && payload.size >= 2 && (payload[1].toInt() and 0xFF) == id ->
            ResultadoId(
                id,
                "respuesta positiva; ${(payload.size - 2).coerceAtLeast(0)} bytes de datos",
                payload.copyOfRange(2, payload.size)
            )

        sid == 0x7F && payload.size < 3 ->
            ResultadoId(id, "NRC incompleto", null)

        sid == 0x7F && (payload[1].toInt() and 0xFF) != 0x21 ->
            ResultadoId(
                id,
                "respuesta negativa para servicio 0x%02X; NRC 0x%02X".format(
                    payload[1].toInt() and 0xFF,
                    payload[2].toInt() and 0xFF
                ),
                null
            )

        sid == 0x7F ->
            ResultadoId(id, "NRC 0x%02X".format(payload[2].toInt() and 0xFF), null)

        else -> ResultadoId(
            id,
            "respuesta inesperada ${frame.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }}",
            null
        )
    }
}

object IdProbe {
    /**
     * Exploratory IDs only. F0/F1 are intentionally excluded until their
     * ECU-specific dynamic blocks have been defined and validated with service 0x2C.
     */
    val IDS = listOf(0x01, 0x02, 0x03, 0x04, 0x11, 0x20, 0xFB)

    suspend fun sondear(bus: KwpBus, ids: List<Int> = IDS): List<ResultadoId> {
        val resultados = ArrayList<ResultadoId>()
        for (id in ids) {
            val frame = bus.transaccion(trama(bus.ecu, bus.tester, 0x21, id))
            resultados.add(parsearRespuesta(id, frame, bus.ecu))
            delay(100)
        }
        return resultados
    }
}
