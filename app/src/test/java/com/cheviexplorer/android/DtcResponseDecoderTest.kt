package com.cheviexplorer.android

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class DtcResponseDecoderTest {
    @Test
    fun classifiesPositiveMr140ResponseWithoutClaimingNoFaults() {
        val frame = KwpProtocol.FrameCheck(
            valid = true,
            description = "synthetic test frame",
            bytes = byteArrayOf(),
            payload = hex("59 00")
        )

        val result = DtcResponseDecoder.decode(frame, requestService = 0x19)

        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertEquals(0x59, result.responseService)
        assertEquals(0x00, result.subfunctionOrStatus)
        assertTrue(result.recordBytes.isEmpty())
    }

    @Test
    fun preservesBytesAfterPositiveResponseStatusWithoutInventingCodes() {
        val frame = KwpProtocol.FrameCheck(
            valid = true,
            description = "synthetic test frame",
            bytes = byteArrayOf(),
            payload = hex("59 00 01 02 03")
        )

        val result = DtcResponseDecoder.decode(frame, requestService = 0x19)

        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertEquals("01 02 03", result.recordBytes.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) })
    }

    @Test
    fun extractsNegativeResponseCodeForMatchingService() {
        val frame = KwpProtocol.FrameCheck(
            valid = true,
            description = "synthetic test frame",
            bytes = byteArrayOf(),
            payload = hex("7F 19 31")
        )

        val result = DtcResponseDecoder.decode(frame, requestService = 0x19)

        assertTrue(result is DtcResponseDecoder.Result.Negative)
        result as DtcResponseDecoder.Result.Negative
        assertEquals(0x31, result.nrc)
    }

    @Test
    fun rejectsInvalidChecksumAndUnexpectedSid() {
        val invalid = KwpProtocol.FrameCheck(false, "bad checksum", byteArrayOf(), hex("59 00"))
        val unexpected = KwpProtocol.FrameCheck(true, "unexpected SID", byteArrayOf(), hex("58 00"))

        assertTrue(DtcResponseDecoder.decode(invalid, 0x19) is DtcResponseDecoder.Result.Invalid)
        assertTrue(DtcResponseDecoder.decode(unexpected, 0x19) is DtcResponseDecoder.Result.Unexpected)
    }

    private fun hex(value: String): ByteArray =
        value.split(" ").map { it.toInt(16).toByte() }.toByteArray()
}
