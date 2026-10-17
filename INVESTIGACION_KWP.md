# Estado del proyecto CheviExplorer KKL — investigación y pendientes

**Última actualización:** 2026-10-16  
**Repositorio:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Rama:** main

Este documento reúne avances, pruebas físicas, cambios de la app Android y preguntas abiertas. Distingue hechos observados de hipótesis para evitar presentar datos sin validar como parámetros confirmados.

## 1. Objetivo

Desarrollar una aplicación Android para comunicarse por K-Line mediante adaptador USB KKL con un Chevrolet Lacetti 1.8 automático y sus unidades:
- ECU motor Delphi HV-240.
- ECU motor Delphi MR-140.
- Transmisión automática ZF 4HP16.

El protocolo investigado es KWP2000 / ISO 14230 sobre K-Line. Las lecturas actuales se mantienen en **solo lectura**. No enviar comandos de escritura, programación, borrado ni acceso de seguridad durante la exploración.

## 2. Adaptador y comunicación

- Adaptador USB serie CH340/CH341.
- VID USB: 1A86; PID: 7523.
- Configuración serie probada: 10400 baudios, 8 bits, sin paridad, 1 bit de parada (8N1).
- El enlace K-Line se ha establecido con las ECUs investigadas.
- La app usa una cola RX alimentada por los datos recibidos y limita la acumulación a capturas activas.
- KwpBus.kt maneja el eco TX: si el primer byte recibido coincide con el enviado, comprueba el eco completo; si es ambiguo, aborta la transacción en vez de interpretar bytes dudosos como respuesta.

## 3. Pruebas físicas confirmadas

Los siguientes registros se observaron con el adaptador/ECU; no son valores inferidos de un catálogo.

### 3.1 ECU MR-140

Dirección/origen utilizado: 0x11.

| Operación | Solicitud | Respuesta observada | Resultado |
|---|---|---|---|
| Inicio de comunicación | 81 11 F1 81 04 | 83 F1 11 C1 EF 8F C4 | Positiva; checksum válido |
| Tester Present | 3E C1 | 7E 01 | Positiva; checksum correcto |
| Consulta DTC | 19 DA FF 00 | 59 00 | Respuesta positiva observada, compatible con cero DTC para esta consulta |
| Lectura ID F0 | 21 F0 | 7F 21 31 | Rechazo: Request Out Of Range |
| Lectura ID F1 | 21 F1 | 7F 21 31 | Rechazo: Request Out Of Range |

Sondeo del servicio 0x21:

| ID | Respuesta | Interpretación actual |
|---|---|---|
| 01 | NRC 31 | No admitido en esta sesión/prueba |
| 02 | 96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C | Positiva; 20 bytes de datos, sin decodificación confirmada |
| 03 | 86 F1 11 61 03 05 BF 9A 4C 96 | Positiva; datos 05 BF 9A 4C |
| 04 | 86 F1 11 61 04 00 BA 5B DA DC | Positiva; datos 00 BA 5B DA |
| 11, 20, F0, F1, FB | NRC 31 | No confirmados como lecturas válidas para esta ECU física |

La app consulta ahora IDs 02, 03 y 04 para MR-140 y muestra los bytes en bruto. No etiquetarlos como RPM, temperatura, carga, posición u otra magnitud hasta demostrar el mapa y las fórmulas.

### 3.2 Transmisión ZF 4HP16

Dirección/origen utilizado: 0x18.

| Operación | Solicitud | Respuesta observada | Resultado |
|---|---|---|---|
| Inicio de comunicación | 81 18 F1 81 0B | 83 F1 18 C1 EF 8F CB | Positiva; checksum correcto |
| Tester Present | 3E C8 | 7E 08 | Positiva; checksum correcto |

Sondeo del servicio 0x21:

