package com.cheviexplorer.android

import com.cheviexplorer.android.kwp.IdProbe
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Test

class KwpDynamicBlockPlanTest {
    @Test
    fun dynamicIdentifiersAreDeferredUntilService2cSupportExists() {
        assertEquals(listOf(0xF0, 0xF1), KwpLaboratoryPlan.deferredDynamicIds)
        assertFalse(KwpLaboratoryPlan.baseIds.contains(0xF0))
        assertFalse(KwpLaboratoryPlan.baseIds.contains(0xF1))
        assertFalse(KwpLaboratoryPlan.allCandidateIds.contains(0xF0))
        assertFalse(KwpLaboratoryPlan.allCandidateIds.contains(0xF1))
        assertFalse(IdProbe.IDS.contains(0xF0))
        assertFalse(IdProbe.IDS.contains(0xF1))
    }
}
