# CheviExplorer — Prompts de continuación multiagente
**Fecha:** 2026-10-21  
**Repositorio de referencia:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Main base comprobado antes de preparar estos prompts:** `e0d3ac0dabbc60325c296bb7a5094436ac27df61`  
**Rama de documentación de estos prompts:** `docs/continuidad-prompts-2026-10-21`

## Instrucciones comunes para todos los agentes

Este es un proyecto Android/KWP para Chevrolet Lacetti / Daewoo J200 2008, motor 1.8 LDA, ECM Delphi MR-140 y transmisión ZF 4HP16. Adaptador previsto: KKL USB CH340/CH341 por Android OTG. El usuario dispone solo de un teléfono Android y ya tiene instalada una APK antigua; no dispone de PC.

Los agentes externos NO tienen acceso al repositorio y NO pueden subir cambios, crear ramas/PR ni afirmar que lo hicieron. Trabajen únicamente con los archivos o enlaces que el usuario les proporcione. El usuario descargará los entregables y los subirá manualmente; ChatGPT revisará e integrará.

En cada respuesta separen explícitamente: (1) análisis estático, (2) pruebas unitarias realmente ejecutadas, (3) CI realmente observada, (4) prueba con adaptador, (5) prueba física en vehículo. Si no tienen acceso a un entorno para ejecutar algo, digan “no ejecutado”. Nunca fabriquen logs, capturas, SHA, resultados, fuentes OEM ni compatibilidad ECU.

No habilitar actuadores, aprendizaje de acelerador, escritura/borrado, ni HV-240. No añadir F0/F1 al barrido automático. El foco de esta ronda es una propuesta de integración segura del servicio 0x2C y la revisión independiente de esa propuesta.

Cada agente debe entregar:
1. Un informe Markdown completo, nombrado según el prompt.
2. Todos los archivos fuente/diff/test/documentación completos, no solo fragmentos.
3. Un ZIP descargable con la estructura de rutas destino preservada y una lista de contenido.
4. Una lista de archivos nuevos/modificados, supuestos, evidencia, riesgos, preguntas abiertas y pasos manuales de integración.
5. Un resumen breve que el usuario pueda pegar en este chat.
6. No incluir archivos basura vacíos ni ficheros de 1 byte sin explicar su propósito. No sobrescribir los informes históricos: usar un archivo nuevo de addendum/versionado.

---

## PROMPT A — CLAUDE: propuesta de implementación de la compuerta 0x2C en producción

Actúa como ingeniero Kotlin/Android responsable de proponer un parche pequeño, revisable y seguro para integrar definiciones dinámicas KWP 0x2C en el flujo real de CheviExplorer. Continúa tu trabajo previo; no repitas la ingeniería inversa desde cero.

### Archivos existentes que debes leer y conservar como referencia
- `opera/claud/opera_claud_v2/CHANGELOG_CLAUDE.md`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
- `opera/claud/opera_claud_v2/CLAUDE_GAPS_AND_TESTS.md`
- `opera/claud/opera_claud_v2/CLAUDE_KWP_SEQUENCES.json`
- `opera/claud/opera_claud_v2/patches/0001-add-2c-dynamic-block-definitions-and-read-gate.patch`
- `opera/claud/opera_claud_v2/patches/0002-fix-mr140-injector-cylinder-byte.patch`
- Código actual que debe proporcionarte el usuario: `app/src/main/java/com/cheviexplorer/android/MainActivity.kt`, `KwpProtocol.kt`, `kwp/KwpBus.kt`, `kwp/IdProbe.kt`
- Tests actuales: `app/src/test/java/com/cheviexplorer/android/kwp/IdProbeTest.kt`, `KwpLaboratoryPlanTest.kt`, `DelphiActuatorProtocolTest.kt`

### Objetivo
Producir una propuesta aplicable al main actual para integrar una compuerta 0x2C real, en el flujo de producción, con transacciones serializadas y validación estricta. No basta con añadir una clase aislada que nadie use.

