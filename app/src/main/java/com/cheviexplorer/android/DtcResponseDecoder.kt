package com.cheviexplorer.android

/**
 * Conservative semantic classification for a DTC response.
 *
 * The original Delphi routine is ECU-specific and uses a table-driven record layout.
 * Until that record layout is fully reconstructed, this decoder validates the KWP
 * service response but deliberately does not invent DTC records or claim that an
 * empty record area means the ECU has no stored faults.
 */
internal object DtcResponseDecoder {
    sealed interface Result {
        data class Positive(
            val responseService: Int,
            val subfunctionOrStatus: Int?,
            val recordBytes: ByteArray,
            val rawPayload: ByteArray
        ) : Result

        data class Negative(val nrc: Int, val rawPayload: ByteArray) : Result
        data class Invalid(val reason: String) : Result
        data class Unexpected(val rawPayload: ByteArray) : Result
    }

    fun decode(frame: KwpProtocol.FrameCheck, requestService: Int): Result {
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

        val status = payload.getOrNull(1)?.toInt()?.and(0xFF)
        val recordStart = if (payload.size >= 2) 2 else 1
        return Result.Positive(
            responseService = sid,
            subfunctionOrStatus = status,
            recordBytes = payload.copyOfRange(recordStart, payload.size),
            rawPayload = payload.copyOf()
        )
    }
}
