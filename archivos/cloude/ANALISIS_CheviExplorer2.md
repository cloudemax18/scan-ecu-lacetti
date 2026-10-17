# CheviExplorer 1.8 – datos extraídos del .exe

Origen: `CheviExplorer1_8.exe` (Delphi, sin empaquetar). Las cadenas están como AnsiString Delphi (cp1251) en las secciones CODE/DATA.

## Archivos
| Archivo | Contenido |
|---|---|
| `dtc_tablas.json` | 316 códigos con descripción (ruso) agrupados por prefijo: `num` (airbag antiguo, 1..87), `B` (SRS.1), `P` (motor), `U`, `C` (ABS/TCS). 16 códigos sin descripción asociada. |
| `parametros.json` | 239 entradas de parámetros (incluye estados y banderas) en vivo: nombre (ru), unidad, rango de gráfica `min*max`, valores enumerados (`Выкл.;Вкл.`). |
| `ident_campos.json` | 19 etiquetas del bloque de identificación (VIN, número de programa, versión SW, calibración, kilometraje, etc.). |
| `tests_actuadores.json` | 26 nombres de tests/actuadores. |
| `ecus_soportadas.json` | Lista de ECUs del menú: Sirius-D42, MR-140, Sirius-D32, Bosch M7.9.7.1, Nissan EFI, Aisin-81 (1.6L), ZF-4P16 (1.8L), Airbag SRS.0/.1, ABS Bosch/Teves/Delphi/Mando. |

## Qué NO está en estos archivos
- El mapeo parámetro → byte/offset de la respuesta y su fórmula de conversión (está en `RaschetParam`, ~3600 líneas de ensamblador en `main.pas`).
- El mapeo exacto grupo de DTC → ECU (se deduce por prefijo, falta confirmarlo en `Button_DTCClick`).
- El orden de los campos dentro de la respuesta `1A 80`.
- Los códigos de transmisión (Aisin/ZF) no aparecen como tabla de texto; pueden calcularse en código.

## Hallazgo clave de los logs Android
Las peticiones que solo devuelven eco coinciden con >~5 s sin tráfico: la sesión KWP expira (P3). Activar Tester Present (`3E`) automático cada ~2 s y reintentar StartCommunication si solo hay eco.

## Actualización: MR-140 y decodificación de identificación
- `mr140_parametros.json` / `Mr140Params.kt`: 61 parámetros del MR-140 (type 0x12). Petición `82 11 F1 21 <id> chk` con id `F0` (grupo 1) y `F1` (grupo 2); respuesta `61 <id> datos…`. 56 con fórmula decodificada del `.exe`, 5 calculados (consumos) pendientes.
- `ident_decodificacion.json`: posición/largo/formato de cada campo de la respuesta `1A 80` por ECU (tabla de 53 entradas del exe). Verificado contra tus capturas del MR-140 y del ZF.
- Código sin compilar ni probar contra el coche: validar con una captura real de `21 F0` y `21 F1`.
