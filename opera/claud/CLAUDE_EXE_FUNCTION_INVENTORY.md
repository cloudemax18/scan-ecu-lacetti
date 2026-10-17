# CLAUDE_EXE_FUNCTION_INVENTORY.md
Inventario de funciones del EXE Delphi (CheviExplorer 1.8) para Chevrolet Lacetti 1.8 — MR-140 (selector `0x12`) y ZF 4HP16 (selector `0x22`).

Fecha del análisis: 2026-10-17. Fuente: `scan-ecu-lacetti-main.zip`.
Etiquetas: `CONFIRMADO_EXE` (visto en código/tablas del EXE), `CONFIRMADO_VEHICULO` (visto en RX real: captura o `.cedat` del EXE), `HIPOTESIS`, `NO_VERIFICADO`, "no determinado".

## 0. Método, alcance y límites
- Se leyó el volcado `archivos/dumps1.8/main.pas` (739 KB) y `Graf.pas` (desensamblado con direcciones). Donde el volcado quedó desalineado (tablas de salto) se re-desensambló directamente `archivos/CheviExplorer1.8.exe` (secciones CODE/DATA leídas con un parser PE propio). Las tramas se reconstruyeron automáticamente de cada llamada a `WriteReadComm` (46 en `main.pas`, 10 en `Graf.pas`).
- La tabla de 376 parámetros (VA `0x4F22AC`, 36 bytes/fila) se volvió a leer del EXE: coincide al 100 % con `archivos/cloude/delphi_parameter_table.json`.
- **Archivos pedidos que no existen en el zip:** `arquitectura_completa_scanner.md` y `decodificacion_y_actuadores_kwp.md`. Sí se revisaron `INVESTIGACION_KWP.md`, `KWP_LABORATORIO.md`, `PORTADO_DELPHI_ACTUADORES.md`, `docs/`, los JSON de `archivos/cloude/`, las 15 capturas `.txt` y `archivos/2610161732 MR-140.cedat`.
- No se ha podido ejecutar el EXE ni hablar con el vehículo. Nada de lo marcado `CONFIRMADO_EXE` está validado en el coche por este análisis.
- Referencias de línea: números de línea de `main_pas`/`Graf_pas` tal como están en los volcados del repo (`Lxxxx`); direcciones `0x4E….` son VA del EXE.

## 1. Hallazgos críticos (lo que cambia el trabajo Android)
1. **El EXE define bloques dinámicos con servicio `2C` justo después de StartCommunication, antes de pedir `21 F0`/`21 F1`.** MR-140: dos tramas (`2C F0` 163 bytes, `2C F1` 175 bytes). ZF: una trama (`2C F0` 142 bytes). El Android nunca las envía. Capturas Android: `21 F0` → `7F 21 31` (MR-140) y `7F 21 22` (ZF). `HIPOTESIS` (alta): ese NRC se debe a que el bloque no está definido en la sesión. Evidencia del EXE: `Start` L2255–L3133. Evidencia indirecta en vehículo: el `.cedat` guardado por el EXE contiene 237 respuestas `9F F1 11 61 F0 …` y 237 `A7 F1 11 61 F1 …` con checksum correcto, y sus tamaños (29 y 37 bytes de datos) coinciden exactamente con el total que suman las definiciones `2C`.
2. **`dataOffset - 11` queda verificado** para MR-140 y ZF (sección 4): el buffer es el RX bruto con eco; con petición de 6 bytes y cabecera de respuesta de 5 bytes, `índice_payload = offset − 11`. Las 56 filas directas de MR-140 (+5 calculadas) y las 30 de ZF encajan sin una sola excepción en las entradas de las tramas `2C`.
3. **Las 56 fórmulas directas de `Mr140Params.kt` coinciden con el código del EXE** (offset, modo/endianess y fórmula; 0 diferencias). Quedan 5 filas calculadas (IDs 67–71) sin reconstruir.
4. **El "aprendizaje de acelerador" del EXE (`30 2C 07 FF`) depende de leer F0** (RPM = ID 9, MAP = ID 1) en bucle. Sin `2C F0` no es replicable.
5. **Regresión en Android — actuador de inyector:** el EXE envía el byte de cilindro `ItemIndex−1` (0..3) tanto en ON como en OFF. `KwpProtocol.kt` envía `injectorIndex−1` en ON (da `FF,00,01,02`) y `injectorIndex` en OFF (`00..03`), y el test unitario fija ese comportamiento. Ver `CLAUDE_ACTUATOR_AND_ADAPTATION.md`.
6. **ZF no tiene en el EXE reset, aprendizaje ni actuadores** (`N_ZFClick` L12341 deshabilita `Button_Sbros`, `Button_Obuchenie`, `Test_DK`). `SecurityAccess` (`27`) solo se invoca para selectores `0x11`/`0x13`; no aplica a MR-140 ni ZF.
7. **Corrección a documentación del repo:** el segundo argumento de `WriteReadComm` (p. ej. `0xC8`, `0xFF`, `0x29`) es el **número de bytes que pide `ReadFile`**, no un retardo ni una longitud de trama. La petición `21 BL` mide **6 bytes** con checksum (no 5).
8. **El byte `0x50`/`0x76` que el EXE compara en identificación es el byte de longitud de la respuesta extendida** (`80 F1 DST LEN 5A 80 …`). ZF capturada: `LEN=0x76`. Coincide.

