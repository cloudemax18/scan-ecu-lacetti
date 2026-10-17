package com.cheviexplorer.android

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class Mr140ParamsTest {
    @Test
    fun buildsReadOnlyRequestsForBothExtractedGroups() {
        assertArrayEquals(
            byteArrayOf(0x82.toByte(), 0x11, 0xF1.toByte(), 0x21, 0xF0.toByte(), 0x95.toByte()),
            KwpProtocol.buildMr140ParameterRequest(0xF0)
        )
        assertArrayEquals(
            byteArrayOf(0x82.toByte(), 0x11, 0xF1.toByte(), 0x21, 0xF1.toByte(), 0x96.toByte()),
            KwpProtocol.buildMr140ParameterRequest(0xF1)
        )
    }

    @Test(expected = IllegalArgumentException::class)
    fun refusesUnknownLocalIdentifier() {
        KwpProtocol.buildMr140ParameterRequest(0x01)
    }

    @Test
    fun decodesKnownF0ValuesFromExtractedTable() {
        val data = ByteArray(30)
        data[0] = 80
        data[1] = 15
        data[3] = 90
        data[9] = 0x0F
        data[10] = 0xA0.toByte()

        val readings = Mr140.decodeGroup(0xF0, data)
        assertEquals(80.0, readings.first { it.id == 1 }.value, 0.0)
        assertEquals(15.0, readings.first { it.id == 2 }.value, 0.0)
        assertEquals(50.0, readings.first { it.id == 4 }.value, 0.0)
        assertEquals(1000.0, readings.first { it.id == 9 }.value, 0.0)
        assertTrue(readings.all { it.name.isNotBlank() })
    }

    @Test
    fun truncatedGroupOnlyProducesValuesWithEnoughBytes() {
        val readings = Mr140.decodeGroup(0xF0, byteArrayOf(100))
        assertEquals(listOf(1), readings.map { it.id })
    }
}
