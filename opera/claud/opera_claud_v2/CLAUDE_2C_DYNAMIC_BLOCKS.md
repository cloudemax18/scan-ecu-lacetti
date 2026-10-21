# CLAUDE_2C_DYNAMIC_BLOCKS.md
Definición de bloques dinámicos KWP `0x2C` (MR-140 F0/F1, ZF F0) reconstruida del EXE, comparación con Android y cambios mínimos para habilitar lecturas.

Fecha: 2026-10-20. **Análisis estático.** No se ha probado nada en el vehículo ni con el APK. Android se contrastó con el snapshot `scan-ecu-lacetti-main.zip` del 2026-10-17 (no pude leer el repo vigente ni `opera/claud/` existente; si el código cambió, repetir §5).
Etiquetas: `CONFIRMADO_EXE`, `CONFIRMADO_VEHICULO`, `HIPOTESIS`, `NO_VERIFICADO`.

## 1. Dónde está en el EXE (`CONFIRMADO_EXE`)
| Bloque | Llamada `WriteReadComm` (dirección / línea `main.pas`) | Rama | Read count | Validación de respuesta |
|---|---|---|---|---|
| MR-140 F0 | `0x4E4EF6` / L2438 | selector `0x12` (`Start`, salto `0x4E4A67`) | `0xFF` | `RX[166]==0x6C` y `RX[167]==0xF0` (cmp `0x4E4EFB`/`0x4E4F04`) |
| MR-140 F1 | `0x4E53FC` / L2633 | selector `0x12` (se envía tras validar F0) | `0xFF` | `RX[178]==0x6C` y `RX[179]==0xF1` (cmp `0x4E5401`/`0x4E540A`) |
| ZF F0 | `0x4E5ACA` / L2947 | selector `0x22` (salto `0x4E5800`) | `0xFF` | `RX[145]==0x6C` y `RX[146]==0xF0` (cmp `0x4E5ACF`/`0x4E5AD8`) |
Los índices `RX[n]` son sobre el buffer VA `0x4F6DF8` **con el eco** de la trama enviada (163/175/142 bytes) más 3 bytes de cabecera de respuesta (`fmt`, `F1`, ECU): el byte `n` es el SID de respuesta y `n+1` el identificador del bloque.
Si falla cualquier validación el EXE llama a `0x4E9784` (procedimiento sin nombre en el volcado) y sale de `Start`: **no llega a leer datos**. Orden: StartCommunication → 2C F0 → validar → 2C F1 → validar (MR-140); StartCommunication → 2C F0 → validar (ZF).
El selector `0x11`/`0x13` (Sirius) tiene sus propias definiciones (L2255, L2785) y **no** se reutilizan aquí.

## 2. Estructura de la trama
`80 <ECU> F1 <LEN> 2C <bloque> <entradas…> <CHK>` — `LEN` = nº de bytes entre `LEN` y `CHK` (`0x9E`, `0xAA`, `0x89`); `CHK` = suma mod 256 de todos los bytes anteriores (el EXE lo rellena en `WriteReadComm`, L911–1087). Nótese que el destino `0x11`/`0x18` va fijo en la trama, no tomado de `[0x4F6DA8]`.
- **MR-140:** 6 bytes por entrada `02 <pos> <tam> <idHi> <idLo> 01` (`HIPOTESIS`: modo 0x02 = "por identificador común" de KWP2000; los bytes son `CONFIRMADO_EXE`, el significado ECU de cada id común es no determinado).
- **ZF:** 5 bytes por entrada `01 <pos> <tam> <LID> <byte-en-LID>` (`HIPOTESIS`: modo 0x01 = "por local identifier"). Fuentes: LIDs `01`, `02`, `03`, `04` y `06`. El LID `11` no se usa; el `06` no está en ninguna captura.

