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
     * Reconstructs the read-only DTC requests used by the original Delphi program.
     * MR-140 profile 0x12 uses service 0x19 DA FF 00; ZF 4HP16 profile 0x22 uses 0x18 00 00 00.
     * The final checksum is additive over all preceding bytes.
     */
    fun buildDtcReadRequest(targetAddress: Int, isMr140: Boolean): ByteArray {
        require(targetAddress == if (isMr140) 0x11 else 0x18) {
            "Target address does not match the selected ECU profile"
        }
        val payload = if (isMr140) {
            byteArrayOf(0x19, 0xDA.toByte(), 0xFF.toByte(), 0x00)
        } else {
            byteArrayOf(0x18, 0x00, 0x00, 0x00)
        }
        val frame = byteArrayOf(
            0x84.toByte(),
            targetAddress.toByte(),
            0xF1.toByte(),
            payload[0], payload[1], payload[2], payload[3],
            0x00
        )
        frame[7] = checksum(frame.copyOfRange(0, 7)).toByte()
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


    /** ReadDataByLocalIdentifier frame shape confirmed by the captured 0x21 requests. */
    fun buildLocalIdentifierRequest(targetAddress: Int, localId: Int): ByteArray {
        require(targetAddress == 0x11 || targetAddress == 0x18) {
            "Only the confirmed MR-140 and ZF 4HP16 target addresses are supported"
        }
        require(localId in 0..0xFF) { "Local identifier must be one byte" }
        val frame = byteArrayOf(0x82.toByte(), targetAddress.toByte(), 0xF1.toByte(), 0x21, localId.toByte(), 0)
        frame[5] = checksum(frame.copyOfRange(0, 5)).toByte()
        return frame
    }

    /**
     * Reconstructs the MR-140 actuator-control requests from the original Delphi Graf.pas
     * test_ONClick/test_OFFClick handlers. These IDs/options are ECU-specific, not generic OBD PIDs.
     */
    fun buildMr140ActuatorStatusRequest(localId: Int): ByteArray {
        require(localId in mr140ActuatorIds) { "Actuator ID is not in the reconstructed MR-140 test list" }
        return buildMr140Service30(byteArrayOf(0x30, localId.toByte(), 0x01))
    }

    fun buildMr140ActuatorControlRequest(
        localId: Int,
        activate: Boolean,
        injectorIndex: Int? = null
    ): ByteArray {
        require(localId in mr140ActuatorIds) { "Actuator ID is not in the reconstructed MR-140 test list" }
        val state = if (activate) 0xFF else 0x00
        val payload = if (localId == 0x32) {
            require(injectorIndex in 0..3) { "Injector test requires an index from 0 to 3" }
            val selectorByte = if (activate) injectorIndex!! - 1 else injectorIndex!!
            byteArrayOf(0x30, 0x32, 0x07, state.toByte(), selectorByte.toByte())
        } else {
            require(injectorIndex == null) { "Injector index is only valid for local ID 0x32" }
            byteArrayOf(0x30, localId.toByte(), 0x07, state.toByte())
        }
        return buildMr140Service30(payload)
    }

    /** Original Delphi Button_ObuchenieClick request: throttle adaptation, not a generic actuator test. */
    fun buildMr140ThrottleAdaptationRequest(): ByteArray =
        buildMr140Service30(byteArrayOf(0x30, 0x2C, 0x07, 0xFF.toByte()))

    private val mr140ActuatorIds = setOf(0x32, 0x15, 0x13, 0x14, 0x10, 0x12, 0x37, 0x18, 0x40)

    private fun buildMr140Service30(payload: ByteArray): ByteArray {
        val frame = ByteArray(3 + payload.size + 1)
        frame[0] = (0x80 or payload.size).toByte()
        frame[1] = 0x11
        frame[2] = 0xF1.toByte()
        payload.copyInto(frame, destinationOffset = 3)
        frame[frame.lastIndex] = checksum(frame.copyOfRange(0, frame.lastIndex)).toByte()
        return frame
    }

    /** Compatibility wrapper for the original Delphi MR-140 F0/F1 group requests. */
    fun buildMr140ParameterRequest(localId: Int): ByteArray {
        require(localId == 0xF0 || localId == 0xF1) { "Only extracted MR-140 groups F0/F1 are supported by this wrapper" }
        return buildLocalIdentifierRequest(0x11, localId)
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
    fun findResponse(bytes: ByteArray, expectedSource: Int, expectedPayloadPrefix: ByteArray? = null): FrameCheck? {
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

            val payloadStart = if (hasExtendedLength) 4 else 3
            val payload = frame.copyOfRange(payloadStart, frame.lastIndex)
            if (expectedPayloadPrefix != null &&
                (payload.size < expectedPayloadPrefix.size ||
                    !payload.copyOfRange(0, expectedPayloadPrefix.size).contentEquals(expectedPayloadPrefix))
            ) continue

            val expectedChecksum = checksum(frame.copyOfRange(0, frame.lastIndex))
            val actualChecksum = frame.last().toInt() and 0xFF
            val description = "formato=0x%02X, longitud=%d%s, destino=0x%02X, origen=0x%02X, checksum recibido=0x%02X, esperado=0x%02X (%s)".format(
                format, payloadLength, if (hasExtendedLength) " (extendida)" else "", target, source, actualChecksum, expectedChecksum,
                if (expectedChecksum == actualChecksum) "OK" else "ERROR"
            )
            return FrameCheck(
                valid = expectedChecksum == actualChecksum,
                description = description,
                bytes = frame,
                payload = payload
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
