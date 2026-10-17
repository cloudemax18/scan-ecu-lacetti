[10:51:22] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[10:51:22] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[10:51:56] USB detectado: VID=1A86 PID=7523
[10:52:00] USB detectado: VID=1A86 PID=7523
[10:52:00] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[10:52:00] No se han enviado bytes a la ECU. Esperando datos del enlace.
[10:52:09] INIT MR-140: secuencia candidata derivada estáticamente; no es una comunicación confirmada.
[10:52:09] ERROR INIT MR-140: UnsupportedOperationException
[10:52:12] INIT MR-140: secuencia candidata derivada estáticamente; no es una comunicación confirmada.
[10:52:12] ERROR INIT MR-140: UnsupportedOperationException

[11:11:36] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[11:11:36] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[11:12:30] USB detectado: VID=1A86 PID=7523
[11:12:32] USB detectado: VID=1A86 PID=7523
[11:12:32] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[11:12:32] No se han enviado bytes a la ECU. Esperando datos del enlace.
[11:12:42] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:12:42] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[11:12:42] RX  00
[11:12:42] TX MR-140  81 11 F1 83
[11:12:42] RX  81 11 F1 83
[11:12:44] INIT MR-140 finalizada; comprueba si apareció RX después de TX.

[11:27:05] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[11:27:05] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[11:27:24] USB detectado: VID=1A86 PID=7523
[11:27:26] USB detectado: VID=1A86 PID=7523
[11:27:26] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[11:27:26] No se han enviado bytes a la ECU. Esperando datos del enlace.
[11:27:32] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:27:32] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[11:27:32] RX  00
[11:27:32] TX MR-140  81 11 F1 81 04
[11:27:32] RX  81 11 F1 81 04
[11:27:32] RX  83 F1 11 C1 EF 8F C4
[11:27:33] RESULTADO MR-140: ECO TX + BYTES ADICIONALES RX: 83 F1 11 C1 EF 8F C4
[11:27:33] Los bytes adicionales son candidatos a respuesta; todavía falta validar formato y checksum.

