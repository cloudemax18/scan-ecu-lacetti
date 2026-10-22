# Análisis de captura KWP — CheviExplorer
**Captura fuente:** `archivos/Capturas/cheviexplorer-captura-1792610672651.md`  
**Fecha/hora de sesión según marcas del archivo:** 15:21:45–15:24:29 (la captura no indica fecha ni zona horaria).  
**Tipo de evidencia:** registro de aplicación aportado por el usuario; no es un volcado independiente de analizador de bus.  
**Estado:** análisis documental. No se ejecutaron nuevas pruebas a partir de este archivo.

## Resumen ejecutivo

El registro documenta que la app detecta un adaptador USB VID `1A86` / PID `7523`, abre `Ch34xSerialDriver` a 10400 baud, 8N1, y registra secuencias etiquetadas como TX/RX para perfiles MR-140 y ZF 4HP16. En MR-140 hay respuestas candidatas de inicio KWP, lectura DTC con SID positivo `0x59`, y lecturas de identificadores `0x02`, `0x03` y `0x04` con respuesta positiva `0x61`. En ZF se registra una respuesta candidata positiva de StartCommunication y respuestas `0x7E` al TesterPresent.

Esto respalda que **la aplicación registró** tramas con formato, direcciones y sumas de comprobación coherentes según su propio validador. No demuestra por sí solo la identidad exacta del hardware ECU, el estado mecánico del vehículo, la semántica de los bytes de datos, ni que las capturas TX/RX sean una observación independiente del bus. El propio registro señala que algunas tramas son candidatas y que las consultas reconstruidas desde código deben validarse.

## Hallazgos principales

### 1. Adaptador y enlace serie
- USB reportado: VID `1A86`, PID `7523`; el log lo identifica como controlador CH34x.
- Puerto reportado: 10400 baud, 8N1.
- Hay varios RX `00` al abrir/inicializar. El registro no determina si son ruido, estado transitorio o datos residuales.
- El controlador no admite `purgeHwBuffers()`; la app continúa. Conviene vaciar/aislar RX de forma compatible antes de asociar respuestas a una transacción, o documentar por qué no se requiere.

### 2. Inicio de comunicación
- MR-140: TX registrado `81 11 F1 81 04`; respuesta candidata `83 F1 11 C1 EF 8F C4`. El log calcula checksum `C4` y lo valida como coherente.
- ZF 4HP16: TX registrado `81 18 F1 81 0B`; respuesta candidata `83 F1 18 C1 EF 8F CB`. El log calcula checksum `CB` y lo valida como coherente.
- En ambos casos el servicio `0x81` recibe una respuesta positiva `0xC1` según el parser. Las claves `EF 8F` no son una identificación de ECU.
- La propia app marca la trama inicial como “candidata, aún no validada”; después registra validación de formato/direcciones/checksum. Debe conservarse esa distinción entre inicialización de enlace y validación completa del perfil.

### 3. TesterPresent y posible concurrencia
- El TesterPresent automático se programa cada 2 segundos.
- Se registran respuestas `81 F1 11 7E 01` para MR-140 y `81 F1 18 7E 08` para ZF, compatibles con una respuesta de servicio positivo `0x7E` a la solicitud `0x3E`.
- En MR-140 aparecen consultas DTC e inicio de comunicación cerca de las ventanas en que TesterPresent está activo. A las 15:23:04, por ejemplo, se registra TesterPresent, respuesta `7E`, RX `00` y luego una nueva secuencia de inicio.
- El registro no prueba por sí solo que una respuesta haya sido consumida por la solicitud equivocada, pero demuestra que el diseño debe gestionar de forma explícita la exclusión mutua/serialización y la asociación de RX con una sola petición pendiente.
- Requisito recomendado: un único propietario de la transacción KWP; no ejecutar TesterPresent, DTC, lecturas periódicas ni reinicialización concurrentemente. Una respuesta `7E` no puede aceptarse como respuesta a DTC o a `0x2C`.

### 4. Lectura DTC
- Se registra la solicitud `84 11 F1 19 DA FF 00 78` y la respuesta `82 F1 11 59 00 DD` en varias ocasiones.
- El validador de la app informa checksum recibido/esperado `DD`, coincidente, y SID positivo `0x59`.
- La app interpreta el byte `00` como contador de DTC cero. Esta es una interpretación reportada por el parser Delphi del programa, no una validación independiente de la definición OEM del subservicio ni del estado total de todos los módulos.
- La captura no muestra una lista de códigos de avería; la conclusión apropiada es “esta respuesta fue interpretada por la app como cero DTC en esta consulta”, no “el vehículo está libre de fallos”.

