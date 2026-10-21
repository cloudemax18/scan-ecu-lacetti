# CLAUDE_GAPS_AND_TESTS.md
Vacíos de evidencia, clasificación de capturas y pruebas físicas mínimas. Fecha: 2026-10-20 (v2). **Ninguna prueba física se ha ejecutado; todo lo de este archivo es análisis estático salvo lo indicado como ejecutado en §5.**
Regla: lo que no está demostrado figura como "no determinado" y se indica qué evidencia falta. Nada se marca validado solo por compilar.

## 1. Clasificación de capturas (tarea 6)
Archivos revisados: 5 capturas de `archivos/Capturas/` + `archivos/capturas varias.md` + `archivos/2610161732 MR-140.cedat`. (`Capturas/Hello` son 3 bytes sin contenido útil.) Todas las capturas `.txt/.md` son de la **app Android**, no del EXE; solo el `.cedat` lo escribió el EXE.

| Archivo | Respuestas válidas | NRC | Sin respuesta / sustituida | Checksum inválido | Detenida/incompleta |
|---|---|---|---|---|---|
| `…1792215134799.txt` | StartComm MR/ZF (`C1 EF 8F`), TP MR/ZF, ZF ident (118 B, chk `AD`), ZF DTC `58 01 07 03 68`, MR `21 02/03/04`, ZF `21 01/02/03/04/11` | MR `21 01/11/20/F0/F1/FB` → `7F 21 31`; ZF `21 20/F1/FB` → `7F 21 12`, `21 F0` → `7F 21 22` | **MR-140 DTC** `84 11 F1 19 DA FF 00 78`: llegó `81 F1 11 7E 01` (respuesta de TP) en lugar de `59 …`; **MR-140 ident `1A 80`: sin respuesta capturada** | 0 | No |
| `…1792218546412344.txt` | solo TP | 82 × `7F 21 31` (MR-140) | TP enviado dos veces seguidas al final | 0 | Sí: termina en TP |
| `…1792218794749.txt` / `…1792218894668.txt` / `…17922caja18643530.txt` | barridos `21 xx`: ZF positivos 0x46–0x62, 0x67–0x6B, 0x7B–0x7F; MR-140 positivos (listado parcial revisado): 0x02–0x05, 0x09–0x0C, 0xA0, 0xB4, entre otros | MR `7F 21 31` (≈ 270), ZF `7F 21 12` (96) | — | 0 | Sí: terminan con TP (barrido interrumpido) |
| `capturas varias.md` | ≈ 66 checksums OK | 16 NRC | 2 líneas "sin respuesta" | **2**: ZF DTC `85 F1 18 58 01 07 14 3E C8` (esperado `40`) y resto `85 F1 18 58 E6` → dos respuestas concatenadas/desalineadas | Sí: varias sesiones |
| `2610161732 MR-140.cedat` (EXE) | 237 × `21 F0` + 237 × `21 F1`, **todas con checksum correcto** | 0 | 0 | 0 | No (237 muestras motor parado) |

Observaciones: (a) ningún NRC de los barridos es de un comando que el EXE use realmente (el EXE no sondea IDs); (b) los NRC de F0/F1 coinciden con "bloque dinámico no definido" pero **no hay captura de `2C`**; (c) la respuesta de TP intercalada demuestra una condición de carrera en Android; (d) el LID `0x06` de ZF **no está en ninguna captura**.

## 2. Incógnitas y prueba física mínima
Orden recomendado: de menor a mayor riesgo. Las pruebas 1–7 son de **solo lectura** o definen un bloque en RAM exactamente como hace el EXE en cada sesión (efecto persistente: no determinado, sin evidencia de que escriba memoria no volátil).

