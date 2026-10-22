package com.cheviexplorer.android.kwp

import java.util.concurrent.locks.ReentrantLock

/**
 * Único propietario del puerto serie para transacciones petición/respuesta.
 * Tester Present, barrido (IdProbe), lecturas y definiciones 0x2C deben pasar por aquí:
 * mientras una transacción está en curso nadie más escribe ni lee, así nadie consume la respuesta ajena.
 *
 * - [run]: bloquea hasta tener el puerto. Usar SIEMPRE fuera del hilo de UI.
 * - [tryRun]: no espera; devuelve false si está ocupado (para Tester Present: se omite el latido).
 * La acción debe vaciar el buffer de entrada antes de escribir y leer hasta fin de respuesta o timeout.
 */
internal class SerialTransactionOwner {
    private val lock = ReentrantLock()
    @Volatile private var owner: String? = null

    fun busyOwner(): String? = owner

    fun <T> run(name: String, action: () -> T): T {
        lock.lock()
        try {
            owner = name
            return action()
        } finally {
            owner = null
            lock.unlock()
        }
    }

    fun tryRun(name: String, action: () -> Unit): Boolean {
        if (!lock.tryLock()) return false
        try {
            owner = name
            action()
            return true
        } finally {
            owner = null
            lock.unlock()
        }
    }
}