## 2. Convenciones de transporte del EXE (`WriteReadComm`, `main.pas` L911–1087)
| Aspecto | Comportamiento | Estado |
|---|---|---|
| Firma | `WriteReadComm(Self, array de bytes, High=ecx, pila: nº bytes a leer)` | CONFIRMADO_EXE |
| Checksum | Suma mod 256 de los bytes `0..High-1`, escrita en el **último** elemento del array (el llamante deja un hueco `CHK`). No se calcula si selector `0x31` (Airbag SRS0). | CONFIRMADO_EXE |
| Purga | `PurgeComm(hComm, 0x0F)` antes de enviar | CONFIRMADO_EXE |
| Envío | `WriteFile` de la trama completa; selector `0x32`: byte a byte con `Sleep(5)` | CONFIRMADO_EXE |
| Tester Present | Para selector `≠0x31` hace `TimerTesterPresent.Enabled := False; := True` (reinicia la cuenta) en cada transacción | CONFIRMADO_EXE |
| Recepción | Limpia 256 bytes en VA `0x4F6DF8` y `ReadFile(n)` en ese buffer. **El eco de la trama enviada queda al principio del buffer** y la respuesta empieza en el índice `len(eco)` | CONFIRMADO_EXE |
| Timeouts | `COMMTIMEOUTS`: ReadInterval 1500 ms, ReadTotalMultiplier 15 ms, ReadTotalConstant 15 ms (total = `15·n+15` ms) | CONFIRMADO_EXE (`PortInit` 0x4E2927–0x4E294C) |
| Puerto | 10400 baud (0x28A0; 9600 para selector `0x31`), 8 bits, sin paridad, 1 stop | CONFIRMADO_EXE (0x4E2903–0x4E2916) |
| Registro | `ZapProtokol` escribe `protokol.htm` (opción en `TOptionsForm`, variable VA `0x4F7226`) | CONFIRMADO_EXE |

## 3. Inventario de funciones visibles
Selector MR-140 = `0x12` (`DST=0x11`, `SRC=0xF1`; `N_MR140Click` L12126). ZF = `0x22` (`DST=0x18`; `N_ZFClick` L12341).

