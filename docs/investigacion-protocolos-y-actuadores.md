# Investigación de protocolos y pruebas de actuadores

Vehículo objetivo: Chevrolet/Daewoo Lacetti 2008, motor 1.8 LDA, transmisión automática ZF 4HP16. Interfaz disponible: KKL 409.1 USB con CH340/CH341 por USB-OTG, sin interruptor.

## Hallazgos del ejecutable CheviExplorer_ES.exe

Se inspeccionó la tabla de cadenas del ejecutable Windows Delphi (PE32, 1.31 MB). Aparecen nombres de funciones/controles `PortInit`, `Altinit`, `Button_ECUIdentClick`, `TimerTesterPresentTimer`, `test_ON`, `test_OFF`, `MenuItem_TestClick` y la pantalla «Control de actuadores». También contiene perfiles «Motor (MR-140/HV-240)», «Transmisión» y «ABS AVEO (Delphi)», así como etiquetas de actuadores y parámetros de transmisión. Estos nombres confirman que el programa original incluye rutinas de inicialización, keep-alive/TesterPresent, identificación y pruebas ON/OFF; la tabla de cadenas por sí sola no revela los bytes que transmiten esas rutinas. La siguiente fase de ingeniería inversa debe localizar esas rutinas en el código nativo y relacionarlas con capturas de tráfico conocidas.

## Nueva evidencia estática del ejecutable

La inspección de cadenas ASCII del PE32 confirmó referencias a `PortInit`, `Altinit`, `TimerTesterPresentTimer`, `Button_ECUIdentClick`, `test_ONClick`, `test_OFFClick`, `SecurityAccess`, `Prueba del adaptador K-Line`, `Control de actuadores` y archivos de respuestas `*.cedat`. En datos de recursos aparece la cadena `10400`, lo que respalda priorizar 10400 bit/s como primer ajuste de captura; no prueba por sí solo que todas las ECU objetivo usen esa velocidad ni revela la secuencia de inicialización. El ejecutable importa funciones Win32 de puerto serie como `CreateFileA`, `ReadFile`, `WriteFile`, `SetCommState`, `SetCommTimeouts`, `SetCommBreak`, `PurgeComm` y `Sleep`, así que el análisis de la rutina de inicialización debe prestar atención a temporización y a cambios de BREAK, no solo a comandos KWP genéricos.

## Estado confirmado

- La app abre un puerto USB-serie y registra bytes recibidos en hexadecimal.
- Para MR-140/HV-240 hay evidencia pública de diagnóstico por K-Line y perfiles de escáner que muestran datos en vivo y pruebas de actuadores; esto no confirma todavía los bytes exactos de inicialización ni la compatibilidad de cada variante con esta interfaz.
- El manual de servicio Lacetti/ZF 4HP16 documenta pruebas de actuadores desde una herramienta de diagnóstico mediante el menú «Actuating», incluyendo Solenoid 1 ON/OFF y válvulas de presión EDS 3, EDS 6, entre otras. Esto confirma que las pruebas existen en el sistema de diagnóstico OEM; no publica en las páginas consultadas los mensajes de transporte que debemos enviar desde esta app.

## Motor: MR-140 / HV-240

Hipótesis de trabajo: K-Line con protocolo de la familia KWP2000/ISO 14230. Aún hay que verificar por separado, con capturas de una sesión real, la secuencia de inicialización (incluida la variante de 5 baudios o fast init), cabeceras/direcciones, checksum, servicios disponibles y diferencias entre HV-240 y MR-140. No enviar solicitudes de SecurityAccess, escritura, borrado de adaptaciones ni activaciones hasta identificar las respuestas válidas.

La documentación pública de escáner para T18SED/MR140/HV240 enumera pruebas como relé de bomba de combustible, relés de ventilador, EGR, purga EVAP, inyectores, actuador de ralentí y embrague del compresor A/C. La lista es una pista de funciones soportadas por ciertos equipos/perfiles, no una tabla de comandos reutilizable sin validación.

## Transmisión ZF 4HP16

El manual de servicio describe pruebas de actuadores ON/OFF para Solenoid 1/2 y válvulas EDS 3/4/5/6. La transmisión puede entrar en modo de emergencia ante fallos de las válvulas de presión. Por tanto, no implementar activaciones directas sin confirmar primero cómo se direcciona el TCM, el protocolo y las condiciones de seguridad de cada prueba.

