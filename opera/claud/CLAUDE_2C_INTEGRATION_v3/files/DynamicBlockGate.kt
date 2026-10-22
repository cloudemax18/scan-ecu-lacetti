package com.cheviexplorer.android.kwp

import com.cheviexplorer.android.DynamicBlockDefinitions.Block

/**
 * Compuerta de sesión para bloques dinámicos 0x2C. Falla cerrado.
 *
 * Invariantes:
 *  - F0/F1 solo se pueden leer si SU definición fue aceptada en la sesión ACTUAL.
 *  - MR-140: orden F0 -> F1; F1 no se define si F0 no fue aceptada.
 *  - Cualquier rechazo, timeout, error I/O, desconexión, reconexión, reinicio o cambio de perfil
 *    deja la compuerta cerrada (todos los bloques revocados) hasta una nueva [startSession].
 *  - Cada reset invalida las finalizaciones en vuelo (se incrementa el id de sesión).
 *  - ZF F0 está bloqueado por política (sin captura física de aceptación). [Policy.zfEnabled] = false por defecto.
 */
internal class DynamicBlockGate(private val policy: Policy = Policy()) {
    data class Policy(val zfEnabled: Boolean = false)
    enum class Profile { MR140, ZF }
    enum class ResetReason {
        DISCONNECT, RECONNECT, SESSION_RESTART, PROFILE_CHANGE, TIMEOUT, IO_ERROR, INVALID_RESPONSE, DEFINITION_FAILED
    }
    enum class Completion { ACCEPTED, REJECTED_GATE_CLOSED, IGNORED_STALE }

    private var sessionId = 0L
    private var profile: Profile? = null
    private val accepted = mutableSetOf<Block>()
    private var pending: Block? = null
    private var lastReset: ResetReason? = null

    @Synchronized fun currentSessionId(): Long = sessionId
    @Synchronized fun lastResetReason(): ResetReason? = lastReset
    @Synchronized fun isPending(): Boolean = pending != null

    /** Llamar solo tras aceptar StartCommunication de la sesión nueva. Revoca todo lo anterior. */
    @Synchronized fun startSession(newProfile: Profile): Long {
        if (profile != null) lastReset = ResetReason.SESSION_RESTART
        sessionId++
        accepted.clear(); pending = null
        profile = newProfile
        return sessionId
    }

    @Synchronized fun reset(reason: ResetReason) {
        sessionId++            // invalida finalizaciones en vuelo
        accepted.clear(); pending = null
        profile = null         // sin sesión: hay que arrancar otra
        lastReset = reason
    }

    @Synchronized fun onProfileChange(newProfile: Profile) {
        val current = profile
        if (current != null && current != newProfile) reset(ResetReason.PROFILE_CHANGE)
    }

    /** Siguiente bloque a definir, o null (sin sesión, pendiente, completo o bloqueado por política). */
    @Synchronized fun nextDefinition(): Block? {
        if (pending != null) return null
        return when (profile) {
            Profile.MR140 -> when {
                Block.MR140_F0 !in accepted -> Block.MR140_F0
                Block.MR140_F1 !in accepted -> Block.MR140_F1
                else -> null
            }
            Profile.ZF -> if (policy.zfEnabled && Block.ZF_F0 !in accepted) Block.ZF_F0 else null
            null -> null
        }
    }

    @Synchronized fun beginDefinition(block: Block, session: Long): Boolean {
        if (session != sessionId || nextDefinition() != block) return false
        pending = block
        return true
    }

    @Synchronized fun completeDefinition(
        block: Block, session: Long, result: DynamicBlockResponseValidator.Result
    ): Completion {
        if (session != sessionId || pending != block) return Completion.IGNORED_STALE
        if (result.accepted) {
            accepted.add(block); pending = null
            return Completion.ACCEPTED
        }
        reset(
            if (result.verdict == DynamicBlockResponseValidator.Verdict.NO_RESPONSE) ResetReason.TIMEOUT
            else ResetReason.INVALID_RESPONSE
        )
        return Completion.REJECTED_GATE_CLOSED
    }

    @Synchronized fun canRead(block: Block): Boolean {
        val current = profile ?: return false
        if (pending != null) return false
        if (profileOf(block) != current) return false
        if (block == Block.ZF_F0 && !policy.zfEnabled) return false
        return block in accepted
    }

    /** El barrido automático debe preguntar esto antes de incluir F0/F1. */
    @Synchronized fun canPoll(block: Block): Boolean = canRead(block)

    private fun profileOf(block: Block): Profile = when (block) {
        Block.MR140_F0, Block.MR140_F1 -> Profile.MR140
        Block.ZF_F0 -> Profile.ZF
    }
}
