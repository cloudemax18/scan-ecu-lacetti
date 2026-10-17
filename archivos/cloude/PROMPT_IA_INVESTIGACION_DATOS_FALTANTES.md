# Prompt para investigar los datos faltantes de CheviExplorer

Actúa como ingeniero inverso senior especializado en Delphi Win32, KWP2000/K-Line, ECUs GM/Daewoo y aplicaciones Android/Kotlin. Investiga con evidencia verificable los datos y algoritmos que faltan para completar esta app:

Repositorio: https://github.com/cloudemax18/scan-ecu-lacetti
Ejecutable original: `archivos/CheviExplorer.exe` y `archivos/CheviExplorer1.8.exe`.
Fuentes/datos existentes: `archivos/dump/main.pas`, `archivos/dumps1.8/`, `archivos/cloude/parametros.json`, `dtc_tablas.json`, `ident_campos.json`, `tests_actuadores.json`, `ecus_soportadas.json`, `mr140_parametros.json`, `Mr140Params.kt`, `ident_decodificacion.json`, `ANALISIS_CheviExplorer2.md`.

## Vehículo y hardware
- Chevrolet Lacetti 1.8, año 2008, transmisión automática ZF 4HP16.
- ECU motor Delphi MR-140, dirección KWP 0x11; transmisión ZF 4HP16, dirección 0x18.
- Adaptador KKL 409.1 USB CH340/CH341 mediante OTG; K-Line, 10400 baud, 8N1.
- No hay interruptor físico para seleccionar protocolos.
- El coche de prueba no muestra DTC conocidos. No inventes averías.

## Capturas físicas verificadas
StartCommunication MR-140: TX `81 11 F1 81 04`, RX `83 F1 11 C1 EF 8F C4`.
StartCommunication ZF: TX `81 18 F1 81 0B`, RX `83 F1 18 C1 EF 8F CB`.
TesterPresent MR-140: TX `81 11 F1 3E C1`, RX `81 F1 11 7E 01`.
TesterPresent ZF: TX `81 18 F1 3E C8`, RX `81 F1 18 7E 08`.
Identificación `1A 80`: MR payload inicia `5A 80`, contiene ASCII `8Z1JJ51388V322946` y `03h014h005`; ZF contiene `5WK33600JG10630040766581075121--65810755A9--65810756D67654381` y `96801169JG`. Verifica índices de los campos contra el parser Delphi y no asignes etiquetas por intuición. El eco de TX puede aparecer en RX y debe eliminarse antes de analizar.

DTC requests reconstruidas:
- MR-140: `84 11 F1 19 DA FF 00 78`; respuesta observada `82 F1 11 59 00 DD`.
- ZF 4HP16: `84 18 F1 18 00 00 00 A5`; respuesta observada `85 F1 18 58 01 07 03 68 59`.
No etiquetes la respuesta ZF como P0703 sin verificar el parser Delphi y los límites de registros. Distingue encabezado, estado y DTC.

## Investigación priorizada
1. Inspecciona `Button_DTCClick`, `Button_ECUIdentClick`, `RaschetParam`, `TimerParamTimer`, `VspomRaschetParam`, las tablas y constantes referenciadas. Traza cada byte de entrada hasta el valor mostrado por el programa original.
2. Valida las 61 entradas anunciadas en `mr140_parametros.json` frente a `Mr140Params.kt`: local ID, índice de datos, tipo, endianess, máscara de bits, fórmula, unidad, precisión, valores enumerados y longitud mínima. Identifica faltantes y discrepancias; no completes huecos por intuición.
3. Investiga parámetros de ZF 4HP16: IDs/servicios, tamaños, endianess, fórmulas, unidades, estados y límites. Busca en el ejecutable, fuentes, documentación técnica pública y proyectos relacionados. Marca como desconocido lo que no tenga evidencia.
4. Decodifica `1A 80` para MR-140 y ZF. Determina si los índices incluyen SID, longitud extendida, cabecera o solo datos y prueba el resultado con las capturas anteriores.
5. Reconstruye el formato DTC de ambas ECUs desde Delphi: solicitud, SID positivo, byte de control, registros, máscaras/estados y conversión a códigos. Añade pruebas de regresión con capturas reales. No asumas registros de 3 bytes sin evidencia.
6. Para los 26 tests de actuadores, busca payloads exactos, secuencia de seguridad, condiciones y respuestas. No envíes comandos de escritura, borrado o activación; documenta solo evidencia y no recomiendes experimentar en el coche.
7. Verifica gestión de sesión KWP, tiempos P2/P3, TesterPresent, checksum, NRC, eco serial, respuestas extendidas y fragmentación/concatenación.
8. Busca fuentes públicas fiables (manuales OEM GM/Daewoo, documentación KWP, proyectos abiertos, discusiones técnicas). Cita URL directa, versión/página/fragmento y fecha; separa fuentes primarias de hipótesis.

## Restricciones
- No inventes IDs, bytes, fórmulas, offsets, DTC ni comandos.
- `offset_exe` es posición dentro del ejecutable, no offset de datos ECU.
- No afirmes que compila o funciona en coche sin ejecutar pruebas o contar con captura real.
- No expongas secretos ni datos personales.
- Mantén lectura separada de escritura. No implementes borrado DTC, seguridad ni actuadores.
- El paquete Android es `com.cheviexplorer.android`; `Mr140Params.kt` bajo `archivos/cloude/` no se integra automáticamente.

## Entregables
A. Informe en español con tablas por ECU: hallazgo, evidencia, confianza (confirmado/probable/desconocido), archivo/línea/offset.
B. JSON normalizados para identificación, parámetros MR-140, parámetros ZF y DTC, con esquema y fuente por campo.
C. Kotlin propuesto y tests unitarios sin conexión al vehículo.
D. Tests con capturas reales: checksum, eco, longitud extendida, NRC, payload truncado.
E. Lista priorizada de datos que requieren captura física, con tramas exactas y precauciones.
F. Pasos reproducibles y limitaciones.

Empieza inspeccionando el repositorio y el código Delphi original; no reescribas desde cero. Primero presenta el mapa de evidencia y las incertidumbres críticas. Implementa solo lo respaldado. Ejecuta tests y build Android si tienes entorno y reporta resultados reales, sin afirmar éxitos no verificados.