# CLAUDE_2C_INTEGRATION_PROPOSAL.md
Propuesta de integración de la compuerta KWP `0x2C` en el flujo de CheviExplorer. Fecha: 2026-10-22.

## 0. Estado real de esta entrega (leer primero)
| Pedido | Estado |
|---|---|
| Contrastar con `MainActivity.kt`, `KwpProtocol.kt`, `kwp/KwpBus.kt`, `kwp/IdProbe.kt` y tests **actuales** | **NO HECHO.** Esos archivos no llegaron a mi sesión (solo tengo el zip del 2026-10-17, que no uso como base). |
| Parche aplicable al `main` actual que conecte la compuerta al flujo de producción | **NO HECHO.** Sin esos archivos no puedo escribir un diff honesto de `MainActivity`/`KwpBus`/`IdProbe`. En §6 va el esquema de integración con puntos de anclaje, **no es un diff**. |
| Componentes nuevos (validador estricto, compuerta, propietario único del puerto, ejecutor de definiciones) + pruebas | **HECHO como archivos nuevos** (parche 0003). Solo crean archivos; no tocan código existente. |
| Gradle / tests Kotlin | **NO EJECUTADO** (mi entorno no tiene Gradle ni Kotlin). No hay salida de CI. |
| Lógica verificada de otra forma | Modelo en Python (`tools/model_2c_gate.py`): 6 pruebas OK. **Es un modelo del algoritmo, no el código Kotlin.** |
| Subido a GitHub | **No.** Nada se ha subido. |
Dependencia: el parche 0003 usa `DynamicBlockDefinitions` del parche 0001 (v2). Si tu `main` ya lo trae, nada que hacer; si no, aplicar 0001 primero. No sé si 0001 sigue aplicando limpio a tu `main` actual: **no lo comprobé** contra tu código (solo contra el snapshot del 17-oct, donde sí aplica). El parche 0002 (inyectores) no se repite: según tu revisión ya está en `main`.

## 1. Diseño
Cuatro piezas puras o casi puras, en el paquete `com.cheviexplorer.android.kwp`:
| Archivo | Papel |
|---|---|
| `DynamicBlockResponseValidator.kt` | Valida estrictamente la respuesta a `2C`. Sin E/S. |
| `DynamicBlockGate.kt` | Máquina de estados de la sesión. Decide qué se puede definir y leer. Falla cerrado. |
| `SerialTransactionOwner.kt` | Cerrojo único del puerto: `run` espera, `tryRun` no espera (para Tester Present). |
| `DynamicBlockDefinitionRunner.kt` | Ejecuta `2C F0` → `2C F1` bajo el cerrojo con una `DefinitionTransport` inyectada. |
La `DefinitionTransport` (una función `exchange(request, timeoutMs): ByteArray?` que vacía la entrada, escribe, lee hasta fin/timeout y devuelve **todo** lo leído con eco) es el único punto que hay que adaptar a `KwpBus`. Hasta que exista ese adaptador, **nada se envía** y la compuerta no se usa en producción.

### Orden de definición MR-140
`2C F0` y después `2C F1`, aceptación individual antes de abrir cada bloque. Evidencia (de `CLAUDE_2C_DYNAMIC_BLOCKS.md` §1): `main.pas` `TForm1.Start`, `WriteReadComm` en `0x4E4EF6` (L2438, F0) y `0x4E53FC` (L2633, F1); el EXE valida `RX[166]==0x6C`, `RX[167]==0xF0` antes de enviar F1 y `RX[178]==0x6C`, `RX[179]==0xF1` después. No hay evidencia de otro orden. El EXE no abre F0 por separado de F1; abrir F0 en cuanto se acepta es una decisión mía más estricta que el EXE (§8).

## 2. Flujo de estado
```
        startSession(MR140)                      begin(F0) ok            ACCEPTED
 IDLE ───────────────────────► SESIÓN ───────► DEFINIENDO F0 ───────────────────► F0 ABIERTA
  ▲  (sin sesión: todo cerrado)    │                  │ rechazo/timeout/IO              │ begin(F1) ok
  │                                │                  ▼                                  ▼
  │                                │             CERRADO (reset)               DEFINIENDO F1 ──ACCEPTED──► F0+F1 ABIERTAS
  │◄───────────────────────────────┴───── reset(razón) desde cualquier estado ───────────┘      │ rechazo → CERRADO (F0 se revoca también)
```
Razones de reset: `DISCONNECT`, `RECONNECT`, `SESSION_RESTART`, `PROFILE_CHANGE`, `TIMEOUT`, `IO_ERROR`, `INVALID_RESPONSE`, `DEFINITION_FAILED`. Tras un reset no hay sesión: solo `startSession` (nueva StartCommunication aceptada) reabre el camino. Sin reintentos automáticos (el EXE no reintenta).

