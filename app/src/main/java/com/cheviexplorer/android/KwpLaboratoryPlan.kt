package com.cheviexplorer.android

/**
 * Read-only KWP laboratory ranges. These lists only describe service 0x21
 * local identifiers; they do not imply that an ECU supports an identifier.
 */
internal object KwpLaboratoryPlan {
    /** Dynamic IDs remain deferred until the correct profile-specific 0x2C sequence is implemented. */
    val deferredDynamicIds: List<Int> = listOf(0xF0, 0xF1)

    // F0/F1 are deliberately not part of automatic scans until their dynamic blocks are defined.
    val baseIds: List<Int> = (0x01..0x40).toList() + listOf(0xFB)

    // IDs already present in the base pass are intentionally excluded.
    val extendedIds: List<Int> =
        (0x41..0xEF).toList() + (0xF2..0xFA).toList() + (0xFC..0xFF).toList()

    val allCandidateIds: List<Int> = baseIds + extendedIds
}