No se ha confirmado aún que el TCM ZF 4HP16 concreto de este vehículo sea accesible por el mismo perfil KWP/K-Line usado por el motor, ni que el KKL sin interruptor pueda seleccionar eléctricamente ambas líneas del vehículo.

## Plan de validación

1. Capturar identificación USB (VID/PID), velocidad serie y datos RX. La app Android ahora permite exportar el registro RX como TXT; todavía no registra TX porque no transmite comandos.
2. Obtener una captura de referencia de la herramienta original en el mismo vehículo: conexión, identificación, lectura de DTC y lectura de datos en vivo.
3. Separar sesiones de motor y transmisión; comparar inicialización, cabeceras, temporización y checksum.
4. Crear pruebas unitarias de framing/checksum usando capturas conocidas antes de habilitar cualquier envío.
5. Habilitar primero identificación, lectura de DTC y parámetros. Añadir borrado y pruebas de actuadores solo tras verificar los comandos y sus respuestas.
6. Para actuadores: vehículo inmovilizado, freno de estacionamiento, ruedas calzadas, selector en condición indicada por el manual, motor apagado cuando corresponda y procedimiento específico del fabricante. No ejecutar pruebas de solenoides de transmisión con vehículo en movimiento.

## Referencias consultadas

- Manual de servicio Daewoo Lacetti, sección ZF 4HP16, procedimientos de actuadores y DTC: https://www.carmanualsonline.info/daewoo-lacetti-2004-service-repair-manual/150
- Manual de servicio, procedimientos EDS 3/EDS 6: https://www.carmanualsonline.info/daewoo-lacetti-2004-service-repair-manual/153
- Perfil de diagnóstico T18SED MR140/HV240 y lista de actuadores reportada por ScanDoc: https://beta.scandoc.online/last/0/20/2/0/36
- Nota de conexión en banco MR-140 (útil solo como referencia de pines en banco, no para conectar a ciegas en el vehículo): https://blog.obdii365.com/2025/02/05/tips-to-read-chevrolet-mr140-ecu-with-obdstar-dc706/

## Elementos de interfaz y actuadores identificados en el ejecutable

Cadenas visibles del perfil de motor incluyen prueba de relé de bomba de combustible, ventilador de alta/baja velocidad, luz de falla, válvula EGR, inyectores 1–4 y regulador de ralentí. Para transmisión aparecen parámetros como temperatura del aceite, corriente de los solenoides de presión, solenoides 1/2, bloqueo del convertidor y sincronización; también aparecen descripciones de DTC de solenoide 1 y 2. Estos nombres sirven para construir el catálogo de funciones, pero no se deben convertir en comandos TX hasta extraer las tablas/código que vinculan cada elemento con su identificador de prueba.

## Incógnitas pendientes

- Bytes de inicialización exactos para cada variante de ECU.
- Direcciones/cabeceras, checksum y temporización específicos.
- Direccionamiento y protocolo exacto del TCM ZF 4HP16 de este vehículo.
- Identificadores y parámetros de cada prueba de actuador, y condiciones que exige cada ECU/TCM.
- Confirmación práctica con una captura real RX/TX del vehículo y del software de referencia.


## Hallazgos nuevos de la ayuda original CheviExplorer 1.7 (CHM)

Se extrajo el archivo `CheviExplorer.chm` con 7-Zip y se revisaron sus páginas HTML (texto original en Windows-1251). La ayuda aporta evidencia importante sobre la interfaz física y el flujo de uso:

