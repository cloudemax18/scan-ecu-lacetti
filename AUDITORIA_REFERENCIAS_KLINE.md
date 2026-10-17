# Auditoría técnica de referencias externas para CheviExplorer

Fecha de revisión: 2026-10-17

## Alcance y criterio

Se revisaron los README, los contratos de protocolo visibles y archivos fuente de estos proyectos:

- [OBD2_KLine_Library](https://github.com/muki01/OBD2_KLine_Library)
- [OBD2_K-line_Reader](https://github.com/muki01/OBD2_K-line_Reader)
- [OBD2_CAN_Bus_Library](https://github.com/muki01/OBD2_CAN_Bus_Library)
- [OBD2-Diagnostic-UI](https://github.com/muki01/OBD2-Diagnostic-UI)

Se compararon con el código actual de CheviExplorer, la reconstrucción de la tabla Delphi y las capturas físicas del Lacetti 1.8 2008 con KKL CH340/CH341. Una afirmación de README o un ejemplo genérico no se considera prueba para el MR-140 ni la ZF 4HP16.

## Resumen ejecutivo

1. **Reutilizar ideas de arquitectura K-Line, no copiar el protocolo genérico como si fuera el perfil Delphi del Lacetti.** La librería K-Line separa capa física/tiempos, encuadre, protocolo y definiciones ECU específicas. Esa separación es una buena referencia para organizar CheviExplorer.
2. **La conexión del coche ya está probada con KWP físico** a 10400 baudios, 8N1 y direcciones de destino MR-140 `0x11` y ZF `0x18`. No reemplazar esta secuencia por auto-detección OBD genérica ni asumir que las direcciones/servicios del ejemplo de Arduino aplican a estas ECUs.
3. **El escáner KWP actual debe mejorar su contabilidad de resultados.** El resumen del barrido puede declarar el total planificado aunque se haya detenido antes; además no separa checksum inválido, RX no reconocible y excepción de I/O. Esta auditoría corrige ese resumen.
4. **Los actuadores deben portarse desde el EXE, no inventarse desde ejemplos genéricos.** La revisión adicional de `archivos/dumps1.8/Graf.pas` sí contiene los handlers `DriverIM`, `test_ONClick` y `test_OFFClick` para el selector MR-140. Android ahora reproduce esos IDs y formatos exactos con confirmación, validación de respuesta y un intento de OFF temporal. No se habilitó la ZF porque ese handler usa destino `0x11`.
5. **No decodificar los bloques `0x21` como sensores aún.** Las capturas han confirmado respuestas positivas a algunos IDs, no el significado, endianess, escala o relación de cada byte con los offsets del buffer Delphi.
6. **No integrar CAN en el camino KKL.** La librería CAN es para ISO 15765-4 sobre CAN (normalmente pines OBD 6/14 y transceptor CAN); el KKL usado por esta app opera K-Line en el pin 7. El proyecto CAN puede ser referencia futura para otra interfaz, no una dependencia actual.

## Comparación de los cuatro repositorios

| Fuente | Qué aporta | Qué no demuestra para este coche | Decisión |
|---|---|---|---|
| K-Line Library | Arquitectura en capas; inicialización configurable; tiempos P1–P4; checksum, framing y eco; APIs de acceso raw; perfiles ECU opcionales. | Que el framing de cada perfil, los servicios o el mapa de parámetros de ejemplos genéricos coincidan con MR-140/ZF. | Adoptar los principios de separación y pruebas; conservar los frames físicos ya validados del Lacetti. |
| K-Line Reader | Flujo práctico de conexión, sondeo de PIDs soportados, reconexión, logs y separación entre modo serie y dashboard. | Los PIDs OBD-II estándar y sus fórmulas no son equivalentes a los identificadores propietarios `0x21` de nuestras ECUs. | Usar como referencia para UX de estado/logs; no trasladar fórmulas a bloques propietarios. |
| CAN Bus Library | ISO 15765-4, CAN 11/29 bit, 250/500 kbit/s, detección y servicios OBD-II sobre TWAI de ESP32. | No puede comunicarse directamente mediante el KKL/K-Line actual; requiere interfaz CAN y otro transporte. | Excluir del flujo actual; mantenerlo como posible backend futuro si se añade hardware CAN. |
| Diagnostic UI | Dashboard web, selección de datos, DTC, estado de conexión, JSON estructurado y datos deseados/soportados. | No implementa la capa serie Android ni define el protocolo propietario del Lacetti. | Tomar ideas de presentación, pero mantener UI nativa y un modelo de datos tipado. |

## Contraste con la evidencia física de CheviExplorer

### MR-140

- StartCommunication `81 11 F1 81 04` y respuesta `83 F1 11 C1 EF 8F C4`: formato y checksum confirmados en capturas.
- Tester Present `3E C1` responde `7E 01`.
- La lectura DTC `19 DA FF 00` ha devuelto `59 00`, compatible con cero DTC según el parser reconstruido.
- IDs `0x02`, `0x03`, `0x04`, `0x05`, `0x09`, `0x0A`, `0x0B` y `0x0C` tienen respuestas positivas observadas en capturas; los bytes siguen sin mapa físico confirmado.
- `0xF0`/`0xF1` y varios IDs devuelven NRC. No asumir que el bloque maestro propuesto en el documento de arquitectura está disponible en esta ECU sin una respuesta positiva válida.
- La captura de barrido MR-140 más reciente se detuvo temprano; sus totales anteriores no sirven como inventario completo.

### ZF 4HP16

- StartCommunication `81 18 F1 81 0B` y respuesta `83 F1 18 C1 EF 8F CB`: formato y checksum confirmados.
- Tester Present `3E C8` responde `7E 08`.
- Servicio `1A 80` respondió positivamente en una captura con identificación, incluido número de pieza `96801169`; preservar el payload raw para validar cada campo.
- El DTC observado `85 F1 18 58 01 07 03 68 59` tiene checksum correcto y el parser lo relaciona con P0703. Confirmar con una nueva lectura antes de concluir diagnóstico; inspeccionar circuito/interruptor de freno y luces de freno antes de cambiar piezas.
- El barrido ampliado encontró 39 IDs positivos en un rango de 188. Esos bloques no prueban que los IDs sean PIDs OBD estándar ni que coincidan con los IDs locales del catálogo Delphi.

## Rectificaciones al documento de arquitectura subido

### A. `data_offset - 11` no está validado para un payload KWP aislado

El documento asume que el índice de buffer Delphi se convierte a índice de payload restando 11. Pero no define con precisión si `dataOffset` indexa la trama completa, el buffer acumulado, un buffer con eco o el primer byte de datos. En el código propuesto, `responsePayload[0]` es `0x61`; por tanto un offset convertido a cero leería el SID, no el primer dato. **No usar esta función de extracción hasta reconstruir el buffer Delphi original y validar el origen exacto de los offsets.**

### B. Catálogos y fórmulas de ejemplo no son una tabla validada

Las ecuaciones `raw * 0.47`, `raw - 40`, `raw * 0.25`, o las asignaciones de bytes a MAP/ECT/RPM del documento son hipótesis mientras no se relacionen con una respuesta real y se comparen con una fuente independiente. La tabla Delphi reconstruida aporta nombres, unidades, offsets y modos, pero por sí sola no prueba el layout de la respuesta KWP ni la fórmula de conversión.

### C. Actuadores: se localizaron los handlers exactos en Graf.pas

La primera revisión de `main.pas` no contenía todos los handlers de la ventana de mecanismos. Al revisar también `archivos/dumps1.8/Graf.pas` se localizaron `TGrafForm.CaseIMSelect`, `test_ONClick`, `test_OFFClick` y `TForm1.Driver`. Por tanto, ya hay evidencia del EXE para el catálogo de control MR-140 y el formato de sus órdenes:

- Leer estado: servicio `0x30`, ID local y opción `0x01`.
- Activar: servicio `0x30`, ID local, opción `0x07` y estado `0xFF`.
- Desactivar: servicio `0x30`, ID local, opción `0x07` y estado `0x00`.
- Inyectores: local ID `0x32` con un byte adicional que selecciona el inyector.
- El código revisado usa destino `0x11`; no se habilitó el mismo catálogo para la ZF 4HP16/destino `0x18`.

Esto valida la reconstrucción de las tramas desde el EXE, pero no sustituye una captura RX de la app Android ni una comprobación física. La interfaz Android ahora tiene pruebas de estado/ON/OFF para el catálogo MR-140, confirmación previa, comprobación de checksum y un intento de OFF automático a los 3 segundos. Ese timeout es una salvaguarda de la app; no garantiza la liberación de la ECU si se pierde comunicación.

La adaptación de acelerador es otra rutina: `Button_ObuchenieClick` envía `30 2C 07 FF` y después sigue una secuencia de lectura/condiciones. No debe etiquetarse como prueba de actuador individual ni reducirse a una sola trama. Ver `PORTADO_DELPHI_ACTUADORES.md`.

### D. Encuadre, eco y checksum deben comprobarse por separado

El código de referencia K-Line muestra que los tiempos y el eco dependen del adaptador y que distintos protocolos usan distintos formatos. CheviExplorer ya comprueba checksum y dirección en el parser de respuestas; no debe adoptar reglas universales como “si el primer byte coincide, siempre hay eco” sin verificar el resto de la trama. La corrección del resumen del barrido y el portado de los handlers de actuadores no reemplazan el parser de transporte.

### E. OBD-II estándar frente a diagnóstico propietario

Los modos SAE/OBD-II de los ejemplos (por ejemplo, `01` datos, `03` DTC, `09` identificación) tienen contratos distintos de las solicitudes propietarias KWP como `21 <localId>`, `19 DA FF 00` o `1A 80`. Mantener APIs y decodificadores separados por perfil y servicio.

## Mejora aplicada en esta rama

Se ajustó el resumen del barrido de identificadores locales para informar por separado:

- IDs planificados y solicitudes realmente intentadas.
- Respuestas positivas con checksum válido.
- Respuestas negativas (NRC) agrupadas por código.
- Sin respuesta RX.
- RX presente pero sin trama reconocible.
- Tramas detectadas con checksum inválido.
- Errores de ejecución/I/O.
- Resultado final: completado, detenido o interrumpido.

Así una detención temprana no se presenta como un barrido exhaustivo. El barrido sigue siendo de solo lectura; el panel DriverIM es una función separada y explícita de control de actuadores.

Además, se reconstruyó el menú MR-140 de `Graf.pas`, se añadieron los constructores de tramas `0x30` y pruebas unitarias de checksum para lectura de estado, ON/OFF, selección de inyector y adaptación del acelerador. La interfaz se rediseñó con un dashboard nativo de tarjetas redondeadas inspirado visualmente en OBD2-Diagnostic-UI, sin copiar su frontend web ni su transporte WebSocket. El detalle de las funciones portadas está en `PORTADO_DELPHI_ACTUADORES.md`.

## Próximas pruebas recomendadas

1. Ejecutar el barrido base completo en MR-140, sin detenerlo, exportando el registro local.
2. Repetir el barrido base y el ampliado de ZF en sesiones separadas; no cambiar perfil de ECU durante un barrido.
3. Reconsultar los IDs positivos en dos estados controlados (por ejemplo, contacto/motor apagado y motor encendido solo cuando sea seguro) para identificar bytes estáticos y dinámicos; no conducir mirando la app.
4. Para sensor de freno ZF, comparar IDs candidatos con freno liberado/presionado y confirmar con las luces de freno. No dar por hecho que el ID `0x02` del catálogo y el ID `0x02` de la respuesta KWP son el mismo campo.
5. Para cada señal propuesta, registrar simultáneamente bytes raw, estado del vehículo, valor de referencia independiente y fórmula candidata; solo después marcarla como validada.
6. Mantener el botón de borrado DTC, servicios de escritura y actuadores fuera de las pruebas de descubrimiento.

## Licencias y reutilización

La revisión encontró señales de licencia que requieren atención antes de copiar código:

- El repositorio K-Line Library contiene una licencia GPLv3, mientras que algunos encabezados fuente declaran un esquema “personal/research” y licencia comercial separada. Resolver esta discrepancia con el mantenedor antes de reutilizar código.
- El K-Line Reader también debe tratarse según el archivo LICENSE presente en el repositorio (GPLv3), aunque una descripción/metadata pueda sugerir otra cosa.
- El CAN Bus Library contiene GPLv3.
- Diagnostic UI declara MIT en su archivo LICENSE.

Este documento recoge análisis y recomendaciones; no copia implementación de esos repositorios. Antes de distribuir una app derivada, revisar los archivos LICENSE vigentes y las cabeceras de los archivos concretos que se pretenda reutilizar.

## Referencias

- https://github.com/muki01/OBD2_KLine_Library
- https://github.com/muki01/OBD2_K-line_Reader
- https://github.com/muki01/OBD2_CAN_Bus_Library
- https://github.com/muki01/OBD2-Diagnostic-UI
- https://github.com/cloudemax18/scan-ecu-lacetti/blob/main/INVESTIGACION_KWP.md
- https://github.com/cloudemax18/scan-ecu-lacetti/blob/main/KWP_LABORATORIO.md
- Archivo del usuario: `arquitectura_completa_scanner.md`