| # | Incógnita | Qué evidencia falta | Prueba mínima | Criterio de aceptación | Riesgo |
|---|---|---|---|---|---|
| 1 | ¿`2C F0`/`2C F1` (MR-140) habilitan `21 F0/F1`? (hipótesis alta; detalle y criterios en `CLAUDE_2C_DYNAMIC_BLOCKS.md` §3) | Ninguna captura envía `2C`. | Contacto ON, motor parado: StartComm → `DEFINE_F0_MR140` → `DEFINE_F1_MR140` (bytes de `CLAUDE_KWP_SEQUENCES.json`) → `21 F0` → `21 F1`, sin TP intercalado. | `6C F0`, `6C F1`; luego `9F F1 11 61 F0 …`(35 B) y `A7 F1 11 61 F1 …`(43 B) con checksum OK. Si hay NRC, guardar la trama exacta. | Bajo (lo hace el EXE en cada sesión) |
| 2 | ¿La definición ZF `2C F0` se acepta y devuelve 47 B? | Sin captura. | StartComm ZF → `DEFINE_F0_ZF` → `21 F0`. | `6C F0` y `AB F1 18 61 F0 …`; comparar byte a byte con LIDs 01,02,03,04,06 leídos aparte. | Bajo |
| 3 | Contenido y existencia del LID `0x06` de ZF | Nunca leído. | `82 18 F1 21 06 chk` (solo lectura). | Respuesta positiva `61 06` con ≥ 4 bytes (los parámetros 28–30 toman bytes 1,3,4). | Muy bajo |
| 4 | Respuesta MR-140 a `19 DA FF 00` (entradas de 4 bytes, 3 textos de estado) | Respuesta `59 …` nunca capturada (TP la pisó). | Desactivar TP durante la consulta; una sola petición. | `<fmt> F1 11 59 <n> …`; con `n=0` sin errores; si `n>0` validar entradas de 4 bytes. | Muy bajo |
| 5 | Respuesta MR-140 a `1A 80` y byte de longitud `0x50` | Sin respuesta MR-140 capturada. | Una petición `82 11 F1 1A 80 1E` sin TP. | `80 F1 11 50 5A 80 …` (formato extendido) con checksum OK. | Muy bajo |
| 6 | Significado de enums ZF (`1;2;3;4;D;N;R;P;---`) y de la indexación | Estado real de la palanca durante la captura no registrado; indexación por valor = hipótesis. | Leer LID 01 (o F0 tras definir) con la palanca en P, R, N, D (motor parado, contacto ON). | Cada posición da un valor distinto y estable; verificar que la etiqueta coincide. | Bajo |
| 7 | Plausibilidad física MR-140 con motor en marcha | El `.cedat` es de motor parado. | Con el EXE y con Android en paralelo (no a la vez en el bus), motor al ralentí: comparar RPM, refrigerante, MAP, TPS. | Diferencia ≤ resolución del dato. | Bajo |
| 8 | Fórmulas calculadas MR-140 IDs 67–71 | Código en 0x4E79CF–0x4E7C09 no reconstruido por completo (dependen de estado de UI y de otros parámetros) | Fuera de alcance mínimo; leer solo después de cerrar 1. | Hasta entonces `NO_VERIFICADO`. | — |
| 9 | Borrado de DTC `83 DST F1 14 FF 00` (respuesta y validación) | Validación completa del EXE no extraída; sin captura. | Solo con consentimiento y tras anotar DTC existentes. Comparar con la respuesta del EXE. | Respuesta `54 …` esperada (SID+0x40); no determinado si el EXE exige más. | **Medio**: borra registros del vehículo |
| 10 | Reset ECU `82 11 F1 11 01` y efecto en la sesión | Sin captura. | Solo MR-140, tras 1–5. | `RX[9]==0x51`. Qué pasa con la sesión: no determinado. | **Medio**: reinicia ECU y borra aprendizajes |
| 11 | Aprendizaje de acelerador | Sin captura del EXE ejecutándolo ni de su respuesta a `30 2C 07 FF`. | **No ejecutar desde Android** hasta cerrar 1 (se necesita F0). Primero registrar el EXE original haciéndolo (ver §3). | `70` a `30 2C 07 FF` y secuencia de muestras RPM/MAP del bucle. | **Alto**: actúa sobre el ECU; el EXE envía el comando antes de comprobar RPM |
| 12 | Actuadores individuales | Sin captura. Desfase del byte de cilindro en Android. | Primero corregir el byte (`ItemIndex−1` en ON y OFF) y comprobar con un sniffer o con `protokol.htm` del EXE que las tramas coinciden. | Tramas idénticas a las del EXE para cada uno de los 12 ítems. | **Alto**: activa cargas reales; el EXE no impone precondiciones |
| 13 | Inicio rápido (break 24/24/24 ms) frente a "conectar sin break" | Android contestó `81 11 F1 81` sin break (capturas), pero no sabemos en qué estado estaba la ECU. | Probar con contacto ON tras ≥ 5 s sin comunicación, con y sin break. | Si sin break falla, hay que emitir break (CH340: solo posible si el driver soporta `setBreak`; no determinado). | Bajo |
| 14 | Intervalo de TP | DFM del EXE 3000 ms (valor de diseño); Android 2000 ms; límite del ECU desconocido | Dejar sesión inactiva y medir cuándo cae. | Registrar tiempo de caída. | Bajo |

