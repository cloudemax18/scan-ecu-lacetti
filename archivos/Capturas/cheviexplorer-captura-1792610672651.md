[15:21:45] Aplicación iniciada. Conecta el KKL mediante USB OTG.
[15:21:45] KWP físico MR-140/ZF confirmado en capturas previas. Esta compilación añade el panel DriverIM MR-140 reconstruido desde Graf.pas; validar cada respuesta en el vehículo.
[15:21:53] USB detectado: VID=1A86 PID=7523
[15:21:59] USB detectado: VID=1A86 PID=7523
[15:21:59] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:21:59] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:21:59] RX  00
[15:22:47] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:22:47] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[15:22:48] RX  00
[15:22:48] TX MR-140  81 11 F1 81 04
[15:22:48] RX  81 11 F1 81 04
[15:22:48] RX  83 F1 11 C1 EF 8F C4
[15:22:49] ECO TX detectado: 81 11 F1 81 04
[15:22:49] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[15:22:49] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[15:22:49] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[15:22:49] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:22:49] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:22:49] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:22:51] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:22:51] RX  81 11 F1 3E C1
[15:22:51] RX  81 F1 11 7E 01
[15:22:52] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:22:52] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:22:52] RX  84 11 F1 19 DA FF 00 78
[15:22:52] RX  82 F1 11 59 00 DD
[15:22:53] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:22:53] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[15:22:53] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[15:22:53] LECTURA DTC MR-140: respuesta positiva 0x59.
[15:22:53] DTC: byte de control/estado recibido = 0x00.
[15:22:53] DATOS DTC RAW MR-140 (incluye SID): 59 00
[15:22:53] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[15:22:53] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:22:55] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:22:55] RX  81 11 F1 3E C1
[15:22:55] RX  81 F1 11 7E 01
[15:22:57] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:22:57] RX  81 11 F1 3E C1
[15:22:57] RX  81 F1 11 7E 01
[15:22:59] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:22:59] RX  81 11 F1 3E C1
[15:22:59] RX  81 F1 11 7E 01
[15:23:00] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:23:00] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:23:00] RX  84 11 F1 19 DA FF 00 78
[15:23:00] RX  82 F1 11 59 00 DD
[15:23:02] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:23:02] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[15:23:02] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[15:23:02] LECTURA DTC MR-140: respuesta positiva 0x59.
[15:23:02] DTC: byte de control/estado recibido = 0x00.
[15:23:02] DATOS DTC RAW MR-140 (incluye SID): 59 00
[15:23:02] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[15:23:02] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:23:04] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:23:04] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[15:23:04] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:23:04] RX  81 11 F1 3E C1
[15:23:04] RX  81 F1 11 7E 01
[15:23:04] RX  00
[15:23:04] TX MR-140  81 11 F1 81 04
[15:23:04] RX  81 11 F1 81 04
[15:23:04] RX  83 F1 11 C1 EF 8F C4
[15:23:06] ECO TX detectado: 81 11 F1 81 04
[15:23:06] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[15:23:06] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[15:23:06] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[15:23:06] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:23:06] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:23:06] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:23:06] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:23:06] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:23:06] RX  84 11 F1 19 DA FF 00 78
[15:23:06] RX  82 F1 11 59 00 DD
[15:23:08] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:23:08] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[15:23:08] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[15:23:08] LECTURA DTC MR-140: respuesta positiva 0x59.
[15:23:08] DTC: byte de control/estado recibido = 0x00.
[15:23:08] DATOS DTC RAW MR-140 (incluye SID): 59 00
[15:23:08] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[15:23:08] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:23:10] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:23:10] RX  81 11 F1 3E C1
[15:23:10] RX  81 F1 11 7E 01
[15:23:11] Solicitud de detener lectura en vivo/exploración.
[15:23:11] Puerto serie cerrado.
[15:23:15] Perfil ECU cambiado: vuelve a inicializar la ECU seleccionada antes de diagnosticar o probar actuadores.
[15:23:15] USB detectado: VID=1A86 PID=7523
[15:23:15] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:23:15] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:23:22] LECTURA DTC cancelada: inicializa primero ZF 4HP16 y confirma StartCommunication.
[15:23:24] INIT ZF 4HP16: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:23:24] AVISO INIT ZF 4HP16: el controlador no admite purgeHwBuffers(); se continúa.
[15:23:25] RX  00
[15:23:25] TX ZF 4HP16  81 18 F1 81 0B
[15:23:25] RX  81 18 F1 81 0B
[15:23:25] RX  83 F1 18 C1 EF 8F CB
[15:23:26] LECTURA DTC cancelada: inicializa primero ZF 4HP16 y confirma StartCommunication.
[15:23:26] ECO TX detectado: 81 18 F1 81 0B
[15:23:26] RX CANDIDATA ZF 4HP16: 83 F1 18 C1 EF 8F CB
[15:23:26] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x18, checksum recibido=0xCB, esperado=0xCB (OK)
[15:23:26] RESULTADO ZF 4HP16: trama con formato/dirección/checksum coherentes.
[15:23:26] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:23:26] TESTER PRESENT automático activado para ZF 4HP16: intervalo de 2 s mientras la sesión esté abierta.
[15:23:26] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:23:28] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:28] RX  81 18 F1 3E C8
[15:23:28] RX  81 F1 18 7E 08
[15:23:30] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:30] RX  81 18 F1 3E C8
[15:23:30] RX  81 F1 18 7E 08
[15:23:32] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:32] RX  81 18 F1 3E C8
[15:23:32] RX  81 F1 18 7E 08
[15:23:34] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:34] RX  81 18 F1 3E C8
[15:23:34] RX  81 F1 18 7E 08
[15:23:36] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:36] RX  81 18 F1 3E C8
[15:23:36] RX  81 F1 18 7E 08
[15:23:38] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:38] RX  81 18 F1 3E C8
[15:23:38] RX  81 F1 18 7E 08
[15:23:40] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:40] RX  81 18 F1 3E C8
[15:23:40] RX  81 F1 18 7E 08
[15:23:42] TX TESTER PRESENT automático ZF 4HP16  81 18 F1 3E C8
[15:23:42] RX  81 18 F1 3E C8
[15:23:42] RX  81 F1 18 7E 08
[15:23:42] Solicitud de detener lectura en vivo/exploración.
[15:23:42] Puerto serie cerrado.
[15:23:47] Perfil ECU cambiado: vuelve a inicializar la ECU seleccionada antes de diagnosticar o probar actuadores.
[15:23:49] USB detectado: VID=1A86 PID=7523
[15:23:49] Puerto abierto: Ch34xSerialDriver, 10400 baud, 8N1.
[15:23:49] No se han enviado bytes a la ECU. Esperando datos del enlace.
[15:23:53] INIT MR-140: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.
[15:23:53] AVISO INIT MR-140: el controlador no admite purgeHwBuffers(); se continúa.
[15:23:54] RX  00
[15:23:54] TX MR-140  81 11 F1 81 04
[15:23:54] RX  81 11 F1 81 04
[15:23:54] RX  83 F1 11 C1 EF 8F C4
[15:23:55] ECO TX detectado: 81 11 F1 81 04
[15:23:55] RX CANDIDATA MR-140: 83 F1 11 C1 EF 8F C4
[15:23:55] VALIDACIÓN DE TRAMA: formato=0x83, longitud=3, destino=0xF1, origen=0x11, checksum recibido=0xC4, esperado=0xC4 (OK)
[15:23:55] RESULTADO MR-140: trama con formato/dirección/checksum coherentes.
[15:23:55] KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=EF 8F.
[15:23:55] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:23:55] Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.
[15:23:57] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:23:57] RX  81 11 F1 3E C1
[15:23:57] RX  81 F1 11 7E 01
[15:23:58] LECTURA DTC MR-140: solicitud de solo lectura reconstruida de main.pas.
[15:23:58] TX DTC MR-140  84 11 F1 19 DA FF 00 78
[15:23:58] RX  84 11 F1 19 DA FF 00 78
[15:23:58] RX  82 F1 11 59 00 DD
[15:24:00] ECO TX DTC detectado: 84 11 F1 19 DA FF 00 78
[15:24:00] RX DTC CANDIDATA MR-140: 82 F1 11 59 00 DD
[15:24:00] VALIDACIÓN DTC: formato=0x82, longitud=2, destino=0xF1, origen=0x11, checksum recibido=0xDD, esperado=0xDD (OK)
[15:24:00] LECTURA DTC MR-140: respuesta positiva 0x59.
[15:24:00] DTC: byte de control/estado recibido = 0x00.
[15:24:00] DATOS DTC RAW MR-140 (incluye SID): 59 00
[15:24:00] DTC MR-140: sin averías (contador 0 confirmado por el parser Delphi).
[15:24:00] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:24:02] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:02] RX  81 11 F1 3E C1
[15:24:02] RX  81 F1 11 7E 01
[15:24:04] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:04] RX  81 11 F1 3E C1
[15:24:04] RX  81 F1 11 7E 01
[15:24:05] DATOS ECU MR-140: consulta de solo lectura para IDs con respuestas positivas previas: 0x02, 0x03, 0x04. Sin decodificación de campos.
[15:24:05] TX MR-140 ID 02: 82 11 F1 21 02 A7
[15:24:05] RX  82 11 F1 21 02 A7
[15:24:05] RX  96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C
[15:24:06] ECO TX MR-140 ID 02 detectado.
[15:24:06] RX MR-140 ID 02: 96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C
[15:24:06] VALIDACIÓN MR-140 ID 02: formato=0x96, longitud=22, destino=0xF1, origen=0x11, checksum recibido=0x7C, esperado=0x7C (OK)
[15:24:06] DATOS RAW MR-140 ID 02 (20 bytes): 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF
[15:24:07] TX MR-140 ID 03: 82 11 F1 21 03 A8
[15:24:07] RX  82 11 F1 21 03 A8
[15:24:07] RX  86 F1 11 61 03 05 BF 9A 4C 96
[15:24:07] ECO TX MR-140 ID 03 detectado.
[15:24:07] RX MR-140 ID 03: 86 F1 11 61 03 05 BF 9A 4C 96
[15:24:07] VALIDACIÓN MR-140 ID 03: formato=0x86, longitud=6, destino=0xF1, origen=0x11, checksum recibido=0x96, esperado=0x96 (OK)
[15:24:07] DATOS RAW MR-140 ID 03 (4 bytes): 05 BF 9A 4C
[15:24:08] TX MR-140 ID 04: 82 11 F1 21 04 A9
[15:24:08] RX  82 11 F1 21 04 A9
[15:24:08] RX  86 F1 11 61 04 00 BA 5B DA DC
[15:24:08] ECO TX MR-140 ID 04 detectado.
[15:24:08] RX MR-140 ID 04: 86 F1 11 61 04 00 BA 5B DA DC
[15:24:09] DATOS ECU MR-140 finalizados. Revisa RX/checksum; no se asignan unidades a bytes sin mapa validado.
[15:24:09] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:24:11] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:11] RX  81 11 F1 3E C1
[15:24:11] RX  81 F1 11 7E 01
[15:24:13] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:13] RX  81 11 F1 3E C1
[15:24:13] RX  81 F1 11 7E 01
[15:24:15] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:15] RX  81 11 F1 3E C1
[15:24:15] RX  81 F1 11 7E 01
[15:24:15] EN VIVO MR-140: sondeo periódico de IDs confirmados 0x02, 0x03, 0x04.
[15:24:15] RX  82 11 F1 21 02 A7
[15:24:15] RX  96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C
[15:24:16] RX  82 11 F1 21 03 A8
[15:24:16] RX  86 F1 11 61 03 05 BF 9A 4C 96
[15:24:17] RX  82 11 F1 21 04 A9
[15:24:17] RX  86 F1 11 61 04 00 BA 5B DA DC
[15:24:19] RX  82 11 F1 21 02 A7
[15:24:19] RX  96 F1 11 61 02 66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF 7C
[15:24:20] RX  82 11 F1 21 03 A8
[15:24:20] RX  86 F1 11 61 03 05 BF 9A 4C 96
[15:24:21] RX  82 11 F1 21 04 A9
[15:24:21] RX  86 F1 11 61 04 00 BA 5B DA DC
[15:24:23] Solicitud de detener lectura en vivo/exploración.
[15:24:23] TESTER PRESENT automático activado para MR-140: intervalo de 2 s mientras la sesión esté abierta.
[15:24:23] EN VIVO MR-140 detenido.
[15:24:25] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:25] RX  81 11 F1 3E C1
[15:24:25] RX  81 F1 11 7E 01
[15:24:27] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:27] RX  81 11 F1 3E C1
[15:24:27] RX  81 F1 11 7E 01
[15:24:29] TX TESTER PRESENT automático MR-140  81 11 F1 3E C1
[15:24:29] RX  81 11 F1 3E C1
[15:24:29] RX  81 F1 11 7E 01