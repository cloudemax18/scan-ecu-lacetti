# CheviExplorer — Bitácora maestra de continuidad e integración

**Última actualización:** 2026-10-21  
**Repositorio:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Rama de documentación:** docs/continuidad-integracion-2026-10-20  
**SHA base registrado:** 1dd53122ed0aab6d88d36f0ba84805e6788d4adc  
**Estado:** revisión estática de Claude v2 registrada; integración 0x2C pendiente.

> Propósito: permitir que cualquier persona o agente retome el proyecto aunque se pierda esta conversación o una sesión de otro agente. Actualizar fecha, evidencia, SHA y próximos pasos en cada cambio. Esta bitácora no convierte inferencias en hechos probados.

## 1. Cómo retomar el proyecto

1. Leer este archivo y opera/README_CONTINUIDAD.md.
2. Confirmar en GitHub el SHA real de main, ramas, PR y ejecuciones CI. No asumir que el SHA registrado sigue siendo el más reciente.
3. Leer los informes originales de los agentes como evidencia histórica, no como verdad vigente automática.
4. Revisar los cambios integrados y sus ejecuciones CI.
5. Cuando llegue el paquete final de Claude, comparar cada archivo con lo existente, detectar duplicados y verificar la evidencia antes de integrar.
6. Actualizar esta bitácora con fecha, SHA comprobado, cambios, resultados reales, riesgos y pendientes.
7. No afirmar pruebas físicas ni instalación de una nueva APK salvo evidencia directa del usuario.

## 2. Configuración y alcance

- Vehículo objetivo: Chevrolet Lacetti / Daewoo J200, 2008, motor 1.8 LDA.
- ECM: Delphi MR-140.
- Transmisión automática: ZF 4HP16.
- Adaptador previsto: KKL USB con CH340/CH341 mediante Android OTG.
- El usuario dispone de un teléfono Android, no de PC, y ya tiene una APK de CheviExplorer instalada.
- HV-240 debe permanecer bloqueada/no conectable hasta disponer de evidencia propia y perfil específico. No heredar el perfil MR-140.
- Separar siempre: confirmado en código, confirmado en EXE, fuente primaria verificada, captura RX real, prueba unitaria, CI, prueba con adaptador y prueba física en vehículo. Usar hipótesis o pendiente si no hay evidencia.

## 3. Estado de integración conocido

Cambios que constan como integrados en main en el registro de trabajo:

- PR #6: endurece el parser de IdProbe, comprobaciones de trama/checksum y manejo de NRC incompletos. SHA informado: b5e9ad06c5fa52f5003610aceaebb7de4cf8cbf1.
- PR #7: excluye los IDs dinámicos F0/F1 del barrido automático y candidatos hasta implementar y validar las definiciones 0x2C. SHA informado: 97cefb35233742d22e0f17a210702ba3d3d8768d.
- PR #8: corrige el selector de inyectores MR-140 y añade aserciones de tramas ON/OFF y checksum para los cuatro cilindros. SHA informado: bf2253a4c9acdc9981ab9077216cda013d09ab18.
- SHA de main registrado después de esos cambios: 8fdd627370e88acce253d774916b66e36e47b1c2. Volver a verificar antes de nuevos cambios.

### CI registrada
- Run #213: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39528264821
- Run #216: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39528625602
- Run #217: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39528671985
- Run #219: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39528854110

Los registros previos indican que pruebas unitarias, compilación debug y subida de artefacto finalizaron correctamente. Al retomar, inspeccionar de nuevo jobs y artefactos; no confiar en IDs de artefacto anotados en conversaciones sin verificarlos. CI no demuestra compatibilidad con adaptador ni comunicación física.

## 4. Decisiones técnicas que deben mantenerse

### 4.1 KWP, identificación y checksum
- KwpBus.kt rechaza checksums RX incorrectos; el parser de IdProbe añade defensa al interpretar respuestas.
- Se mejoró el tratamiento de NRC cortos como 7F y 7F 21 para no interpretar erróneamente un byte como NRC completo.
- El transporte aún puede agrupar timeout y checksum fallido como resultado nulo. Distinguirlos requiere cambiar el contrato de transporte y sus consumidores.
- Las tramas reconstruidas del EXE son análisis estático, no capturas de una ECU real.

