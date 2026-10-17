# Prompt para investigar los datos faltantes de CheviExplorer

Actúa como ingeniero inverso senior especializado en Delphi Win32, KWP2000/K-Line, ECUs GM/Daewoo y Android/Kotlin. Investiga con evidencia verificable y devuelve resultados reproducibles, no conjeturas.

## Repositorio y archivos de partida
Repositorio: https://github.com/cloudemax18/scan-ecu-lacetti
Ejecutables originales: `archivos/CheviExplorer.exe`, `archivos/CheviExplorer1.8.exe`.
Fuentes/tablas: `archivos/dump/main.pas`, `archivos/dumps1.8/`, `archivos/cloude/parametros.json`, `dtc_tablas.json`, `ident_campos.json`, `tests_actuadores.json`, `ecus_soportadas.json`, `mr140_parametros.json`, `Mr140Params.kt`, `ident_decodificacion.json`, `DtcDecoder.kt`, `ANALISIS_CheviExplorer2.md`.
App Android: `app/src/main/java/com/cheviexplorer/android/`; revisa también tests y GitHub Actions.

## Vehículo objetivo
- Chevrolet Lacetti 1.8, año 2008, transmisión automática ZF 4HP16.
- Motor Delphi MR-140, dirección ECU KWP 0x11; transmisión ZF 4HP16, dirección 0x18.
- KKL 409.1 USB CH340/CH341 por OTG, K-Line 10400 baud, 8N1.
- Sin interruptor físico para seleccionar protocolos.
- El vehículo de prueba no presenta averías conocidas.

## Capturas verificadas
StartCommunication MR-140: TX `81 11 F1 81 04`, RX `83 F1 11 C1 EF 8F C4`.
StartCommunication ZF: TX `81 18 F1 81 0B`, RX `83 F1 18 C1 EF 8F CB`.
TesterPresent MR-140: TX `81 11 F1 3E C1`, RX `81 F1 11 7E 01`.
TesterPresent ZF: TX `81 18 F1 3E C8`, RX `81 F1 18 7E 08`.
TesterPresent cada 2 segundos mantuvo la sesión MR-140 abierta unos 25 segundos; una lectura DTC respondió a mitad de esa sesión. Antes de enviar tráfico la ECU parecía cerrar la sesión a los 5 segundos.
Identificación `1A 80`: MR-140 payload comienza `5A 80`, contiene ASCII `8Z1JJ51388V322946` y `03h014h005`; ZF payload contiene `5WK33600JG10630040766581075121--65810755A9--65810756D67654381` y `96801169JG`. Decodifica posiciones solo tras confirmar qué buffer usa Delphi (trama completa, payload, SID incluido o excluido).
Los logs USB pueden contener eco exacto de TX; retíralo antes de interpretar RX.

## Solicitudes DTC observadas
MR-140 TX `84 11 F1 19 DA FF 00 78`; RX `82 F1 11 59 00 DD`.
ZF TX `84 18 F1 18 00 00 00 A5`; RX `85 F1 18 58 01 07 03 68 59`.
Reglas reconstruidas del Delphi:
- MR-140: respuesta `59 00`, contador cero, significa “Ошибок нет” / “Sin averías”.
- ZF: `58 01 07 03 68`, contador 1 y registro `07 03 68`; el código sale de los dos primeros bytes con los dos bits altos del primero para P/C/B/U, por lo que es P0703 según tabla. El byte 0x68 tiene máscara `& 0x60 = 0x60`, estado “intermitente” en el Delphi.
- Los registros DTC MR-140 miden 4 bytes para la petición `19 DA FF 00`; ZF y otras ECUs usan 3 bytes. El cuarto byte del registro MR-140 no debe recibir un significado inventado.
No cambies estas reglas salvo que el código Delphi pruebe una interpretación distinta.