### Requisitos
1. Compara los parches v2 con el código actual; no asumas que se aplican limpiamente ni uses un snapshot antiguo como base.
2. No repitas el parche de inyectores 0002: la corrección y las pruebas de ON/OFF para cilindros 0–3 ya están en main según la revisión previa.
3. Para MR-140, propone el orden de definición basado en los artefactos disponibles: 2C F0 y después 2C F1, con aceptación positiva individual antes de permitir la lectura dinámica correspondiente. Si la evidencia sugiere otro orden, justifícalo con referencias exactas y no lo inventes.
4. Validar trama completa, checksum, destino del tester, origen esperado de ECU, servicio positivo 0x6C y bloque correcto. Rechazar NRC, checksum malo, origen/destino incorrecto, trama truncada, respuesta residual/intercalada como 0x7E y respuesta de otra solicitud.
5. Asegurar un único propietario de las transacciones seriales. Evitar que TesterPresent, barrido o lecturas concurrentes consuman respuestas de otra solicitud. Documentar el cambio mínimo que evita la condición de carrera.
6. Resetear estado de compuerta en desconexión, reconexión, reinicio de sesión, cambio de perfil ECU, timeout, error I/O, respuesta inválida y fallo de cualquier definición. Fallar cerrado.
7. Mantener F0/F1 fuera del barrido automático hasta que cada bloque relevante se haya definido y validado en la sesión actual.
8. No activar ZF F0 en producción en esta iteración: su definición no tiene captura física de aceptación; deja la integración ZF explícitamente bloqueada o detrás de una política no habilitada por defecto.
9. Añadir pruebas unitarias negativas y positivas para todos los casos de los puntos 4–7. No reducir las pruebas existentes.
10. No modificar UI para actuadores, no enviar comandos 0x30, no habilitar adaptación, no añadir soporte HV-240.
11. Entrega un patch completo o conjunto de archivos con rutas destino y notas de aplicación. Si no puedes ejecutar Gradle, indica que no está ejecutado; no simules salida de CI.

### Informe obligatorio
Crear `CLAUDE_2C_INTEGRATION_PROPOSAL.md` con diseño, flujo de estado, invariantes, archivos tocados, diff, pruebas propuestas/ejecutadas, riesgos y decisiones pendientes. Añadir un changelog nuevo; no reescribir el informe v2 original.

Entrega también un ZIP descargable con el patch, tests, informe y rutas organizadas. No afirmes haber subido nada a GitHub.

---

## PROMPT B — DEEPSEEK: auditoría independiente y matriz de amenazas/pruebas (sin implementar código)

Actúa como auditor independiente de protocolo KWP, concurrencia y seguridad funcional. No escribas un parche de producción y no repitas la tarea de Claude. Tu función es definir cómo demostrar que la propuesta es segura y detectar huecos antes de integrar.

### Material que debes revisar
- `opera/deekseep/DEEPSEEK_BLOCKERS.md`
- `opera/deekseep/DEEPSEEK_TECHNICAL_REVIEW.md`
- `opera/deekseep/DEEPSEEK_TEST_MATRIX.csv`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
- `opera/claud/opera_claud_v2/CLAUDE_KWP_SEQUENCES.json`
- `opera/claud/opera_claud_v2/patches/0001-add-2c-dynamic-block-definitions-and-read-gate.patch`
- La propuesta nueva de Claude `CLAUDE_2C_INTEGRATION_PROPOSAL.md` y su diff, que el usuario proporcionará cuando estén listos.

### Tarea
Crear una auditoría independiente con foco en:
- carreras entre TesterPresent y peticiones diagnósticas;
- asociación de cada RX con una sola petición pendiente;
- checksum, framing, dirección origen/destino, SID y bloque;
- NRC, timeout, respuestas tardías, duplicadas, concatenadas o truncadas;
- cambio de ECU, desconexión, reconexión y reinicio de sesión;
- definición F0 aceptada pero F1 rechazada;
- lecturas F0/F1 antes de gate completo o con gate de una sesión anterior;
- perfiles MR-140 frente a ZF 4HP16 y prohibición de heredar perfil a HV-240;
- regresiones sobre IdProbe, DTC y TesterPresent.

Construye una matriz con ID de caso, riesgo, precondiciones, TX/RX simulado, resultado esperado, prueba unitaria que debería cubrirlo y criterio de aceptación. Clasifica hallazgos como bloqueante/alto/medio/bajo y explica qué evidencia respalda cada uno. No llames “vulnerabilidad confirmada” a una hipótesis sin demostrar.

### Límites
No modificar Kotlin ni proponer cambios visuales. No afirmar que corriste JUnit/Gradle ni CI si no ocurrió. No recomendar pruebas físicas de actuadores. Mantener las operaciones del vehículo fuera del alcance.