## 3. Invariantes
1. `canRead(F0/F1)` solo es verdadero si **ese** bloque fue aceptado en la sesión **actual** y no hay definición pendiente.
2. F1 no se define si F0 no está aceptada.
3. Cualquier definición rechazada, timeout, error I/O o excepción cierra **todo** (también el bloque ya aceptado).
4. Cada `reset` incrementa el id de sesión: una finalización en vuelo con el id viejo se ignora (`IGNORED_STALE`) y no abre nada.
5. El barrido automático solo incluye F0/F1 si `canPoll(block)` (= `canRead`).
6. ZF F0 nunca se define ni se lee con la política por defecto (`Policy(zfEnabled = false)`), aunque llegue una respuesta aceptable.
7. Solo un hilo escribe/lee el puerto a la vez (`SerialTransactionOwner`); el Tester Present usa `tryRun` y se omite si hay otra transacción.
8. Ningún byte de la respuesta se usa si la trama no es completa, con checksum correcto, destino `0xF1`, origen = ECU del bloque, SID `0x6C` y id de bloque correcto; sobrantes → rechazo.

## 4. Validación de la respuesta (punto 4)
| Caso | Veredicto |
|---|---|
| Sin bytes / solo eco | `NO_RESPONSE` |
| Eco distinto de la petición | `ECHO_MISMATCH` |
| Eco o trama incompletos | `TRUNCATED` |
| Formato no soportado / longitud 0 / payload vacío o `6C` sin id | `MALFORMED` |
| Checksum malo | `BAD_CHECKSUM` |
| Destino ≠ `0xF1` | `WRONG_TARGET` |
| Origen ≠ ECU del bloque (MR-140 `0x11`, ZF `0x18`) | `WRONG_SOURCE` |
| `7F 2C xx` | `NEGATIVE_RESPONSE` |
| `7F yy xx` con `yy ≠ 2C` / SID de otra petición (`61`, `5A`…) | `OTHER_REQUEST` / `WRONG_SERVICE` |
| `7E` (Tester Present) antes de la respuesta, aunque venga la buena detrás | `TESTER_PRESENT_RESIDUAL` |
| `6C` con otro bloque | `WRONG_BLOCK` |
| Bytes después de la respuesta válida | `RESIDUAL_BYTES` |
| Todo correcto | `ACCEPTED` |
Más estricto que el EXE (que solo compara `6C` y el id). Acepta los dos formatos de cabecera (`82 F1 11 6C F0 chk` y `80 F1 11 02 6C F0 chk`).

## 5. Condición de carrera (punto 5)
Causa (capturas Android, `CLAUDE_GAPS_AND_TESTS.md` §1): el Tester Present y una consulta compartían el puerto y la respuesta `81 F1 11 7E 01` ocupó el lugar de la respuesta esperada. **Cambio mínimo que lo evita:** que toda transacción serie (definiciones, lecturas, `IdProbe`, y el TP) pase por **un único** `SerialTransactionOwner`; el TP con `tryRun` (se omite, no espera) y el resto con `run` desde un hilo de E/S. Dentro de la acción: vaciar entrada → escribir → leer hasta fin/timeout. Sin eso, ninguna validación evita consumir la respuesta de otra petición.

## 6. Integración en producción — ESQUEMA, no diff (pendiente de los archivos actuales)
```kotlin
// 1) donde viva el puerto (KwpBus o su dueño): UNA instancia compartida
val transactionOwner = SerialTransactionOwner()
val dynamicGate = DynamicBlockGate()                      // zfEnabled=false por defecto

// 2) TesterPresent: no esperar, omitir si ocupado
transactionOwner.tryRun("TP") { sendTesterPresent() }

// 3) IdProbe / lecturas / cualquier request: dentro de run(...) en hilo de E/S, con flush previo
transactionOwner.run("probe") { exchange(...) }

// 4) tras aceptar StartCommunication del perfil MR-140:
val session = dynamicGate.startSession(DynamicBlockGate.Profile.MR140)
ioExecutor.execute { DynamicBlockDefinitionRunner(dynamicGate, transactionOwner, adapterTransport).defineAll(session) }

// 5) barrido: nunca F0/F1 sin compuerta
if (isDynamicBlock(id) && !dynamicGate.canPoll(blockOf(id))) skip

// 6) resets: desconexión, reconexión, reinicio de sesión, cambio de perfil, timeout, error I/O
dynamicGate.reset(DynamicBlockGate.ResetReason.DISCONNECT)   // etc.; onProfileChange(...) al cambiar de ECU
```
Comprobaciones para quien integre: (a) buscar con `grep` todos los `write(`/`read(` del puerto y confirmar que ninguno queda fuera del propietario; (b) que no exista ninguna petición `21 F0`/`21 F1` fuera de `canPoll`; (c) que `startSession` solo se llame tras StartCommunication aceptado; (d) nada de `0x30`, UI de actuadores, adaptación ni HV-240.

