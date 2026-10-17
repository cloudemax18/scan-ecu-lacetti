package com.cheviexplorer.android

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class EcuIdentificationDecoderTest {
    @Test
    fun decodesMr140FieldsAtOffsetsAfter5A80() {
        val data = ByteArray(68)
        "8Z1JJ51388V322946".toByteArray(Charsets.US_ASCII).copyInto(data, 0)
        "03h014h005".toByteArray(Charsets.US_ASCII).copyInto(data, 48)
        byteArrayOf(0x12, 0x34, 0x56, 0x78).map { it.toByte() }.toByteArray().copyInto(data, 64)
        val payload = byteArrayOf(0x5A.toByte(), 0x80.toByte()) + data

        val values = EcuIdentificationDecoder.decode("MR-140", payload)
        assertEquals("8Z1JJ51388V32294", values.first { it.name.startsWith("VIN") }.value)
        assertEquals("03h014h005", values.first { it.name == "Número de programa" }.value)
        assertEquals("12 34 56 78", values.first { it.name == "Fecha de programación" }.value)
    }

    @Test
    fun ignoresPayloadWithUnexpectedPrefix() {
        assertTrue(EcuIdentificationDecoder.decode("MR-140", byteArrayOf(0x50, 0x80)).isEmpty())
    }

    @Test
    fun decodesZfAsciiFieldsUsingExtractedOffsets() {
        val data = ByteArray(100) { 0xFF.toByte() }
        "5WK33600".toByteArray(Charsets.US_ASCII).copyInto(data, 0)
        "BOOTPROGRAM01".toByteArray(Charsets.US_ASCII).copyOf(12).copyInto(data, 20)
        "PROGRAM00001".toByteArray(Charsets.US_ASCII).copyInto(data, 32)
        "CALIBR1234".toByteArray(Charsets.US_ASCII).copyInto(data, 44)
        "96801169".toByteArray(Charsets.US_ASCII).copyInto(data, 92)
        val values = EcuIdentificationDecoder.decode("ZF 4HP16", byteArrayOf(0x5A.toByte(), 0x80.toByte()) + data)
        assertEquals("5WK33600", values.first { it.name == "Código de software" }.value)
        assertEquals("96801169", values.first { it.name == "Número de pieza" }.value)
    }
}
