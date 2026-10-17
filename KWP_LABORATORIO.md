# Laboratorio KWP — secuencia de validación

Esta guía corresponde a la pantalla **Lab** de CheviExplorer. Está diseñada para recopilar la máxima evidencia útil con consultas de lectura y mantener separadas las observaciones físicas de las hipótesis del ejecutable Delphi.

## Antes de empezar

- Vehículo inmóvil, freno de estacionamiento aplicado, selector en P.
- Contacto ON; no arrancar ni mover el selector durante los barridos.
- Adaptador KKL conectado, 10400 baud, 8N1.
- Seleccionar e inicializar una sola ECU cada vez: MR-140 (origen 0x11) o ZF 4HP16 (origen 0x18).
- No ejecutar la prueba si la comunicación inicial no devuelve respuesta positiva con checksum válido.
- Los barridos usan exclusivamente el servicio KWP 0x21. No se exploran servicios de escritura, programación, borrado ni actuadores.

## Secuencia por ECU

1. **Inicializar comunicación.** Registrar la trama TX, respuesta, claves de inicio y checksum.
2. **Leer identificación (1A 80).** Conservar el payload bruto y aceptar campos decodificados solo si SID, longitud y checksum coinciden.
3. **Leer DTC iniciales.** Exportar la respuesta bruta y registros interpretados; no borrar códigos.
4. **Barrido base.** Consultar IDs 0x01–0x40 y 0xF0, 0xF1, 0xFB. Por ID registrar TX, RX, bytes, checksum, respuesta positiva, NRC o timeout.
5. **Barrido ampliado opcional.** Consultar IDs 0x41–0xEF, 0xF2–0xFA y 0xFC–0xFF. El diálogo de confirmación advierte que puede tardar varios minutos. Ejecutarlo solo si el barrido base es estable.
6. **Releer bloques positivos conocidos.** Verificar que la respuesta sea reproducible en la misma condición del vehículo.
7. **Leer DTC finales.** Comparar con la línea base y conservar cualquier diferencia.
8. **Exportar Registro.** Guardar el registro completo localmente y compartirlo para análisis. No limpiar el registro hasta comprobar que el archivo exportado existe.

## Cómo interpretar los resultados

- **Respuesta positiva + checksum válido:** candidato confirmado para ese ID y esa ECU en esa sesión. Los bytes todavía no equivalen a una magnitud física.
- **NRC:** registrar el código exacto; no tratarlo como timeout ni como dato.
- **Timeout / trama no reconocida / checksum incorrecto:** no afirmar que el ID no exista; la comunicación puede no haber respondido dentro del tiempo de espera.
- **Repetibilidad:** repetir cada ID positivo en la misma condición. Después, comparar condiciones controladas (contacto ON motor apagado; luego motor al ralentí solo para lecturas normales y sin barridos ampliados).
- **Mapeo físico:** para identificar RPM, temperatura, voltaje, palanca o freno, comparar cambios de un parámetro a la vez y conservar cada captura con contexto y hora. No inferir escalas a partir de los offsets del buffer Delphi.
- **ZF 4HP16:** priorizar IDs del catálogo (1, 2, 7, 9, 10, 12, 28) y validar contra estados conocidos antes de asignar unidades o fórmulas.
- **MR-140:** las fórmulas candidatas de catálogo no se deben aplicar a una respuesta KWP hasta comprobar cómo se relacionan los bytes RX con el buffer Delphi original.

## Seguridad y límites

El servicio 0x21 se utiliza aquí como lectura exploratoria, pero un ID arbitrario puede ser rechazado o tener significado específico del fabricante. La app no habilita activación de actuadores. No ampliar la exploración a servicios 0x30/0x31 ni enviar comandos desconocidos sin documentación/captura positiva que confirme su formato y comportamiento.

## Paquete de evidencia que debe compartirse

Exportar el registro completo de cada ECU por separado, indicando:
- MR-140 o ZF 4HP16.
- Contacto ON/motor apagado o motor al ralentí.
- Si el motor estaba frío o caliente y, para la ZF, condición conocida de temperatura ATF.
- IDs positivos repetibles, NRC agrupados, timeouts y DTC iniciales/finales.