## 7. Archivos tocados (parche 0003, solo archivos NUEVOS)
`app/src/main/java/com/cheviexplorer/android/kwp/{DynamicBlockResponseValidator,DynamicBlockGate,SerialTransactionOwner,DynamicBlockDefinitionRunner}.kt` y `app/src/test/java/com/cheviexplorer/android/kwp/{DynamicBlockResponseValidatorTest,DynamicBlockGateTest,DynamicBlockDefinitionRunnerTest}.kt`. Diff completo: `patches/0003-add-2c-gate-validator-owner-runner.patch` (694 líneas; copias en `files/`). **Modificados: ninguno.** Pendientes de modificar (no entregados): `MainActivity.kt`, `kwp/KwpBus.kt`, `kwp/IdProbe.kt` y, si procede, `KwpProtocol.kt`. Los tests existentes no se tocan ni se reducen.
Aplicar: `cd <raíz del repo> && patch -p1 --dry-run < patches/0003-…patch && patch -p1 < patches/0003-…patch` (o `git apply`). Rama sugerida: separada de `main`.

## 8. Pruebas
**Propuestas (Kotlin, escritas, NO ejecutadas):**
- `DynamicBlockResponseValidatorTest` (16): positivos (F0, F1, cabecera extendida, sin eco), ZF origen; negativos: sin respuesta, eco incompleto/distinto, truncada, checksum, destino, origen, NRC, `7E` intercalado (solo y con la buena detrás), respuestas de otra solicitud, bloque equivocado, bytes sobrantes, malformadas.
- `DynamicBlockGateTest` (12): cerrada al inicio, orden F0→F1 y apertura individual, F1 sin F0, cierre total con **cada** veredicto malo, las 8 razones de reset, nueva sesión, cambio de perfil, finalización obsoleta, ZF bloqueado por defecto y por perfil.
- `DynamicBlockDefinitionRunnerTest` (9): orden y bytes enviados, F1 no se envía si F0 falla, F1 rechazado revoca F0, timeout, error I/O, sesión obsoleta no envía, ZF no envía nada, Tester Present no se intercala (hilos), propietario serializa.
**Ejecutadas (Python, modelo del algoritmo):** `tools/model_2c_gate.py` — 6 pruebas, OK (`tools/model_run_log.txt`). Reutiliza las tramas `2C` reconstruidas del EXE por `verify_kwp_sequences.py` (v2). Cubre los mismos escenarios, **no** compila ni corre el Kotlin: errores de sintaxis/tipos de Kotlin no pueden descartarse hasta correr `./gradlew testDebugUnitTest`.
**Físicas / APK:** ninguna.

## 9. Riesgos
1. Kotlin sin compilar: posibles errores de compilación en los 7 archivos (p. ej. versión de Kotlin con `fun interface` ≥ 1.4).
2. Integración no hecha: si se conecta mal, el puerto puede seguir teniendo escritores fuera del propietario (§6a).
3. `run` bloquea: llamarlo desde el hilo de UI congelaría la app; debe usarse en hilo de E/S.
4. Validación más estricta que el EXE: una ECU real que añada bytes tras `6C F0` o no devuelva eco quedaría rechazada y la compuerta cerrada (fallar cerrado). Para no depender de suposiciones, la primera prueba en vehículo debe grabar los bytes crudos.
5. No hay captura de aceptación de `2C` en el coche: que MR-140 acepte F0/F1 sigue siendo hipótesis (`CLAUDE_GAPS_AND_TESTS.md` prueba 1).
6. `DynamicBlockDefinitions.Session` (parche 0001) queda duplicada por la compuerta nueva; usar solo la compuerta.

## 10. Decisiones pendientes
1. ¿Eco esperado siempre (`echoExpected = true`)? El EXE lo ve en su buffer y las capturas Android registran "ECO TX"; si algún adaptador no lo da, cambiar el parámetro.
2. ¿Aceptar payload `6C <bloque>` con bytes extra? Hoy se acepta (el EXE compara solo 2 bytes); alternativa: exigir exactamente 2.
3. Timeout del `exchange` (4000 ms por defecto = límite total de lectura del EXE, 3,84 s) y política de reintento (hoy ninguno).
4. ¿Definir automáticamente tras StartCommunication o con acción explícita de laboratorio? Recomiendo explícita hasta la prueba 1.
5. Intervalo de Tester Present (EXE 3000 ms por DFM, Android 2000 ms) y que se omita mientras `busyOwner() != null`.
6. ¿Quién llama a `reset` en cada razón (hay que mapearlo en `MainActivity`/`KwpBus`)? Necesito esos archivos.
7. Activar `zfEnabled`: solo tras una captura física de aceptación de `2C F0` en ZF.

## 11. Lo que necesito para terminar
Envíame (o súbelos) `MainActivity.kt`, `KwpProtocol.kt`, `kwp/KwpBus.kt`, `kwp/IdProbe.kt` y los tests `IdProbeTest.kt`, `KwpLaboratoryPlanTest.kt`, `DelphiActuatorProtocolTest.kt` **del `main` actual**. Con eso preparo el parche 0004 (adaptador `DefinitionTransport`, propietario único en TP/barrido/lecturas, compuerta en el barrido, resets) contra tu código real.