### 4.2 IDs dinámicos F0/F1 y servicio 0x2C
- El análisis del EXE indica que se definen bloques dinámicos con 0x2C antes de ciertas lecturas 21 F0 / 21 F1.
- No consultar automáticamente esos IDs sin definir el bloque requerido, el perfil aplicable y la respuesta positiva esperada.
- Se han observado como expectativas por verificar NRC 7F 21 31 para solicitudes no admitidas en MR-140 y 7F 21 22 en ZF. No universalizar estas respuestas.
- PR #7 aplaza F0/F1 en el barrido. No reintroducirlos sin especificación, pruebas y revisión.

### 4.3 Actuadores y aprendizaje
- No habilitar actuadores solo porque haya una trama reconstruida en el EXE.
- No ejecutar inyectores, relés, bombas u otros actuadores sin identificar módulo, validar secuencia completa, precondiciones, duración máxima, cancelación, fallo de comunicación y recuperación segura.
- El EXE analizado contiene comandos de actuadores para MR-140. No se hallaron ramas equivalentes confirmadas para actuadores, reset o aprendizaje de acelerador de la ZF 4HP16.
- El aprendizaje de acelerador del EXE depende de lecturas F0 de MR-140 y condiciones del motor; incluye una secuencia con 30 2C 07 FF y el análisis detectó ausencia de timeout global. No activar hasta definir timeout, cancelación, recuperación y confirmar la secuencia.
- No se identificó una petición Security Access 0x27 en las ramas MR-140/ZF analizadas. Esto no demuestra que todas las funciones carezcan de requisitos de seguridad.
- No inventar procedimientos para ZF ni asumir el mismo pinout para todos los mercados.

### 4.4 Perfil de conexión
- Una respuesta positiva de StartCommunication no demuestra que el perfil completo esté inicializado.
- El registro de código indica que initializeSelectedEcu marca validatedStartProfile después de una respuesta positiva e inicia TesterPresent, pero no confirma que se hayan definido todos los bloques dinámicos necesarios.
- No etiquetar “ECU validada” si solo se ha probado el inicio de comunicación.

## 5. Inventario de informes y revisión por agente

### Claude — paquete v2 recibido; integración pendiente
Ya existen:
- opera/claud/CLAUDE_ACTUATOR_AND_ADAPTATION.md
- opera/claud/CLAUDE_EXE_FUNCTION_INVENTORY.md
- opera/claud/CLAUDE_KWP_SEQUENCES.json
- opera/claud/CLAUDE_PARAMETER_MAP.csv

Paquete v2 en `opera/claud/opera_claud_v2/`. Revisión estática anotada en §12. Las 11 verificaciones Python aparecen como OK en `tools/verify_run_log.txt`; JUnit y compilación no se ejecutaron según el propio informe. El parche 0001 añade definiciones pero no las conecta a `MainActivity`; el parche 0002 es redundante con el estado actual de main. No integrar sin cerrar los bloqueantes de §12.

### DeepSeek
Archivos:
- opera/deekseep/DEEPSEEK_BLOCKERS.md
- opera/deekseep/DEEPSEEK_INFORME_COMPLETO.md
- opera/deekseep/DEEPSEEK_TECHNICAL_REVIEW.md
- opera/deekseep/DEEPSEEK_TEST_MATRIX.csv
- opera/deekseep/deepseek_csv.csv

El informe completo mantiene como bloqueantes checksum de IdProbe y parser NRC; esos hallazgos son históricos y quedaron abordados por PR #6. Añadir estado actual sin borrar el diagnóstico original. La matriz marca resultados como Pendiente; son propuestas, no pruebas ejecutadas. Las filas de actuadores no autorizan ejecución y requieren puerta de seguridad. No se han confirmado pruebas físicas.

### Gemini
Archivos:
- opera/gemini/GEMINI_INFORME_COMPLETO.md
- opera/gemini/GEMINI_PRIMARY_SOURCES.md
- opera/gemini/GEMINI_SERVICE_PROCEDURES.md
- opera/gemini/GEMINI_UNRESOLVED_QUESTIONS.md

