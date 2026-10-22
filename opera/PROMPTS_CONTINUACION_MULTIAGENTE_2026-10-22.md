# CheviExplorer — Prompts de continuación multiagente v4
**Fecha:** 2026-10-22  
**Repositorio:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Punto de partida revisado:** commit de subida Claude v3 `e593e23068b4046919a5775e24f7bb4291ce28bb`; verificar `main` y CI antes de trabajar.  
**Propósito:** convertir la propuesta Claude v3 en una integración revisable contra el código real, con auditoría independiente y sin dar por probadas funciones de ECU que aún no tienen evidencia.

## Reglas comunes obligatorias
- Proyecto: CheviExplorer Android, Chevrolet Lacetti/Daewoo J200 2008, 1.8 LDA, Delphi MR-140 y transmisión ZF 4HP16; KKL CH340/CH341 por Android OTG.
- El usuario solo dispone de teléfono Android, no de PC. No dar por hecho que podrá ejecutar Gradle localmente.
- Los agentes externos no tienen acceso al repositorio ni pueden crear commits, ramas o PR. Entregar archivos completos y ZIP; el usuario los sube manualmente. Nunca afirmar que se subieron a GitHub.
- Separar resultados: análisis estático, pruebas modelo, pruebas unitarias Kotlin realmente ejecutadas, CI observada, adaptador real y vehículo real. Etiquetar cada prueba como ejecutada/no ejecutada y adjuntar evidencia.
- No fabricar capturas, resultados, SHA, citas OEM ni compatibilidad. Las tramas reconstruidas de EXE son evidencia estática, no validación física.
- Mantener F0/F1 fuera del barrido automático hasta integración y validación por sesión. ZF F0 bloqueado por defecto. HV-240 no conectable. No habilitar actuadores, aprendizaje de acelerador, escritura/borrado ni comandos 0x30.
- Conservar informes históricos; añadir addenda versionados.
- Cada entrega incluye informe Markdown completo, archivos fuente/diff/tests completos con rutas destino, ZIP descargable con README/manifiesto, lista de cambios/riesgos/supuestos y pasos de integración. No incluir archivos basura o de 1 byte sin explicar su función.

---

## PROMPT A — CLAUDE: integración real contra el código actual (no más clases aisladas)

Actúa como ingeniero Kotlin/Android encargado de preparar un parche pequeño y aplicable que integre el servicio KWP 0x2C al flujo productivo. Continúa la entrega v3; no reinicies el análisis ni repitas el parche de inyectores.

### Entrega Claude v3 que debes conservar y auditar
- `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`
- `opera/claud/CHANGELOG_CLAUDE_V3.md`
- `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockDefinitionRunner.kt`
- `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockGate.kt`
- `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockResponseValidator.kt`
- `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/SerialTransactionOwner.kt`
- `opera/claud/CLAUDE_2C_INTEGRATION_v3/parches/0003-add-2c-gate-validator-owner-runner.patch`
- `opera/claud/opera_claud_v2/patches/0001-add-2c-dynamic-block-definitions-and-read-gate.patch`
- No volver a aplicar `0002-fix-mr140-injector-cylinder-byte.patch`: la corrección y pruebas de cilindros ya están en main según el estado registrado.

