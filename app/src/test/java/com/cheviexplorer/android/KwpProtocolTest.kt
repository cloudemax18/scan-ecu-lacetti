package com.cheviexplorer.android

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

class KwpProtocolTest {
    private val mr140Response = hex("83 F1 11 C1 EF 8F C4")
    private val zfResponse = hex("83 F1 18 C1 EF 8F CB")

    @Test
    fun buildsObservedStartCommunicationRequests() {
        assertArrayEquals(hex("81 11 F1 81 04"), KwpProtocol.buildStartCommunicationRequest(0x11))
        assertArrayEquals(hex("81 18 F1 81 0B"), KwpProtocol.buildStartCommunicationRequest(0x18))
    }

    @Test
    fun reconstructsOriginalIdentificationRequestsWithoutSendingThem() {
        assertArrayEquals(hex("82 11 F1 1A 80 1E"), KwpProtocol.buildEcuIdentificationRequest(0x11))
        assertArrayEquals(hex("82 18 F1 1A 80 25"), KwpProtocol.buildEcuIdentificationRequest(0x18))
    }

    @Test
    fun validatesMr140ResponseAndExtractsStartCommunicationKeys() {
        val frame = KwpProtocol.findResponse(mr140Response, expectedSource = 0x11)
        assertNotNull(frame)
        assertTrue(frame!!.valid)
        assertArrayEquals(mr140Response, frame.bytes)
        assertArrayEquals(hex("C1 EF 8F"), frame.payload)
        assertArrayEquals(hex("EF 8F"), KwpProtocol.startCommunicationKeys(frame))
    }

    @Test
    fun validatesZfResponseAndExtractsStartCommunicationKeys() {
        val frame = KwpProtocol.findResponse(zfResponse, expectedSource = 0x18)
        assertNotNull(frame)
        assertTrue(frame!!.valid)
        assertArrayEquals(zfResponse, frame.bytes)
        assertArrayEquals(hex("EF 8F"), KwpProtocol.startCommunicationKeys(frame))
    }

    @Test
    fun rejectsBadChecksumForSemanticClassification() {
        val corrupt = hex("83 F1 11 C1 EF 8F 00")
        val frame = KwpProtocol.findResponse(corrupt, expectedSource = 0x11)
        assertNotNull(frame)
        assertFalse(frame!!.valid)
        assertNull(KwpProtocol.startCommunicationKeys(frame))
    }

    @Test
    fun ignoresWrongSourceAddress() {
        assertNull(KwpProtocol.findResponse(mr140Response, expectedSource = 0x18))
    }

    @Test
    fun findsResponseAfterExactTransmitEcho() {
        val txEcho = hex("81 11 F1 81 04")
        val combined = txEcho + mr140Response
        val frame = KwpProtocol.findResponse(combined, expectedSource = 0x11)
        assertNotNull(frame)
        assertArrayEquals(mr140Response, frame!!.bytes)
        assertEquals(0xC1, frame.payload[0].toInt() and 0xFF)
    }

    private fun hex(value: String): ByteArray =
        value.split(" ").map { it.toInt(16).toByte() }.toByteArray()
}