Hay preguntas útiles sobre PIDs de TCM, pinout por mercado y fuentes primarias. Las afirmaciones etiquetadas como OEM/directas deben tener documento identificable, edición, sección/página y relación exacta con vehículo, motor, ECU y mercado. No adoptar automáticamente el procedimiento de aprendizaje de ralentí ni secuencias genéricas como instrucciones verificadas. No convertir supuestos de pin 7/pin 12 ni de servicio 0x27 en hechos.

### Grok
Archivos:
- opera/grok/GROK_AUDIT_CHANGELOG.md
- opera/grok/GROK_COMPONENT_MATRIX.md
- opera/grok/GROK_INFORME_COMPLETO.md
- opera/grok/GROK_SCREEN_SPEC.md
- opera/grok/GROK_UI_SYSTEM.md
- opera/grok/mockups/ (HTML de referencia visual)

Es una entrega de diseño/documentación, no cambios Kotlin ni una APK funcional. Es útil la separación entre código, captura, prueba en dispositivo y pendiente, y la regla de HV-240 bloqueada. Verificar la UI real antes de implementar los mockups. Una consulta anterior devolvió 404 para opera/grok/README_MOCKUPS.md, por lo que su existencia no está confirmada en la revisión actual.

## 6. Matriz de estado de pruebas

| Categoría | Estado registrado | Alcance real |
|---|---|---|
| Unit tests de parser/protocolo | CI reportada como exitosa en runs #213/#216/#217/#219; revalidar | Funciones aisladas y regresiones cubiertas |
| Compilación APK debug | CI reportada como exitosa; revalidar run y artefacto | El proyecto compila en esa revisión |
| Instalación en teléfono | El usuario ya tenía una APK instalada; no implica que instalara la última | Instalación/arranque de una APK concreta |
| USB/OTG y CH340/CH341 | Pendiente de evidencia de esta revisión | Android detecta adaptador y app puede abrirlo |
| K-Line real con MR-140 | Pendiente de nuevos logs/capturas | TX/RX real, checksum y respuesta |
| Comunicación real con ZF 4HP16 | Pendiente | Perfil, pinout y respuestas reales |
| Actuadores/adaptación en vehículo | No ejecutar hasta completar puerta de seguridad | Procedimiento validado bajo condiciones controladas |

## 7. Prioridades

### P0 — Seguridad y regresiones
1. Mantener HV-240 bloqueada.
2. Mantener F0/F1 fuera del barrido automático mientras falte definición 0x2C.
3. Mantener actuadores y aprendizaje deshabilitados si no hay flujo completo validado.
4. No usar etiquetas “probado” sin evidencia física.

### P1 — Evidencia y protocolo
1. Revisar el paquete de Claude contra el inventario EXE y capturas existentes.
2. Actualizar el estado vigente en los informes DeepSeek/Gemini sin borrar la historia.
3. Verificar fuentes OEM con página/edición y variante exacta.
4. Evaluar si el transporte debe distinguir timeout, checksum inválido, trama inesperada y error de I/O.
5. Revisar que la pantalla de laboratorio no equipare inicio de comunicación con perfil plenamente validado.

### P2 — UX y entrega
1. Tratar los mockups Grok como referencia, no código implementado.
2. Preparar instrucciones Android-only para descargar artefacto, extraer ZIP e instalar APK.
3. Antes de desinstalar una versión existente, exportar logs necesarios; desinstalar puede borrar datos locales.
4. Registrar run, SHA, nombre de artefacto, fecha e instalación solo si está confirmado.

## 8. Prueba recomendada usando solo Android

1. Abrir el run de Actions que corresponde a la revisión deseada.
2. Verificar que SHA y job de compilación coinciden.
3. Descargar el ZIP del artefacto desde Artifacts; no usar uno de otro run.
4. Extraerlo desde Archivos/Files.
5. Instalar app-debug.apk. Si Android pide permiso para instalar desde Chrome/Files, autorizar solo si se confía en el origen.
6. Si hay conflicto de firma/versión, no desinstalar de inmediato; exportar registros primero. Desinstalar puede borrar datos.
7. Registrar versión, permisos OTG, detección del adaptador y mensajes exactos.
8. No ejecutar actuadores. Empezar con UI y comunicación de solo lectura cuando estén disponibles adaptador y vehículo.
9. Guardar captura/log TX/RX con fecha, ECU, estado de contacto/motor, adaptador y resultado. No publicar VIN ni datos personales innecesarios.