### Código actual que debes pedir al usuario si no está adjunto
- `app/src/main/java/com/cheviexplorer/android/MainActivity.kt`
- `app/src/main/java/com/cheviexplorer/android/KwpProtocol.kt`
- `app/src/main/java/com/cheviexplorer/android/kwp/KwpBus.kt`
- `app/src/main/java/com/cheviexplorer/android/kwp/IdProbe.kt`
- `app/src/main/java/com/cheviexplorer/android/KwpLaboratoryPlan.kt`
- Tests: `IdProbeTest.kt`, `KwpLaboratoryPlanTest.kt`, `DelphiActuatorProtocolTest.kt`
- Lee además `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.

### Trabajo obligatorio
1. Contrasta el parche con los archivos actuales; no declares aplicabilidad sin hacer ese contraste. Si falta un archivo, dilo y entrega una lista exacta de lo que falta.
2. Resolver la dependencia `DynamicBlockDefinitions`: incluir una implementación con ruta de producción y pruebas, o demostrar que ya existe en el árbol actual. No dejar imports rotos.
3. Definir un único contrato de transporte: especificar si `exchange()` devuelve bytes con eco o solo la respuesta. Inspecciona el comportamiento real de `KwpBus`; adapta el validador a ese contrato. Prueba con eco, sin eco, solo eco, respuesta truncada y respuesta con bytes residuales.
4. Integrar un único propietario compartido del puerto a todas las rutas que hacen TX/RX: TesterPresent, StartCommunication, IdProbe, escaneo, lecturas en vivo y 0x2C. No basta con añadir `SerialTransactionOwner` sin conectarlo.
5. Auditar la cola RX, buffers, `SerialInputOutputManager`, timeouts y asociación respuesta-solicitud. No asumir que un mutex de una capa serializa accesos directos desde otras capas.
6. Resetear el gate en desconexión/reconexión, cambio de ECU/perfil, inicio/reinicio de sesión, timeout, error I/O, respuesta inválida y fallo de cualquier definición. Invalidar respuestas tardías de una sesión anterior.
7. Para MR-140, respetar la secuencia respaldada por artefactos disponibles: definir F0 y validar respuesta antes de definir F1; solo habilitar lectura de cada ID dinámico tras aceptación en la sesión actual. Si el código EXE exige ambas definiciones antes de cualquier lectura, preservar esa condición más estricta y documentarla.
8. Mantener ZF F0 bloqueado por defecto. No inferir que el protocolo MR-140 se aplica a ZF.
9. Mantener F0/F1 excluidos del barrido automático hasta que el gate productivo lo autorice explícitamente. Añadir tests para que el camino alternativo no pueda saltarse la compuerta.
10. Validar trama completa, checksum, destino tester, origen esperado, SID positivo 0x6C y bloque correcto; rechazar NRC, trama truncada, respuesta de otro servicio, 0x7E intercalado y bytes sobrantes.
11. Añadir tests Kotlin positivos/negativos y de concurrencia/reset. No quitar ni debilitar tests actuales. No habilitar UI de actuadores, adaptación, escritura, ni HV-240.
12. Si no puedes compilar/ejecutar Gradle, decláralo y no inventes resultados.

### Entregables
- `opera/claud/CLAUDE_2C_INTEGRATION_REPORT_V4.md`
- Patch versionado `0004-integrate-2c-gate-production.patch` o conjunto completo de archivos modificados con rutas exactas.
- Tests nuevos y/o modificados, changelog y manifest de archivos.
- ZIP descargable que preserve rutas destino.
- Resumen de diferencias entre v3 y v4, bloqueantes no resueltos y comandos exactos para CI. No afirmes integración en main.

---

## PROMPT B — DEEPSEEK: auditoría independiente del parche v4 (sin escribir implementación)

Continúa los informes existentes, sin duplicar el trabajo de implementación de Claude.

### Material de entrada
- `opera/deekseep/DEEPSEEK_BLOCKERS.md`
- `opera/deekseep/DEEPSEEK_TECHNICAL_REVIEW.md`
- `opera/deekseep/DEEPSEEK_TEST_MATRIX.csv`
- `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`
- Los cuatro componentes Claude v3 y el parche 0003 enumerados en el prompt A.
- El parche/informe v4 de Claude, que el usuario proporcionará después.
- `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.

### Tarea
Audita, sin modificar Kotlin, si el parche v4:
- cubre todas las rutas de puerto serie con un propietario único;
- asocia una sola respuesta a cada solicitud y trata eco, RX residual, respuestas tardías y TesterPresent;
- comprueba framing, longitud, checksum, destino/origen, SID, bloque, NRC y bytes sobrantes;
- invalida el gate tras desconexión, cambio de perfil, timeout, I/O y respuesta inválida;
- no deja caminos alternativos de lectura F0/F1 que eviten el gate;
- conserva tests de IdProbe, DTC, KwpLaboratoryPlan y selector de inyectores;
- evita habilitar ZF F0, HV-240, actuadores o adaptación;
- no presenta una prueba modelo Python como prueba Kotlin ni CI.

Entrega una matriz con ID, severidad, archivo/línea, evidencia reproducible, escenario, resultado esperado y criterio de aceptación. Clasifica Blocker/High/Medium/Low y distingue defecto demostrado de riesgo hipotético. Si el parche no se puede revisar por falta de archivos, enuméralos; no rellenes huecos por inferencia.

### Entregables
- `opera/deekseep/DEEPSEEK_AUDITORIA_2C_V4.md`
- `opera/deekseep/DEEPSEEK_TEST_MATRIX_2C_V4.csv`
- `opera/deekseep/DEEPSEEK_BLOCKERS_ADDENDUM_2026-10-22.md`
- ZIP con README/manifiesto y rutas destino. No edites informes históricos ni afirmes pruebas no ejecutadas.

---

## PROMPT C — GEMINI: verificar fuentes primarias y límites de evidencia

Continúa la investigación documental, sin implementar código.

### Archivos de continuidad
- `opera/gemini/GEMINI_INFORME_COMPLETO.md`
- `opera/gemini/GEMINI_PRIMARY_SOURCES.md`
- `opera/gemini/GEMINI_SERVICE_PROCEDURES.md`
- `opera/gemini/GEMINI_UNRESOLVED_QUESTIONS.md`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
- `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`

