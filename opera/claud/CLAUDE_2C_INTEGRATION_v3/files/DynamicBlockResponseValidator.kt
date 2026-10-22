package com.cheviexplorer.android.kwp

import com.cheviexplorer.android.DynamicBlockDefinitions.Block

/**
 * Validación ESTRICTA de la respuesta a una definición 0x2C. Puro: no toca el puerto.
 *
 * Criterios (CLAUDE_2C_DYNAMIC_BLOCKS.md §3; el EXE solo compara 0x6C y el id del bloque, aquí se exige más):
 * eco exacto de la petición, UNA sola trama completa, checksum, destino = tester (0xF1),
 * origen = ECU del bloque, SID 0x6C, id de bloque correcto y ningún byte sobrante.
 * Cualquier otra cosa se rechaza (fallar cerrado).
 */
internal object DynamicBlockResponseValidator {
    const val TESTER_ADDRESS = 0xF1
    const val SID_REQUEST = 0x2C
    const val SID_POSITIVE = 0x6C
    const val SID_NEGATIVE = 0x7F
    const val SID_TESTER_PRESENT_POSITIVE = 0x7E

    enum class Verdict {
        ACCEPTED, NO_RESPONSE, ECHO_MISMATCH, TRUNCATED, MALFORMED, BAD_CHECKSUM,
        WRONG_TARGET, WRONG_SOURCE, NEGATIVE_RESPONSE, OTHER_REQUEST,
        TESTER_PRESENT_RESIDUAL, WRONG_SERVICE, WRONG_BLOCK, RESIDUAL_BYTES
    }

    data class Result(val verdict: Verdict, val detail: String) {
        val accepted: Boolean get() = verdict == Verdict.ACCEPTED
    }

    /**
     * @param request trama enviada (con checksum).
     * @param rx todos los bytes leídos tras enviarla (incluye el eco si [echoExpected]).
     */
    fun validate(request: ByteArray, rx: ByteArray?, block: Block, echoExpected: Boolean = true): Result {
        if (rx == null || rx.isEmpty()) return fail(Verdict.NO_RESPONSE, "sin bytes recibidos")
        var start = 0
        if (echoExpected) {
            val common = minOf(rx.size, request.size)
            for (i in 0 until common) {
                if (rx[i] != request[i]) return fail(Verdict.ECHO_MISMATCH, "eco distinto en el byte $i")
            }
            if (rx.size < request.size) return fail(Verdict.TRUNCATED, "eco incompleto: ${rx.size} de ${request.size}")
            start = request.size
        }
        val available = rx.size - start
        if (available <= 0) return fail(Verdict.NO_RESPONSE, "solo eco, sin respuesta")

        val format = rx[start].toInt() and 0xFF
        if ((format and 0xC0) != 0x80) return fail(Verdict.MALFORMED, "formato 0x%02X no soportado".format(format))
        val shortLength = format and 0x3F
        val header: Int
        val dataLength: Int
        if (shortLength == 0) {
            header = 4
            if (available < header) return fail(Verdict.TRUNCATED, "cabecera extendida incompleta")
            dataLength = rx[start + 3].toInt() and 0xFF
            if (dataLength == 0) return fail(Verdict.MALFORMED, "longitud 0")
        } else {
            header = 3
            dataLength = shortLength
        }
        val total = header + dataLength + 1
        if (available < total) return fail(Verdict.TRUNCATED, "trama de $available bytes, se esperaban $total")

        var sum = 0
        for (i in start until start + total - 1) sum += rx[i].toInt() and 0xFF
        val received = rx[start + total - 1].toInt() and 0xFF
        if ((sum and 0xFF) != received) {
            return fail(Verdict.BAD_CHECKSUM, "checksum 0x%02X, esperado 0x%02X".format(received, sum and 0xFF))
        }
        val target = rx[start + 1].toInt() and 0xFF
        val source = rx[start + 2].toInt() and 0xFF
        if (target != TESTER_ADDRESS) return fail(Verdict.WRONG_TARGET, "destino 0x%02X".format(target))
        if (source != block.targetAddress) return fail(Verdict.WRONG_SOURCE, "origen 0x%02X, esperado 0x%02X".format(source, block.targetAddress))

        val payloadStart = start + header
        val payload = ByteArray(dataLength) { rx[payloadStart + it] }
        val sid = payload[0].toInt() and 0xFF
        when (sid) {
            SID_NEGATIVE -> {
                if (payload.size < 3) return fail(Verdict.MALFORMED, "respuesta negativa incompleta")
                val requested = payload[1].toInt() and 0xFF
                val nrc = payload[2].toInt() and 0xFF
                return if (requested == SID_REQUEST) fail(Verdict.NEGATIVE_RESPONSE, "NRC 0x%02X a 0x2C".format(nrc))
                else fail(Verdict.OTHER_REQUEST, "NRC 0x%02X a SID 0x%02X (otra solicitud)".format(nrc, requested))
            }
            SID_TESTER_PRESENT_POSITIVE -> return fail(Verdict.TESTER_PRESENT_RESIDUAL, "respuesta 0x7E intercalada")
            SID_POSITIVE -> Unit
            else -> return fail(Verdict.WRONG_SERVICE, "SID 0x%02X".format(sid))
        }
        if (payload.size < 2) return fail(Verdict.MALFORMED, "6C sin id de bloque")
        val blockId = payload[1].toInt() and 0xFF
        if (blockId != block.blockId) {
            return fail(Verdict.WRONG_BLOCK, "bloque 0x%02X, esperado 0x%02X".format(blockId, block.blockId))
        }
        if (available > total) return fail(Verdict.RESIDUAL_BYTES, "${available - total} bytes tras la respuesta")
        return Result(Verdict.ACCEPTED, "6C %02X aceptado".format(blockId))
    }

    private fun fail(verdict: Verdict, detail: String) = Result(verdict, detail)
}