## 9. Reglas para agentes externos

Los agentes externos no tienen acceso al repositorio. Cada prompt debe:
- definir un rol único y no solapado;
- enumerar entregables existentes y sus rutas;
- pedir que continúen el trabajo actual y eviten duplicarlo;
- separar análisis estático, documentación, unit tests, CI, pruebas con adaptador y pruebas físicas;
- exigir rutas, evidencia, decisiones, riesgos y pendientes;
- prohibir afirmaciones falsas de ramas, PR, uploads o pruebas;
- exigir ZIP descargable preservando rutas de destino, archivos individuales si es posible y un informe Markdown completo;
- indicar que el usuario subirá los archivos manualmente y el asistente los revisará/integrará después.

## 10. Plantilla para cada nueva entrada de la bitácora

Añadir fecha y responsable; SHA base y rama comprobados; rutas y propósito de cambios; evidencia y enlaces a PR/CI; pruebas ejecutadas y resultados; pruebas pendientes; riesgos/decisiones; próximos pasos ordenados; y para paquetes de agentes, nombre, archivos, hash si existe, duplicados y decisión de integración.

## 11. Historial

### 2026-10-20 — revisión intermedia antes del paquete final de Claude
- Consultados en GitHub los informes de DeepSeek, Gemini y Grok y archivos de mockup.
- DeepSeek conserva dos bloqueantes históricos ya abordados por PR #6; conservar el registro original y anotar el estado vigente.
- Gemini: exigir referencias primarias precisas para procedimientos y afirmaciones OEM.
- Grok: especificaciones y mockups, no implementación Kotlin.
- Preparada esta bitácora para recuperación y continuidad.
- No se ejecutaron pruebas físicas en esta revisión.
- Paquete final de Claude pendiente.


## 12. 2026-10-21 — revisión estática del paquete Claude v2

**Base comprobada:** `main` en `1dd53122ed0aab6d88d36f0ba84805e6788d4adc` al iniciar esta revisión.  
**Paquete:** `opera/claud/opera_claud_v2/` (el changelog y el informe de bloques están en esta subcarpeta, no en la raíz de `opera/claud/`).  
**Alcance de esta revisión:** lectura de archivos GitHub y comparación estática con `KwpProtocol.kt`, `MainActivity.kt` y `DelphiActuatorProtocolTest.kt`. No se aplicaron parches, no se compiló, no se ejecutaron JUnit ni pruebas con APK/vehículo.

### 12.1 Archivos nuevos revisados

- `opera/claud/opera_claud_v2/CHANGELOG_CLAUDE.md`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
- `opera/claud/opera_claud_v2/CLAUDE_GAPS_AND_TESTS.md`
- `opera/claud/opera_claud_v2/CLAUDE_ACTUATOR_AND_ADAPTATION.md`
- `opera/claud/opera_claud_v2/CLAUDE_EXE_FUNCTION_INVENTORY.md`
- `opera/claud/opera_claud_v2/CLAUDE_KWP_SEQUENCES.json`
- `opera/claud/opera_claud_v2/CLAUDE_PARAMETER_MAP.csv`
- `opera/claud/opera_claud_v2/patches/0001-add-2c-dynamic-block-definitions-and-read-gate.patch`
- `opera/claud/opera_claud_v2/patches/0002-fix-mr140-injector-cylinder-byte.patch`
- `opera/claud/opera_claud_v2/tools/verify_kwp_sequences.py` y `verify_run_log.txt`

### 12.2 Hallazgos favorables

1. El informe identifica las tres definiciones estáticas reconstruidas del EXE: MR-140 F0 (163 bytes), MR-140 F1 (175 bytes) y ZF F0 (142 bytes), con checksum aditivo, LEN, entradas y respuesta positiva esperada `6C <bloque>`.
2. Distingue evidencia del EXE, capturas Android, datos `.cedat`, hipótesis y cuestiones sin resolver. Reconoce que no ha probado las definiciones en el vehículo.
3. El registro de 11 pruebas de Python muestra éxito para sus verificaciones estáticas. Es evidencia del resultado que el agente reportó en el log, no una ejecución independiente de esta revisión.
4. El análisis advierte que el JUnit añadido no fue ejecutado y que el parche 0001 no modifica `MainActivity`; por tanto no presenta la compuerta como ya activa en el flujo de la app.
5. El inventario y las preguntas abiertas conservan HV-240 como no identificado/no autorizado, y no inventan soporte de actuadores o adaptación para ZF.