### Preguntas
1. Identifica el estándar aplicable a servicio 0x2C y separa campos normalizados de parámetros específicos del fabricante.
2. Busca evidencia documental de las definiciones concretas MR-140 F0/F1 y ZF F0 para Lacetti/J200 2008 1.8 LDA. Aporta título real, emisor, edición/fecha, sección/página, URL y cita breve verificable.
3. Determina qué evidencia respalda el ciclo de vida de las definiciones dinámicas (sesión, reinicio, desconexión). No asumir persistencia ni borrado sin fuente.
4. Verifica direcciones, velocidad y pinout únicamente con documentación que corresponda a variante/mercado exactos. No deducir pinout desde un diagrama genérico.
5. Clasifica cada afirmación: fuente primaria OEM/estándar, fuente secundaria, EXE analizado, captura app, inferencia o no encontrado.
6. Explica qué evidencia física faltaría para confirmar aceptación de 0x2C en MR-140 y ZF. No pidas ejecutar operaciones de riesgo.
7. No declarar que un EXE es documentación OEM; no inventar referencias ni citas.

### Entregables
- `opera/gemini/GEMINI_2C_PRIMARY_EVIDENCE_V2.md`
- `opera/gemini/GEMINI_2C_SOURCE_MATRIX_V2.csv`
- `opera/gemini/GEMINI_2C_OPEN_QUESTIONS_V2.md`
- ZIP descargable con README/manifiesto. Añade fecha de consulta y limitaciones de acceso a documentos.

---

## PROMPT D — GROK: estados UX seguros y guía de validación con Android

Continúa el trabajo visual existente; no rediseñes toda la app y no entregues Kotlin de producción.

### Material existente
- `opera/grok/GROK_INFORME_COMPLETO.md`
- `opera/grok/GROK_AUDIT_CHANGELOG.md`
- `opera/grok/GROK_COMPONENT_MATRIX.md`
- `opera/grok/GROK_SCREEN_SPEC.md`
- `opera/grok/GROK_UI_SYSTEM.md`
- `opera/grok/mockups/`
- `opera/INTEGRACION_BITACORA_CONTINUIDAD.md`

### Tarea
1. Propón textos/estados que distingan: adaptador detectado, permiso USB, sesión iniciada, perfil no verificado, definición pendiente, bloque aceptado en esta sesión, respuesta inválida, timeout y sesión perdida.
2. Diseña una pantalla de laboratorio de solo lectura y no muestres controles accionables para actuadores/aprendizaje mientras estén bloqueados.
3. Indica cómo evitar que “conectado” o “StartCommunication positivo” se interprete como ECU/perfil completamente validado.
4. Prepara guía de prueba solo con teléfono Android: comprobar run y SHA de Actions, descargar artefacto de ese run, extraer APK, instalar con cuidado de no borrar logs, y exportar registro TX/RX. No afirmar que el usuario ya hizo esos pasos.
5. Revisa accesibilidad, contraste, tamaño de texto, estados no dependientes solo del color y protección ante toques accidentales.

### Entregables
- `opera/grok/GROK_2C_SAFE_STATES_V2.md`
- `opera/grok/GROK_ANDROID_ONLY_TEST_GUIDE_V2.md`
- Mockups/recursos solo si aportan algo nuevo, con rutas y explicación.
- ZIP descargable con README/manifiesto. Los mockups no son implementación funcional.

---

## PROMPT E — INTEGRADOR (ChatGPT / responsable del repositorio)

Actúa como responsable de integración y QA del repositorio. Tu tarea no es aprobar por intuición: confirma los archivos y SHA reales en GitHub, revisa los entregables de A–D y decide qué se puede integrar.

### Orden de trabajo
1. Confirmar `main`, commit actual y estado final de Actions #254; nunca usar como actual el SHA anotado si cambió.
2. Comparar v4 de Claude con archivos productivos actuales. Detectar imports inexistentes, rutas seriales no cubiertas, contrato de eco incompatible, tests ausentes y cambios fuera de alcance.
3. Incorporar la auditoría DeepSeek como revisión separada y revisar fuentes Gemini; mantener el diseño Grok como documentación, no como funcionalidad.
4. Solo proponer PR si el parche es coherente, no rompe tests y conserva los bloqueos. Si no puede verificarse, dejar PR sin crear y listar bloqueantes.
5. Ejecutar o verificar CI de un SHA concreto. Reportar por separado compilación, JUnit, análisis estático y artefacto; no confundir CI con prueba física.
6. Mantener F0/F1 fuera de barrido automático hasta que la compuerta esté integrada y pase tests. No habilitar ZF F0 sin evidencia específica, ni actuadores, adaptación o HV-240.
7. Actualizar `opera/INTEGRACION_BITACORA_CONTINUIDAD.md` y `opera/README_CONTINUIDAD.md` con fecha, SHA, PR/CI, archivos, evidencia, riesgos y próximos pasos. No borrar el historial.

### Salida requerida
- Tabla de archivos revisados con veredicto y evidencia.
- Lista de bloqueantes que impiden integrar.
- Decisión: integrar / revisar cambios / rechazar por ahora, con razones.
- Pruebas efectivamente ejecutadas y no ejecutadas.
- Informe `opera/INTEGRACION_REPORTE_V4.md` y ZIP descargable con el informe y cualquier parche generado, preservando rutas.
- No afirmar que se ejecutó una prueba física ni que se subieron cambios si no hay evidencia.

