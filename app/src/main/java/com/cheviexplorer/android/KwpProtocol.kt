package com.cheviexplorer.android

/**
 * Pure KWP/K-Line framing helpers. These validate framing and checksum only;
 * they do not authorize arbitrary diagnostic services.
 */
internal object KwpProtocol {
    internal data class FrameCheck(
        val valid: Boolean,
        val description: String,
        val bytes: ByteArray,
        val payload: ByteArray
    )

    fun buildStartCommunicationRequest(targetAddress: Int): ByteArray {
        require(targetAddress in 0..0xFF) { "Target address must be one byte" }
        val frame = byteArrayOf(
            0x81.toByte(),
            targetAddress.toByte(),
            0xF1.toByte(),
            0x81.toByte(),
            0x00
        )
        frame[4] = checksum(frame.copyOfRange(0, 4)).toByte()
        return frame
    }

    /**
     * Builds the standard-profile TesterPresent frame observed in the original
     * Delphi timer: format 0x81, target, tester address 0xF1, service 0x3E,
     * and additive checksum.
     */
    fun buildTesterPresentRequest(targetAddress: Int): ByteArray {
        require(targetAddress in 0..0xFF) { "Target address must be one byte" }
        val frame = byteArrayOf(
            0x81.toByte(),
            targetAddress.toByte(),
            0xF1.toByte(),
            0x3E,
            0x00
        )
        frame[4] = checksum(frame.copyOfRange(0, 4)).toByte()
        return frame
    }

    /**
     * Static reconstruction of the original CheviExplorer ECU-identification request.
     * Intentionally not wired to serial TX until its response is validated on-vehicle.
     */
    fun buildEcuIdentificationRequest(targetAddress: Int): ByteArray {
        require(targetAddress in 0..0xFF) { "Target address must be one byte" }
        val frame = byteArrayOf(
            0x82.toByte(),
            targetAddress.toByte(),
            0xF1.toByte(),
            0x1A,
            0x80.toByte(),
            0x00
        )
        frame[5] = checksum(frame.copyOfRange(0, 5)).toByte()
        return frame
    }

    fun isPositiveResponseTo(frame: FrameCheck, requestService: Int): Boolean {
        if (!frame.valid || frame.payload.isEmpty() || requestService !in 0..0xBF) return false
        return (frame.payload[0].toInt() and 0xFF) == ((requestService + 0x40) and 0xFF)
    }

    fun isNegativeResponseTo(frame: FrameCheck, requestService: Int): Boolean {
        if (!frame.valid || frame.payload.size < 3) return false
        return (frame.payload[0].toInt() and 0xFF) == 0x7F &&
            (frame.payload[1].toInt() and 0xFF) == requestService
    }

    /**
     * Supports normal KWP frames with the payload length in the format byte (e.g. 0x83)
     * and long frames whose format byte is 0x80 and whose next byte after the addresses
     * contains the payload length (as seen in ECU identification responses).
     */
    fun findResponse(bytes: ByteArray, expectedSource: Int): FrameCheck? {
        for (start in bytes.indices) {
            val format = bytes[start].toInt() and 0xFF
            if ((format and 0x80) == 0) continue

            val shortLength = format and 0x3F
            val hasExtendedLength = shortLength == 0
            val lengthIndex = start + 3
            if (hasExtendedLength && lengthIndex >= bytes.size) continue

            val payloadLength = if (hasExtendedLength) {
                bytes[lengthIndex].toInt() and 0xFF
            } else {
                shortLength
            }
            if (payloadLength == 0) continue

            val headerLength = if (hasExtendedLength) 4 else 3
            val frameLength = headerLength + payloadLength + 1
            if (start + frameLength > bytes.size) continue

            val frame = bytes.copyOfRange(start, start + frameLength)
            val target = frame[1].toInt() and 0xFF
            val source = frame[2].toInt() and 0xFF
            if (target != 0xF1 || source != expectedSource) continue

            val expectedChecksum = checksum(frame.copyOfRange(0, frame.lastIndex))
            val actualChecksum = frame.last().toInt() and 0xFF
            val description = "formato=0x%02X, longitud=%d%s, destino=0x%02X, origen=0x%02X, checksum recibido=0x%02X, esperado=0x%02X (%s)".format(
                format, payloadLength, if (hasExtendedLength) " (extendida)" else "", target, source, actualChecksum, expectedChecksum,
                if (expectedChecksum == actualChecksum) "OK" else "ERROR"
            )
            val payloadStart = if (hasExtendedLength) 4 else 3
            return FrameCheck(
                valid = expectedChecksum == actualChecksum,
                description = description,
                bytes = frame,
                payload = frame.copyOfRange(payloadStart, frame.lastIndex)
            )
        }
        return null
    }

    /**
     * A 0xC1 payload byte is the positive response SID for request service 0x81.
     * Following bytes are returned as protocol key bytes, not ECU identity.
     */
    fun startCommunicationKeys(frame: FrameCheck): ByteArray? {
        if (!frame.valid || frame.payload.isEmpty()) return null
        if ((frame.payload[0].toInt() and 0xFF) != 0xC1) return null
        return frame.payload.copyOfRange(1, frame.payload.size)
    }

    private fun checksum(bytes: ByteArray): Int =
        bytes.sumOf { it.toInt() and 0xFF } and 0xFF
}
