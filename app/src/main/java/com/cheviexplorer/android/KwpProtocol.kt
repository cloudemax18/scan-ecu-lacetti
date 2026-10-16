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

    fun findResponse(bytes: ByteArray, expectedSource: Int): FrameCheck? {
        for (start in bytes.indices) {
            val format = bytes[start].toInt() and 0xFF
            if ((format and 0x80) == 0) continue

            val payloadLength = format and 0x3F
            val frameLength = 1 + 2 + payloadLength + 1
            if (payloadLength == 0 || start + frameLength > bytes.size) continue

            val frame = bytes.copyOfRange(start, start + frameLength)
            val target = frame[1].toInt() and 0xFF
            val source = frame[2].toInt() and 0xFF
            if (target != 0xF1 || source != expectedSource) continue

            val expectedChecksum = checksum(frame.copyOfRange(0, frame.lastIndex))
            val actualChecksum = frame.last().toInt() and 0xFF
            val description = "formato=0x%02X, longitud=%d, destino=0x%02X, origen=0x%02X, checksum recibido=0x%02X, esperado=0x%02X (%s)".format(
                format, payloadLength, target, source, actualChecksum, expectedChecksum,
                if (expectedChecksum == actualChecksum) "OK" else "ERROR"
            )
            return FrameCheck(
                valid = expectedChecksum == actualChecksum,
                description = description,
                bytes = frame,
                payload = frame.copyOfRange(3, frame.lastIndex)
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