| Bloque | Trama (bytes) | LEN | Entradas | Datos del bloque | Checksum (SRC=F1) | Respuesta `2C` esperada | Respuesta posterior a `21 <bloque>` |
|---|---|---|---|---|---|---|---|
| MR-140 F0 | 163 | `0x9E` | 26 | 29 B | `0x80` | `fmt F1 11 6C F0 …` | `9F F1 11 61 F0 <29 B> chk` (35 B; read count EXE 41) |
| MR-140 F1 | 175 | `0xAA` | 28 | 37 B | `0x95` | `fmt F1 11 6C F1 …` | `A7 F1 11 61 F1 <37 B> chk` (43 B; read count 49) |
| ZF F0 | 142 | `0x89` | 27 | 41 B | `0x8F` | `fmt F1 18 6C F0 …` | `AB F1 18 61 F0 <41 B> chk` (47 B; read count 53) |
Las longitudes de respuesta de MR-140 están respaldadas por 237+237 registros del `.cedat` del EXE (checksum válido): `CONFIRMADO_VEHICULO` para esos dos tamaños. Para ZF (47 B) es un cálculo: `NO_VERIFICADO`.
El formato de la respuesta a `2C` (`fmt`) no está fijado por el EXE: solo compara `0x6C` y el id del bloque; el parser de Android debe buscarlo en el stream (`findResponse` con prefijo `6C <bloque>`).

## 3. Criterios (válidos para las tres definiciones)
**Aceptación** — todos a la vez: (1) trama con checksum válido y origen = ECU; (2) payload empieza por `6C <bloque>`; (3) llega dentro del tiempo de espera (el EXE usa `ReadFile` de 255 bytes: termina cuando pasan 1,5 s sin bytes tras el primero o a los 3,84 s totales; la trama enviada tarda ≈ 0,16 s a 10400 baud).
**Rechazo** — cualquiera de: NRC `7F 2C xx` (el EXE no lo interpreta: aborta; registrar `xx`); payload distinto (p. ej. `7E` de un Tester Present intercalado, visto en capturas Android); checksum inválido; sin respuesta. Tras rechazo: no pedir `21 F0/F1` en esa sesión; no reintentar en bucle (el EXE no reintenta).
**Entorno** — sin Tester Present durante la secuencia; contacto ON (el EXE no comprueba más); StartCommunication aceptado en la misma sesión.

## 4. Entradas por bloque (TX bytes, offsets y parámetros)
### MR-140 — bloque F0

Trama completa (163 bytes, checksum con SRC=F1):

```
80 11 F1 9E 2C F0 02 01 01 00 0B 01 02 02 01 00 0D 01 02 03 01 00 0E 01 02 04 01 00 0F 01 02 05 01 00 11 01 02 06 02 11 AC 01 02 08 01 00 04 01 02 09 01 11 92 01 02 0A 02 00 0C 01 02 0C 02 12 E3 01 02 0E 01 11 41 01 02 0F 01 11 43 01 02 10 01 11 45 01 02 11 01 11 46 01 02 12 01 00 07 01 02 13 01 11 4E 01 02 14 01 11 55 01 02 15 01 11 01 01 02 16 01 11 70 01 02 17 01 11 4B 01 02 18 01 11 72 01 02 19 01 11 90 01 02 1A 01 00 05 01 02 1B 01 00 06 01 02 1C 01 11 9D 01 02 1D 01 11 9E 01 80
```

| pos | tam | id común | offset tabla (RX con eco) | parámetros del EXE que lo leen |
|---|---|---|---|---|
| 1 | 1 | 0x000B | 11 | ID 1 Абсолютное давление во впускном коллекторе |
| 2 | 1 | 0x000D | 12 | ID 2 Скорость |
| 3 | 1 | 0x000E | 13 | ID 3 Угол опережения зажигания |
| 4 | 1 | 0x000F | 14 | ID 4 Температура впускного воздуха |
| 5 | 1 | 0x0011 | 15 | ID 5 Положение ДЗ |
| 6 | 2 | 0x11AC | 16 | ID 6 Массовый расход воздуха |
| 8 | 1 | 0x0004 | 18 | ID 7 Нагрузка на двигатель |
| 9 | 1 | 0x1192 | 19 | ID 8 Желаемые обороты ХХ |
| 10 | 2 | 0x000C | 20 | ID 9 Обороты двигателя  |
| 12 | 2 | 0x12E3 | 22 | sin fila en la tabla (uso no determinado) |
| 14 | 1 | 0x1141 | 24 | ID 11 Напряжение БС |
| 15 | 1 | 0x1143 | 25 | ID 12 Сигнал ДПДЗ |
| 16 | 1 | 0x1145 | 26 | ID 13 Сигнал ДК1 |
| 17 | 1 | 0x1146 | 27 | ID 14 Сигнал ДК2 |
| 18 | 1 | 0x0007 | 28 | ID 15 Долгосрочная коррекция топливоподачи |
| 19 | 1 | 0x114E | 29 | sin fila en la tabla (uso no determinado) |
| 20 | 1 | 0x1155 | 30 | ID 17 Сигнал датчика уровня топлива |
| 21 | 1 | 0x1101 | 31 | ID 18 Лампа низкого уровня топлива; ID 19 Отсечка топлива; ID 21 Лампа неисправности |
| 22 | 1 | 0x1170 | 32 | ID 22 Положение клапана продувки адсорбера |
| 23 | 1 | 0x114B | 33 | sin fila en la tabla (uso no determinado) |
| 24 | 1 | 0x1172 | 34 | ID 24 Положение РХХ |
| 25 | 1 | 0x1190 | 35 | sin fila en la tabla (uso no determinado) |
| 26 | 1 | 0x0005 | 36 | ID 26 Температура ОЖ |
| 27 | 1 | 0x0006 | 37 | ID 27 Кратковременная коррекция топливоподачи |
| 28 | 1 | 0x119D | 38 | ID 28 Барометрическое давление |
| 29 | 1 | 0x119E | 39 | ID 29 Соотношение воздух-топливо |