| ID | Respuesta observada | Datos / estado |
|---|---|---|
| 01 | 85 F1 18 61 01 05 05 00 FA | Positiva; datos 05 05 00 |
| 02 | 86 F1 18 61 02 72 20 00 47 CB | Positiva; datos 72 20 00 47 |
| 03 | 91 F1 18 61 03 00 00 00 00 00 00 00 00 00 00 FC FF 00 00 00 F9 | Positiva; 15 bytes de datos: 00 00 00 00 00 00 00 00 00 00 FC FF 00 00 00 |
| 04 | 93 F1 18 61 04 00 DC 05 DC 05 DC 05 DC 05 D9 05 E0 05 E2 05 D9 05 0D | Positiva; 17 bytes de datos: 00 DC 05 DC 05 DC 05 DC 05 D9 05 E0 05 E2 05 D9 05 |
| 11 | 97 F1 18 61 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 | Positiva; 21 bytes de datos: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF |
| 20 | 7F 21 12 | Subfunción/formato no admitido |
| F0 | 7F 21 22 | Condiciones no correctas |
| F1, FB | 7F 21 12 | Subfunción/formato no admitido |

Los IDs positivos de la ZF no tienen aún un mapa de bytes y fórmulas verificado. No etiquetar datos como velocidad de entrada/salida, temperatura, marcha o freno hasta validar posiciones, escalas, signo, endianness y unidades.

**Calidad de datos:** una captura anterior de DTC de la ZF estaba contaminada por Tester Present y tenía checksum incorrecto. No usarla como prueba de P0703. La tabla española sí contiene P0703 como “Fallo en el circuito del sensor de freno”, pero eso no prueba que la ECU lo haya reportado.

## 4. NRC observados

- 0x31: Request Out Of Range (solicitud fuera de rango).
- 0x12: subfunción o formato no admitido.
- 0x22: condiciones no correctas.

Un NRC describe el resultado de esa solicitud en esa sesión/configuración. No demuestra que el ID sea universalmente inválido: puede depender de ECU, variante, sesión, estado del vehículo o formato exacto.

## 5. Trabajo realizado en la app Android

- Integración de comunicación KWP en KwpBus.kt.
- Manejo del eco TX para reducir confusión entre bytes transmitidos y recibidos.
- Cola RX limitada a capturas activas.
- Sondeo de identificadores KWP 0x21 en modo de solo lectura.
- Pausa de Tester Present durante el sondeo para reducir contaminación de captura.
- Botón de exploración de IDs: 21 01, 02, 03, 04, 11, 20, F0, F1, FB.
- Lectura MR-140 para IDs 02/03/04 con datos en hexadecimal, sin etiquetas especulativas.
- Exportación local de capturas RX.
- Retirada de la subida de capturas a GitHub/Gist; no reintroducirla sin petición explícita.
- Dependencia kotlinx-coroutines-android:1.9.0.
- Corrección de paquetes/imports de KwpBus.kt e IdProbe.kt para que coincidan con package kwp.

## 6. Investigación del Delphi original

Archivo desensamblado: archivos/dump/main.pas.

Otros archivos útiles:
- archivos/cloude/parametros.json: catálogo general extraído, con 239 entradas observadas durante el análisis.
- archivos/cloude/mr140_parametros.json: catálogo MR-140.
- archivos/cloude/Mr140Params.kt y app/src/main/java/com/cheviexplorer/android/Mr140Params.kt: tablas/decodificadores heredados que deben cotejarse con respuestas reales.
- dtc_tablas_es.json: 316 entradas; se observaron 16 descripciones vacías.

### 6.1 Hallazgo: la secuencia de lectura está dentro de StringGrid_DTCSelectCell

El bloque 004EDD48–004EDEFC, incluida la secuencia que comienza en 004EDE1C, pertenece a TForm1.StringGrid_DTCSelectCell(Sender: TObject). No es una rutina independiente cuyo propósito ya esté identificado.

Ese procedimiento:
1. Lee celdas de un TStringGrid y convierte parte del texto a un byte.
2. Envía la petición de cinco bytes 82 <dst> <src> 21 02 <checksum> mediante WriteReadComm.
3. Espera 200 ms.
4. Envía 82 <dst> <src> 21 F0 <checksum>.
5. Espera 200 ms.
6. Envía una petición de ocho bytes con patrón 85 <dst> <src> 12 00 04 <BL> <valor_previo> <checksum>.
7. BL se obtiene de una celda del grid; el byte siguiente procede de una variable local convertida desde otra celda.

**Qué demuestra:** el programa Delphi solicita explícitamente 21 02 y 21 F0 en este flujo de selección de celda, además de enviar una petición de servicio 12.