### 12.3 Bloqueantes antes de integrar

**P0 — La compuerta todavía no está conectada al flujo real.**  
El parche 0001 añade `DynamicBlockDefinitions.kt` y su test, pero no modifica `MainActivity.kt`, el transporte ni el punto donde se solicitan `21 F0/F1`. La clase `Session` es una compuerta en memoria aislada; mientras ningún flujo de producción la use, no impide que la app real solicite esos IDs. Debe integrarse explícitamente en la sesión de comunicación, ejecutarse `2C F0` y, para MR-140, después `2C F1`, validar cada respuesta y permitir lecturas solo tras aceptación en esa misma sesión. En desconexión, reinicio, cambio de ECU o fallo debe resetearse el estado.

**P0 — La validación de respuesta propuesta no comprueba explícitamente el origen ECU.**  
`isAcceptedResponse()` valida checksum, payload `6C <bloque>` y bloque esperado, pero no verifica de forma visible la dirección origen en `frame.bytes`. El informe exige origen ECU como criterio. Antes de usarlo como compuerta, la validación debe comprobar dirección, formato/framing y checksum según el parser real, y rechazar respuestas residuales/intercaladas como `7E`.

**P1 — El parche 0002 es redundante respecto al main actual.**  
El `KwpProtocol.kt` de `main` ya usa `injectorIndex` sin restar uno solo en ON, y `DelphiActuatorProtocolTest.kt` ya comprueba ON/OFF para los cuatro cilindros con bytes 0–3. El parche 0002 parte de una versión anterior y al aplicarlo sobre el main actual puede no aplicar limpiamente o ser innecesario. No aplicarlo; comparar el historial si se necesita trazar su origen. La corrección ya está representada en el código actual, pero sigue siendo reconstrucción estática, no autorización para activar inyectores en el coche.

**P1 — La compuerta de lectura y las definiciones aún no son funcionalidad activa.**  
El informe de Claude confirma que el parche no toca `MainActivity`; por tanto no se debe afirmar que F0/F1 ya funcionan ni retirar el bloqueo del barrido. La secuencia candidata debe integrarse detrás de una máquina de estados explícita y sin TesterPresent intercalado durante la definición/lectura, conservando el bloqueo si hay timeout, NRC, checksum incorrecto o respuesta inesperada.

**P1 — ZF F0 tiene más incertidumbre que MR-140.**  
El bloque ZF y su LEN/checksum están reconstruidos estáticamente; no hay captura de una respuesta `2C F0` de ZF, ni del LID 0x06, ni validación de los 41 bytes de datos. Mantenerlo como no verificado; no presentar los parámetros 28–30 como decodificados/confirmados.

**P2 — Limpieza del paquete.**  
Hay archivos residuales de 1 byte llamados `g`, `ddd` y `s` en carpetas del paquete, además de un `g` en la carpeta `opera_claud_v2`. No afectan al protocolo pero deben identificarse o eliminarse en una limpieza documental revisada, sin borrar archivos a ciegas.

### 12.4 Decisión de integración

- **No aplicar todavía el parche 0001.** Primero diseñar una integración pequeña que conecte las definiciones a la transacción real, añada comprobación de dirección de origen y haga obligatoria la compuerta para cualquier lectura F0/F1.
- **No aplicar el parche 0002** porque el código y los tests actuales ya contienen esa corrección.
- Mantener el barrido automático F0/F1 bloqueado hasta que la integración pase revisión y CI.
- No habilitar actuadores ni adaptación de acelerador; no realizar pruebas físicas como parte de esta revisión.
- Antes de integrar, ejecutar en CI `./gradlew testDebugUnitTest` y `./gradlew assembleDebug`; revisar que no haya una carrera con TesterPresent y que el estado aceptado se borre en cada nueva sesión.

### 12.5 Próximos pasos

