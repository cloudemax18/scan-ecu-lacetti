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