[11:36:24] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[11:36:24] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[11:36:47] USB detectado: VID=1A86 PID=7523
[11:36:49] USB detectado: VID=1A86 PID=7523
[11:36:49] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[11:36:49] No se han enviado bytes a la ECU. Esperando datos del enlace.
[11:36:51] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:36:51] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[11:36:52] RX  00
[11:36:52] TX MR-140  81 11 F1 81 04
[11:36:52] RX  81 11 F1 81 04
[11:36:52] RX  83 F1 11 C1 EF 8F C4
[11:36:53] ECO TX detectado: 81 11 F1 81 04
[11:36:53] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[11:36:53] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[11:36:53] RESULTADO MR-140: trama con formato/dirección/checksum coherentes. Respuesta candidata; identidad y datos aún no decodificados.
[11:46:09] USB detectado: VID=1A86 PID=7523
[11:46:11] USB detectado: VID=1A86 PID=7523
[11:46:11] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[11:46:11] No se han enviado bytes a la ECU. Esperando datos del enlace.
[11:46:12] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:46:12] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[11:46:13] RX  00
[11:46:13] TX MR-140  81 11 F1 81 04
[11:46:13] RX  81 11 F1 81 04
[11:46:13] RX  83 F1 11 C1 EF 8F C4
[11:46:14] ECO TX detectado: 81 11 F1 81 04
[11:46:14] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[11:46:14] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[11:46:14] RESULTADO MR-140: trama con formato/dirección/checksum coherentes. Respuesta candidata; identidad y datos aún no decodificados.
[11:46:37] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:46:37] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[11:46:37] RX  00
[11:46:37] TX ZF 4HP16  81 18 F1 81 0B
[11:46:37] RX  81 18 F1 81 0B
[11:46:37] RX  83 F1 18 C1 EF 8F CB
[11:46:39] ECO TX detectado: 81 18 F1 81 0B
[11:46:39] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[11:46:39] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[11:46:39] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes. Respuesta candidata; identidad y datos aún no decodificados.
[11:51:51] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[11:51:51] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[11:52:10] USB detectado: VID=1A86 PID=7523
[11:52:12] USB detectado: VID=1A86 PID=7523
[11:52:12] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[11:52:12] No se han enviado bytes a la ECU. Esperando datos del enlace.
[11:52:17] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:52:17] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[11:52:18] RX  00
[11:52:18] TX MR-140  81 11 F1 81 04
[11:52:18] RX  81 11 F1 81 04
[11:52:18] RX  83 F1 11 C1 EF 8F C4
[11:52:19] ECO TX detectado: 81 11 F1 81 04
[11:52:19] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[11:52:19] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[11:52:19] RESULTADO MR-140: trama con formato/dirección/checksum coherentes. Respuesta candidata; identidad y datos aún no decodificados.
[11:52:37] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[11:52:37] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[11:52:38] RX  00
[11:52:38] TX ZF 4HP16  81 18 F1 81 0B
[11:52:38] RX  81 18 F1 81 0B
[11:52:38] RX  83 F1 18 C1 EF 8F CB
[11:52:39] ECO TX detectado: 81 18 F1 81 0B
[11:52:39] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[11:52:39] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[11:52:39] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes. Respuesta candidata; identidad y datos aún no decodificados.
[11:52:45] Puerto serie cerrado.
[12:06:57] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[12:06:57] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[12:07:49] USB detectado: VID=1A86 PID=7523
[12:07:51] USB detectado: VID=1A86 PID=7523
[12:07:51] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:07:51] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:07:55] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:07:55] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[12:07:55] RX  00
[12:07:55] TX MR-140  81 11 F1 81 04
[12:07:55] RX  81 11 F1 81 04
[12:07:55] RX  83 F1 11 C1 EF 8F C4
[12:07:56] ECO TX detectado: 81 11 F1 81 04
[12:07:56] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[12:07:56] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[12:07:56] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[12:07:56] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:07:56] Estas claves no son una identificación de ECU; siguiente solicitud aún pendiente de validar.
[12:08:06] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:08:06] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[12:08:06] RX  00
[12:08:06] TX MR-140  81 11 F1 81 04
[12:08:06] RX  81 11 F1 81 04
[12:08:06] RX  83 F1 11 C1 EF 8F C4
[12:08:08] ECO TX detectado: 81 11 F1 81 04
[12:08:08] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[12:08:08] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[12:08:08] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[12:08:08] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:08:08] Estas claves no son una identificación de ECU; siguiente solicitud aún pendiente de validar.
[12:08:13] Puerto serie cerrado.
[12:08:15] USB detectado: VID=1A86 PID=7523
[12:08:15] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:08:15] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:08:20] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:08:20] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[12:08:20] RX  00
[12:08:20] TX ZF 4HP16  81 18 F1 81 0B
[12:08:20] RX  81 18 F1 81 0B
[12:08:21] RX  83 F1 18 C1 EF 8F CB
[12:08:22] ECO TX detectado: 81 18 F1 81 0B
[12:08:22] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[12:08:22] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[12:08:22] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[12:08:22] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:08:22] Estas claves no son una identificación de ECU; siguiente solicitud aún pendiente de validar.
[12:19:49] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[12:19:49] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[12:20:08] USB detectado: VID=1A86 PID=7523
[12:20:10] USB detectado: VID=1A86 PID=7523
[12:20:10] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:20:10] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:20:13] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:20:13] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[12:20:13] RX  00
[12:20:13] TX MR-140  81 11 F1 81 04
[12:20:13] RX  81 11 F1 81 04
[12:20:13] RX  83 F1 11 C1 EF 8F C4
[12:20:15] ECO TX detectado: 81 11 F1 81 04
[12:20:15] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[12:20:15] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[12:20:15] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[12:20:15] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:20:15] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[12:20:17] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[12:20:17] TX IDENT MR-140  82 11 F1 1A 80 1E
[12:20:17] RX  82 11 F1 1A 80 1E
[12:20:17] RX  80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00
[12:20:17] RX  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35
[12:20:17] RX  00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[12:20:19] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[12:20:19] IDENT ECU MR-140: RX sin trama reconocible: 80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[12:20:28] Puerto serie cerrado.
[12:20:32] USB detectado: VID=1A86 PID=7523
[12:20:32] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:20:32] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:20:36] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:20:36] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[12:20:37] RX  00
[12:20:37] TX ZF 4HP16  81 18 F1 81 0B
[12:20:37] RX  81 18 F1 81 0B
[12:20:37] RX  83 F1 18 C1 EF 8F CB
[12:20:38] ECO TX detectado: 81 18 F1 81 0B
[12:20:38] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[12:20:38] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[12:20:38] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[12:20:38] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:20:38] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[12:20:40] IDENT ECU ZF 4HP16: solicitud de lectura 1A 80 reconstruida del programa original.
[12:20:40] TX IDENT ZF 4HP16  82 18 F1 1A 80 25
[12:20:40] RX  82 18 F1 1A 80 25
[12:20:40] RX  80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37
[12:20:40] RX  35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34
[12:20:40] RX  33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[12:20:40] RX  FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[12:20:41] ECO TX IDENT detectado: 82 18 F1 1A 80 25
[12:20:41] IDENT ECU ZF 4HP16: RX sin trama reconocible: 80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[12:20:47] Puerto serie cerrado.
[12:37:19] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[12:37:19] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[12:37:25] USB detectado: VID=1A86 PID=7523
[12:37:27] USB detectado: VID=1A86 PID=7523
[12:37:27] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:37:27] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:37:28] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:37:28] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[12:37:29] RX  00
[12:37:29] TX MR-140  81 11 F1 81 04
[12:37:29] RX  81 11 F1 81 04
[12:37:29] RX  83 F1 11 C1 EF 8F C4
[12:37:30] ECO TX detectado: 81 11 F1 81 04
[12:37:30] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[12:37:30] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[12:37:30] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[12:37:30] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:37:30] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[12:37:30] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[12:37:30] TX IDENT MR-140  82 11 F1 1A 80 1E
[12:37:30] RX  82 11 F1 1A 80 1E
[12:37:30] RX  80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00
[12:37:30] RX  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35
[12:37:31] RX  00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[12:37:32] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[12:37:32] RX IDENT CANDIDATA MR-140: 80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[12:37:32] VALIDACIÓN IDENT: formato=0x80, longitud=80 (extendida), destino=0xF1, origen=0x11, checksum recibido=0xEB, esperado=0xEB (OK)
[12:37:32] IDENT ECU MR-140: respuesta positiva 0x5A al servicio 0x1A.
[12:37:32] Datos de identificación sin decodificar (incluye SID): 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[12:37:32] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[12:37:39] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[12:37:39] TX IDENT MR-140  82 11 F1 1A 80 1E
[12:37:39] RX  82 11 F1 1A 80 1E
[12:37:40] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[12:37:40] IDENT ECU MR-140: solo eco TX; no se recibió respuesta adicional.
[12:37:48] Puerto serie cerrado.
[12:37:52] USB detectado: VID=1A86 PID=7523
[12:37:52] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[12:37:52] No se han enviado bytes a la ECU. Esperando datos del enlace.
[12:37:54] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[12:37:54] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[12:37:54] RX  00
[12:37:54] TX ZF 4HP16  81 18 F1 81 0B
[12:37:55] RX  81 18 F1 81 0B
[12:37:55] RX  83 F1 18 C1 EF 8F CB
[12:37:56] ECO TX detectado: 81 18 F1 81 0B
[12:37:56] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[12:37:56] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[12:37:56] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[12:37:56] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[12:37:56] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[12:37:58] IDENT ECU ZF 4HP16: solicitud de lectura 1A 80 reconstruida del programa original.
[12:37:58] TX IDENT ZF 4HP16  82 18 F1 1A 80 25
[12:37:58] RX  82 18 F1 1A 80 25
[12:37:58] RX  80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37
[12:37:58] RX  35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34
[12:37:58] RX  33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[12:37:58] RX  FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[12:37:59] ECO TX IDENT detectado: 82 18 F1 1A 80 25
[12:37:59] RX IDENT CANDIDATA ZF 4HP16: 80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[12:37:59] VALIDACIÓN IDENT: formato=0x80, longitud=118 (extendida), destino=0xF1, origen=0x18, checksum recibido=0xAD, esperado=0xAD (OK)
[12:37:59] IDENT ECU ZF 4HP16: respuesta positiva 0x5A al servicio 0x1A.
[12:37:59] Datos de identificación sin decodificar (incluye SID): 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[12:37:59] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[13:04:43] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[13:04:43] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[13:04:57] USB detectado: VID=1A86 PID=7523
[13:04:59] USB detectado: VID=1A86 PID=7523
[13:04:59] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[13:04:59] No se han enviado bytes a la ECU. Esperando datos del enlace.
[13:05:01] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[13:05:01] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[13:05:02] RX  00
[13:05:02] TX MR-140  81 11 F1 81 04
[13:05:02] RX  81 11 F1 81 04
[13:05:02] RX  83 F1 11 C1 EF 8F C4
[13:05:03] ECO TX detectado: 81 11 F1 81 04
[13:05:03] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[13:05:03] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[13:05:03] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[13:05:03] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[13:05:03] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[13:05:07] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[13:05:07] TX IDENT MR-140  82 11 F1 1A 80 1E
[13:05:07] RX  82 11 F1 1A 80 1E
[13:05:09] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[13:05:09] IDENT ECU MR-140: solo eco TX; no se recibió respuesta adicional.
[13:05:16] Puerto serie cerrado.
[13:05:20] USB detectado: VID=1A86 PID=7523
[13:05:20] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[13:05:20] No se han enviado bytes a la ECU. Esperando datos del enlace.
[13:05:24] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[13:05:24] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[13:05:24] RX  00
[13:05:24] TX ZF 4HP16  81 18 F1 81 0B
[13:05:24] RX  81 18 F1 81 0B
[13:05:24] RX  83 F1 18 C1 EF 8F CB
[13:05:26] ECO TX detectado: 81 18 F1 81 0B
[13:05:26] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[13:05:26] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[13:05:26] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[13:05:26] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[13:05:26] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[13:05:27] IDENT ECU ZF 4HP16: solicitud de lectura 1A 80 reconstruida del programa original.
[13:05:27] TX IDENT ZF 4HP16  82 18 F1 1A 80 25
[13:05:27] RX  82 18 F1 1A 80 25
[13:05:27] RX  80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37
[13:05:27] RX  35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34
[13:05:27] RX  33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[13:05:27] RX  FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[13:05:28] ECO TX IDENT detectado: 82 18 F1 1A 80 25
[13:05:28] RX IDENT CANDIDATA ZF 4HP16: 80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[13:05:28] VALIDACIÓN IDENT: formato=0x80, longitud=118 (extendida), destino=0xF1, origen=0x18, checksum recibido=0xAD, esperado=0xAD (OK)
[13:05:28] IDENT ECU ZF 4HP16: respuesta positiva 0x5A al servicio 0x1A.
[13:05:28] Datos de identificación sin decodificar (incluye SID): 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[13:05:28] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[15:17:41] USB detectado: VID=1A86 PID=7523
[15:17:45] USB detectado: VID=1A86 PID=7523
[15:17:45] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:17:45] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:17:50] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:17:50] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[15:17:50] RX  00
[15:17:50] TX MR-140  81 11 F1 81 04
[15:17:50] RX  81 11 F1 81 04
[15:17:50] RX  83 F1 11 C1 EF 8F C4
[15:17:51] ECO TX detectado: 81 11 F1 81 04
[15:17:51] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[15:17:51] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[15:17:51] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[15:17:51] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:17:51] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:17:55] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[15:17:55] TX IDENT MR-140  82 11 F1 1A 80 1E
[15:17:55] RX  82 11 F1 1A 80 1E
[15:17:55] RX  80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00
[15:17:55] RX  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35
[15:17:55] RX  00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[15:17:56] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[15:17:56] RX IDENT CANDIDATA MR-140: 80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[15:17:56] VALIDACIÓN IDENT: formato=0x80, longitud=80 (extendida), destino=0xF1, origen=0x11, checksum recibido=0xEB, esperado=0xEB (OK)
[15:17:56] IDENT ECU MR-140: respuesta positiva 0x5A al servicio 0x1A.
[15:17:56] Datos de identificación sin decodificar (incluye SID): 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[15:17:56] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[15:17:59] TESTER PRESENT MR-140: envío único de 0x3E; temporizador automático desactivado.
[15:17:59] TX TESTER PRESENT MR-140  81 11 F1 3E C1
[15:17:59] RX  81 11 F1 3E C1
[15:17:59] RX  81 F1 11 7E 01
[15:18:00] ECO TX TESTER PRESENT detectado: 81 11 F1 3E C1
[15:18:00] RX TESTER PRESENT CANDIDATA MR-140: 81 F1 11 7E 01
[15:18:00] VALIDACIÓN TESTER PRESENT: formato=0x81, longitud=1, destino=0xF1, origen=0x11, checksum recibido=0x01, esperado=0x01 (OK)
[15:18:05] Puerto serie cerrado.
[15:18:06] USB detectado: VID=1A86 PID=7523
[15:18:06] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:18:06] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:18:13] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:18:13] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[15:18:13] RX  00
[15:18:14] TX ZF 4HP16  81 18 F1 81 0B
[15:18:14] RX  81 18 F1 81 0B
[15:18:14] RX  83 F1 18 C1 EF 8F CB
[15:18:15] ECO TX detectado: 81 18 F1 81 0B
[15:18:15] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[15:18:15] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[15:18:15] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[15:18:15] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:18:15] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:18:17] IDENT ECU ZF 4HP16: solicitud de lectura 1A 80 reconstruida del programa original.
[15:18:17] TX IDENT ZF 4HP16  82 18 F1 1A 80 25
[15:18:17] RX  82 18 F1 1A 80 25
[15:18:17] RX  80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37
[15:18:18] RX  35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34
[15:18:18] RX  33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[15:18:18] RX  FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[15:18:19] ECO TX IDENT detectado: 82 18 F1 1A 80 25
[15:18:19] RX IDENT CANDIDATA ZF 4HP16: 80 F1 18 76 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF AD
[15:18:19] VALIDACIÓN IDENT: formato=0x80, longitud=118 (extendida), destino=0xF1, origen=0x18, checksum recibido=0xAD, esperado=0xAD (OK)
[15:18:19] IDENT ECU ZF 4HP16: respuesta positiva 0x5A al servicio 0x1A.
[15:18:19] Datos de identificación sin decodificar (incluye SID): 5A 80 35 57 4B 33 33 36 30 30 4A 47 31 30 36 33 30 30 34 30 37 36 36 35 38 31 30 37 35 31 32 31 2D 2D 36 35 38 31 30 37 35 35 41 39 2D 2D 36 35 38 31 30 37 35 36 44 36 37 36 35 34 33 38 31 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF 39 36 38 30 31 31 36 39 4A 47 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[15:18:19] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[15:18:22] TESTER PRESENT ZF 4HP16: envío único de 0x3E; temporizador automático desactivado.
[15:18:22] TX TESTER PRESENT ZF 4HP16  81 18 F1 3E C8
[15:18:23] RX  81 18 F1 3E C8
[15:18:23] RX  81 F1 18 7E 08
[15:18:23] ECO TX TESTER PRESENT detectado: 81 18 F1 3E C8
[15:18:23] RX TESTER PRESENT CANDIDATA ZF 4HP16: 81 F1 18 7E 08
[15:18:23] VALIDACIÓN TESTER PRESENT: formato=0x81, longitud=1, destino=0xF1, origen=0x18, checksum recibido=0x08, esperado=0x08 (OK)
[15:18:27] Puerto serie cerrado.
[15:37:08] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[15:37:08] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[15:37:50] USB detectado: VID=1A86 PID=7523
[15:37:54] USB detectado: VID=1A86 PID=7523
[15:37:54] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:37:54] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:37:56] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:37:56] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[15:37:56] RX  00
[15:37:56] TX MR-140  81 11 F1 81 04
[15:37:56] RX  81 11 F1 81 04
[15:37:57] RX  83 F1 11 C1 EF 8F C4
[15:37:58] ECO TX detectado: 81 11 F1 81 04
[15:37:58] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[15:37:58] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[15:37:58] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[15:37:58] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:37:58] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:38:01] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[15:38:01] TX IDENT MR-140  82 11 F1 1A 80 1E
[15:38:01] RX  82 11 F1 1A 80 1E
[15:38:01] RX  80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00
[15:38:01] RX  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35
[15:38:01] RX  00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[15:38:03] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[15:38:03] RX IDENT CANDIDATA MR-140: 80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[15:38:03] VALIDACIÓN IDENT: formato=0x80, longitud=80 (extendida), destino=0xF1, origen=0x11, checksum recibido=0xEB, esperado=0xEB (OK)
[15:38:03] IDENT ECU MR-140: respuesta positiva 0x5A al servicio 0x1A.
[15:38:03] Datos de identificación sin decodificar (incluye SID): 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[15:38:03] No se asigna nombre/modelo de ECU hasta contrastar estos bytes con el parser Delphi.
[15:38:04] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:38:04] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:38:04] RX  84 11 F1 19 DA FF 00 78
[15:38:04] RX  82 F1 11 59 00 DD
[15:38:05] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:38:05] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[15:38:05] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[15:38:05] LECTURA DTC MR-140: respuesta positiva 0x59.
[15:38:05] DATOS DTC RAW MR-140 (sin decodificar): 59 00
[15:38:05] No se muestran códigos traducidos hasta verificar el formato de registros de esta ECU.
[15:38:16] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:38:16] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:38:16] RX  84 11 F1 19 DA FF 00 78
[15:38:18] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:38:18] LECTURA DTC MR-140: solo eco TX; no se recibió respuesta ECU.
[15:38:23] TESTER PRESENT MR-140: envío único de 0x3E; temporizador automático desactivado.
[15:38:23] TX TESTER PRESENT MR-140  81 11 F1 3E C1
[15:38:23] RX  81 11 F1 3E C1
[15:38:23] ECO TX TESTER PRESENT detectado: 81 11 F1 3E C1
[15:38:23] TESTER PRESENT MR-140: solo eco TX; no se interpreta como respuesta ECU.
[15:38:30] Puerto serie cerrado.
[15:38:32] USB detectado: VID=1A86 PID=7523
[15:38:32] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:38:32] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:38:34] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:38:34] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[15:38:35] RX  00
[15:38:35] TX ZF 4HP16  81 18 F1 81 0B
[15:38:35] RX  81 18 F1 81 0B
[15:38:35] RX  83 F1 18 C1 EF 8F CB
[15:38:36] ECO TX detectado: 81 18 F1 81 0B
[15:38:36] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[15:38:36] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[15:38:36] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[15:38:36] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:38:36] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:38:41] LECTURA DTC ZF 4HP16: solicitud de solo lectura reconstruida de main.pas.
[15:38:41] TX DTC ZF 4HP16  84 18 F1 18 00 00 00 A5
[15:38:41] RX  84 18 F1 18 00 00 00 A5
[15:38:42] ECO TX DTC detectado: 84 18 F1 18 00 00 00 A5
[15:38:42] LECTURA DTC ZF 4HP16: solo eco TX; no se recibió respuesta ECU.
[15:38:45] IDENT ECU ZF 4HP16: solicitud de lectura 1A 80 reconstruida del programa original.
[15:38:45] TX IDENT ZF 4HP16  82 18 F1 1A 80 25
[15:38:45] RX  82 18 F1 1A 80 25
[15:38:46] ECO TX IDENT detectado: 82 18 F1 1A 80 25
[15:38:46] IDENT ECU ZF 4HP16: solo eco TX; no se recibió respuesta adicional.
[15:38:49] TESTER PRESENT ZF 4HP16: envío único de 0x3E; temporizador automático desactivado.
[15:38:49] TX TESTER PRESENT ZF 4HP16  81 18 F1 3E C8
[15:38:49] RX  81 18 F1 3E C8
[15:38:50] ECO TX TESTER PRESENT detectado: 81 18 F1 3E C8
[15:38:50] TESTER PRESENT ZF 4HP16: solo eco TX; no se interpreta como respuesta ECU.
[15:38:55] Puerto serie cerrado.
[21:38:25] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[21:38:25] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[21:38:40] ACTUALIZACIONES: buscando la última compilación debug exitosa en GitHub Actions.
[22:08:14] USB detectado: VID=1A86 PID=7523
[22:08:17] USB detectado: VID=1A86 PID=7523
[22:08:17] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[22:08:17] No se han enviado bytes a la ECU. Esperando datos del enlace.
[22:08:17] RX  00
[22:08:22] LECTURA DTC cancelada: inicializa primero MR-140 y confirma StartCommunication.
[22:08:24] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[22:08:24] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[22:08:25] RX  00
[22:08:25] TX MR-140  81 11 F1 81 04
[22:08:25] RX  81 11 F1 81 04
[22:08:25] RX  83 F1 11 C1 EF 8F C4
[22:08:26] ECO TX detectado: 81 11 F1 81 04
[22:08:26] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[22:08:26] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[22:08:26] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[22:08:26] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[22:08:26] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[22:08:26] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[22:08:28] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:28] RX  81 11 F1 3E C1
[22:08:28] RX  81 F1 11 7E 01
[22:08:30] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:30] RX  81 11 F1 3E C1
[22:08:30] RX  81 F1 11 7E 01
[22:08:32] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:32] RX  81 11 F1 3E C1
[22:08:32] RX  81 F1 11 7E 01
[22:08:34] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:34] RX  81 11 F1 3E C1
[22:08:34] RX  81 F1 11 7E 01
[22:08:36] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:36] RX  81 11 F1 3E C1
[22:08:36] RX  81 F1 11 7E 01
[22:08:38] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:38] RX  81 11 F1 3E C1
[22:08:38] RX  81 F1 11 7E 01
[22:08:40] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:40] RX  81 11 F1 3E C1
[22:08:40] RX  81 F1 11 7E 01
[22:08:42] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:42] RX  81 11 F1 3E C1
[22:08:42] RX  81 F1 11 7E 01
[22:08:43] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[22:08:43] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[22:08:43] RX  84 11 F1 19 DA FF 00 78
[22:08:43] RX  82 F1 11 59 00 DD
[22:08:45] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[22:08:45] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[22:08:45] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[22:08:45] LECTURA DTC MR-140: respuesta positiva 0x59.
[22:08:45] DTC: subfunción/estado recibido = 0x00.
[22:08:45] DATOS DTC RAW MR-140 (incluye SID): 59 00
[22:08:45] DTC: la respuesta no contiene bytes de registro después del SID/estado.
[22:08:45] Esto NO se presenta como «sin averías»: falta confirmar el formato de registros Delphi para esta ECU.
[22:08:45] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:45] RX  81 11 F1 3E C1
[22:08:45] RX  81 F1 11 7E 01
[22:08:46] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:46] RX  81 11 F1 3E C1
[22:08:46] RX  81 F1 11 7E 01
[22:08:48] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:48] RX  81 11 F1 3E C1
[22:08:48] RX  81 F1 11 7E 01
[22:08:50] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:50] RX  81 11 F1 3E C1
[22:08:50] RX  81 F1 11 7E 01
[22:08:51] Puerto serie cerrado.
[21:38:25] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[21:38:25] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[21:38:40] ACTUALIZACIONES: buscando la última compilación debug exitosa en GitHub Actions.
[22:08:14] USB detectado: VID=1A86 PID=7523
[22:08:17] USB detectado: VID=1A86 PID=7523
[22:08:17] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[22:08:17] No se han enviado bytes a la ECU. Esperando datos del enlace.
[22:08:17] RX  00
[22:08:22] LECTURA DTC cancelada: inicializa primero MR-140 y confirma StartCommunication.
[22:08:24] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[22:08:24] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[22:08:25] RX  00
[22:08:25] TX MR-140  81 11 F1 81 04
[22:08:25] RX  81 11 F1 81 04
[22:08:25] RX  83 F1 11 C1 EF 8F C4
[22:08:26] ECO TX detectado: 81 11 F1 81 04
[22:08:26] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[22:08:26] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[22:08:26] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[22:08:26] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[22:08:26] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[22:08:26] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[22:08:28] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:28] RX  81 11 F1 3E C1
[22:08:28] RX  81 F1 11 7E 01
[22:08:30] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:30] RX  81 11 F1 3E C1
[22:08:30] RX  81 F1 11 7E 01
[22:08:32] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:32] RX  81 11 F1 3E C1
[22:08:32] RX  81 F1 11 7E 01
[22:08:34] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:34] RX  81 11 F1 3E C1
[22:08:34] RX  81 F1 11 7E 01
[22:08:36] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:36] RX  81 11 F1 3E C1
[22:08:36] RX  81 F1 11 7E 01
[22:08:38] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:38] RX  81 11 F1 3E C1
[22:08:38] RX  81 F1 11 7E 01
[22:08:40] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:40] RX  81 11 F1 3E C1
[22:08:40] RX  81 F1 11 7E 01
[22:08:42] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:42] RX  81 11 F1 3E C1
[22:08:42] RX  81 F1 11 7E 01
[22:08:43] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[22:08:43] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[22:08:43] RX  84 11 F1 19 DA FF 00 78
[22:08:43] RX  82 F1 11 59 00 DD
[22:08:45] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[22:08:45] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[22:08:45] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[22:08:45] LECTURA DTC MR-140: respuesta positiva 0x59.
[22:08:45] DTC: subfunción/estado recibido = 0x00.
[22:08:45] DATOS DTC RAW MR-140 (incluye SID): 59 00
[22:08:45] DTC: la respuesta no contiene bytes de registro después del SID/estado.
[22:08:45] Esto NO se presenta como «sin averías»: falta confirmar el formato de registros Delphi para esta ECU.
[22:08:45] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:45] RX  81 11 F1 3E C1
[22:08:45] RX  81 F1 11 7E 01
[22:08:46] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:46] RX  81 11 F1 3E C1
[22:08:46] RX  81 F1 11 7E 01
[22:08:48] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:48] RX  81 11 F1 3E C1
[22:08:48] RX  81 F1 11 7E 01
[22:08:50] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[22:08:50] RX  81 11 F1 3E C1
[22:08:50] RX  81 F1 11 7E 01
[22:08:51] Puerto serie cerrado.
[22:09:00] USB detectado: VID=1A86 PID=7523
[22:09:00] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[22:09:00] No se han enviado bytes a la ECU. Esperando datos del enlace.
[22:09:04] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[22:09:04] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[22:09:04] RX  00
[22:09:05] TX ZF 4HP16  81 18 F1 81 0B
[22:09:05] RX  81 18 F1 81 0B
[22:09:05] RX  83 F1 18 C1 EF 8F CB
[22:09:06] ECO TX detectado: 81 18 F1 81 0B
[22:09:06] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[22:09:06] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[22:09:06] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[22:09:06] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[22:09:06] TESTER PRESENT automático activado para ZF 4HP16: intervalo de 2 s mientras la sesión esté abierta.
[22:09:06] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[22:09:08] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[22:09:08] RX  81 18 F1 3E C8
[22:09:08] RX  81 F1 18 7E 08
[22:09:10] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[22:09:10] RX  81 18 F1 3E C8
[22:09:10] RX  81 F1 18 7E 08
[22:09:11] LECTURA DTC ZF 4HP16: solicitud de solo lectura reconstruida de main.pas.
[22:09:11] TX DTC ZF 4HP16  84 18 F1 18 00 00 00 A5
[22:09:11] RX  84 18 F1 18 00 00 00 A5
[22:09:11] RX  85 F1 18 58 01 07 03 68 59
[22:09:13] ECO TX DTC detectado: 84 18 F1 18 00 00 00 A5
[22:09:13] RX DTC CANDIDATA ZF 4HP16: 85 F1 18 58 01 07 03 68 59
[22:09:13] VALIDACIÓN DTC: formato=0x85, longitud=5, destino=0xF1, origen=0x18, checksum recibido=0x59, esperado=0x59 (OK)
[22:09:13] LECTURA DTC ZF 4HP16: respuesta positiva 0x58.
[22:09:13] DTC: subfunción/estado recibido = 0x01.
[22:09:13] DATOS DTC RAW ZF 4HP16 (incluye SID): 58 01 07 03 68
[22:09:13] DTC: 3 byte(s) de registro disponibles; se conservan sin decodificar hasta verificar el formato de esta ECU.
[22:09:13] REGISTROS DTC RAW: 07 03 68
[22:09:13] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[22:09:13] RX  81 18 F1 3E C8
[22:09:13] RX  81 F1 18 7E 08
[22:09:14] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[22:09:14] RX  81 18 F1 3E C8
[22:09:14] RX  81 F1 18 7E 08
[22:09:15] Puerto serie cerrado.
[23:10:42] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[23:10:43] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[23:11:36] USB detectado: VID=1A86 PID=7523
[23:11:38] USB detectado: VID=1A86 PID=7523
[23:11:38] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[23:11:38] No se han enviado bytes a la ECU. Esperando datos del enlace.
[23:11:38] RX  00
[23:11:39] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[23:11:39] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[23:11:39] RX  00
[23:11:39] TX MR-140  81 11 F1 81 04
[23:11:39] RX  81 11 F1 81 04
[23:11:39] RX  83 F1 11 C1 EF 8F C4
[23:11:41] ECO TX detectado: 81 11 F1 81 04
[23:11:41] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[23:11:41] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[23:11:41] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[23:11:41] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[23:11:41] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[23:11:41] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[23:11:41] IDENT ECU MR-140: solicitud de lectura 1A 80 reconstruida del programa original.
[23:11:41] TX IDENT MR-140  82 11 F1 1A 80 1E
[23:11:41] RX  82 11 F1 1A 80 1E
[23:11:41] RX  80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00
[23:11:41] RX  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35
[23:11:41] RX  00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[23:11:43] ECO TX IDENT detectado: 82 11 F1 1A 80 1E
[23:11:43] RX IDENT CANDIDATA MR-140: 80 F1 11 50 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF EB
[23:11:43] VALIDACIÓN IDENT: formato=0x80, longitud=80 (extendida), destino=0xF1, origen=0x11, checksum recibido=0xEB, esperado=0xEB (OK)
[23:11:43] IDENT ECU MR-140: respuesta positiva 0x5A al servicio 0x1A.
[23:11:43] PAYLOAD IDENT RAW (incluye 5A 80): 5A 80 38 5A 31 4A 4A 35 31 33 38 38 56 33 32 32 39 34 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 30 33 68 30 31 34 68 30 30 35 00 00 00 00 00 00 FF FF FF FF FF FF FF FF FF FF FF FF FF FF
[23:11:43] IDENTIFICACIÓN MR-140 · VIN (16 caracteres según parser original): 8Z1JJ51388V32294
[23:11:43] IDENTIFICACIÓN MR-140 · Número de programa: 03h014h005
[23:11:43] IDENTIFICACIÓN MR-140 · Fecha de programación: FF FF FF FF
[23:11:43] AVISO: campos decodificados con ident_decodificacion.json; contrastar con el ejecutable original, especialmente VIN MR-140 (parser original lee 16 de 17 caracteres).
[23:11:43] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:43] RX  81 11 F1 3E C1
[23:11:43] RX  81 F1 11 7E 01
[23:11:45] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:45] RX  81 11 F1 3E C1
[23:11:45] RX  81 F1 11 7E 01
[23:11:47] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:47] RX  81 11 F1 3E C1
[23:11:47] RX  81 F1 11 7E 01
[23:11:49] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:49] RX  81 11 F1 3E C1
[23:11:49] RX  81 F1 11 7E 01
[23:11:51] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:51] RX  81 11 F1 3E C1
[23:11:51] RX  81 F1 11 7E 01
[23:11:53] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[23:11:53] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[23:11:53] RX  84 11 F1 19 DA FF 00 78
[23:11:53] RX  82 F1 11 59 00 DD
[23:11:53] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:53] RX  81 11 F1 3E C1
[23:11:53] RX  81 F1 11 7E 01
[23:11:54] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[23:11:54] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[23:11:54] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[23:11:54] LECTURA DTC MR-140: respuesta positiva 0x59.
[23:11:54] DTC: byte de control/estado recibido = 0x00.
[23:11:54] DATOS DTC RAW MR-140 (incluye SID): 59 00
[23:11:54] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[23:11:54] RX DTC restante/no clasificada: 81 11 F1 3E C1 81 F1 11 7E 01
[23:11:55] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:55] RX  81 11 F1 3E C1
[23:11:55] RX  81 F1 11 7E 01
[23:11:57] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:57] RX  81 11 F1 3E C1
[23:11:57] RX  81 F1 11 7E 01
[23:11:59] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:11:59] RX  81 11 F1 3E C1
[23:11:59] RX  81 F1 11 7E 01
[23:12:00] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[23:12:00] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[23:12:00] RX  84 11 F1 19 DA FF 00 78
[23:12:00] RX  82 F1 11 59 00 DD
[23:12:01] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:01] RX  81 11 F1 3E C1
[23:12:01] RX  81 F1 11 7E 01
[23:12:02] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[23:12:02] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[23:12:02] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[23:12:02] LECTURA DTC MR-140: respuesta positiva 0x59.
[23:12:02] DTC: byte de control/estado recibido = 0x00.
[23:12:02] DATOS DTC RAW MR-140 (incluye SID): 59 00
[23:12:02] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[23:12:02] RX DTC restante/no clasificada: 81 11 F1 3E C1 81 F1 11 7E 01
[23:12:03] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:03] RX  81 11 F1 3E C1
[23:12:03] RX  81 F1 11 7E 01
[23:12:04] PARÁMETROS MR-140: lectura de solo lectura de grupos F0/F1. Fórmulas extraídas; validación en vehículo pendiente.
[23:12:04] TX MR-140 grupo F0: 82 11 F1 21 F0 95
[23:12:04] RX  82 11 F1 21 F0 95
[23:12:04] RX  83 F1 11 7F 21 31 56
[23:12:05] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:05] RX  81 11 F1 3E C1
[23:12:05] RX  81 F1 11 7E 01
[23:12:05] ECO TX grupo F0 detectado.
[23:12:05] RX MR-140 grupo F0: 83 F1 11 7F 21 31 56
[23:12:05] VALIDACIÓN grupo F0: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:05] MR-140 grupo F0: respuesta negativa KWP NRC=0x31.
[23:12:05] TX MR-140 grupo F1: 82 11 F1 21 F1 96
[23:12:05] RX  82 11 F1 21 F1 96
[23:12:05] RX  83 F1 11 7F 21 31 56
[23:12:06] ECO TX grupo F1 detectado.
[23:12:06] RX MR-140 grupo F1: 83 F1 11 7F 21 31 56
[23:12:06] VALIDACIÓN grupo F1: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:06] MR-140 grupo F1: respuesta negativa KWP NRC=0x31.
[23:12:07] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:07] RX  81 11 F1 3E C1
[23:12:07] RX  81 F1 11 7E 01
[23:12:08] TESTER PRESENT MR-140: envío manual de 0x3E (también hay mantenimiento automático si la sesión está validada).
[23:12:08] TX TESTER PRESENT MR-140  81 11 F1 3E C1
[23:12:08] RX  81 11 F1 3E C1
[23:12:08] RX  81 F1 11 7E 01
[23:12:09] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:09] RX  81 11 F1 3E C1
[23:12:09] RX  81 F1 11 7E 01
[23:12:09] ECO TX TESTER PRESENT detectado: 81 11 F1 3E C1
[23:12:09] RX TESTER PRESENT CANDIDATA MR-140: 81 F1 11 7E 01
[23:12:09] VALIDACIÓN TESTER PRESENT: formato=0x81, longitud=1, destino=0xF1, origen=0x11, checksum recibido=0x01, esperado=0x01 (OK)
[23:12:11] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:11] RX  81 11 F1 3E C1
[23:12:11] RX  81 F1 11 7E 01
[23:12:13] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:13] RX  81 11 F1 3E C1
[23:12:13] RX  81 F1 11 7E 01
[23:12:15] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:15] RX  81 11 F1 3E C1
[23:12:15] RX  81 F1 11 7E 01
[23:12:16] PARÁMETROS MR-140: lectura de solo lectura de grupos F0/F1. Fórmulas extraídas; validación en vehículo pendiente.
[23:12:16] TX MR-140 grupo F0: 82 11 F1 21 F0 95
[23:12:16] RX  82 11 F1 21 F0 95
[23:12:16] RX  83 F1 11 7F 21 31 56
[23:12:17] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:17] RX  81 11 F1 3E C1
[23:12:17] RX  81 F1 11 7E 01
[23:12:17] ECO TX grupo F0 detectado.
[23:12:17] RX MR-140 grupo F0: 83 F1 11 7F 21 31 56
[23:12:17] VALIDACIÓN grupo F0: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:17] MR-140 grupo F0: respuesta negativa KWP NRC=0x31.
[23:12:17] TX MR-140 grupo F1: 82 11 F1 21 F1 96
[23:12:17] RX  82 11 F1 21 F1 96
[23:12:17] RX  83 F1 11 7F 21 31 56
[23:12:18] ECO TX grupo F1 detectado.
[23:12:18] RX MR-140 grupo F1: 83 F1 11 7F 21 31 56
[23:12:18] VALIDACIÓN grupo F1: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:18] MR-140 grupo F1: respuesta negativa KWP NRC=0x31.
[23:12:19] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:19] RX  81 11 F1 3E C1
[23:12:19] RX  81 F1 11 7E 01
[23:12:20] Puerto serie cerrado.
[23:12:23] USB detectado: VID=1A86 PID=7523
[23:12:23] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[23:12:23] No se han enviado bytes a la ECU. Esperando datos del enlace.
[23:12:25] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[23:12:25] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[23:12:25] RX  00
[23:12:25] TX ZF 4HP16  81 18 F1 81 0B
[23:12:25] RX  81 18 F1 81 0B
[23:12:25] RX  83 F1 18 C1 EF 8F CB
[23:12:27] ECO TX detectado: 81 18 F1 81 0B
[23:12:27] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[23:12:27] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[23:12:27] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[23:12:27] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[23:12:27] TESTER PRESENT automático activado para ZF 4HP16: intervalo de 2 s mientras la sesión esté abierta.
[23:12:27] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[23:12:28] PARÁMETROS EN VIVO: solo hay tabla preliminar para MR-140; no se envía ninguna solicitud a ZF 4HP16.
[23:12:29] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[23:12:29] RX  81 18 F1 3E C8
[23:12:29] RX  81 F1 18 7E 08
[23:12:31] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[23:12:31] RX  81 18 F1 3E C8
[23:12:31] RX  81 F1 18 7E 08
[23:12:33] LECTURA DTC ZF 4HP16: solicitud de solo lectura reconstruida de main.pas.
[23:12:33] TX DTC ZF 4HP16  84 18 F1 18 00 00 00 A5
[23:12:33] RX  84 18 F1 18 00 00 00 A5
[23:12:33] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[23:12:33] RX  85 F1 18 58 01 07 14 3E C8
[23:12:33] RX  85 F1 18 58 E6
[23:12:35] ECO TX DTC detectado: 84 18 F1 18 00 00 00 A5
[23:12:35] RX DTC CANDIDATA ZF 4HP16: 85 F1 18 58 01 07 14 3E C8
[23:12:35] VALIDACIÓN DTC: formato=0x85, longitud=5, destino=0xF1, origen=0x18, checksum recibido=0xC8, esperado=0x40 (ERROR)
[23:12:35] LECTURA DTC ZF 4HP16: respuesta no interpretable: checksum inválido.
[23:12:35] RX DTC restante/no clasificada: 85 F1 18 58 E6
[23:12:35] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[23:12:35] RX  81 18 F1 3E C8
[23:12:35] RX  81 F1 18 7E 08
[23:12:36] Puerto serie cerrado.
[23:12:40] USB detectado: VID=1A86 PID=7523
[23:12:40] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[23:12:40] No se han enviado bytes a la ECU. Esperando datos del enlace.
[23:12:42] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[23:12:42] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[23:12:42] RX  00
[23:12:42] TX MR-140  81 11 F1 81 04
[23:12:42] RX  81 11 F1 81 04
[23:12:43] RX  83 F1 11 C1 EF 8F C4
[23:12:44] ECO TX detectado: 81 11 F1 81 04
[23:12:44] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[23:12:44] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[23:12:44] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[23:12:44] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[23:12:44] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[23:12:44] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[23:12:45] PARÁMETROS MR-140: lectura de solo lectura de grupos F0/F1. Fórmulas extraídas; validación en vehículo pendiente.
[23:12:45] TX MR-140 grupo F0: 82 11 F1 21 F0 95
[23:12:45] RX  82 11 F1 21 F0 95
[23:12:45] RX  83 F1 11 7F 21 31 56
[23:12:46] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:46] RX  81 11 F1 3E C1
[23:12:46] RX  81 F1 11 7E 01
[23:12:47] ECO TX grupo F0 detectado.
[23:12:47] RX MR-140 grupo F0: 83 F1 11 7F 21 31 56
[23:12:47] VALIDACIÓN grupo F0: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:47] MR-140 grupo F0: respuesta negativa KWP NRC=0x31.
[23:12:47] TX MR-140 grupo F1: 82 11 F1 21 F1 96
[23:12:47] RX  82 11 F1 21 F1 96
[23:12:47] RX  83 F1 11 7F 21 31 56
[23:12:48] ECO TX grupo F1 detectado.
[23:12:48] RX MR-140 grupo F1: 83 F1 11 7F 21 31 56
[23:12:48] VALIDACIÓN grupo F1: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0x56, esperado=0x56 (OK)
[23:12:48] MR-140 grupo F1: respuesta negativa KWP NRC=0x31.
[23:12:48] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:48] RX  81 11 F1 3E C1
[23:12:48] RX  81 F1 11 7E 01
[23:12:50] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:50] RX  81 11 F1 3E C1
[23:12:50] RX  81 F1 11 7E 01
[23:12:52] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:12:52] RX  81 11 F1 3E C1
[23:12:52] RX  81 F1 11 7E 01
[23:12:54] Puerto serie cerrado.
[23:40:25] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[23:40:25] Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.
[23:42:28] USB detectado: VID=1A86 PID=7523
[23:42:31] USB detectado: VID=1A86 PID=7523
[23:42:31] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[23:42:31] No se han enviado bytes a la ECU. Esperando datos del enlace.
[23:42:31] RX  00
[23:42:41] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[23:42:41] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[23:42:41] RX  00
[23:42:41] TX MR-140  81 11 F1 81 04
[23:42:41] RX  81 11 F1 81 04
[23:42:41] RX  83 F1 11 C1 EF 8F C4
[23:42:43] ECO TX detectado: 81 11 F1 81 04
[23:42:43] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[23:42:43] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[23:42:43] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[23:42:43] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[23:42:43] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[23:42:43] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[23:42:45] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:42:45] RX  81 11 F1 3E C1
[23:42:45] RX  81 F1 11 7E 01
[23:42:46] SONDEO KWP MR-140: inicio de IDs 0x21 (exploratorio; coche detenido).
[23:42:46] KWP BUS MR-140: TX 82 11 F1 21 01 A6
[23:42:46] RX  82 11 F1 21 01 A6
[23:42:46] KWP BUS MR-140: Eco TX confirmado
[23:42:46] RX  83 F1 11 7F 21 31 56
[23:42:46] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:46] KWP BUS MR-140: TX 82 11 F1 21 02 A7
[23:42:46] KWP BUS MR-140: Eco TX confirmado
[23:42:46] RX  82 11 F1 21 02 A7
[23:42:46] KWP BUS MR-140: RX 96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C checksum=OK
[23:42:46] RX  96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C
[23:42:46] KWP BUS MR-140: TX 82 11 F1 21 03 A8
[23:42:46] KWP BUS MR-140: Eco TX confirmado
[23:42:46] RX  82 11 F1 21 03 A8
[23:42:46] RX  86 F1 11 61 03 05 BF 9A 4C 96
[23:42:46] KWP BUS MR-140: RX 86 F1 11 61 03 05 BF 9A 4C 96 checksum=OK
[23:42:46] KWP BUS MR-140: TX 82 11 F1 21 04 A9
[23:42:46] KWP BUS MR-140: Eco TX confirmado
[23:42:46] RX  82 11 F1 21 04 A9
[23:42:46] RX  86 F1 11 61 04 00 BA 5B DA DC
[23:42:46] KWP BUS MR-140: RX 86 F1 11 61 04 00 BA 5B DA DC checksum=OK
[23:42:47] KWP BUS MR-140: TX 82 11 F1 21 11 B6
[23:42:47] KWP BUS MR-140: Eco TX confirmado
[23:42:47] RX  82 11 F1 21 11 B6
[23:42:47] RX  83 F1 11 7F 21 31 56
[23:42:47] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:47] KWP BUS MR-140: TX 82 11 F1 21 20 C5
[23:42:47] KWP BUS MR-140: Eco TX confirmado
[23:42:47] RX  82 11 F1 21 20 C5
[23:42:47] RX  83 F1 11 7F 21 31 56
[23:42:47] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:47] KWP BUS MR-140: TX 82 11 F1 21 F0 95
[23:42:47] RX  82 11 F1 21 F0 95
[23:42:47] KWP BUS MR-140: Eco TX confirmado
[23:42:47] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:47] RX  83 F1 11 7F 21 31 56
[23:42:47] KWP BUS MR-140: TX 82 11 F1 21 F1 96
[23:42:47] KWP BUS MR-140: Eco TX confirmado
[23:42:47] RX  82 11 F1 21 F1 96
[23:42:47] RX  83 F1 11 7F 21 31 56
[23:42:47] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:47] KWP BUS MR-140: TX 82 11 F1 21 FB A0
[23:42:47] KWP BUS MR-140: Eco TX confirmado
[23:42:47] RX  82 11 F1 21 FB A0
[23:42:47] RX  83 F1 11 7F 21 31 56
[23:42:47] KWP BUS MR-140: RX 83 F1 11 7F 21 31 56 checksum=OK
[23:42:47] ID 0x01: NRC 0x31
[23:42:47] ID 0x02: respuesta positiva; 20 bytes de datos · datos=66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF
[23:42:47] ID 0x03: respuesta positiva; 4 bytes de datos · datos=05 BF 9A 4C
[23:42:47] ID 0x04: respuesta positiva; 4 bytes de datos · datos=00 BA 5B DA
[23:42:47] ID 0x11: NRC 0x31
[23:42:47] ID 0x20: NRC 0x31
[23:42:47] ID 0xF0: NRC 0x31
[23:42:47] ID 0xF1: NRC 0x31
[23:42:47] ID 0xFB: NRC 0x31
[23:42:47] SONDEO KWP MR-140 finalizado. IDs sin respuesta no se consideran compatibles.
[23:42:47] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[23:42:49] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:42:50] RX  81 11 F1 3E C1
[23:42:50] RX  81 F1 11 7E 01
[23:42:51] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:42:52] RX  81 11 F1 3E C1
[23:42:52] RX  81 F1 11 7E 01
[23:42:53] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:42:53] RX  81 11 F1 3E C1
[23:42:54] RX  81 F1 11 7E 01
[23:42:55] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[23:42:55] RX  81 11 F1 3E C1
[23:42:56] RX  81 F1 11 7E 01
[23:42:57] Puerto serie cerrado.
[23:43:00] USB detectado: VID=1A86 PID=7523
[23:43:00] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[23:43:00] No se han enviado bytes a la ECU. Esperando datos del enlace.
[23:43:06] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[23:43:06] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[23:43:06] RX  00
[23:43:06] TX ZF 4HP16  81 18 F1 81 0B
[23:43:06] RX  81 18 F1 81 0B
[23:43:06] RX  83 F1 18 C1 EF 8F CB
[23:43:08] ECO TX detectado: 81 18 F1 81 0B
[23:43:08] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[23:43:08] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[23:43:08] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[23:43:08] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[23:43:08] TESTER PRESENT automático activado para ZF 4HP16: intervalo de 2 s mientras la sesión esté abierta.
[23:43:08] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[23:43:09] SONDEO KWP ZF 4HP16: inicio de IDs 0x21 (exploratorio; coche detenido).
[23:43:09] KWP BUS ZF 4HP16: TX 82 18 F1 21 01 AD
[23:43:09] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:09] RX  82 18 F1 21 01 AD
[23:43:09] RX  85 F1 18 61 01 05 05 00 FA
[23:43:09] KWP BUS ZF 4HP16: RX 85 F1 18 61 01 05 05 00 FA checksum=OK
[23:43:09] KWP BUS ZF 4HP16: TX 82 18 F1 21 02 AE
[23:43:09] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:09] RX  82 18 F1 21 02 AE
[23:43:09] RX  86 F1 18 61 02 72 20 00 47 CB
[23:43:09] KWP BUS ZF 4HP16: RX 86 F1 18 61 02 72 20 00 47 CB checksum=OK
[23:43:09] KWP BUS ZF 4HP16: TX 82 18 F1 21 03 AF
[23:43:09] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:09] RX  82 18 F1 21 03 AF
[23:43:09] RX  91 F1 18 61 03 00 00 00 00 00 00 00 00 00 00 FC FF 00 00 00 F9
[23:43:09] KWP BUS ZF 4HP16: RX 91 F1 18 61 03 00 00 00 00 00 00 00 00 00 00 FC FF 00 00 00 F9 checksum=OK
[23:43:09] KWP BUS ZF 4HP16: TX 82 18 F1 21 04 B0
[23:43:09] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:09] RX  82 18 F1 21 04 B0
[23:43:09] RX  93 F1 18 61 04 00 DC 05 DC 05 DC 05 DC 05 D9 05 E0 05 E2 05 D9 05 0D
[23:43:09] KWP BUS ZF 4HP16: RX 93 F1 18 61 04 00 DC 05 DC 05 DC 05 DC 05 D9 05 E0 05 E2 05 D9 05 0D checksum=OK
[23:43:09] KWP BUS ZF 4HP16: TX 82 18 F1 21 11 BD
[23:43:09] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:09] RX  82 18 F1 21 11 BD
[23:43:09] RX  97 F1 18 61 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11
[23:43:09] KWP BUS ZF 4HP16: RX 97 F1 18 61 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 checksum=OK
[23:43:10] KWP BUS ZF 4HP16: TX 82 18 F1 21 20 CC
[23:43:10] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:10] RX  82 18 F1 21 20 CC
[23:43:10] RX  83 F1 18 7F 21 12 3E
[23:43:10] KWP BUS ZF 4HP16: RX 83 F1 18 7F 21 12 3E checksum=OK
[23:43:10] KWP BUS ZF 4HP16: TX 82 18 F1 21 F0 9C
[23:43:10] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:10] RX  82 18 F1 21 F0 9C
[23:43:10] RX  83 F1 18 7F 21 22 4E
[23:43:10] KWP BUS ZF 4HP16: RX 83 F1 18 7F 21 22 4E checksum=OK
[23:43:10] KWP BUS ZF 4HP16: TX 82 18 F1 21 F1 9D
[23:43:10] RX  82 18 F1 21 F1 9D
[23:43:10] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:10] RX  83 F1 18 7F 21 12 3E
[23:43:10] KWP BUS ZF 4HP16: RX 83 F1 18 7F 21 12 3E checksum=OK
[23:43:10] KWP BUS ZF 4HP16: TX 82 18 F1 21 FB A7
[23:43:10] RX  82 18 F1 21 FB A7
[23:43:10] KWP BUS ZF 4HP16: Eco TX confirmado
[23:43:10] RX  83 F1 18 7F 21 12 3E
[23:43:10] KWP BUS ZF 4HP16: RX 83 F1 18 7F 21 12 3E checksum=OK
[23:43:10] ID 0x01: respuesta positiva; 3 bytes de datos · datos=05 05 00
[23:43:10] ID 0x02: respuesta positiva; 4 bytes de datos · datos=72 20 00 47
[23:43:10] ID 0x03: respuesta positiva; 15 bytes de datos · datos=00 00 00 00 00 00 00 00 00 00 FC FF 00 00 00
[23:43:10] ID 0x04: respuesta positiva; 17 bytes de datos · datos=00 DC 05 DC 05 DC 05 DC 05 D9 05 E0 05 E2 05 D9 05
[23:43:10] ID 0x11: respuesta positiva; 21 bytes de datos · datos=00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF
[23:43:10] ID 0x20: NRC 0x12
[23:43:10] ID 0xF0: NRC 0x22
[23:43:10] ID 0xF1: NRC 0x12
[23:43:10] ID 0xFB: NRC 0x12
[23:43:10] SONDEO KWP ZF 4HP16 finalizado. IDs sin respuesta no se consideran compatibles.
[23:43:10] TESTER PRESENT automático activado para ZF 4HP16: intervalo de 2 s mientras la sesión esté abierta.
[23:43:12] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[23:43:12] RX  81 18 F1 3E C8
[23:43:12] RX  81 F1 18 7E 08
[23:43:12] Puerto serie cerrado.