**Qué no demuestra:** no identifica qué representan esos bytes, qué ECU/estado hace válidas esas solicitudes ni por qué la ECU MR-140 física responde NRC 31 a 21 F0. El procedimiento se activa al seleccionar una celda del grid de DTC; no asumir que es el flujo de datos en vivo sin rastrear el estado de la interfaz y las variables globales.

### 6.2 VspomRaschetParam: constructor de peticiones

TForm1.VspomRaschetParam comienza en 004E6714. La petición depende de la variable global [$004F6DA7] y del ID de parámetro:

- Si el selector global vale 0x42, construye 84 <dst> <src> 21 01 01 01 <checksum> (7 bytes).
- Si vale 0x14 o 0x1E, construye 80 <dst> <src> 02 21 <BL> <checksum> (6 bytes).
- En otras ramas, construye 82 <dst> <src> 21 <BL> <checksum> (5 bytes).

Después comprueba respuestas que contienen el servicio positivo 0x61 y compara bytes de respuesta con el ID solicitado. El formato parece depender del tipo/selección de ECU o modo; no simplificarlo a una única trama universal sin identificar las variables globales.

### 6.3 RaschetParam: tabla interna y conversión

TForm1.RaschetParam comienza en 004E69B4. Recorre una tabla interna y busca una entrada que coincida con dos claves: un selector global ([$004F6DA7]) y el ID solicitado. Luego obtiene metadatos, lee uno o más bytes del búfer y los convierte a valor numérico, incluyendo casos de uno o dos bytes. También hay lógica dependiente del selector/protocolo.

Esto confirma que existe una tabla de metadatos que relaciona tipo de ECU/selector e ID con longitud/posición o forma de conversión. Aún no se ha resuelto el significado completo de sus campos ni demostrado que los IDs de esta tabla coincidan directamente con los IDs probados en la ECU física actual.

## 7. Commits y compilación

Cambios importantes:
- 7e1169f76e444334f353cbcaca9628ba7631c6b0 — dependencia kotlinx-coroutines-android:1.9.0.
- 709e0665f5b5746cae10b365554252ff48af508b — implementación inicial de KwpBus.kt.
- 54c625bd9bc35876937f82fc31ea285178b76681 — ajuste del eco TX.
- a1de3af18675f74401c1669ecda9531c5ac8e449 — implementación inicial de IdProbe.kt.
- 2d5cd9364f6b5028309f978fbaef6b7171148c1b — integración en MainActivity.kt.
- c2a011275415813b47855ffa2ab8fad2370a9273 — cola RX limitada a capturas activas.
- 01f3784fcb8b44c378839884f9eb42ded015904e y fb76d04609a9eab9cbb29e7c5a688f22089ecc08 — correcciones de paquetes.
- d6f8120c7f48bcff5325b0719baec8319246ed74 — lectura MR-140 cambiada a IDs 02/03/04 y datos en bruto.

GitHub Actions para el último commit citado terminó con **success**:
https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39000377806

El flujo ejecuta pruebas unitarias y assembleDebug y publica un APK de depuración. CI confirma que compila y pasan las pruebas automatizadas existentes; no sustituye una prueba física en el vehículo. Los cambios futuros deben volver a compilarse.

## 8. Pendientes — prioridad

### P0 — validar en el vehículo
- [ ] Instalar el APK actual y probar MR-140 IDs 02, 03 y 04.
- [ ] Guardar capturas RX/TX limpias por ECU, con cada solicitud y respuesta delimitadas.
- [ ] Repetir las lecturas en estados controlados del vehículo y anotar las condiciones.
- [ ] Verificar que el parser no confunde eco, Tester Present, respuestas tardías ni NRC con datos válidos.
- [ ] Confirmar checksum y longitud de cada trama exportada.

### P1 — resolver el catálogo Delphi
- [ ] Rastrear dónde se asignan y cambian [$004F6DA7], [$004F6DA8], [$004F6DA9] y [$004F6DA6].
- [ ] Identificar los índices de ECU/protocolo y las direcciones destino/origen de cada flujo.
- [ ] Decodificar la estructura de tabla recorrida por RaschetParam a partir de $4F2294, $4F2298, $4F22A8 y $4F22AC.
- [ ] Relacionar las entradas con parametros.json y mr140_parametros.json; aclarar si el índice de tabla es un ID KWP, un índice interno o ambos.
- [ ] Identificar el flujo de interfaz que llama a StringGrid_DTCSelectCell y por qué consulta 21 02, 21 F0 y después servicio 12.
- [ ] Explicar la discrepancia entre el Delphi y la ECU MR-140 física que rechaza 21 F0 con NRC 31.

