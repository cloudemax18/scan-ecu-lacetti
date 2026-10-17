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

### 12.3 Tabla interna estática del ejecutable

En `RaschetParam` (bloque de código alrededor de `004E6B70`) se observa:
- La tabla empieza en la dirección `0x004F22AC`.
- El tamaño de registro se recorre con `add eax, 0x24`: **36 bytes por entrada**.
- El bucle compara el byte del desplazamiento `+0x00` con el selector global `[$004F6DA7]` y el valor de 32 bits en `+0x04` con el ID solicitado.
- El límite de búsqueda es el índice `0x177` inclusive: **376 entradas** (`0x178` en total).
- El campo de 32 bits en `+0x10` se compara con 1 y 2 en `VichMaxNomParam`, que calcula máximos separados según ese campo.
- La rutina lee además campos en `+0x14` y `+0x18` para seleccionar bytes del búfer `[$004F6DF8]` y convertirlos a un valor numérico. En los caminos observados combina bytes como `byte0 × 256 + byte1` o usa un byte solo. El significado completo de cada campo, la regla de signo/escala y la relación con los nombres del catálogo siguen pendientes.

Esta estructura confirma que el ejecutable tiene metadatos por unidad e ID y lógica para extraer/construir valores desde el búfer de respuesta. **No equivale todavía a un mapa completo de parámetros legible**, porque el contenido de la tabla está embebido en el ejecutable y aún no se ha reconstruido cada entrada.

### 12.4 Diferencia entre el catálogo y el sondeo físico

`archivos/CE.ini` contiene la sección `NaborParam12` con una lista seleccionada de números (01–71) y `SelectNaborParam12=*`. Esos números son coherentes con una selección/lista de parámetros de la familia seleccionada, pero no debe suponerse que todos sean IDs KWP enviados directamente sin seguir cada flujo de interfaz.

El catálogo `archivos/cloude/mr140_parametros.json` describe parámetros individuales con posiciones y fórmulas, y en sus entradas iniciales asocia `peticion_local_id: 240` (decimal, `0xF0`). Por otra parte, `VspomRaschetParam` construye una petición genérica `82 <dst> <src> 21 <BL> <checksum>` en la rama usada por el selector MR-140 `0x12`, donde `BL` proviene del parámetro seleccionado. Esto sugiere que hay más de un flujo/modo de consulta en el Delphi (por ejemplo, lectura por ID frente a lectura de bloques locales), pero la relación exacta todavía no está demostrada.

### 12.5 Próximos pasos concretos

1. Describir todos los campos de los bloques de 64 bytes del `.cedat` y aislar los bytes reales de TX, RX, tiempo y metadatos.
2. Validar longitud y checksum de las secuencias `21 F0` y `21 F1` almacenadas; compararlas con capturas físicas recientes, manteniendo cada sesión separada.
3. Reconstruir los 376 registros de 36 bytes de la tabla estática desde el ejecutable o desde las fuentes disponibles, con los campos `+0x00`, `+0x04`, `+0x10`, `+0x14`, `+0x18` como primeros candidatos.
4. Relacionar las entradas del selector `0x12` con `mr140_parametros.json` y la lista `NaborParam12`, sin asumir equivalencia entre índice de catálogo, ID de servicio KWP e índice de datos.
5. Repetir la misma reconstrucción para el selector ZF `0x22`; no reutilizar automáticamente las fórmulas MR-140.
6. Mantener la app en solo lectura y sin cambios de decodificación hasta obtener una correlación repetible entre ID, bytes de respuesta, fórmula y lectura física conocida.