- **No funciona con ELM/ELM327.** La ayuda dice explícitamente que requiere un adaptador K-Line convencional, no un lector ELM.
- La conexión PC–ECU se hace por puerto serie y adaptador K-Line. Para USB-serie, la ayuda recomienda FTDI porque algunos convertidores no soportan velocidades no estándar; los adaptadores Prolific PL23xx pueden requerir ajuste del controlador.
- La tabla de pines de diagnóstico indicada por la ayuda asigna el **pin 7** a ECU del tren motriz (motor y transmisión), y el pin 16 a +12 V. La propia ayuda señala que ciertas otras líneas pueden variar por vehículo; no se debe asumir que el TCM está en un pin alternativo sin confirmar el esquema exacto del Lacetti.
- Para conectar, la ayuda indica seleccionar el puerto, encender el contacto y elegir el perfil de ECU. Si falla la conexión, propone activar «Alternativa inicialización ECU». Esto confirma que existen al menos dos rutas de inicialización en el software, pero no revela sus bytes.
- La ayuda documenta perfiles separados para **MR-140/HV-240** y **ZF-4P16 (1.8L)**. La transmisión ZF tiene perfil propio en el programa, no debe tratarse como si fuera simplemente el motor MR-140.
- La función de control de actuadores se habilita después de comenzar la solicitud de parámetros; la lista depende del tipo de ECU. La ayuda también documenta «Tester del adaptador K-Line» y funciones de servicio.
- El manual recomienda preferir FTDI y menciona problemas con velocidades no estándar. Nuestro adaptador identificado anteriormente como VID=1A86/PID=7523 corresponde a la familia CH340/CH341; por tanto, aún debemos comprobar experimentalmente que su driver Android y la interfaz física soporten la velocidad y los tiempos requeridos.

## Evidencia estática reproducible

Se añadió el workflow de GitHub Actions `.github/workflows/analizar-cheviexplorer.yml`, que inspecciona el EXE sin ejecutarlo y extrae las páginas de ayuda. La ejecución terminó correctamente:
https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/38913822863

Artefactos del análisis (caducan según la retención de Actions):
- Informe de cadenas e importaciones: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/38913822863
- Ayuda CHM extraída: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/38913822863

En el PE32 aparecen las funciones `PortInit`, `WriteReadComm`, `Altinit`, `TimerTesterPresentTimer`, `Button_ECUIdentClick`, `SecurityAccess`, `MenuItem_TestClick`, `test_ONClick` y `test_OFFClick`. Las importaciones incluyen `SetCommBreak`, `ClearCommBreak`, `SetCommState`, `SetCommTimeouts`, `PurgeComm`, `ReadFile`, `WriteFile` y `Sleep`. Esto refuerza que la inicialización y sus tiempos son relevantes. La cadena `10400` aparece en el ejecutable y es una velocidad candidata para investigar, no una confirmación universal para ambos módulos.

**Límite actual:** el informe de cadenas no identifica todavía los bytes transmitidos por `PortInit`/ `Altinit`, el checksum, la dirección de destino ni los identificadores de actuadores. No se han añadido comandos TX a la app. El siguiente paso de ingeniería inversa es mapear las referencias a esas cadenas y desensamblar las rutinas de inicialización/escritura; después contrastarlas con una captura real de conexión exitosa.


## Análisis adicional del desensamblado (16-10-2026)

Se generó el desensamblado x86 completo y un informe de referencias cruzadas de cadenas en la ejecución de análisis estático:
https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/38914390795

La búsqueda de llamadas a las APIs importadas sitúa grupos de código que manipulan el puerto serie en estas direcciones virtuales del EXE (son direcciones de código, no bytes de protocolo):

- `0x42A983` y `0x42AE96`: llamadas al wrapper de `SetCommState`, dentro de rutinas que preparan/configuran el puerto.
- `0x42AF75` y `0x42B246`: llamadas al wrapper de `ClearCommBreak`.
- `0x42B6A7`: llamada al wrapper de `SetCommBreak`.
- `0x429C78`: llamada al wrapper de `SetCommTimeouts`.
- `0x445C9D` y `0x445CDD`: llamadas al wrapper de `PurgeComm`.
- `0x45A71B`: no es una escritura K-Line. El contexto muestra un bucle de espera de aproximadamente 1 segundo (`GetTickCount`/comparación de tiempo) que llama a una función importada con argumento `0`; el salto indirecto en `0x407168` apunta a una entrada de importación compatible con `Sleep(0)`. Por tanto, este sitio se descarta como evidencia de transmisión de bytes ECU.

Esto estrecha el área a estudiar: las rutinas alrededor de `0x42A900–0x42B825` parecen pertenecer al componente de puerto serie y manejan configuración, BREAK, lectura y temporización. No es seguro traducir directamente esas direcciones a una secuencia K-Line; algunas pueden ser funciones genéricas del componente Delphi, no la rutina específica `PortInit` del perfil MR-140 o ZF-4P16. Se corrigió además una atribución preliminar: `0x45A71B` es parte de una espera temporizada, no una llamada de transmisión identificada. Aún no se ha localizado de forma fiable el sitio que arma/escribe las tramas de diagnóstico.