## Investigación requerida, por prioridad
1. **Parámetros MR-140:** compara cada entrada de `mr140_parametros.json` y `Mr140Params.kt` con `RaschetParam`, `TimerParamTimer`, `VspomRaschetParam`, tablas y eventos Delphi. Traza ID local, offset de datos, tamaño, endianess, máscaras, fórmula, unidad, precisión, enumeraciones y longitud mínima. Señala parámetros con fórmulas dudosas.
2. **Parámetros ZF 4HP16:** busca servicios/IDs locales, longitudes, fórmulas, endianess, unidades, estados y condiciones. No reutilices tablas del motor por analogía.
3. **Identificación ECU:** valida cada campo de `1A 80` para MR-140 y ZF usando offsets exactos y capturas; explica si el offset es respecto a la trama, payload, SID o buffer Delphi.
4. **DTC:** confirma estructura, contador, longitudes de registros (MR-140 4 bytes; ZF/resto 3), codificación P/C/B/U, estados, casos sin fallos y respuestas negativas desde `Button_DTCClick`. Crea tests de regresión para las dos respuestas físicas y casos truncados.
5. **Sesión KWP:** determina intervalos P2/P3, TesterPresent, checksum, eco, respuesta extendida, concatenación/fragmentación y gestión de timeout. La sesión se mantuvo unos 25 s con TesterPresent cada 2 s.
6. **Actuadores y escritura:** para las 26 pruebas listadas, identifica qué comandos/condiciones existen en el original, pero NO los envíes ni implementes. No habilites borrado DTC, acceso de seguridad, escritura ni activación de actuadores en esta fase.
7. **Ejecutable:** si el entorno permite analizar los EXE del repositorio, documenta método, arquitectura, hashes, cadenas y referencias; no afirmes descompilación si solo se consultó pseudocódigo.
8. **Fuentes públicas:** busca documentación OEM, manuales de servicio, referencias KWP y repositorios técnicos. Cita enlaces directos y página/versión/fragmento. Separa evidencia primaria, secundaria e hipótesis.

## Restricciones estrictas
- No inventes bytes, servicios, IDs, fórmulas, offsets, DTC ni nombres de parámetros.
- `offset_exe` de `parametros.json` es offset en el ejecutable, no índice de respuesta ECU.
- No infieras que una solicitud funciona en el coche sin una captura real.
- No marques build/test como exitoso sin ejecutarlos y reportar salida real.
- No pidas al usuario que suba el EXE: ya está en el repositorio.
- No compartas secretos ni datos personales.
- Conserva el package Android `com.cheviexplorer.android`; mantén lectura separada de escritura.

## Entregables
A. Informe en español con tabla por ECU: dato, hallazgo, evidencia exacta (archivo + línea/offset), confianza (confirmado/probable/desconocido).
B. JSON normalizados para parámetros MR-140, parámetros ZF, identificación y DTC, con esquema y procedencia de cada campo.
C. Cambios Kotlin pequeños y revisables, con tests unitarios sin vehículo.
D. Pruebas de regresión para StartCommunication, TesterPresent, `1A 80`, `59 00`, `58 01 07 03 68`, checksum incorrecto, eco, respuesta negativa y bytes truncados.
E. Lista de datos que aún requieren captura física, con petición exacta, respuesta esperada/interpretación y precauciones.
F. Resultados reales de tests/build, limitaciones y pasos para reproducir.

Empieza trazando el código Delphi, no reescribas desde cero. Primero presenta un mapa de evidencia y las incertidumbres críticas; luego implementa solo lo respaldado. No realices operaciones que cambien el estado de ninguna ECU.

## Novedad: catálogo de DTC traducido al español
- `archivos/dtc_tablas_es.json` contiene 316 entradas y 300 descripciones únicas traducidas del ruso al español; cada entrada conserva `codigo`, `grupo`, `descripcion_ru` y `descripcion_es`. La traducción fue elaborada manualmente y requiere revisión técnica de términos dudosos.
- Equivalencias usadas: ЭСУД = ECU del motor; РХХ = actuador de ralentí; УОЗ = avance de encendido; адсорбер = canister; ПЗУ = ROM; ОЗУ = RAM. Mantener TCC, SS1, SS2, ST y PCS junto al término español.
- Hay 16 códigos sin descripción en la fuente original: `59`, `B1400`, `B1403`, `B2500`, `P0141`, `P042E`, `C0041`, `C0046`, `C0051`, `C0065`, `C0075`, `C0085`, `C0095`, `C0146`, `C0151` y `C0156`. La app debe mostrar el código y “Sin descripción disponible” para esos registros; no completar con definiciones SAE externas sin distinguir explícitamente la fuente.
- Los códigos numéricos sin prefijo (grupo `num`, 1–87) pertenecen al módulo SRS/airbag antiguo y deben buscarse por separado, no como P/B/C/U.
- La app Android debe cargar `app/src/main/assets/dtc_tablas_es.json` y mostrar `descripcion_es`; el archivo conserva `descripcion_ru` para auditoría. No borrar la descripción rusa.
- La última sesión de prueba confirma que TesterPresent cada 2 segundos mantuvo abierta la sesión MR-140 durante unos 25 segundos y permitió leer DTC a mitad de sesión. Incluir este hallazgo en el análisis de temporización, sin extrapolarlo a todas las ECUs.
