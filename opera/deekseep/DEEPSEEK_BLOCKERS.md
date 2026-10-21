# DEEPSEEK_BLOCKERS

## BLOQUEANTE 1 - Falta de verificacion de checksum en IdProbe
- Ubicacion: `app/src/main/java/com/cheviexplorer/android/kwp/IdProbe.kt` L9-20
- Riesgo: tramas corruptas aceptadas como validas
- Accion: integrar `KwpProtocol.findResponse` o validacion explicita

## BLOQUEANTE 2 - Parser NRC roto en IdProbe
- Ubicacion: `app/src/main/java/com/cheviexplorer/android/kwp/IdProbe.kt` L17-18
- Riesgo: `ArrayIndexOutOfBoundsException` ante `7F xx yy`
- Accion: detectar SID 0x7F explicitamente y extraer NRC del indice 2