| Función | Handler (líneas) | MR-140 | ZF 4HP16 | Secuencia (ids en `CLAUDE_KWP_SEQUENCES.json`) |
|---|---|---|---|---|
| Conexión + inicio rápido | `Start` L1248–3256, `PortInit` L623–911 | Sí | Sí | `PORT_OPEN`, `FAST_INIT`, `START_COMM_*` |
| Definición de bloques `2C` | `Start` L2438, L2633 (MR); L2947 (ZF) | Sí (F0+F1) | Sí (F0) | `DEFINE_F0_MR140`, `DEFINE_F1_MR140`, `DEFINE_F0_ZF` |
| Tester Present | `TimerTesterPresentTimer` L3415–3459 | Sí (DFM 3000 ms) | Sí | `TESTER_PRESENT` |
| Identificación ECU | `Button_ECUIdentClick` L3554 | `82 11 F1 1A 80` | `82 18 F1 1A 80` | `IDENT_1A80` |
| Leer DTC | `Button_DTCClick` L4931 | `84 11 F1 19 DA FF 00` | `84 18 F1 18 00 00 00` | `DTC_READ` |
| Borrar DTC | `Button_ClearDTCClick` L6401 | `83 11 F1 14 FF 00` (rama por defecto) | misma rama por defecto; habilitación del menú en ZF no verificada | `DTC_CLEAR` |
| Datos en vivo | `TimerParamTimer` L12443, `VspomRaschetParam` L13036, `RaschetParam` L6892 | F0 (41 B) ↔ F1 (49 B) | F0 (53 B) | `READ_F0_MR140`, `READ_F1_MR140`, `READ_F0_ZF` |
| Gráficos / sets | `Button_GrafClick` L6789; `Graf.pas` `ChartPoint` L1119, sets `Next_Nabor`… | Sí | Sí (mismos datos) | (sin tráfico propio) |
| Test sensor O2 (`Test_DK`) | `Test_DKClick` L16512 | Abre gráfico de "Сигнал ДК1" (ID 13) y "Кратковременная коррекция топливоподачи" (ID 27). **No envía comando.** | deshabilitado | — |
| Reset / borrado de aprendizajes | `Button_SbrosClick` L14793 | `82 11 F1 11 01` (ECUReset) | menú deshabilitado | `ECU_RESET_MR140` |
| Aprendizaje de acelerador | `Button_ObuchenieClick` L14950 | `84 11 F1 30 2C 07 FF` + bucle F0 | menú deshabilitado | `THROTTLE_ADAPT_MR140` |
| Actuadores | `Graf.pas`: `DriveIMClick` L5374, `CaseIMSelect` L6195, `test_ONClick` L6747, `test_OFFClick` L6535, `FormClose` L5071; `Driver` L16344 | 12 entradas / 9 IDs | no existe | `ACTUATOR_STATUS`, `ACTUATOR_ON_OFF`, `ACTUATOR_RELEASE` |
| Parada de comunicación | `MenuItem_StopClick` L4372 | `81 11 F1 82 05` | `81 18 F1 82 0C` | `STOP_COMM` |
| Seguridad (`27`) | `SecurityAccess` L14230–14791 | **No se invoca** | **No se invoca** | `SECURITY_ACCESS_NO_APLICA` |
| Test de adaptador (propósito `HIPOTESIS`) | `MenuItem_TestClick` L11348 | Envía una trama fija de 18 bytes (`11 18 81 22 33 44 55 66 77 88 99 AA BB CC DD EE F1 CHK`), lee 18 bytes y usa `temp.tmp`; no es una función ECU | igual | — |
| Guardar / cargar sesión `.cedat`, exportar XLS | `MenuItem_SaveClick` L6245, `MenuItem_LoadClick` L10484, `MenuItem_SaveToXLSClick` L11574 | — | — | formato `.cedat` verificado (sec. 5) |
| Selección de celda DTC | `StringGrid_DTCSelectCell` L15890 | Tras elegir una fila: `21 02`, `21 F0` y `85 DST F1 12 00 04 …` (bytes finales de ese frame no extraídos) | — | no determinado |