### MR-140 — bloque F1

Trama completa (175 bytes, checksum con SRC=F1):

```
80 11 F1 AA 2C F1 02 01 01 11 5E 01 02 02 02 11 A1 01 02 04 01 11 A6 01 02 05 02 11 93 01 02 07 01 11 76 01 02 08 01 11 00 01 02 09 01 11 04 01 02 0A 01 11 02 01 02 0B 01 11 03 01 02 0C 01 11 A0 01 02 0D 01 16 16 01 02 0E 01 11 6F 01 02 0F 01 12 E2 01 02 10 01 11 44 01 02 11 01 12 00 01 02 12 02 12 01 01 02 14 02 12 02 01 02 16 02 12 03 01 02 18 02 12 04 01 02 1A 01 11 A3 01 02 1B 01 12 ED 01 02 1C 02 12 1A 01 02 1E 01 11 9B 01 02 1F 02 11 BB 01 02 21 01 11 71 01 02 22 02 11 C1 01 02 24 01 11 BD 01 02 25 01 12 F0 01 95
```

| pos | tam | id común | offset tabla (RX con eco) | parámetros del EXE que lo leen |
|---|---|---|---|---|
| 1 | 1 | 0x115E | 11 | sin fila en la tabla (uso no determinado) |
| 2 | 2 | 0x11A1 | 12 | ID 31 Время работы двигателя |
| 4 | 1 | 0x11A6 | 14 | ID 32 Отскок угла зажигания |
| 5 | 2 | 0x1193 | 15 | ID 33 Время впрыска |
| 7 | 1 | 0x1176 | 17 | ID 34 Желаемое положение РХХ |
| 8 | 1 | 0x1100 | 18 | ID 35 Запрос кондиционера; ID 36 Реле компрессора кондиционера; ID 37 Защита катализатора; ID 38 Реле бензонасоса |
| 9 | 1 | 0x1104 | 19 | ID 39 Соленоид продувки адсорбера |
| 10 | 1 | 0x1102 | 20 | ID 40 Управление составом топливной смеси; ID 41 Датчик кислорода 1 готов; ID 42 Иммобилайзер; ID 43 Обучение топливоподачи; ID 44 Увеличение мощности |
| 11 | 1 | 0x1103 | 21 | ID 45 Реле низкой скорости ветилятора охлаждения; ID 46 Реле высокой скорости ветилятора охлаждения; ID 47 Соленоид муфты гидротрансформатора; ID 48 Рычаг в положении P/N |
| 12 | 1 | 0x11A0 | 22 | ID 49 Счетчик включения датчика детонации |
| 13 | 1 | 0x1616 | 23 | ID 50 Опорное напряжение 5В |
| 14 | 1 | 0x116F | 24 | ID 51 Температура ОЖ при запуске |
| 15 | 1 | 0x12E2 | 25 | ID 52 Температура впускного воздуха при запуске |
| 16 | 1 | 0x1144 | 26 | ID 53 Сигнал контура выс. давления кондиционера |
| 17 | 1 | 0x1200 | 27 | ID 54 Общее число пропусков воспламенения |
| 18 | 2 | 0x1201 | 28 | ID 55 Число пропусков воспламенения в 1 цилиндре |
| 20 | 2 | 0x1202 | 30 | ID 56 Число пропусков воспламенения во 2 цилиндре |
| 22 | 2 | 0x1203 | 32 | ID 57 Число пропусков воспламенения в 3 цилиндре |
| 24 | 2 | 0x1204 | 34 | ID 58 Число пропусков воспламенения в 4 цилиндре |
| 26 | 1 | 0x11A3 | 36 | ID 59 Температура катализатора |
| 27 | 1 | 0x12ED | 37 | sin fila en la tabla (uso no determinado) |
| 28 | 2 | 0x121A | 38 | ID 61 Число переходов бедная/богатая смесь |
| 30 | 1 | 0x119B | 40 | ID 62 Желаемое положение EGR |
| 31 | 2 | 0x11BB | 41 | sin fila en la tabla (uso no determinado) |
| 33 | 1 | 0x1171 | 43 | ID 64 Положение EGR |
| 34 | 2 | 0x11C1 | 44 | sin fila en la tabla (uso no determinado) |
| 36 | 1 | 0x11BD | 46 | sin fila en la tabla (uso no determinado) |
| 37 | 1 | 0x12F0 | 47 | sin fila en la tabla (uso no determinado) |

