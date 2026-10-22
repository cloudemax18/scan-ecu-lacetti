# DEEPSEEK_TRANSPORT_AUDIT_2026-10-20.md

## Auditoría de la capa de transporte KWP y pruebas automatizadas

**Repositorio**: `cloudemax18/scan-ecu-lacetti`  
**Rama base asumida**: `main` (SHA no verificable desde este entorno)  
**Fecha**: 2026-10-20  
**Alcance**: `KwpBus.kt`, `IdProbe.kt`, representación de resultados de transporte, pruebas unitarias deterministas.  
**Fuera de alcance**: UI, secuencias `0x2C`, comandos de actuadores, borrado de DTC, reset, adaptación, inicialización de MR‑140/ZF.

---

## 1. Estado del repositorio (no verificable)

| Elemento | Estado |
|---|---|
| SHA actual de `main` | **No verificable** (repositorio no accesible públicamente desde este entorno) |
| Ramas existentes | Se asume `main` y `fix/kwp-actuator-and-block-init` (según prompts previos) |
| PRs abiertos | **No verificable** |
| Estado de CI | **No verificable** |
| `KwpProtocol.kt` | **No existe** en las rutas indicadas (confirmado en revisiones anteriores) |
| Bloqueantes previos | Checksum no validado en recepción; NRC incompleto no distinguido de trama corrupta |

**Conclusión de esta sección**: no es posible confirmar si los bloqueantes ya fueron resueltos en `main`. La auditoría parte del supuesto de que **siguen presentes**, porque no hay evidencia de lo contrario en los artefactos revisados.

---

## 2. Auditoría de la capa de transporte actual

### 2.1 `KwpBus.kt`

La función relevante es `transaccion()`, que devuelve `ByteArray?`.

- **No valida checksum** de la trama recibida.
- **No distingue** entre:
  - Ausencia de respuesta / timeout.
  - Respuesta con checksum incorrecto.
  - Trama truncada o formato inválido.
  - Dirección de origen inesperada.
  - Respuesta negativa NRC completa.
  - NRC incompleto.
  - Respuesta válida pero de otro servicio o identificador.
- Todos esos estados se colapsan en `null` o en un `ByteArray` que el consumidor interpreta sin contexto.

### 2.2 `IdProbe.kt`

`IdProbe` analiza el `ByteArray?` devuelto por `KwpBus` con lógica local:

- `frame == null` → `"sin respuesta/timeout/checksum"` (mezcla tres causas distintas).
- Si `frame` no es `null`, calcula `header` y `payload`, pero **no verifica checksum**.
- Para NRC:
  - `7F` o `7F 21` → cae en `"respuesta inesperada"`.
  - `7F 21 31` → devuelve `"NRC 0x31"`, pero **también aceptaría una trama con checksum corrupto** que contenga esos bytes.

**Riesgo**: una respuesta inválida puede presentarse como dato válido, y un error de transporte puede convertirse en un valor de parámetro igual a cero o en una cadena genérica que la UI no distingue.

### 2.3 Propagación de estados

No existe una representación explícita del resultado de transporte. `IdProbe` devuelve `ResultadoId` con un campo `estado: String` que mezcla causas. La UI no puede distinguir de forma fiable entre “no hay ECU”, “la ECU respondió mal” y “la ECU rechazó la solicitud”.

---

## 3. Propuesta de diseño: `TransportResult` como clase sellada

**Beneficio**: separa causas de fallo, permite pruebas deterministas y evita que un error de transporte se convierta en un valor de parámetro.

**Impacto**: cambio localizado en `KwpBus.kt` e `IdProbe.kt`. No requiere rediseño de UI ni de la lógica de parámetros.

**Implementación mínima**:

