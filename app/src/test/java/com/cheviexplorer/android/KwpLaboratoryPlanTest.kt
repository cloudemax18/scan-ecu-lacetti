package com.cheviexplorer.android

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class KwpLaboratoryPlanTest {
    @Test
    fun basePassIncludesStaticRangesAndDefersDynamicIds() {
        assertTrue(KwpLaboratoryPlan.baseIds.containsAll(listOf(0x01, 0x40, 0xFB)))
        assertFalse(KwpLaboratoryPlan.baseIds.contains(0xF0))
        assertFalse(KwpLaboratoryPlan.baseIds.contains(0xF1))
        assertEquals(KwpLaboratoryPlan.baseIds.size, KwpLaboratoryPlan.baseIds.toSet().size)
    }

    @Test
    fun extendedPassDoesNotRepeatBaseIdentifiers() {
        assertTrue(KwpLaboratoryPlan.extendedIds.containsAll(listOf(0x41, 0xEF, 0xF2, 0xFA, 0xFC, 0xFF)))
        assertFalse(KwpLaboratoryPlan.extendedIds.any { it in KwpLaboratoryPlan.baseIds })
        assertEquals(KwpLaboratoryPlan.extendedIds.size, KwpLaboratoryPlan.extendedIds.toSet().size)
    }

    @Test
    fun combinedPassCoversEveryNonDeferredIdentifierExactlyOnce() {
        val expected = (0x01..0xFF).toSet() - setOf(0xF0, 0xF1)
        assertEquals(expected, KwpLaboratoryPlan.allCandidateIds.toSet())
        assertEquals(253, KwpLaboratoryPlan.allCandidateIds.size)
    }
}
