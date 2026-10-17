package com.cheviexplorer.android

import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class DelphiActuatorProtocolTest {
    @Test
    fun buildsMr140ActuatorStatusRequestFromDelphiDriverRoutine() {
        assertArrayEquals(hex("83 11 F1 30 15 01 D1"), KwpProtocol.buildMr140ActuatorStatusRequest(0x15))
    }

    @Test
    fun buildsOnAndOffRequestsForSingleOutputExactlyAsDelphi() {
        assertArrayEquals(hex("84 11 F1 30 15 07 FF D1"), KwpProtocol.buildMr140ActuatorControlRequest(0x15, true))
        assertArrayEquals(hex("84 11 F1 30 15 07 00 D2"), KwpProtocol.buildMr140ActuatorControlRequest(0x15, false))
    }

    @Test
    fun preservesDelphiInjectorSpecialCaseForAllFourCylinders() {
        assertArrayEquals(hex("85 11 F1 30 32 07 FF FF EE"), KwpProtocol.buildMr140ActuatorControlRequest(0x32, true, 0))
        assertArrayEquals(hex("85 11 F1 30 32 07 00 00 F0"), KwpProtocol.buildMr140ActuatorControlRequest(0x32, false, 0))
        assertArrayEquals(hex("85 11 F1 30 32 07 FF 02 F1"), KwpProtocol.buildMr140ActuatorControlRequest(0x32, true, 3))
        assertArrayEquals(hex("85 11 F1 30 32 07 00 03 F3"), KwpProtocol.buildMr140ActuatorControlRequest(0x32, false, 3))
    }

    @Test
    fun reconstructsThrottleAdaptationSeparatelyFromActuatorTests() {
        assertArrayEquals(hex("84 11 F1 30 2C 07 FF E8"), KwpProtocol.buildMr140ThrottleAdaptationRequest())
    }

    @Test
    fun actuatorCatalogMatchesDelphiMenuLabelsAndIdentifiers() {
        assertEquals(12, DelphiActuatorCatalog.mr140.size)
        assertEquals(listOf(0x32, 0x32, 0x32, 0x32, 0x15, 0x13, 0x14, 0x10, 0x12, 0x37, 0x18, 0x40),
            DelphiActuatorCatalog.mr140.map { it.localId })
        assertTrue(DelphiActuatorCatalog.mr140.take(4).all { it.injectorIndex != null })
        assertTrue(DelphiActuatorCatalog.mr140.drop(4).all { it.injectorIndex == null })
    }

    private fun hex(value: String): ByteArray =
        value.split(" ").map { it.toInt(16).toByte() }.toByteArray()
}