### Entregables
- `DEEPSEEK_AUDITORIA_2C_INTEGRACION.md`
- `DEEPSEEK_MATRIZ_2C_TESTS.csv`
- `DEEPSEEK_BLOCKERS_ADDENDUM_2026-10-21.md`

ZIP descargable con esos tres archivos y README de contenido. No reescribir informes anteriores ni afirmar que subiste cambios al repositorio.

---

## PROMPT C — GEMINI: fuentes primarias y evidencia documental (sin tocar código)

Actúa como investigador técnico de documentación automotriz. Tu tarea es localizar y evaluar fuentes primarias para el servicio KWP 0x2C (DynamicallyDefineDataIdentifier), las definiciones de bloques y su aplicabilidad real a Delphi MR-140 y ZF 4HP16 en Chevrolet Lacetti/Daewoo J200 2008 1.8 LDA.

### Continúa desde estos archivos
- `opera/gemini/GEMINI_INFORME_COMPLETO.md`
- `opera/gemini/GEMINI_PRIMARY_SOURCES.md`
- `opera/gemini/GEMINI_SERVICE_PROCEDURES.md`
- `opera/gemini/GEMINI_UNRESOLVED_QUESTIONS.md`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`

### Preguntas concretas
1. ¿Qué estándar/documento define el formato genérico de 0x2C y qué campos son estándar frente a específicos del fabricante?
2. ¿Existe una fuente identificable que relacione las definiciones concretas MR-140 F0/F1 y ZF F0 con esta variante de ECU/vehículo? Cita edición, sección/página, URL y cita corta o resumen verificable.
3. ¿Qué evidencia permite afirmar que una definición es temporal/de sesión y qué se sabe —o no se sabe— sobre persistencia tras desconectar?
4. ¿Hay diferencias documentadas entre perfiles, años, mercados, hardware/firmware o variantes de ECU?
5. ¿Qué evidencia OEM valida direcciones de destino, origen, pinout y velocidad? No inferirlo de un pinout genérico.
6. Clasifica cada fuente como estándar, manual OEM, documentación de fabricante, código EXE analizado, repositorio comunitario o hipótesis. Distingue fuente primaria de fuente secundaria.
7. Si no encuentras una fuente fiable, escribe “no encontrado” y define qué documento o captura resolvería la duda.

### Restricciones
No implementar ni editar Kotlin. No convertir el contenido del EXE en fuente OEM. No declarar que el vehículo acepta 0x2C sin captura RX real. No recomendar actuadores/adaptaciones. No inventar títulos, números de página, URLs ni citas.

### Entregables
- `GEMINI_2C_PRIMARY_EVIDENCE.md`
- `GEMINI_2C_SOURCE_MATRIX.csv`
- `GEMINI_2C_OPEN_QUESTIONS_ADDENDUM.md`

Incluye enlaces completos, fecha de consulta y limitaciones. ZIP descargable con rutas de destino y README. No reemplazar los informes históricos ni afirmar subidas al repo.

---

## PROMPT D — GROK: revisión de UX, estados bloqueados y guía Android-only (sin código Kotlin)

Actúa como especialista UX/UI de herramientas de diagnóstico automotriz. Continúa los artefactos de Grok; no rediseñes toda la aplicación y no confundas mockup con funcionalidad implementada.

### Material existente
- `opera/grok/GROK_INFORME_COMPLETO.md`
- `opera/grok/GROK_AUDIT_CHANGELOG.md`
- `opera/grok/GROK_COMPONENT_MATRIX.md`
- `opera/grok/GROK_SCREEN_SPEC.md`
- `opera/grok/GROK_UI_SYSTEM.md`
- `opera/grok/mockups/`
- Estado técnico: `opera/INTEGRACION_BITACORA_CONTINUIDAD.md`

### Tarea
1. Auditar cómo debería comunicar la app que “inicio de comunicación aceptado” no significa “perfil/lecturas dinámicas validados”.
2. Proponer etiquetas de estado y mensajes de error claros para: desconectado, USB sin permiso, adaptador detectado, sesión iniciada, definición 0x2C pendiente, bloque definido, respuesta inválida, timeout, pérdida de sesión y perfil no compatible.
3. Diseñar una revisión de solo lectura, sin botones de actuadores ni aprendizaje. No pedir que se quite la protección actual.
4. Preparar instrucciones aptas para un usuario con solo teléfono Android: localizar el artefacto correcto de GitHub Actions, comprobar el run/SHA, descargar/extrair APK, instalar sin borrar la app antigua antes de exportar logs, y capturar mensajes TX/RX.
5. Señalar accesibilidad: contraste, tamaños, errores legibles, no depender solo del color, y controles táctiles seguros.
6. Marcar claramente qué es propuesta de UX y qué existe realmente en el código actual. No inventar una captura de pantalla ni afirmar que el diseño está implementado.

### Restricciones
No editar Kotlin, no generar una APK, no habilitar comandos de diagnóstico adicionales ni actuadores. No presentar mockups como producción. Evitar alarmismo y evitar instrucciones que impliquen probar el coche durante la marcha.

### Entregables
- `GROK_2C_UX_STATES.md`
- `GROK_ANDROID_ONLY_TEST_GUIDE.md`
- `GROK_UX_AUDIT_ADDENDUM_2026-10-21.md`

ZIP descargable con documentos y mockups nuevos si hacen falta, con rutas de destino y README. No sobrescribir informes originales ni afirmar que subiste archivos.

---

## PROMPT E — CHATGPT / INTEGRADOR: revisión, pruebas y entrega tras recibir paquetes

Actúa como responsable de integración y control de calidad del repositorio CheviExplorer. Usa el repositorio real con las herramientas GitHub disponibles; no delegues en los agentes acciones de repositorio que no pueden ejecutar.

### Estado base y decisiones
- Repositorio: https://github.com/cloudemax18/scan-ecu-lacetti
- Main SHA base para esta ronda: `e0d3ac0dabbc60325c296bb7a5094436ac27df61` (verificar nuevamente antes de tocar código).
- La documentación de la ronda está en `opera/PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-21.md` y la bitácora en `opera/INTEGRACION_BITACORA_CONTINUIDAD.md`.
- Claude v2 no está listo para aplicación directa: el gate está aislado y falta validar origen ECU.
- El parche 0002 de inyectores es redundante; no reaplicarlo.
- Mantener F0/F1 fuera del barrido automático; ZF F0 bloqueado sin evidencia; HV-240 y actuadores/adaptación bloqueados.

### Al recibir los paquetes
1. Verificar archivos, rutas, duplicados, integridad del ZIP y que no se sustituyan informes históricos.
2. Comparar propuesta de Claude con el main vigente; no asumir que el parche aplica.
3. Obtener revisión de DeepSeek y contrastar defectos; usar Gemini para resolver afirmaciones documentales y Grok solo para UX/guía.
4. Crear rama a partir del SHA real de main; hacer cambios pequeños y trazables; actualizar bitácora e índice en la misma rama.
5. Abrir PR, revisar diff y estado de checks. No hacer merge hasta que el gate de código, auditoría y CI esté satisfecho.
6. Ejecutar/verificar unit tests y `assembleDebug` en CI sobre el mismo SHA. Informar fallos exactos, no ocultarlos. Verificar el artefacto del run correcto.
7. No afirmar prueba OTG, K-Line o ECU sin logs del usuario. El usuario tiene solo Android: entregar instrucciones de descarga/instalación del APK de Actions y cómo guardar logs sin perder datos.
8. No habilitar actuadores, aprendizaje, escritura/borrado ni HV-240.

### Salida obligatoria
Informe `CHATGPT_INFORME_COMPLETO.md` o addendum versionado con SHA base/final, archivos, PR, CI, pruebas ejecutadas y pendientes, decisión de merge y riesgos. La respuesta al usuario debe separar con claridad lo realizado de lo que falta.

---

## Orden recomendado de trabajo
1. Enviar Prompt A a Claude y obtener el patch/diff completo.
2. Enviar Prompt B a DeepSeek con el patch de Claude cuando llegue; si se envía antes, pedir matriz independiente basada en los requisitos de esta guía y luego una segunda revisión del diff.
3. Enviar Prompt C a Gemini en paralelo; su trabajo no depende del código final.
4. Enviar Prompt D a Grok en paralelo; su trabajo no modifica código.
5. Entregar los paquetes aquí para integración y verificación. No se inicia prueba física por el mero hecho de recibir informes.
