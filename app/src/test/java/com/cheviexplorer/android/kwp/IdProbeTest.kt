package com.cheviexplorer.android.kwp

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

class IdProbeTest {
    private fun response(vararg payload: Int, source: Int = 0x11): ByteArray {
        require(payload.size in 1..63)
        val frame = ByteArray(4 + payload.size)
        frame[0] = (0x80 or payload.size).toByte()
        frame[1] = 0xF1.toByte()
        frame[2] = source.toByte()
        payload.forEachIndexed { index, value -> frame[3 + index] = value.toByte() }
        frame[frame.lastIndex] = checksum(frame, frame.lastIndex).toByte()
        return frame
    }

    @Test
    fun acceptsPositiveResponseWithExpectedIdentifierAndData() {
        val result = parsearRespuesta(0x02, response(0x61, 0x02, 0xAA, 0xBB), 0x11)
        assertEquals("respuesta positiva; 2 bytes de datos", result.estado)
        assertArrayEquals(byteArrayOf(0xAA.toByte(), 0xBB.toByte()), result.datos)
    }

    @Test
    fun rejectsPositiveResponseWithUnexpectedIdentifier() {
        val result = parsearRespuesta(0x02, response(0x61, 0x03, 0xAA), 0x11)
        assertEquals(true, result.estado.startsWith("respuesta inesperada"))
        assertNull(result.datos)
    }

    @Test
    fun reportsCompleteNrcForRequestedService() {
        val result = parsearRespuesta(0xF0, response(0x7F, 0x21, 0x31), 0x11)
        assertEquals("NRC 0x31", result.estado)
        assertNull(result.datos)
    }

    @Test
    fun reportsSingleByteNrcPayloadAsIncomplete() {
        val result = parsearRespuesta(0xF0, response(0x7F), 0x11)
        assertEquals("NRC incompleto", result.estado)
    }

    @Test
    fun reportsTwoByteNrcPayloadAsIncompleteRatherThanUsingServiceAsNrc() {
        val result = parsearRespuesta(0xF0, response(0x7F, 0x21), 0x11)
        assertEquals("NRC incompleto", result.estado)
    }

    @Test
    fun doesNotMisclassifyNrcForAnotherService() {
        val result = parsearRespuesta(0xF0, response(0x7F, 0x22, 0x31), 0x11)
        assertEquals("respuesta negativa para servicio 0x22; NRC 0x31", result.estado)
    }

    @Test
    fun rejectsCorruptChecksumBeforeInterpretingPayload() {
        val frame = response(0x61, 0x02, 0xAA)
        frame[frame.lastIndex] = (frame.last().toInt() xor 0xFF).toByte()
        val result = parsearRespuesta(0x02, frame, 0x11)
        assertEquals("checksum inválido", result.estado)
        assertNull(result.datos)
    }

    @Test
    fun rejectsTruncatedFrame() {
        val result = parsearRespuesta(0x02, byteArrayOf(0x83.toByte(), 0xF1.toByte(), 0x11, 0x61), 0x11)
        assertEquals("trama KWP inválida, truncada o dirección inesperada", result.estado)
    }

    @Test
    fun rejectsUnexpectedEcuSourceAddress() {
        val result = parsearRespuesta(0x02, response(0x61, 0x02, 0xAA, source = 0x18), 0x11)
        assertEquals("trama KWP inválida, truncada o dirección inesperada", result.estado)
    }

    @Test
    fun reportsNullFrameAsNoResponse() {
        val result = parsearRespuesta(0x02, null, 0x11)
        assertEquals("sin respuesta/timeout/checksum", result.estado)
    }
}
