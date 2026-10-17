package com.cheviexplorer.android

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class DtcResponseDecoderTest {
    @Test
    fun decodesObservedZfRecordAsP0703AndNonPermanent() {
        val frame = frame("58 01 07 03 68")
        val result = DtcResponseDecoder.decode(frame, requestService = 0x18)

        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertEquals(1, result.records.size)
        assertEquals("P0703", result.records.single().code)
        assertEquals(0x68, result.records.single().statusByte)
        assertEquals(DtcResponseDecoder.RecordState.INTERMITTENT, result.records.single().state)
        assertEquals("07 03 68", result.recordBytes.toHex())
        assertEquals("Intermitente", result.records.single().state.labelEs)
    }

    @Test
    fun classifiesObservedMr140EmptyResponseAsNoFaults() {
        val result = DtcResponseDecoder.decode(frame("59 00"), requestService = 0x19, isMr140 = true)

        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertTrue(result.recordBytes.isEmpty())
        assertTrue(result.noFaultsConfirmed)
    }

    @Test
    fun respectsFourByteRecordStrideForMr140() {
        val result = DtcResponseDecoder.decode(
            frame("59 01 07 03 40 AA"),
            requestService = 0x19,
            isMr140 = true
        )
        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertEquals(1, result.records.size)
        assertEquals("P0703", result.records.single().code)
        assertEquals(DtcResponseDecoder.RecordState.CURRENT, result.records.single().state)
        assertTrue(result.malformedTail.isEmpty())
    }

    @Test
    fun rejectsTruncatedDtcRecordsWhenCountIsNonZero() {
        val result = DtcResponseDecoder.decode(frame("58 01 07"), requestService = 0x18)
        assertTrue(result is DtcResponseDecoder.Result.Invalid)
    }

    @Test
    fun doesNotAssumeEmptyZfResponseMeansNoFaults() {
        val result = DtcResponseDecoder.decode(frame("58 01"), requestService = 0x18)

        assertTrue(result is DtcResponseDecoder.Result.Positive)
        result as DtcResponseDecoder.Result.Positive
        assertTrue(result.records.isEmpty())
        assertTrue(!result.noFaultsConfirmed)
    }

    @Test
    fun extractsNegativeResponseCodeForMatchingService() {
        val result = DtcResponseDecoder.decode(frame("7F 19 31"), requestService = 0x19)
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

    private fun frame(payload: String) = KwpProtocol.FrameCheck(
        valid = true,
        description = "synthetic test frame",
        bytes = byteArrayOf(),
        payload = hex(payload)
    )

    private fun hex(value: String): ByteArray =
        value.split(" ").map { it.toInt(16).toByte() }.toByteArray()

    private fun ByteArray.toHex(): String =
        joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
}