### P2 — decodificar la ZF
- [ ] Asociar IDs positivos 01/02/03/04/11 con entradas del catálogo de transmisión.
- [ ] Recuperar fórmulas exactas: offset, longitud, endianness, signo, escala, unidad y valores especiales.
- [ ] Comparar lecturas bajo condiciones controladas y datos conocidos, sin realizar pruebas peligrosas.
- [ ] No etiquetar como RPM, temperatura, selector, marcha o freno hasta que la correlación sea repetible.

### P3 — robustez
- [ ] Añadir pruebas unitarias de checksum, longitudes, respuesta positiva 0x61, NRC 0x7F, eco y timeout.
- [ ] Añadir tests de regresión con las tramas reales incluidas en este documento.
- [ ] Verificar recuperación tras desconexión/reconexión USB y respuesta incompleta.
- [ ] Mantener capturas locales; no añadir subida automática a GitHub/Gist.
- [ ] Ejecutar CI tras cada cambio de protocolo/decodificación y registrar el SHA probado.

## 9. Reglas para futuras modificaciones

1. No inventar etiquetas ni fórmulas. Los datos no decodificados se muestran en hexadecimal bruto.
2. Una petición del Delphi no prueba soporte de la ECU física; contrastar siempre con la respuesta real.
3. No confundir capturas contaminadas con DTC reales; revisar límites de trama, eco, checksum y Tester Present.
4. Mantener solo lectura durante la exploración; no experimentar con escritura, programación, security access, borrado ni actuadores.
5. Cada cambio debe compilarse y quedar asociado a un commit y una ejecución de CI.
6. Actualizar este documento cuando haya capturas nuevas, fórmulas demostradas o resultados físicos.

## 10. Fuentes internas

- archivos/dump/main.pas — desensamblado Delphi, StringGrid_DTCSelectCell, VspomRaschetParam y RaschetParam.
- archivos/cloude/parametros.json — catálogo general extraído.
- archivos/cloude/mr140_parametros.json — catálogo MR-140.
- archivos/cloude/Mr140Params.kt y app/src/main/java/com/cheviexplorer/android/Mr140Params.kt — implementaciones/catálogos que deben validarse.
- dtc_tablas_es.json — descripciones españolas de códigos de avería.
- app/src/main/java/com/cheviexplorer/android/MainActivity.kt, KwpBus.kt e IdProbe.kt — implementación Android.


## 11. Hallazgo adicional: selector global y tipos de unidad

Al rastrear las escrituras a la variable global [$004F6DA7], se localizaron varios manejadores de selección del menú Delphi que asignan valores constantes. Esto refuerza que esa variable es un selector de familia/unidad o modo, no un ID de parámetro individual.

| Manejador Delphi | Valor asignado a [$004F6DA7] |
|---|---:|
| N_SiriusClick | 0x11 |
| N_MR140Click | 0x12 |
| N_SiriusD32Click | 0x13 |
| N_BoschClick | 0x14 |
| N_AisinClick | 0x21 |
| N_ZFClick | 0x22 |
| N_Airbag_SRS0Click | 0x31 |
| N_Airbag_SRS1Click | 0x32 |
| N_ABS_BoshClick | 0x41 |
| N_ABS_TevesClick | 0x42 |
| N_ABS_AVEO1Click | 0x43 |
| N_ABS_AVEO3Click | 0x44 |

Direcciones de código relevantes del desensamblado:
- N_MR140Click asigna 0x12 en torno a 004E39CC.
- N_SiriusClick asigna 0x11 en torno a 004E3924.
- N_AisinClick asigna 0x21 en torno a 004E3B0C.
- N_ZFClick asigna 0x22 en torno a 004E3BA4.
- N_BoschClick asigna 0x14 en torno a 004E3A74.
- N_ABS_TevesClick asigna 0x42 en torno a 004E3CD0.

