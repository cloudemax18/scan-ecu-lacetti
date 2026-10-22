package com.cheviexplorer.android.kwp

import com.cheviexplorer.android.DynamicBlockDefinitions
import com.cheviexplorer.android.DynamicBlockDefinitions.Block
import java.io.IOException

/** Una transacción de bajo nivel: vaciar entrada, escribir, leer hasta fin/timeout. Devuelve TODO lo leído (con eco). */
internal fun interface DefinitionTransport {
    @Throws(IOException::class)
    fun exchange(request: ByteArray, timeoutMs: Long): ByteArray?
}

/**
 * Ejecuta las definiciones 0x2C pendientes del perfil, en orden y bajo el propietario único del puerto.
 * Se detiene en la primera que no se acepta; la compuerta queda cerrada. Sin reintentos (el EXE no reintenta).
 */
internal class DynamicBlockDefinitionRunner(
    private val gate: DynamicBlockGate,
    private val owner: SerialTransactionOwner,
    private val transport: DefinitionTransport,
    private val timeoutMs: Long = 4_000L,
    private val echoExpected: Boolean = true
) {
    data class Step(
        val block: Block,
        val result: DynamicBlockResponseValidator.Result?,
        val ioError: String? = null
    )

    fun defineAll(session: Long): List<Step> = owner.run(OWNER_NAME) {
        val steps = mutableListOf<Step>()
        while (true) {
            val block = gate.nextDefinition() ?: break
            if (!gate.beginDefinition(block, session)) break
            val request = DynamicBlockDefinitions.buildDefinitionRequest(block)
            val rx = try {
                transport.exchange(request, timeoutMs)
            } catch (e: Exception) {
                if (e is InterruptedException) Thread.currentThread().interrupt()
                gate.reset(DynamicBlockGate.ResetReason.IO_ERROR)
                steps += Step(block, null, e.message ?: e.javaClass.simpleName)
                break
            }
            val result = DynamicBlockResponseValidator.validate(request, rx, block, echoExpected)
            steps += Step(block, result)
            if (gate.completeDefinition(block, session, result) != DynamicBlockGate.Completion.ACCEPTED) break
        }
        steps
    }

    companion object { const val OWNER_NAME = "2C-definition" }
}
