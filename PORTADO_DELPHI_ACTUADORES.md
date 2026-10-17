# Portado de funciones del ejecutable Delphi a CheviExplorer Android

## Resultado de la revisión

La fuente correcta para las pruebas del panel gráfico no es solo `archivos/dumps1.8/main.pas`: los manejadores de la ventana de control están en `archivos/dumps1.8/Graf.pas`. Se inspeccionaron `TGrafForm.CaseIMSelect`, `test_ONClick`, `test_OFFClick` y `TForm1.Driver` en el dump Delphi.

Esto confirma que el EXE tiene un menú **DriverIM / Управление механизмами** (control de mecanismos) y comandos de actuadores. No se debe confundir el control de actuadores con los IDs de datos del servicio `0x21`: los IDs de control del servicio `0x30` son un espacio independiente.

## Perfil habilitado

- Selector Delphi: `0x12` (MR-140).
- Destino KWP: `0x11`.
- Tester: `0xF1`.
- Transporte Android probado previamente: K-Line 10400 baud, 8N1.
- La rutina `Graf.pas` examinada codifica el destino `0x11`; no se ha encontrado un handler equivalente para la transmisión ZF 4HP16/destino `0x18`. Por eso la interfaz Android no permite enviar estas órdenes cuando está seleccionada la ZF.

## Catálogo reconstruido de DriverIM para selector 0x12

El orden de los elementos corresponde al menú original. Los cuatro inyectores comparten el local ID `0x32` y se distinguen mediante un byte adicional de estado.

| Elemento del menú Delphi | Local ID de control |
|---|---:|
| Prueba inyector 1 | `0x32` |
| Prueba inyector 2 | `0x32` |
| Prueba inyector 3 | `0x32` |
| Prueba inyector 4 | `0x32` |
| Relé del aire acondicionado | `0x15` |
| Relé ventilador, baja velocidad | `0x13` |
| Relé ventilador, alta velocidad | `0x14` |
| Lámpara de avería (MIL) | `0x10` |
| Relé bomba de combustible | `0x12` |
| Lazo de retroalimentación de combustible | `0x37` |
| Prueba regulador de ralentí | `0x18` |
| Calentador de sonda lambda | `0x40` |

Estos IDs se extrajeron del selector de control del EXE; no se derivaron del catálogo de lectura `0x21`.

## Tramas portadas

El checksum es la suma aditiva de todos los bytes anteriores, módulo 256.

### Consultar estado actual

El handler `TForm1.Driver` envía servicio `0x30`, local ID y opción `0x01` (report current state). Ejemplo para el relé A/C, ID `0x15`:

```
83 11 F1 30 15 01 CB
```

### Activar salida (Short Term Adjustment)

El handler `test_ONClick` usa la opción `0x07` y estado `0xFF` para los actuadores del selector MR-140. Ejemplo ID `0x15`:

```
84 11 F1 30 15 07 FF D1
```

Para inyectores, el EXE usa una forma extendida con el byte de selección de cilindro:

```
85 11 F1 30 32 07 FF FF EE
```

La selección del cilindro se conserva exactamente como está reconstruida en `Graf.pas`: al activar, el byte adicional es `CaseIM.ItemIndex - 1` convertido a byte.

### Desactivar salida

El handler `test_OFFClick` usa la misma opción `0x07` con estado `0x00`. Ejemplo ID `0x15`:

```
84 11 F1 30 15 07 00 D2
```

Ejemplo de inyector 1:

```
85 11 F1 30 32 07 00 00 F0
```

### Adaptación de acelerador

En `main.pas`, `Button_ObuchenieClick` usa un procedimiento distinto, con local ID `0x2C`, opción `0x07` y estado `0xFF`:

```
84 11 F1 30 2C 07 FF E8
```

Esta es la rutina de aprendizaje/adaptación del acelerador del EXE, no uno de los elementos del catálogo DriverIM. Su flujo completo además consulta el bloque `0xF0`, evalúa valores internos, instruye sobre el pedal y pide ciclar el contacto. No se debe reemplazar ese flujo por una única orden de control.

## Cambios Android incluidos

- `DelphiActuatorCatalog.kt`: catálogo reconstruido del menú MR-140.
- `KwpProtocol.kt`: construcción de consultas de estado y comandos ON/OFF según los handlers Delphi.
- `MainActivity.kt`: sección de pruebas de actuadores separada del barrido de solo lectura, con consulta de estado, activación temporal y OFF.
- `DelphiActuatorProtocolTest.kt`: pruebas unitarias para checksum, framing, los cuatro casos de inyector y el comando de adaptación.

La app verifica el checksum y exige una respuesta positiva `0x70` con el local ID solicitado. En la respuesta positiva KWP el byte siguiente no se debe asumir como eco de la opción de control; los bytes restantes se conservan como estado bruto. Una respuesta negativa `7F 30 NRC`, checksum inválido o ausencia de RX no se muestra como éxito.

## Salvaguardas añadidas en Android

- Solo se permite usar DriverIM cuando se ha inicializado MR-140, está seleccionada la ECU de motor y la comunicación está a 10400 baud.
- El barrido KWP y la lectura en vivo deben estar detenidos antes de mandar control de actuadores.
- Antes de activar se muestra una confirmación con condiciones de seguridad.
- La app intenta mandar la orden OFF a los 3 segundos. Es una salvaguarda añadida en Android; no se debe confundir con un timeout de seguridad garantizado por la ECU. Si se pierde el enlace, hay que ciclar el contacto y verificar que la salida volvió a su estado normal.
- El OFF manual queda disponible como acción separada.
- No se implementan pruebas de actuadores para ZF 4HP16 sin localizar y reconstruir su rutina específica.

## Qué falta para validar en el coche

La reconstrucción de código confirma el formato y el catálogo que usaba el EXE, pero no equivale a una captura RX del Android actual. Probar un actuador cada vez con el coche inmóvil y el motor apagado, exportar el registro y confirmar para cada orden:

1. TX exacto, checksum correcto y destino `0x11`.
2. Respuesta positiva `0x70` con el mismo local ID y opción.
3. Cambio físico esperado y retorno a estado normal tras OFF.
4. Lectura de DTC antes y después si se observa un comportamiento inesperado.

Si no hay respuesta positiva, la app no debe interpretar que el actuador se activó. Si la respuesta no es positiva, no repetir la orden en bucle.

## Fuente de referencia

- [Graf.pas: handlers DriverIM, test_ONClick y test_OFFClick](https://github.com/cloudemax18/scan-ecu-lacetti/blob/main/archivos/dumps1.8/Graf.pas)
- [main.pas: Button_ObuchenieClick y reset de aprendizaje](https://github.com/cloudemax18/scan-ecu-lacetti/blob/main/archivos/dumps1.8/main.pas)
- [OBD2-Diagnostic-UI, referencia visual](https://github.com/muki01/OBD2-Diagnostic-UI)