**Implicación:** en VspomRaschetParam, el caso especial 0x42 corresponde al selector del ABS Teves; el caso 0x14 corresponde al selector Bosch; el MR-140 seleccionado por N_MR140Click usa 0x12 y cae en la rama general de petición 0x82 <dst> <src> 0x21 <BL> <checksum>. Esto es una deducción directa del flujo de control desensamblado, pero todavía no revela por sí solo el significado de cada parámetro ni garantiza que el comportamiento sea idéntico para todas las versiones del software o ECUs.

### Siguiente paso derivado

- [ ] Seguir las asignaciones de las variables de dirección [$004F6DA8] y [$004F6DA9] dentro de cada manejador de selección y determinar cuál es destino y cuál origen a partir de las tramas emitidas.
- [ ] Seguir [$004F6DA6], que se añade como byte final de las peticiones, y verificar cómo se calcula el checksum en cada formato.
- [ ] Decodificar las tablas de metadatos usando el selector global como clave; separar las entradas de MR-140 (0x12) de las de ZF (0x22) antes de correlacionar IDs y fórmulas.


## 12. Investigación del archivo `.cedat` y estructura de la tabla Delphi (2026-10-17)

### 12.1 Formato de archivo observado

Archivo analizado: `archivos/2610161732 MR-140.cedat`.
- Tamaño exacto: 30.464 bytes (`0x7700`).
- La rutina `MenuItem_LoadClick` valida que el archivo tenga al menos `0x80` bytes y que su tamaño sea múltiplo de `0x40` (64 bytes). También lee los primeros 128 bytes por separado y, en ciertos casos, procesa el resto desde el desplazamiento `tamaño - bloque`.
- Para este archivo, la división compatible con esas comprobaciones es una cabecera de 128 bytes y 474 bloques de 64 bytes: `128 + 474 × 64 = 30.464`.
- El primer byte de la cabecera es `0x12`, el selector que el Delphi asigna a MR-140 (`N_MR140Click`). A continuación hay una cadena de identificación y relleno; no copiar datos identificativos al informe.
- `MenuItem_SaveClick` genera el nombre con extensión `.cedat` y copia el archivo temporal `temp.tmp` al destino elegido. Otra ruta de guardado también copia `temp.tmp`; por eso el archivo parece ser un contenedor binario de sesión/datos, no un catálogo de parámetros en texto.

**Límite de la conclusión:** la división en cabecera y bloques de 64 bytes está apoyada por las comprobaciones de tamaño del lector y por la estructura repetida del archivo. Aún no se ha documentado formalmente el significado de todos los campos de cada bloque.

### 12.2 Bloques con solicitudes KWP repetidas

En los bloques de 64 bytes desde el desplazamiento 128 aparecen repetidamente, en posiciones alternas, secuencias que comienzan así:

- Solicitud aparente `82 11 F1 21 F0 95`, seguida de bytes con apariencia de respuesta `9F F1 11 61 F0 ...`.
- Solicitud aparente `82 11 F1 21 F1 96`, seguida de bytes con apariencia de respuesta `A7 F1 11 61 F1 ...`.

Las secuencias se repiten a lo largo del archivo, con bytes de tiempo/estado entre registros. Los valores `0x9F` y `0xA7` parecen encabezados KWP de longitud variable, pero las comprobaciones iniciales **no validan esos segmentos como tramas completas**: para la candidata `9F F1 11 61 F0 ... 56`, la suma aditiva de los bytes anteriores da `0x96`, no el byte final observado `0x56`; para la candidata `A7 F1 11 61 F1 ...`, el límite de 42 bytes tomado provisionalmente termina en `00` mientras que la suma calculada antes de ese byte da `0x73`. Esto indica que el límite de paquete, el campo de checksum o la interpretación del bloque aún no están resueltos. Parte de esos bytes podría pertenecer a metadatos/estructura interna, no al mensaje transmitido por la ECU.

Por tanto, el archivo solo aporta **candidatas** de registros asociados a solicitudes `21 F0` y `21 F1` con los bytes `61 F0` y `61 F1` en posiciones compatibles con una respuesta positiva; todavía no prueba que la ECU entregara tramas positivas válidas. Esto contrasta con las sesiones físicas recientes de la app, donde esas peticiones recibieron NRC `0x31`, pero no podemos concluir que exista una contradicción hasta reconstruir el registro y validar límites/checksums. No cambiar la app ni dar por universalmente válidos esos IDs.