## 3. Cómo obtener la verdad de terreno del EXE (recomendado)
El EXE registra todo el tráfico en `protokol.htm` (`ZapProtokol`; se activa con la opción de `TOptionsForm` que escribe la variable VA `0x4F7226`; ubicación exacta de la casilla: no determinada). Con esa opción activa, una sesión corta del EXE (conectar → datos en vivo → leer DTC → identificación → desconectar) da las tramas reales con su eco. Usarla para cerrar 1, 2, 4, 5 y 13 sin escribir nada nuevo. No ejecutar en el coche la adaptación/actuadores/reset solo para capturar sin decidir antes que se quiere hacer esa prueba.

## 4. Riesgos de regresión Android (resumen)
1. Cambios en `Mr140Params.kt`: los offsets y fórmulas actuales **coinciden** con el EXE (56/56). No tocarlos al añadir `2C`.
2. Añadir `2C` cambia el estado de la sesión: enviarlo una sola vez por conexión, validar `6C F0`/`6C F1` y no intercalar TP durante la secuencia.
3. El EXE reinicia la cuenta del TP en cada transacción y no envía TP mientras espera; Android debe mantener "omitir TP si hay consulta en curso" y descartar tramas `7E` residuales antes de leer una respuesta.
4. Corregir el desfase del byte de cilindro y **actualizar el test unitario** que hoy lo consagra.
5. No habilitar la adaptación solo con la trama; requiere F0 + bucle + cancelación.
6. Ningún cambio debe marcar "validado en vehículo" sin las capturas de las pruebas 1–7.

## 5. Pruebas reproducibles (estado real)
- **Ejecutadas (estáticas, sobre el repo y el `.exe`):** `opera/claud/tools/verify_kwp_sequences.py` — 11 pruebas OK (`tools/verify_run_log.txt`): longitudes/cabecera/checksum de las 3 definiciones `2C` reconstruidas del código del EXE con `objdump`, tabla de 376 filas, mapa offset → entrada `2C`, 23 checksums de tramas estándar, `.cedat` 237+237, `Mr140Params.kt` (56 parámetros) frente al EXE, constantes de IDs 67–71 y umbrales de adaptación, tablas Kotlin del parche 0001. Comando: `python3 tools/verify_kwp_sequences.py --repo <repo> [--kotlin-dir <app/src/main/java/com/cheviexplorer/android>]`.
- **Escritas pero NO ejecutadas:** `DynamicBlockDefinitionsTest.kt` (parche 0001) y la prueba de cilindros en `DelphiActuatorProtocolTest.kt` (parche 0002): mi entorno no tiene Gradle ni Kotlin. Hay que correr `./gradlew testDebugUnitTest` en una máquina con el SDK; hasta entonces no están validadas.
- **Pruebas en vehículo / APK:** ninguna.

## 6. Preguntas no resueltas (v2)
1. ¿Responde el MR-140 del coche `6C F0` y `6C F1` a las definiciones? ¿Y la TCU ZF a `2C F0`? (sin captura de `2C`).
2. ¿Qué devuelve el LID `06` de ZF y es estable? (parámetros 28–30).
3. ¿Qué es realmente el ECU de motor (MR-140 u otro, p. ej. HV-240)? Falta la respuesta `1A 80` (longitud esperada `0x50` en el perfil MR-140).
4. ¿Qué significan los identificadores comunes de las entradas `2C` (solo se conocen los nombres que el EXE asigna a cada offset) y qué leen las 10 entradas definidas sin fila de tabla (`CLAUDE_PARAMETER_MAP.csv`, filas "(sin ID)")?
5. ¿Los IDs 69–71 son siempre 0 en MR-140 (deducción estática)? ¿Qué unidad real tiene el ID 67 con el coeficiente `koef` por defecto (índice 0 = 1.0)?
6. Respuesta del ECU al borrado de DTC y qué valida exactamente el EXE.
7. ¿Existe cierre de aprendizaje de acelerador en el ECU? El EXE no envía ninguno.
8. Orden de las etiquetas enum ZF y si el valor convertido es el índice 0-based (hipótesis).