1. Diseñar y revisar la integración de `DynamicBlockDefinitions` con la transacción serial real y el estado de sesión; no modificar la UI de actuadores.
2. Añadir tests de dirección origen correcta/incorrecta, NRC `7F 2C xx`, checksum inválido, respuesta `7E` inesperada, timeout, fallo de F1 después de F0 y reset en desconexión/cambio de ECU.
3. Ejecutar CI con el código integrado; solo entonces considerar una prueba de solo lectura con adaptador y contacto ON, motor parado, capturando TX/RX íntegro.
4. Tras esa revisión, añadir la decisión y los SHA/run concretos aquí y en el índice de continuidad.



## 13. 2026-10-21 — plan de integración segura de 0x2C y nueva ronda multiagente

**SHA base comprobado:** `e0d3ac0dabbc60325c296bb7a5094436ac27df61` (main, consultado antes de abrir la rama documental).  
**Rama documental:** `docs/continuidad-prompts-2026-10-21`.  
**Tipo de cambio en esta rama:** documentación y prompts únicamente; no cambia código de producción ni habilita comandos KWP.

### 13.1 Decisión vigente

El paquete Claude v2 es una fuente de reconstrucción estática útil, pero el parche `0001-add-2c-dynamic-block-definitions-and-read-gate.patch` no está listo para aplicarse directamente: define una compuerta aislada que no está conectada al flujo real de `MainActivity.kt`; su aceptación no valida explícitamente el origen ECU en la forma requerida. El parche `0002-fix-mr140-injector-cylinder-byte.patch` es redundante frente al código y pruebas que ya están en main.

**No aplicar ninguno de los parches automáticamente.** La siguiente iteración de código debe producir una propuesta integrada pequeña y revisable, seguida de auditoría independiente y CI. No mezclar UI, actuadores ni adaptación de acelerador en esta iteración.

### 13.2 Requisitos de implementación para la próxima iteración

1. Implementar un estado de sesión real y de un solo propietario para la comunicación KWP; no crear una segunda máquina de estados que pueda divergir del transporte.
2. Asegurar que las solicitudes y respuestas se serialicen: ninguna respuesta de TesterPresent, barrido u otra consulta puede ser consumida como respuesta a la petición 0x2C. Revisar la condición de carrera ya vista en capturas, donde una respuesta `7E` de TesterPresent puede intercalarse con otra transacción.
3. Para MR-140, secuencia propuesta: inicio de comunicación aceptado → definición `2C F0` → validación de respuesta positiva `6C F0` → definición `2C F1` → validación `6C F1` → habilitar solo las lecturas dinámicas correspondientes en esa sesión. Si el diseño del EXE justifica una dependencia distinta, documentarla con evidencia y no asumirla.
4. No asumir que la definición ZF F0 tiene la misma confianza que MR-140: no hay captura física de aceptación `2C F0` de ZF. Mantener ZF F0 bloqueado en producción hasta decisión explícita basada en evidencia.
5. Validar cada respuesta con el parser real: trama completa, dirección destino del tester, dirección origen ECU esperada para el perfil, checksum, servicio positivo y bloque exacto. Rechazar respuesta vieja, de otra ECU, inesperada, truncada, NRC o checksum incorrecto. No tratar `7E` como `6C`.
6. La compuerta debe fallar cerrada. Resetearla en desconexión, reconexión, reinicio de sesión, cambio de ECU, pérdida de sincronización, timeout, error I/O, respuesta inválida o fallo de cualquiera de las definiciones. No reutilizar estado de una sesión anterior.
7. El alcance de esta fase es exclusivamente lectura y definición de bloques. No añadir comandos de actuador, `0x30`, aprendizaje de acelerador, escritura, borrado DTC ni soporte HV-240.
8. Agregar pruebas deterministas para: origen correcto/incorrecto; destino incorrecto; checksum inválido; respuesta positiva correcta; bloque equivocado; NRC `7F 2C xx`; timeout; trama truncada; respuesta residual `7E`; F0 aceptado y F1 rechazado; reset al cambiar/desconectar ECU; lecturas F0/F1 bloqueadas antes de aceptación.
9. No reducir ni relajar las pruebas existentes de `IdProbe`, inyectores o KWP. No duplicar la corrección de inyectores del parche 0002.
10. Antes de proponer merge, ejecutar CI disponible y revisar el SHA exacto probado. Registrar por separado pruebas unitarias, compilación APK debug y artefactos. No llamar a CI “prueba física”.