### 12.3 Tabla interna estática del ejecutable — reconstrucción completada

Se creó un extractor reproducible, `tools/reconstruct_delphi_table.py`, y se ejecutó en GitHub Actions contra `archivos/CheviExplorer1.8.exe`. La tabla extraída se guardó en `archivos/cloude/delphi_parameter_table.json` con los 376 registros completos, sus bytes originales y las cadenas recuperables del ejecutable.

Resultados del PE:
- Base de imagen: `0x00400000`.
- Dirección virtual de la tabla: `0x004F22AC`; desplazamiento correspondiente en el archivo: `0xF10AC`.
- **376 registros × 36 bytes** (`0x24`), índices 0–375.
- La extracción valida las dimensiones de la tabla y se ejecuta en un flujo de CI separado del APK.

#### Estructura de cada registro

| Desplazamiento | Campo reconstruido | Interpretación |
|---|---|---|
| `+0x00` | `selector` (byte) | Selector de ECU, comparado con el global `[$004F6DA7]` |
| `+0x04` | `id` (DWORD) | ID local del parámetro |
| `+0x08` | `name_ptr` | Puntero a nombre en ruso |
| `+0x0C` | `unit_ptr` | Puntero a unidad; cero en entradas que usan etiquetas enumeradas |
| `+0x10` | `max_group` (DWORD) | Grupo 1/2; `VichMaxNomParam` calcula máximos por separado |
| `+0x14` | `data_offset` (DWORD) | Desplazamiento utilizado para extraer datos del búfer |
| `+0x18` | `read_mode` (DWORD) | Modo de extracción/conversión inicial |
| `+0x1C` | `precision` (DWORD) | Precisión decimal pasada a la rutina de formato |
| `+0x20` | `display_ptr` | Texto de rango de gráfica o lista de etiquetas enumeradas |

Los nombres de campo son etiquetas de análisis, no nombres originales de Delphi. Los punteros se resuelven contra las cadenas estáticas del ejecutable; `raw_hex` conserva los 36 bytes para poder auditar cada interpretación.

#### Modos de lectura observados en `RaschetParam`

- `read_mode = 0`: combina dos bytes en orden little-endian.
- `read_mode = 1`: toma un byte.
- `read_mode = 2`: combina dos bytes en orden big-endian.
- `read_mode = 3`: camino calculado; no usa un desplazamiento de datos directo en esa entrada.

La unidad en `+0x0C` no es la fórmula: por ejemplo, el parámetro MR-140 1 apunta a `КПа`, mientras `display_values` contiene `0*100`. En parámetros enumerados la unidad suele ser nula y `display_values` contiene etiquetas como `Выкл.;Вкл.`. El texto de rango y la precisión no bastan por sí solos para inferir una fórmula física; se conserva la fórmula separada del catálogo cuando existe.

#### Distribución de los 376 registros por selector

| Selector | Registros |
|---|---:|
| `0x11` | 56 |
| `0x12` (MR-140) | 61 |
| `0x13` | 51 |
| `0x14` | 63 |
| `0x15` | 2 |
| `0x21` | 35 |
| `0x22` (ZF) | 30 |
| `0x32` | 17 |
| `0x41` | 8 |
| `0x42` | 9 |
| `0x43` | 27 |
| `0x44` | 16 |
| `0xDC` | 1 |
| **Total** | **376** |

#### Correlación confirmada con el catálogo MR-140

El selector `0x12` tiene 61 entradas y sus IDs coinciden exactamente con los 61 IDs de `archivos/cloude/mr140_parametros.json` y con la lista de `NaborParam12` de `archivos/CE.ini`. La tabla permite cerrar varias incógnitas:

- Las entradas con `max_group = 1` corresponden al bloque local `0xF0` (decimal 240); las entradas de grupo 2 corresponden al bloque `0xF1` (decimal 241).
- En las **56 entradas que leen bytes directamente**, `data_offset = indice_datos + 11` coincide con el catálogo. Esto incluye parámetros que comparten byte, como IDs 18, 19 y 21; sus fórmulas/mascaras separadas explican por qué no tienen desplazamientos distintos.
- Los IDs 67–71 usan `read_mode = 3`, `data_offset = 0` y son valores calculados (consumo y distancia de sesión); no deben interpretarse como bytes directos de la ECU.
- La tabla estática proporciona unidad, rango/etiquetas, desplazamiento, modo y precisión; el catálogo aporta las fórmulas ya documentadas. La coincidencia de metadatos no valida por sí sola una lectura física ni autoriza a aplicar una fórmula a bytes de una captura distinta.

