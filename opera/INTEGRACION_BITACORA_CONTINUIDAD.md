# CheviExplorer — Bitácora maestra de continuidad e integración

**Última actualización:** 2026-10-20  
**Repositorio:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Rama de documentación:** docs/continuidad-integracion-2026-10-20  
**SHA base registrado:** 8fdd627370e88acce253d774916b66e36e47b1c2  
**Estado:** revisión documental intermedia; paquete final de Claude pendiente.

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

### Claude — paquete final pendiente
Ya existen:
- opera/claud/CLAUDE_ACTUATOR_AND_ADAPTATION.md
- opera/claud/CLAUDE_EXE_FUNCTION_INVENTORY.md
- opera/claud/CLAUDE_KWP_SEQUENCES.json
- opera/claud/CLAUDE_PARAMETER_MAP.csv

Cuando llegue el paquete: verificar lista y estructura ZIP; comparar archivos para detectar duplicados; comprobar procedencia, función/offset EXE, TX/RX, longitud y checksum; separar reconstrucción estática de captura real; actualizar esta bitácora sin sobrescribir el original de forma silenciosa.

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