El informe de referencias cruzadas encontró que varios nombres de métodos (`PortInit`, `WriteReadComm`, `TimerTesterPresentTimer`, `SecurityAccess`) están almacenados como metadatos/cadenas, pero no tienen referencias absolutas directas en el código. Eso es habitual en aplicaciones Delphi: los métodos pueden enlazarse mediante tablas de clases/eventos, por lo que la ausencia de referencia directa no significa que estén sin usar.

**Siguiente paso técnico:** resolver las tablas de métodos/eventos de Delphi y seguir desde el controlador de identificación hasta el código que arma el buffer de transmisión. Hasta que esa ruta o una captura TX/RX de referencia revele los bytes, se mantiene deshabilitado el envío de comandos desde Android.


## Hallazgo importante al revisar el volcado Delphi subido al repositorio (16-10-2026)

La carpeta `archivos/dump/` contiene un volcado desensamblado de los métodos de CheviExplorer. Esto aporta evidencia más directa que el listado de cadenas, aunque sigue siendo código desensamblado y no una captura eléctrica real.

### Configuración serie y trama de inicialización

En `TForm1.PortInit` (dirección `0x004E27F0`), el ejecutable abre el puerto con `CreateFileA`, configura la cola serie, purga buffers y configura 8 bits de datos, sin paridad y un bit de parada. La selección de velocidad en este código es 9600 cuando el selector global vale el carácter ASCII `'1'`; para los perfiles MR-140 y ZF, los controladores de perfil asignan `0x12` y `0x22`, respectivamente, por lo que esta rama apunta a **10400 baudios**.

Los métodos de selección de perfil establecen estos valores:

- `N_MR140Click`: modo `0x12`, bytes de dirección `0x11 0xF1`.
- `N_ZFClick`: modo `0x22`, bytes de dirección `0x18 0xF1`.
- `N_SiriusClick`: modo `0x11`, dirección `0x11 0xF1` (perfil distinto; no confundir con MR-140).
- `N_AisinClick`: modo `0x21`, dirección `0x18 0xF1` (perfil distinto; no confundir con ZF).

En la ruta de inicio normal de MR-140 y ZF, el código ejecuta pulsos de BREAK mediante `ClearCommBreak`/`SetCommBreak`, con pausas calculadas desde la opción «Alternativa inicialización ECU», y después llama a `WriteReadComm` con el patrón de cuatro bytes `81 [dirección alta] [dirección baja] 81`. La función `WriteReadComm` suma los bytes anteriores y añade el byte bajo de la suma como checksum para los modos distintos de ASCII `'1'`; luego transmite y lee la respuesta.

Por tanto, las tramas candidatas deducidas estáticamente son:

- MR-140: `81 11 F1 81 04` (checksum aditivo de los cuatro bytes anteriores).
- ZF 4HP16: `81 18 F1 81 0B` (checksum aditivo de los cuatro bytes anteriores).

**Importante (estado histórico del análisis):** estas tramas se dedujeron del volcado original. En una prueba Android posterior, la app sí logró ejecutar su secuencia de inicialización y recibió una respuesta adicional para MR-140; el resultado queda documentado a continuación. La capacidad de BREAK depende del controlador USB y debe seguir manejándose como una condición que puede fallar.


## Captura Android: respuesta candidata MR-140 (16-10-2026)

Archivo: `archivos/cheviexplorer-captura-1792165021396.txt`.

La captura registra el adaptador CH340/CH341 (`VID=1A86 PID=7523`) abierto a 10400 baud, 8N1. La app envía la trama deducida del ejecutable original:

- TX: `81 11 F1 81 04`
- Eco recibido: `81 11 F1 81 04`
- Bytes adicionales: `83 F1 11 C1 EF 8F C4`

El clasificador separa el eco TX y reconoce los bytes adicionales como una trama candidata. Interpretando `0x83` como un campo de formato con longitud de datos 3, la estructura detectada es: formato `83`, destino `F1`, origen `11`, datos `C1 EF 8F`, checksum `C4`. La suma de los primeros seis bytes, módulo 256, es `C4`, por lo que el checksum aditivo coincide.

**Qué demuestra:** el adaptador no solo devuelve el eco de TX; hay bytes adicionales con direcciones coherentes y checksum correcto. Esto constituye evidencia fuerte de una respuesta estructurada en el enlace MR-140.