#### Primeros hallazgos de la tabla ZF 4HP16

El selector `0x22` contiene 30 entradas, IDs 1–30. Ejemplos extraídos del ejecutable:

| ID | Nombre del ejecutable | Offset | Modo |
|---:|---|---:|---:|
| 1 | Posición de la palanca selectora | 11 | 1 byte; etiquetas enumeradas |
| 2 | Sensor de freno | 12 | 1 byte; apagado/encendido |
| 7 | Temperatura del aceite de transmisión | 15 | 2 bytes little-endian |
| 9 | RPM del motor | 18 | 2 bytes little-endian |
| 10 | RPM del eje de entrada | 20 | 2 bytes little-endian |
| 12 | RPM del eje de salida | 24 | 2 bytes little-endian |
| 28 | Marcha actual | 49 | 1 byte; etiquetas enumeradas |

Estos son metadatos estáticos del programa, no una validación de escala o endianess contra la captura física de la ZF. No añadir fórmulas a la app hasta cotejar cada campo con bytes RX completos y válidos.

### 12.4 Diferencia entre consulta local y bloque de datos

La correlación del catálogo aclara la relación entre las dos vías: los parámetros MR-140 de grupo 1 se asocian al bloque local `0xF0`; los de grupo 2, al bloque `0xF1`. El campo `data_offset` apunta dentro del búfer que maneja el Delphi, y los índices de catálogo comienzan 11 bytes antes de ese desplazamiento. Esto demuestra una relación estructural entre el catálogo y la tabla, pero no resuelve todavía los límites/checksums de las secuencias candidatas del archivo `.cedat` descritas en §12.2 ni contradice los NRC observados en las pruebas físicas.

### 12.6 Validación desde Android

La pantalla **En vivo** incluye ahora **Validar mapa KWP (solo lectura)**. La exploración consulta el servicio 0x21 para IDs 0x01–0x40 y los IDs 0xF0, 0xF1 y 0xFB. No envía servicios de escritura, borrado, programación ni actuadores.

Para recopilar evidencia del vehículo:

1. Vehículo estacionado y seguro; conecta KKL, abre la app y selecciona MR-140.
2. Inicializa la sesión y abre **En vivo → Validar mapa KWP (solo lectura)**. Espera a que finalice.
3. Guarda/exporta el registro local de RX/log de la aplicación y comparte ese archivo junto con el resumen de la pantalla.
4. Repite el mismo proceso con ZF 4HP16.
5. Comparar solo respuestas positivas con dirección correcta y checksum válido. Los NRC y los timeouts se registran como evidencia negativa, no como valores de parámetro.

**Límite actual:** el catálogo reconstruido aporta offsets, modos y metadatos, pero las respuestas físicas confirmadas de MR-140 a 0x21 F0/F1 fueron NRC 0x31. Por ello, todavía no se pueden mostrar todos los parámetros del .exe como valores físicos fiables. La exploración sirve para detectar qué IDs responde esta variante; para completar el mapa quizá haga falta identificar la secuencia de consulta/variante exacta del ejecutable y comparar capturas del propio .exe con la app.

### 12.5 Próximos pasos concretos

1. Usar la tabla reconstruida para crear un mapa de datos por parámetro, manteniendo separados selector, ID local, bloque `0xF0/0xF1`, offset, modo, unidad, precisión y fórmula.
2. Validar las fórmulas MR-140 con capturas físicas completas, empezando por parámetros con interpretación independiente conocida; no inferir escala a partir del rango gráfico.
3. Analizar por separado las 30 entradas ZF `0x22` y cotejar sus offsets/modos con las respuestas físicas de IDs 01–04 y 11; no reutilizar automáticamente fórmulas MR-140.
4. Continuar la reconstrucción de los bloques de 64 bytes del `.cedat` y validar los límites/checksums de las candidatas `21 F0` y `21 F1`.
5. Mantener la app en solo lectura hasta que cada fórmula esté corroborada por una captura completa y repetible.