## 4. Modelo de buffer y offsets (tarea 4)
**Tabla (`RaschetParam` L6892+, lectura en 0x4E6xxx)**: 376 filas de 36 bytes en VA `0x4F22AC`. Campos (dwords): `+0` selector, `+4` ID de parámetro, `+8` puntero a nombre, `+0xC` puntero a unidad, `+0x10` grupo, `+0x14` **offset de datos**, `+0x18` **modo de lectura**, `+0x1C` precisión (decimales), `+0x20` puntero a lista de etiquetas/enum separada por `;`.

**Búsqueda**: recorre 0..0x177 comparando `selector==[0x4F6DA7]` e ID; devuelve el índice. Caso especial: selector `0x21` (Aisin) con `RX[6]==0x9D` desplaza offsets (no aplica aquí).

**Lectura (valor en doble)**:
| modo | lectura sobre `RX[offset]` (RX = VA `0x4F6DF8`) |
|---|---|
| 0 | `RX[off+1]·256 + RX[off]` — 16 bit **little-endian** |
| 1 | `RX[off]` — 1 byte |
| 2 | `RX[off]·256 + RX[off+1]` — 16 bit **big-endian** |
| ≥3 | no lee bytes; valor calculado en el caso de `RaschetParam` |

**Veredicto `dataOffset − 11`: CONFIRMADO_EXE.**
- El índice es **absoluto en el buffer RX con eco** (`movzx eax, byte ptr [eax+$4F6DF8]`).
- Petición `82 DST F1 21 BL chk` = 6 bytes de eco (índices 0..5). Respuesta `fmt F1 DST 61 BL datos… chk`: `fmt`=6, `F1`=7, `DST`=8, `61`=9, `BL`=10, **primer dato = 11**. Por tanto `índice_payload = offset − 11` y, en la definición `2C`, `posición = offset − 10` (base 1).
- Verificación estructural: las 56 filas MR-140 de lectura directa (modos 0/1/2; las otras 5 son calculadas) y las 30 filas ZF caen **todas** exactamente en el inicio de una entrada de la definición `2C` con el tamaño que exige su modo (script de cruce en el análisis; 0 discrepancias).
- Límite: vale solo cuando el eco mide 6 bytes y la cabecera de respuesta mide 5. Otros ECU (selector `0x14`, `0x42`…) tienen otros offsets en la misma tabla; **no aplicar `−11` a ellos**.
- Eco/checksum: el EXE no quita el eco ni valida el checksum de respuesta en `RaschetParam`; el Android sí valida checksum (mejora, no regresión).

**Origen de cada campo (nuevo hallazgo):** la definición `2C` dice de dónde sale cada byte del bloque.
- MR-140 (`2C F0 02 …` / `2C F1 02 …`): entradas de 6 bytes `02 pos tam idHi idLo 01` → **identificadores comunes** (p. ej. pos 1 = `0x000B`, pos 2 = `0x000D`, pos 9–10 = `0x11AC`…). F0: 26 entradas / 29 bytes; F1: 28 entradas / 37 bytes. (La interpretación "modo 02 = por identificador común" es `HIPOTESIS` por analogía con KWP2000; los bytes sí son `CONFIRMADO_EXE`.)
- ZF (`2C F0 01 …`): entradas de 5 bytes `01 pos tam LID off` → el bloque se arma con bytes de los **local IDs 01, 02, 03, 04 y 06** (27 entradas / 41 bytes). El LID `0x11` que sondea Android **no** lo usa el EXE; el LID `0x06` **nunca se ha capturado**.
- Tabla completa por parámetro: `CLAUDE_PARAMETER_MAP.csv`.