### ZF 4HP16 — bloque F0

Trama completa (142 bytes, checksum con SRC=F1):

```
80 18 F1 89 2C F0 01 01 01 01 01 01 02 01 01 02 01 03 01 01 03 01 04 01 02 01 01 05 02 02 02 01 07 01 02 04 01 08 02 03 01 01 0A 02 03 03 01 0C 02 03 05 01 0E 02 03 07 01 10 01 03 09 01 11 01 03 0A 01 12 02 03 0B 01 14 01 03 0D 01 15 01 03 0E 01 16 01 04 01 01 17 02 04 02 01 19 02 04 04 01 1B 02 04 06 01 1D 02 04 08 01 1F 02 04 0A 01 21 02 04 0C 01 23 02 04 0E 01 25 02 04 10 01 27 01 06 01 01 28 01 06 03 01 29 01 06 04 8F
```

| pos | tam | LID | byte en LID | offset tabla (RX con eco) | parámetros del EXE que lo leen |
|---|---|---|---|---|---|
| 1 | 1 | 01 | 1 | 11 | ID 1 Положение рычага селектора передач |
| 2 | 1 | 01 | 2 | 12 | ID 2 Датчик тормоза; ID 3 Аварийный режим; ID 4 Режим тяги |
| 3 | 1 | 01 | 3 | 13 | ID 5 Режим работы |
| 4 | 1 | 02 | 1 | 14 | ID 6 Напряжение БС |
| 5 | 2 | 02 | 2 | 15 | ID 7 Температура масла трансмиссии |
| 7 | 1 | 02 | 4 | 17 | ID 8 Температура охлаждающей жидкости |
| 8 | 2 | 03 | 1 | 18 | ID 9 Обороты двигателя |
| 10 | 2 | 03 | 3 | 20 | ID 10 Обороты на входном валу |
| 12 | 2 | 03 | 5 | 22 | ID 11 Проскальзывание гидротрансформатора |
| 14 | 2 | 03 | 7 | 24 | ID 12 Обороты на выходном валу |
| 16 | 1 | 03 | 9 | 26 | ID 13 Скорость автомобиля |
| 17 | 1 | 03 | 10 | 27 | ID 14 Положение дроссельной заслонки |
| 18 | 2 | 03 | 11 | 28 | ID 15 Крутящий момент двигателя |
| 20 | 1 | 03 | 13 | 30 | ID 16 Запрос на уменьшение крутящего момента |
| 21 | 1 | 03 | 14 | 31 | ID 17 Крутящий момент турбинного колеса |
| 22 | 1 | 04 | 1 | 32 | ID 18 Соленоид 1; ID 19 Соленоид 2 |
| 23 | 2 | 04 | 2 | 33 | ID 20 Соленоид 3 (задание) |
| 25 | 2 | 04 | 4 | 35 | ID 21 Соленоид 4 (задание) |
| 27 | 2 | 04 | 6 | 37 | ID 22 Соленоид 5 (задание) |
| 29 | 2 | 04 | 8 | 39 | ID 23 Соленоид 6 (задание) |
| 31 | 2 | 04 | 10 | 41 | ID 24 Соленоид 3 (факт) |
| 33 | 2 | 04 | 12 | 43 | ID 25 Соленоид 4 (факт) |
| 35 | 2 | 04 | 14 | 45 | ID 26 Соленоид 5 (факт) |
| 37 | 2 | 04 | 16 | 47 | ID 27 Соленоид 6 (факт) |
| 39 | 1 | 06 | 1 | 49 | ID 28 Текущая передача |
| 40 | 1 | 06 | 3 | 50 | ID 29 Оптимальная передача |
| 41 | 1 | 06 | 4 | 51 | ID 30 Состояние муфты блокировки гидротрансформ. |