### 5. Identificadores de datos MR-140
Se registran consultas `21 02`, `21 03` y `21 04` con respuestas positivas `61 02`, `61 03` y `61 04`. Los checksums indicados por el validador coinciden:
- ID `02`: respuesta larga, checksum `7C`; 20 bytes de datos RAW según la app.
- ID `03`: datos `05 BF 9A 4C`, checksum `96`.
- ID `04`: datos `00 BA 5B DA`, checksum `DC`.
- El registro dice expresamente que no asigna unidades ni decodifica campos sin mapa validado. Mantener esos bytes como datos crudos hasta contar con una definición fiable específica del perfil ECU.

### 6. ZF 4HP16
- Se observa una respuesta positiva candidata al inicio `0x81), con origen `0x18` según el registro.
- Se observan varias respuestas `7E 08` al TesterPresent.
- No se registra en esta captura lectura DTC positiva de ZF, identificación de TCM, definición de bloques `0x2C), ni lectura de datos de transmisión. No inferir soporte de esas funciones.

## Problemas y acciones recomendadas

| Prioridad | Hallazgo | Acción |
|---|---|---|
| P0 | TesterPresent automático puede solaparse temporalmente con otras operaciones; la captura no prueba una respuesta mal asociada, pero hace crítica la serialización. | Introducir un solo gestor de transacciones; pausar/encolar TesterPresent mientras hay una solicitud pendiente; correlacionar y validar respuesta. |
| P0 | El reinicio de comunicación ocurre cerca de TesterPresent y hay RX `00` residuales. | Limpiar/descartar RX anterior al inicio de una nueva sesión y reiniciar el estado de la sesión; no aceptar respuestas antiguas como actuales. |
| P1 | El resultado DTC cero depende del parser actual. | Conservar TX/RX crudos y verificar el subservicio/formato contra documentación específica antes de describirlo como diagnóstico completo. |
| P1 | Los IDs `02`–`04` devuelven bytes, pero no hay mapa de unidades validado en esta captura. | No mostrar unidades ni nombres de parámetros sin fuente/escala específica. |
| P1 | El log no es una captura independiente de bus. | Para evidencia de mayor confianza, guardar trazas TX/RX crudas, marca temporal, longitud, resultado del checksum y estado de la transacción; diferenciar eco local de respuesta ECU. |
| P1 | La sesión ZF solo confirma inicio y TesterPresent en esta evidencia. | Mantener no verificados DTC/datos/definiciones dinámicas ZF hasta capturas específicas. |
| P2 | El aviso `purgeHwBuffers()` indica una diferencia de API del controlador. | Implementar limpieza compatible con la librería utilizada o documentar el mecanismo alternativo y cubrirlo con pruebas. |

## Próximas pruebas seguras

1. En una sesión estacionaria, motor apagado y contacto según el procedimiento de diagnóstico aplicable, capturar una única inicialización MR-140 sin iniciar lecturas simultáneas.
2. Hacer una sola consulta de lectura por vez y verificar que cada respuesta se asocia a la solicitud pendiente correcta.
3. Repetir una consulta DTC de solo lectura y conservar el TX/RX exacto. No borrar DTC.
4. Probar lecturas de datos ya aceptadas una por una, manteniendo los bytes sin decodificar.
5. Repetir para ZF solo las operaciones ya verificadas para ese perfil; esta captura no autoriza añadir comandos nuevos.
6. Añadir pruebas unitarias para respuesta tardía, eco TX, RX `00`, respuesta `7E` intercalada, timeout, cambio de perfil y desconexión.
7. No probar actuadores, adaptación de acelerador ni servicio `0x2C` hasta cerrar la compuerta real, validar definiciones y superar revisión/CI.

## Límites de certeza

- **Respaldado directamente por el archivo:** bytes TX/RX que aparecen en el registro, timestamps, mensajes de la app y resultados que el validador de la app declara.
- **Inferencia técnica razonable:** la planificación de TesterPresent debe serializarse con el resto de las solicitudes; el registro contiene suficientes eventos cercanos para justificar pruebas de concurrencia.
- **No demostrado por esta captura:** identidad física exacta de la ECU, definición OEM de los datos, ausencia absoluta de DTC en el vehículo, compatibilidad de funciones no ejercitadas, validez de `0x2C), ni ejecución de pruebas unitarias/CI/vehículo fuera de lo que muestra el propio log.

## Estado de ejecución

Este documento es un análisis del registro adjunto. No se ejecutaron pruebas JUnit, Gradle, CI ni nuevas pruebas físicas al redactarlo.