## 5. Evidencia del `.cedat` (sesión guardada por el EXE)
`archivos/2610161732 MR-140.cedat` (30 464 B): registros de 128 bytes con `82 11 F1 21 F0 95` + `9F F1 11 61 F0 …(29 B) chk` y `82 11 F1 21 F1 96` + `A7 F1 11 61 F1 …(37 B) chk`. 237 + 237 pares, **todos con checksum correcto**. Valores decodificados con las fórmulas del EXE son coherentes con motor parado: MAP 100 kPa, RPM 0, refrigerante 35 °C, batería 10,8–11,4 V, barométrica 99,96 kPa, referencia 5 V 4,98 V, regulación ralentí deseada 925 rpm. Esto confirma `CONFIRMADO_VEHICULO` para longitudes, framing y checksum de F0/F1; **no** valida por sí solo el significado físico de cada campo (no hay referencia independiente). Procedencia del archivo: según el usuario, el EXE se usa con éxito en el vehículo; el archivo no incluye metadatos que lo demuestren.

## 6. Tabla de cruce Android ↔ EXE (tarea 7)
| Tema | EXE | Android actual | Riesgo |
|---|---|---|---|
| Definición `2C` F0/F1 (MR) y F0 (ZF) | La envía en `Start` y aborta si no recibe `6C F0/F1` | **No existe** | Alto: `21 F0` da NRC; bloquea datos en vivo y adaptación |
| Inicio rápido (break 24/24/24 ms) | Sí (`FAST_INIT`) | No emite break; en captura la ECU contestó `81 11 F1 81` igualmente | Medio: depende del estado de la ECU (no determinado) |
| Tester Present | DFM `Interval=3000 ms`; reinicia en cada transacción | 2 s fijos, se omite si hay consulta en curso | Bajo; en captura una respuesta `7E` ocupó el lugar de la respuesta DTC |
| Lectura de datos F0/F1 | Alterna F0 (41 B) y F1 (49 B); parser por offset absoluto | Offsets `dataIndex = offset − 11` (correctos) pero sin `2C` | Alto (ver arriba) |
| Fórmulas MR-140 | `RaschetParam` | 56/56 idénticas | Ninguno |
| Parámetros calculados 67–71 | Calculados en el EXE | Pendientes | Bajo |
| ZF | Un bloque F0 compuesto por LIDs 01–04, 06 | Lee LIDs 01–04, 11 sueltos sin decodificar | Medio: LID 11 sin uso en EXE; falta LID 06 |
| DTC MR-140 | `19 DA FF 00`, entradas de 4 bytes | Trama correcta; respuesta nunca capturada | Medio |
| DTC ZF | `18 00 00 00`, entradas de 3 bytes | Decodifica (`P0703`) | Ninguno |
| Borrado DTC | `14 FF 00` | No implementado | — |
| Reset ECU | `11 01` + comprobación `RX[9]==0x51` (solo MR-140; ZF sin comprobar) | No implementado | — |
| Actuadores | Mapa 12 entradas | Catálogo igual, **byte de cilindro desfasado** | **Alto** (puede activar otro inyector o byte `FF`) |
| Adaptación | `30 2C 07 FF` + bucle | Solo construye la trama (`buildMr140ThrottleAdaptationRequest`) | Alto si se expone sin el bucle y sin F0 |
| Ident | `1A 80`; valida longitud extendida | ZF OK; MR-140 sin respuesta | Medio |

## 7. Funciones no analizadas a nivel byte (honestidad)
- Respuesta/validación completa de `Button_ClearDTCClick` (bucle con timeout 2000 ms): no determinado a nivel de byte.
- Contenido de `85 DST F1 12 00 04 …` en `StringGrid_DTCSelectCell`: no determinado (bytes finales dependen de celdas del grid).
- Nombre y papel de `0x4E9784` (llamado cuando falla la validación `6C`): no determinado.
- Etiquetas enum (`disp`, listas separadas por `;`): que el valor convertido sea el índice 0-based en la lista es `HIPOTESIS` (no se leyó la rutina que las pinta). Ejemplo: ZF ID 1 (palanca) `1;2;3;4;D;N;R;P;---`; el LID 01 capturado trae `05` → índice 5 = `N` si la hipótesis es cierta; el estado real del selector durante la captura no está registrado.
