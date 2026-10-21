# DEEPSEEK_TECHNICAL_REVIEW

## Matriz de afirmaciones, evidencia y contradicciones

| # | Afirmación | Evidencia | Contradicción / Hallazgo | Severidad | Recomendación |
|---|---|---|---|---|---|
| 1 | Checksum = suma aditiva mod 256 | `KwpBus.kt` L8-9; `PORTADO_DELPHI_ACTUADORES.md` L29 | Coherente con ISO 14230-2. Trama `83 11 F1 30 15 01 CB` verificada manualmente | — | Ninguna |
| 2 | Trama = `0x80 or len` | `KwpBus.kt` L13 | Correcto para len <= 0x3F. No cubre longitudes extendidas | MEDIO | Añadir soporte de formato extendido |
| 3 | MR-140 = 0x11, ZF 4HP16 = 0x18 | `KWP_LABORATORIO.md` L16; `INVESTIGACION_KWP.md` L31 | Coherente con capturas físicas | — | Ninguna |
| 4 | Servicio 0x21 -> respuesta 0x61 | `IdProbe.kt` L8-16; captura `96 F1 11 61 02 ...` | Coherente con KWP2000 (SID+0x40) | — | Ninguna |
| 5 | Servicio 0x30 subfunción 0x07/0x01 para actuadores | `PORTADO_DELPHI_ACTUADORES.md` L30-36 | No verificado físicamente. No se comprueba sesión/seguridad (0x27) previa | ALTO | Implementar y probar precondiciones |
| 6 | IDs de actuador (0x32, 0x15...) válidos para MR-140 | `PORTADO_DELPHI_ACTUADORES.md` L19-28 | Hipótesis no confirmada físicamente | MEDIO | Pruebas controladas por ID |
| 7 | Parser NRC en `IdProbe` correcto | `IdProbe.kt` L17-18 | FALSO: `copyOfRange(3, lastIndex)` falla con tramas de 3 bytes o deja payload vacío | BLOQUEANTE | Reescribir parser de 0x7F |
| 8 | `IdProbe` valida checksum de respuestas | `IdProbe.kt` L9-20 | FALSO: no llama a validación de checksum | BLOQUEANTE | Integrar validación de checksum |
| 9 | Resumen de barrido separa tipos de error | `AUDITORIA_REFERENCIAS_KLINE.md` L20-23 | Contradicción interna reconocida por el propio repo | MEDIO | Contadores independientes |
| 10 | Decodificación de `1A 80` correcta | `KwpProtocolTest.kt` L39-43; `EcuIdentificationDecoder.kt` | Parcial: falta contrastar offsets/endianess con `Graf.pas` | MEDIO | Contrastar con tabla Delphi |