**Qué no demuestra todavía:** el significado de los tres bytes de datos, la identidad exacta de la ECU, ni que estén operativas la lectura de parámetros, la consulta/borrado de DTC o las pruebas de actuadores. El formato debe contrastarse con la rutina de recepción y decodificación del ejecutable original o con más capturas controladas.

**Siguiente prueba recomendada:** guardar esta respuesta como referencia y probar por separado el perfil ZF 4HP16, usando `81 18 F1 81 0B`, con el vehículo detenido y sin emitir comandos de actuadores. Comparar si la caja responde con dirección de origen `18`, checksum coherente y un formato repetible. No reutilizar automáticamente la respuesta MR-140 como si fuera válida para la transmisión.


## Captura Android: respuestas candidatas MR-140 y ZF 4HP16 (16-10-2026, 11:46)

Nueva captura combinada de la app Android: adaptador CH340/CH341 (`VID=1A86 PID=7523`) abierto a 10400 baud, 8N1. En ambos perfiles se observa el eco exacto de la trama transmitida y, después, siete bytes adicionales que pasan la validación estructural y el checksum aditivo.

### Motor MR-140

- TX: `81 11 F1 81 04`
- Eco: `81 11 F1 81 04`
- Respuesta adicional: `83 F1 11 C1 EF 8F C4`
- Interpretación provisional: formato `83`, destino `F1`, origen `11`, datos `C1 EF 8F`, checksum `C4`.
- Checksum: la suma de los seis primeros bytes, módulo 256, da `C4`; coincide.

### Transmisión ZF 4HP16

- TX: `81 18 F1 81 0B`
- Eco: `81 18 F1 81 0B`
- Respuesta adicional: `83 F1 18 C1 EF 8F CB`
- Interpretación provisional: formato `83`, destino `F1`, origen `18`, datos `C1 EF 8F`, checksum `CB`.
- Checksum: la suma de los seis primeros bytes, módulo 256, da `CB`; coincide.

### Conclusión y límites

Esta prueba aporta evidencia sólida de que ambos perfiles reciben bytes adicionales al eco TX, con direcciones de origen diferentes (`11` para MR-140 y `18` para ZF) y checksum coherente. El patrón de datos observado es idéntico (`C1 EF 8F`) en esta captura. No se debe asumir todavía que esos tres bytes identifican el módulo ni que prueban que la comunicación de diagnóstico completa funciona: su significado requiere contrastarse con el decodificador del programa original y con más sesiones reproducibles.

La captura no valida servicios de lectura de DTC, parámetros en vivo, borrado ni actuadores. Mantener esas funciones de transmisión deshabilitadas hasta confirmar servicios y condiciones de seguridad. Próxima fase: comparar la trama recibida con el camino de recepción/identificación del ejecutable Delphi y comprobar si la respuesta se repite tras reconexiones y ciclos de contacto.


## Segunda captura Android: repetibilidad de las respuestas MR-140 y ZF 4HP16 (16-10-2026, 11:52)

Una segunda sesión, iniciada a las 11:51:51 y cerrada a las 11:52:45, repite exactamente los resultados de la captura anterior:

- MR-140: TX `81 11 F1 81 04`; eco idéntico; respuesta adicional `83 F1 11 C1 EF 8F C4`; origen `11`; checksum calculado/recibido `C4`.
- ZF 4HP16: TX `81 18 F1 81 0B`; eco idéntico; respuesta adicional `83 F1 18 C1 EF 8F CB`; origen `18`; checksum calculado/recibido `CB`.

El adaptador vuelve a identificarse como CH340/CH341 (`VID=1A86 PID=7523`) y el puerto abre a 10400 baud, 8N1. El aviso de que el driver no admite `purgeHwBuffers()` reaparece, pero no impide que se reciban ambas respuestas candidatas. El cierre del puerto también queda registrado.

**Conclusión reforzada:** las dos respuestas son reproducibles en al menos dos sesiones y mantienen las mismas tramas, direcciones y checksums. Esto reduce la posibilidad de que el resultado anterior fuera un evento aislado. Sigue siendo una validación del intercambio observado, no una decodificación semántica de `C1 EF 8F` ni una prueba de lectura de DTC, parámetros, borrado o actuadores. Conservar ambas capturas como fixtures de referencia antes de avanzar a solicitudes de diagnóstico adicionales.