### 13.3 Puertas de aceptación

- **Gate A — revisión del parche:** cambios acotados, diff completo, rutas, invariantes de seguridad y cobertura de casos negativos.
- **Gate B — auditoría independiente:** DeepSeek revisa el diff o, si no está disponible, la especificación; reporta defectos y no modifica el código.
- **Gate C — CI:** pruebas unitarias y `assembleDebug` exitosos sobre el mismo commit de la propuesta. Si CI no se ejecuta, declararlo explícitamente.
- **Gate D — revisión documental:** bitácora e índice enlazan PR, SHA, CI y pendientes. No afirmar que se integró a main hasta verificar merge.
- **Gate E — vehículo:** fuera de esta iteración. Solo considerar una prueba de lectura de bajo riesgo cuando la integración esté revisada y el usuario disponga del adaptador; registrar TX/RX completo y condiciones de contacto/motor. No hacer pruebas de actuadores.

### 13.4 Próximos entregables externos

- Claude: propuesta de implementación de producción para compuerta 0x2C y transacciones serializadas, con patch aplicable al main actual; no ejecutar ni afirmar compilación si no dispone del entorno.
- DeepSeek: matriz de amenazas/casos de prueba y revisión crítica independiente; no reescribir código ni repetir la tarea de Claude.
- Gemini: investigación de fuentes primarias/documentación técnica para servicio 0x2C, definiciones de bloques y diferencias por ECU/vehículo; no inferir validación física de código EXE.
- Grok: revisión de UX/estados de bloqueo y advertencias para una fase futura; no tocar Kotlin ni presentar mockups como implementación.
- ChatGPT/integración: comparar los paquetes recibidos con main, resolver discrepancias, implementar/revisar en rama y PR, verificar CI y actualizar bitácora. Los agentes externos no tienen acceso al repositorio; el usuario descarga y sube manualmente los paquetes.

### 13.5 Estado de ejecución

Al redactar esta entrada, solo se ha preparado el plan y los prompts. No se han aplicado cambios de código 0x2C, no se ha compilado APK por esta tarea, no se han ejecutado JUnit por esta tarea y no se han realizado pruebas con adaptador ni vehículo.


## 14. 2026-10-21 — captura KWP MR-140/ZF y análisis

**Archivo fuente incorporado:** `archivos/Capturas/cheviexplorer-captura-1792610672651.md`.  
**Análisis:** `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.  
**Tipo de evidencia:** registro de la aplicación aportado por el usuario; no es un volcado independiente de analizador K-Line.

### Observaciones documentadas
- El log reporta adaptador USB VID `1A86` / PID `7523`, controlador `Ch34xSerialDriver`, 10400 baud, 8N1.
- MR-140: StartCommunication candidata `83 F1 11 C1 EF 8F C4`, lectura DTC con respuesta `59 00), y respuestas positivas `61 02`, `61 03`, `61 04`; el validador de la app informa checksums coincidentes.
- ZF 4HP16: StartCommunication candidata `83 F1 18 C1 EF 8F CB) y respuestas `7E 08) al TesterPresent; esta captura no demuestra lectura DTC ni datos de ZF.
- El TesterPresent automático se ejecuta cada 2 s y aparece cerca de otras operaciones. Esto no prueba por sí solo una respuesta mal asociada, pero exige serializar transacciones y evitar respuestas residuales/intercaladas.
- Los bytes de IDs `02`–`04` siguen sin decodificación/unidades validadas. La interpretación de contador DTC cero es la del parser de la app y no equivale a un certificado de ausencia de fallos en todo el vehículo.
- El registro contiene RX `00) y aviso de que `purgeHwBuffers()` no está disponible; revisar limpieza de buffer y límites de sesión.

### Decisiones
1. Usar esta captura como evidencia de protocolo reportada por la app, no como fuente OEM ni prueba independiente del bus.
2. Priorizar transacciones serializadas, asociación estricta RX↔solicitud y reinicio del estado al cambiar perfil/desconectar.
3. Mantener `0x2C), actuadores, adaptación y HV-240 bloqueados hasta sus respectivas puertas de validación.
4. No se ejecutaron nuevas pruebas JUnit/Gradle/CI ni pruebas físicas por la incorporación de esta captura.