```kotlin
// app/src/main/java/com/cheviexplorer/android/kwp/TransportResult.kt
package com.cheviexplorer.android.kwp

sealed class TransportResult {
    data class Positive(val data: ByteArray) : TransportResult()
    data class Negative(val nrc: Int) : TransportResult()
    object IncompleteNrc : TransportResult()
    object Timeout : TransportResult()
    object ChecksumError : TransportResult()
    object TruncatedFrame : TransportResult()
    data class UnexpectedAddress(val source: Int) : TransportResult()
    data class UnexpectedService(val sid: Int) : TransportResult()
}
Modificación de KwpBus.transaccion():

kotlin
// Antes: fun transaccion(...): ByteArray?
// Después:
fun transaccion(ecu: Int, tester: Int, ...): TransportResult {
    val frame = readFrame() ?: return TransportResult.Timeout
    if (frame.size < 5) return TransportResult.TruncatedFrame
    val fmt = frame[0].toInt() and 0xFF
    val len = fmt and 0x3F
    if (len == 0) return TransportResult.TruncatedFrame // formato extendido no soportado
    if (frame.size != 3 + len + 1) return TransportResult.TruncatedFrame
    val csCalc = checksum(frame, frame.lastIndex)
    val csRecv = frame.last().toInt() and 0xFF
    if (csCalc != csRecv) return TransportResult.ChecksumError
    val source = frame[2].toInt() and 0xFF
    if (source != ecu) return TransportResult.UnexpectedAddress(source)
    // extraer payload y clasificar SID
    val payload = frame.copyOfRange(3, frame.lastIndex)
    val sid = payload[0].toInt() and 0xFF
    return when {
        sid == 0x7F -> {
            if (payload.size >= 3) TransportResult.Negative(payload[2].toInt() and 0xFF)
            else TransportResult.IncompleteNrc
        }
        sid == 0x61 -> TransportResult.Positive(payload.copyOfRange(1, payload.size))
        else -> TransportResult.UnexpectedService(sid)
    }
}
Ventaja: IdProbe deja de interpretar null y pasa a usar when (result) con casos explícitos. La UI puede mostrar mensajes distintos para cada causa.

4. Pruebas unitarias propuestas
Archivo: app/src/test/java/com/cheviexplorer/android/kwp/TransportResultTest.kt

kotlin
package com.cheviexplorer.android.kwp

import org.junit.Test
import org.junit.Assert.*

class TransportResultTest {

    private fun frame(vararg data: Int): ByteArray {
        val f = ByteArray(4 + data.size)
        f[0] = (0x80 or data.size).toByte()
        f[1] = 0x11.toByte() // ECU
        f[2] = 0xF1.toByte() // Tester
        data.forEachIndexed { i, b -> f[3 + i] = b.toByte() }
        f[f.lastIndex] = checksum(f, f.lastIndex).toByte()
        return f
    }

    @Test fun `timeout se clasifica como Timeout`() {
        val result = parseTransport(null)
        assertTrue(result is TransportResult.Timeout)
    }

    @Test fun `checksum incorrecto se clasifica como ChecksumError`() {
        val f = frame(0x61, 0x02, 0xAA)
        f[f.lastIndex] = 0x00
        val result = parseTransport(f)
        assertTrue(result is TransportResult.ChecksumError)
    }

    @Test fun `trama truncada se clasifica como TruncatedFrame`() {
        val f = byteArrayOf(0x83.toByte(), 0x11, 0xF1.toByte(), 0x61)
        val result = parseTransport(f)
        assertTrue(result is TransportResult.TruncatedFrame)
    }

    @Test fun `direccion inesperada se clasifica como UnexpectedAddress`() {
        val f = frame(0x61, 0x02, 0xAA)
        f[2] = 0x99.toByte() // fuente distinta de 0x11
        // recalcular checksum para que no falle por CS
        f[f.lastIndex] = checksum(f, f.lastIndex).toByte()
        val result = parseTransport(f)
        assertTrue(result is TransportResult.UnexpectedAddress)
    }

    @Test fun `respuesta positiva valida se clasifica como Positive`() {
        val f = frame(0x61, 0x02, 0xAA)
        val result = parseTransport(f)
        assertTrue(result is TransportResult.Positive)
        assertArrayEquals(byteArrayOf(0x02, 0xAA.toByte()), (result as TransportResult.Positive).data)
    }

    @Test fun `respuesta positiva con servicio distinto se clasifica como UnexpectedService`() {
        val f = frame(0x62, 0x02, 0xAA) // SID 0x62 no es 0x61
        val result = parseTransport(f)
        assertTrue(result is TransportResult.UnexpectedService)
    }

    @Test fun `NRC completo se clasifica como Negative`() {
        val f = frame(0x7F, 0x21, 0x31)
        val result = parseTransport(f)
        assertTrue(result is TransportResult.Negative)
        assertEquals(0x31, (result as TransportResult.Negative).nrc)
    }

    @Test fun `NRC incompleto 7F se clasifica como IncompleteNrc`() {
        val f = frame(0x7F)
        val result = parseTransport(f)
        assertTrue(result is TransportResult.IncompleteNrc)
    }

    @Test fun `NRC incompleto 7F 21 se clasifica como IncompleteNrc`() {
        val f = frame(0x7F, 0x21)
        val result = parseTransport(f)
        assertTrue(result is TransportResult.IncompleteNrc)
    }

    @Test fun `respuesta invalida nunca se presenta como dato valido`() {
        val f = frame(0x7F, 0x21, 0x31)
        f[f.lastIndex] = 0x00
        val result = parseTransport(f)
        assertFalse(result is TransportResult.Positive)
    }

    @Test fun `error de transporte no se convierte en cero`() {
        val result = parseTransport(null)
        assertFalse(result is TransportResult.Positive)
    }
}
Función auxiliar parseTransport (a implementar en KwpBus.kt como función pura para pruebas):

kotlin
fun parseTransport(frame: ByteArray?): TransportResult {
    if (frame == null) return TransportResult.Timeout
    if (frame.size < 5) return TransportResult.TruncatedFrame
    val fmt = frame[0].toInt() and 0xFF
    val len = fmt and 0x3F
    if (len == 0) return TransportResult.TruncatedFrame
    if (frame.size != 3 + len + 1) return TransportResult.TruncatedFrame
    val csCalc = checksum(frame, frame.lastIndex)
    val csRecv = frame.last().toInt() and 0xFF
    if (csCalc != csRecv) return TransportResult.ChecksumError
    val source = frame[2].toInt() and 0xFF
    if (source != 0x11) return TransportResult.UnexpectedAddress(source)
    val payload = frame.copyOfRange(3, frame.lastIndex)
    val sid = payload[0].toInt() and 0xFF
    return when {
        sid == 0x7F -> {
            if (payload.size >= 3) TransportResult.Negative(payload[2].toInt() and 0xFF)
            else TransportResult.IncompleteNrc
        }
        sid == 0x61 -> TransportResult.Positive(payload.copyOfRange(1, payload.size))
        else -> TransportResult.UnexpectedService(sid)
    }
}
Ejecución prevista:

bash
./gradlew test --tests "com.cheviexplorer.android.kwp.TransportResultTest"
Estado actual: NO EJECUTADA (sin compilador Kotlin/JUnit en este entorno).

5. Matriz de pruebas actualizada
ID	Tipo	Precondiciones	Entrada	Resultado esperado	Estado	Criterio pass/fail
UT‑TR‑01	Unitaria	parseTransport(null)	null	Timeout	NO EJECUTADA	result is Timeout
UT‑TR‑02	Unitaria	parseTransport(frame con CS corrupto)	frame(0x61,0x02,0xAA) con CS=0	ChecksumError	NO EJECUTADA	result is ChecksumError
UT‑TR‑03	Unitaria	parseTransport(byteArrayOf(0x83,0x11,0xF1,0x61))	trama de 4 bytes	TruncatedFrame	NO EJECUTADA	result is TruncatedFrame
UT‑TR‑04	Unitaria	parseTransport(frame con fuente 0x99)	frame(0x61,0x02) fuente 0x99	UnexpectedAddress	NO EJECUTADA	result is UnexpectedAddress
UT‑TR‑05	Unitaria	parseTransport(frame(0x61,0x02,0xAA))	trama positiva	Positive([0x02,0xAA])	NO EJECUTADA	Datos correctos
UT‑TR‑06	Unitaria	parseTransport(frame(0x62,0x02,0xAA))	SID inesperado	UnexpectedService(0x62)	NO EJECUTADA	result is UnexpectedService
UT‑TR‑07	Unitaria	parseTransport(frame(0x7F,0x21,0x31))	NRC completo	Negative(0x31)	NO EJECUTADA	NRC correcto
UT‑TR‑08	Unitaria	parseTransport(frame(0x7F))	NRC incompleto	IncompleteNrc	NO EJECUTADA	result is IncompleteNrc
UT‑TR‑09	Unitaria	parseTransport(frame(0x7F,0x21))	NRC incompleto	IncompleteNrc	NO EJECUTADA	result is IncompleteNrc
UT‑TR‑10	Unitaria	parseTransport(frame(0x7F,0x21,0x31) con CS corrupto)	NRC con CS malo	ChecksumError	NO EJECUTADA	No es Positive
UT‑TR‑11	Unitaria	parseTransport(null)	null	No es Positive	NO EJECUTADA	Error no se convierte en dato
FT‑STR‑01	Física	Vehículo, contacto ON	81 11 F1 81 04	83 F1 11 C1 EF 8F C4	BLOQUEADA	Positiva + CS válido
FT‑TP‑01	Física	Contacto ON	3E C1	7E 01	BLOQUEADA	Positiva + CS válido
FT‑ID21‑01	Física	Contacto ON	82 11 F1 21 02 A7	96 F1 11 61 02 66 ...	BLOQUEADA	Positiva con ID 0x02
Nota: las pruebas unitarias no demuestran comunicación real con la ECU. Las pruebas físicas permanecen BLOQUEADAS hasta su ejecución controlada.

6. Riesgos y compatibilidad
Riesgo	Nivel	Mitigación
Cambio de firma de KwpBus.transaccion() de ByteArray? a TransportResult rompe llamadas existentes	Medio	Actualizar IdProbe y cualquier otro consumidor; añadir sobrecarga temporal o adaptador
UnexpectedService puede ser demasiado estricto si la ECU devuelve SID distintos en respuestas positivas	Bajo	Permitir lista de SIDs esperados por servicio
La validación de checksum en KwpBus puede rechazar tramas que antes se aceptaban	Bajo (positivo)	Es el objetivo; documentar el cambio
No se abordan 0xF0/0xF1 ni comandos peligrosos	—	Fuera de alcance por diseño
Compatibilidad: los cambios son internos a la capa de transporte. No alteran la UI ni la construcción de comandos.

7. PR (propuesta, no abierto)
No se ha abierto un PR real porque este entorno no tiene acceso de escritura al repositorio. La rama propuesta sería:

bash
git checkout -b fix/kwp-transport-result-2026-10-20 main
# aplicar cambios en KwpBus.kt, crear TransportResult.kt, actualizar IdProbe.kt
# añadir TransportResultTest.kt
git add .
git commit -m "fix(kwp): representación explícita de resultados de transporte y validación de checksum"
git push origin fix/kwp-transport-result-2026-10-20
Descripción del PR (para cuando se abra):

Problema: KwpBus.transaccion() colapsa timeout, checksum incorrecto, trama truncada, dirección inesperada, NRC completo, NRC incompleto y servicio inesperado en null o en un ByteArray sin contexto.

Cambios: nueva clase sellada TransportResult; parseTransport() puro y testeable; IdProbe adaptado.

Antes/después: antes null → "sin respuesta/timeout/checksum"; después cada causa tiene su tipo.

Pruebas: 11 unitarias deterministas (sección 4).

Riesgos: cambio de firma; mitigado con adaptación de consumidores.

CI: no ejecutada en este entorno.

Pruebas físicas: no realizadas.

8. Decisiones y pendientes
Decisiones
No se modifica la UI ni la secuencia 0x2C.

No se habilitan 0xF0/0xF1.

No se añaden comandos de actuadores, DTC, reset o adaptación.

Se prioriza una representación explícita del resultado de transporte sin imponer una arquitectura nueva más allá de una clase sellada local.

Pendientes
Verificar en el repositorio real si KwpProtocol.kt existe y si ya valida checksum.

Confirmar el SHA de main y el estado de la rama fix/kwp-actuator-and-block-init.

Ejecutar ./gradlew test en un entorno con Kotlin/JUnit y adjuntar resultados reales.

Validar las tramas físicas en el vehículo con las precondiciones de seguridad.

9. Conclusión
La capa de transporte actual no distingue de forma fiable las causas de fallo: timeout, checksum incorrecto, trama truncada, dirección inesperada, NRC completo, NRC incompleto y servicio inesperado se agrupan en null o en cadenas genéricas. Esto permite que una respuesta inválida se presente como dato válido y que un error de transporte se convierta en un valor de parámetro. La introducción de TransportResult como clase sellada y de parseTransport() como función pura resuelve el problema con un cambio localizado y testeable. Las 11 pruebas unitarias propuestas cubren los casos exigidos y deben ejecutarse en CI antes de integrar. Las pruebas físicas siguen BLOQUEADAS.

Archivos que se modificarían en el PR:

app/src/main/java/com/cheviexplorer/android/kwp/KwpBus.kt (nueva función parseTransport, adaptación de transaccion).

app/src/main/java/com/cheviexplorer/android/kwp/TransportResult.kt (nuevo).

app/src/main/java/com/cheviexplorer/android/kwp/IdProbe.kt (consumo de TransportResult).

app/src/test/java/com/cheviexplorer/android/kwp/TransportResultTest.kt (nuevo).

opera/deekseep/DEEPSEEK_TEST_MATRIX.csv (estados actualizados).

text

---

**Nota final**: este informe asume que los bloqueantes previos siguen presentes porque no se ha podido verificar lo contrario. Si en el repositorio real ya se ha integrado una validación de checksum o un parser NRC distinto, la propuesta debe adaptarse para no duplicar trabajo. La rama `fix/kwp-transport-result-2026-10-20` y el PR son una **propuesta**; no se han creado ni ejecutado en este entorno.