`pos = offset_de_la_tabla − 10` (base 1); índice 0-based del dato tras `61 <bloque>` = `offset − 11`. El cruce está comprobado por `tools/verify_kwp_sequences.py` (test 05): 56 filas directas MR-140 + 30 ZF, 0 discrepancias.

## 5. Android actual (snapshot 2026-10-17) y cambios mínimos
**Estado:** `KwpProtocol.buildMr140ParameterRequest(0xF0/0xF1)` existe pero `MainActivity` no lo usa; el sondeo en vivo (`startLiveParameterPolling`, L1369) pide `21 02/03/04` (MR-140) y `21 01/02/03/04/11` (ZF) y muestra hex. No hay `2C` en el código. Las capturas muestran NRC `31`/`22` a `21 F0`.
| Cambio mínimo | Dónde | Estado |
|---|---|---|
| 1. Constantes + constructor de las 3 definiciones, validación `6C <bloque>`, compuerta de sesión | **Parche 0001** (`DynamicBlockDefinitions.kt` + test), sin tocar `MainActivity` | Preparado; **no compilado ni ejecutado** (no hay Gradle/Kotlin en mi entorno). Los bytes y tablas del `.kt` sí se comprobaron con `tools/verify_kwp_sequences.py` (test 11) |
| 2. Acción de laboratorio explícita "Definir bloques (0x2C)" | `MainActivity`: usar `buildDefinitionRequest`, enviar **una vez**, `findResponse(candidate, expectedSource, expectedPayloadPrefix = expectedPayloadPrefix(block))`, registrar TX/RX/NRC y llamar `session.markAccepted(block)` solo si `isAcceptedResponse` | **No implementado** (decisión pendiente; el usuario pidió no habilitar lecturas antes de verificar) |
| 3. Parar Tester Present durante 2 y no intercalar | ya existe `testerPresentTask?.cancel(false)` al iniciar en vivo; replicarlo en la acción 2 | Propuesto |
| 4. Lectura `21 F0/F1` solo con `session.canRead(block)` | `MainActivity` | **No habilitado** |
| 5. Resetear `session` al desconectar / reinicio de comunicación | `disconnect()` y `initializeSelectedEcu()` | Propuesto |
| 6. ZF: decodificación del bloque F0 (41 B) | falta tabla `ZfParams` (mapa en `CLAUDE_PARAMETER_MAP.csv`) | No hecho |
La compuerta evita pedir `21 F0/F1` antes de verificar la definición; con la lógica actual de `MainActivity` nada de esto se activa solo.

## 6. Pruebas unitarias
| Prueba | Qué comprueba | Ejecutada |
|---|---|---|
| `tools/verify_kwp_sequences.py` tests 01–03 | Longitudes, cabecera, `LEN`, checksum y contigüidad de entradas de las 3 definiciones, reconstruidas **del código del EXE** (objdump) | **Sí** — OK (`tools/verify_run_log.txt`) |
| ídem 04–05 | Tabla de 376 filas del EXE = JSON del repo; offsets → entradas | **Sí** — OK |
| ídem 06 | Checksum de 23 tramas estándar (arranque, TP, 1A, 19/18, 14, 11, 30, 82, inyectores) | **Sí** — OK |
| ídem 07 | `.cedat`: 237+237 respuestas con checksum correcto | **Sí** — OK |
| ídem 08 | Android `Mr140Params.kt`: offsets/loc/modo de 56 parámetros = EXE | **Sí** — OK |
| ídem 09–10 | Constantes de IDs 67–71 y umbrales de adaptación | **Sí** — OK |
| ídem 11 | Tablas Kotlin del parche 0001 = tramas del EXE | **Sí** — OK (sobre copia parcheada) |
| `DynamicBlockDefinitionsTest.kt` (JUnit) | Mismos bytes/longitudes/checksum + compuerta + aceptación/rechazo | **No ejecutada** (sin toolchain) |
| `DelphiActuatorProtocolTest.kt` (parche 0002) | Byte de cilindro ON/OFF | **No ejecutada** |
**Pruebas físicas: ninguna realizada.** Ver `CLAUDE_GAPS_AND_TESTS.md`.