## 15. Revisión de la entrega Claude v3 (2026-10-22)

### Estado del repositorio observado
- Commit de subida observado en `main`: `e593e23068b4046919a5775e24f7bb4291ce28bb`, mensaje `Add files via upload`.
- La ejecución Actions asociada `#254` estaba **en curso** al momento de la revisión: https://github.com/cloudemax18/scan-ecu-lacetti/actions/runs/39728318911. No registrar éxito hasta revisar el resultado final.
- Entrega nueva: `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`, `opera/claud/CHANGELOG_CLAUDE_V3.md`, `opera/claud/CLAUDE_2C_INTEGRATION_v3.zip` y fuentes bajo `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/`.
- La propia propuesta declara explícitamente que no pudo contrastar el código actual, no produjo un parche de integración en `MainActivity.kt`/`KwpBus.kt`, no ejecutó Gradle/JUnit y no subió cambios. Las seis pruebas citadas son del modelo Python, no Kotlin.
- No se debe describir esta entrega como integración terminada: es una propuesta de componentes aislados.

### Revisión técnica de la propuesta
1. `DynamicBlockDefinitionRunner.kt`, `DynamicBlockGate.kt`, `DynamicBlockResponseValidator.kt` y `SerialTransactionOwner.kt` están en el directorio de entrega del agente; no están conectados al flujo de producción por el mero hecho de estar subidos como archivos de documentación.
2. Los componentes importan `com.cheviexplorer.android.DynamicBlockDefinitions`. Antes de integrar hay que confirmar que la definición existe en el código productivo actual. En la revisión, no se encontró en `app/src/main/java/com/cheviexplorer/android/DynamicBlockDefinitions.kt`; el runner depende del parche v2 0001, que no se debe aplicar a ciegas.
3. El validador espera por defecto eco TX incluido en RX. Debe adaptarse al contrato real de transporte: `KwpBus.transaccion()` puede consumir el eco y devolver solo la respuesta. Elegir un único contrato documentado y probar ambos escenarios relevantes; no rechazar una respuesta válida por discrepancia de capas.
4. `SerialTransactionOwner` es una clase nueva, no una garantía de serialización mientras `MainActivity`, `KwpBus`, TesterPresent, inicialización y escaneos sigan accediendo al puerto por rutas distintas. Todas las operaciones TX/RX deben pasar por un único propietario compartido.
5. El gate debe quedar ligado al ciclo de vida real de sesión y reiniciarse en desconexión, reconexión, cambio de perfil, reinicio, timeout, error I/O y respuesta inválida. Una StartCommunication positiva no basta para declarar listos F0/F1.
6. Mantener F0/F1 fuera del barrido automático. Para MR-140, no permitir lecturas hasta aceptar cada definición de la sesión actual. Mantener ZF F0 bloqueado por defecto hasta evidencia específica de aceptación real. No habilitar actuadores, aprendizaje, escritura ni HV-240.

### Estado de pruebas y evidencia
- El archivo `KwpLaboratoryPlan.kt` mantiene F0/F1 excluidos de los rangos automáticos; conservar esta protección.
- La captura Android incorporada en `archivos/Capturas/` sugiere revisar la asociación RX↔TX y TesterPresent concurrente, pero no demuestra por sí sola una carrera ni valida 0x2C.
- No se ejecutaron nuevas pruebas Kotlin/Gradle ni pruebas físicas durante esta revisión. La CI #254 estaba en curso al consultar.
- Identificar antes de limpiar cualquier archivo diminuto/extraño en el paquete de Claude; no borrar a ciegas.

### Próxima decisión
No aplicar el parche 0003 aisladamente ni aplicar 0001/0002 de forma automática. Solicitar una versión integrada contra los archivos actuales, luego revisión independiente y CI. El nuevo paquete de prompts es `PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-22.md`. El usuario dispone solo de Android; los agentes externos entregan ZIP e informe, y la integración/validación del repositorio debe ser verificable por separado.
