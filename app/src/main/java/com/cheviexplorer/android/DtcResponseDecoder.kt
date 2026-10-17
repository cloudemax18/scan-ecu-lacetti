package com.cheviexplorer.android

/**
 * DTC response decoder reconstructed from Button_DTCClick in archivos/dump/main.pas.
 *
 * For service 0x18 the original parser consumes three-byte records:
 *   byte 0: SAE DTC high byte (top two bits identify P/C/B/U)
 *   byte 1: SAE DTC low byte
 *   byte 2: status; the Delphi UI maps (status & 0x60) to stored/current/non-permanent.
 *
 * MR-140 (service 0x19, subfunction DA FF 00) uses four-byte records;
 * ZF 4HP16 (service 0x18) uses three-byte records. Both start with a count.
 * The observed MR-140 59 00 response is count=0 ("Ошибок нет" in Delphi).
 * The observed ZF 58 01 07 03 68 response is one P0703 record with status 0x68,
 * whose 0x60 mask maps to intermittent according to the Delphi status table.
 */
internal object DtcResponseDecoder {
    enum class RecordState(val labelEs: String) {
        UNKNOWN("Estado no identificado"),
        STORED("Guardado"),
        CURRENT("Actual"),
        INTERMITTENT("Intermitente")
    }

    data class DtcRecord(
        val code: String,
        val highByte: Int,
        val lowByte: Int,
        val statusByte: Int,
        val state: RecordState
    )

    sealed interface Result {
        data class Positive(
            val responseService: Int,
            val subfunctionOrStatus: Int?,
            val recordBytes: ByteArray,
            val rawPayload: ByteArray,
            val records: List<DtcRecord>,
            val malformedTail: ByteArray,
            val noFaultsConfirmed: Boolean
        ) : Result

        data class Negative(val nrc: Int, val rawPayload: ByteArray) : Result
        data class Invalid(val reason: String) : Result
        data class Unexpected(val rawPayload: ByteArray) : Result
    }

    fun decode(
        frame: KwpProtocol.FrameCheck,
        requestService: Int,
        isMr140: Boolean = false
    ): Result {
        if (!frame.valid) return Result.Invalid("checksum inválido")
        if (requestService !in 0..0xBF) return Result.Invalid("servicio de solicitud fuera de rango")
        val payload = frame.payload
        if (payload.isEmpty()) return Result.Invalid("respuesta sin payload")

        val sid = payload[0].toInt() and 0xFF
        if (sid == 0x7F && payload.size >= 3 &&
            (payload[1].toInt() and 0xFF) == requestService
        ) {
            return Result.Negative(payload[2].toInt() and 0xFF, payload)
        }

        val expectedSid = (requestService + 0x40) and 0xFF
        if (sid != expectedSid) return Result.Unexpected(payload)

        val second = payload.getOrNull(1)?.toInt()?.and(0xFF)
        val recordsStart = if (payload.size >= 2) 2 else 1
        val recordBytes = payload.copyOfRange(recordsStart, payload.size)
        val records = mutableListOf<DtcRecord>()
        var index = 0
        val recordSize = if (isMr140 && requestService == 0x19) 4 else 3
        val count = second ?: 0
        if ((requestService == 0x18 || requestService == 0x19) && count > 0) {
            repeat(count) {
                if (index + 2 >= recordBytes.size) return Result.Invalid(
                    "contador DTC indica $count registro(s), pero los bytes están truncados"
                )
                val a = recordBytes[index].toInt() and 0xFF
                val b = recordBytes[index + 1].toInt() and 0xFF
                val status = recordBytes[index + 2].toInt() and 0xFF
                records += DtcRecord(
                    code = formatDtc(a, b),
                    highByte = a,
                    lowByte = b,
                    statusByte = status,
                    state = stateFromDelphiStatus(status)
                )
                index += recordSize
            }
        }
        val tail = if (index < recordBytes.size) recordBytes.copyOfRange(index, recordBytes.size) else byteArrayOf()
        val noFaults = isMr140 && requestService == 0x19 &&
            payload.size == 2 && second == 0x00

        return Result.Positive(
            responseService = sid,
            subfunctionOrStatus = second,
            recordBytes = recordBytes,
            rawPayload = payload.copyOf(),
            records = records,
            malformedTail = tail,
            noFaultsConfirmed = noFaults
        )
    }

    private fun formatDtc(high: Int, low: Int): String {
        val prefix = when ((high ushr 6) and 0x03) {
            0 -> 'P'
            1 -> 'C'
            2 -> 'B'
            else -> 'U'
        }
        val numeric = ((high and 0x3F) shl 8) or low
        return prefix + "%04X".format(numeric)
    }

    private fun stateFromDelphiStatus(status: Int): RecordState =
        when (status and 0x60) {
            0x20 -> RecordState.STORED
            0x40 -> RecordState.CURRENT
            0x60 -> RecordState.INTERMITTENT
            else -> RecordState.UNKNOWN
        }
}
