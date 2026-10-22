# CheviExplorer — Prompts operativos multiagente v5 (detalle obligatorio)
**Fecha:** 2026-10-22  
**Repositorio de referencia:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Punto de partida conocido:** commit de subida de Claude v3 `e593e23068b4046919a5775e24f7bb4291ce28bb`; NO asumir que sigue siendo el último. Antes de analizar, confirmar el SHA actual que el usuario adjunta o proporciona.  
**Propósito de esta ronda:** convertir una propuesta de componentes aislados para KWP `0x2C` en una propuesta de integración contrastada con el código productivo, sometida a auditoría independiente y respaldada por pruebas trazables.  
**Regla de calidad:** cada prompt explica contexto, materiales exactos, objetivo, método paso a paso, criterios de aceptación, límites, formato de salida y entregables. No usar órdenes vagas como “revísalo”, “arréglalo” o “hazlo funcionar” sin explicar cómo se comprueba.

---

# 0. Instrucciones comunes para TODOS los agentes

## 0.1 Contexto del proyecto
CheviExplorer es una aplicación Android de diagnóstico para Chevrolet Lacetti/Daewoo J200, año/variante de referencia 2008, motor 1.8 LDA, ECU Delphi MR-140 y transmisión automática ZF 4HP16. El adaptador de referencia es KKL USB basado en CH340/CH341, conectado al teléfono Android mediante OTG. La existencia de un perfil de software no demuestra que todos los vehículos, mercados, ECU o calibraciones respondan igual.

El usuario dispone de un teléfono Android, no de un PC. Diseñar la entrega para que el usuario pueda descargar y cargar ZIP/archivos desde el móvil; no exigir compilación local como único camino. La compilación y pruebas Kotlin deben ejecutarse en CI o en un entorno de desarrollo disponible, y los resultados deben señalar exactamente dónde se ejecutaron.

## 0.2 Límites de acceso y honestidad
Los agentes externos no tienen acceso directo al repositorio GitHub a menos que el usuario les proporcione archivos. Por tanto:
- No afirmar que se ha inspeccionado un archivo que no fue adjuntado o cuyo contenido no se entregó.
- No afirmar que se creó una rama, commit, PR, se subió un archivo o se ejecutó CI si no se dispone de esa capacidad y evidencia.
- Si falta información, entregar una lista de bloqueos concreta y seguir con la parte que sí puede realizarse.
- No inventar SHA, salidas de comandos, capturas, resultados de pruebas, fuentes OEM, páginas ni citas.
- Distinguir claramente: **estático/razonado**, **prueba de modelo**, **JUnit/Kotlin ejecutado**, **CI observada**, **prueba con adaptador**, **prueba física en vehículo**.
- Las tramas reconstruidas a partir de un EXE son evidencia de análisis estático, no evidencia de que una ECU física las acepte.
- Las capturas creadas por la propia app no son un analizador independiente del bus. Una interpretación de “cero DTC” por el parser no certifica que no haya fallos en todo el vehículo.

## 0.3 Seguridad funcional que no se puede negociar
- Mantener `0xF0` y `0xF1` fuera de los barridos automáticos de `0x21` hasta que la definición de bloques dinámicos y la compuerta estén integradas en el camino real de lectura, con tests.
- MR-140: no leer un bloque dinámico antes de aceptar su definición para la sesión actual. Respetar el orden de definición respaldado por los artefactos disponibles; si la evidencia requiere completar F0 y F1 antes de cualquier lectura, aplicar esa condición más estricta.
- ZF 4HP16: F0 deshabilitado por defecto hasta evidencia específica de aceptación. No extrapolar desde MR-140.
- HV-240: no habilitar conexión ni reutilizar automáticamente el perfil MR-140.
- No habilitar ni ampliar actuadores, aprendizaje de acelerador, escritura, borrado, adaptaciones ni comandos de cambio de estado como parte de esta ronda.
- No retirar pruebas existentes ni hacerlas menos estrictas para conseguir una compilación verde.
- Todo camino que lea un ID dinámico debe quedar cubierto por la misma política; no basta con ocultar un botón en la interfaz.

## 0.4 Paquete de entrega obligatorio para cada agente
Entregar todo lo siguiente, incluso si el resultado es “no se puede completar”:
1. Informe principal Markdown completo, no solo un resumen en el chat.
2. Changelog con archivos nuevos/modificados y motivo.
3. Manifiesto con ruta destino exacta para cada archivo.
4. Fuentes completas o patch aplicable; no entregar fragmentos aislados que obliguen al integrador a adivinar dónde insertarlos.
5. Tests o matriz de pruebas, según el rol, con entradas, pasos, resultado esperado y resultado observado. Marcar “no ejecutado” cuando corresponda.
6. ZIP descargable con la estructura de carpetas que preserve las rutas destino, un README y el manifiesto.
7. Lista de supuestos, preguntas sin resolver, riesgos y dependencias.
8. Pasos de integración exactos, ordenados y reversibles. No incluir claves, tokens, datos personales ni archivos basura.
9. Si no puede producir alguno de los entregables, explicarlo en el informe; nunca simularlo.
10. En el chat, devolver un resumen corto con nombre exacto del ZIP, archivos clave y pruebas realmente ejecutadas.

## 0.5 Formato de evidencia
Para cada hallazgo de código indicar: ruta, símbolo/función, línea o fragmento identificable, comportamiento actual, problema, cambio propuesto y prueba que demuestra el cambio. Para cada afirmación de protocolo indicar fuente y nivel de certeza. Usar estas etiquetas:
- **A — primaria/verificada:** estándar oficial o documentación OEM que corresponde exactamente a la variante.
- **B — secundaria:** documentación técnica fiable, pero no fuente primaria específica.
- **C — artefacto de software:** EXE, código, tabla o secuencia estática analizada.
- **D — captura de la app:** registro producido por CheviExplorer, sin independencia de medición.
- **E — inferencia/hipótesis:** explicación plausible todavía no verificada.
- **U — desconocido/no encontrado.**

No mezclar certeza A con C/D/E. Un resultado “positivo” solo prueba lo que el dato realmente cubre.

---

# PROMPT A — CLAUDE
## Integración real de definiciones KWP 0x2C y serialización en el código productivo

### Rol
Actúa como ingeniero senior de Kotlin/Android y protocolo KWP2000. Tu responsabilidad es preparar una integración pequeña, revisable y compilable contra el código productivo actual. Continúa tu v3: no vuelvas a presentar solo clases aisladas y no repitas el parche de selector de inyectores que ya está registrado como integrado.

### Resultado exacto que necesito
Un parche `0004` que conecte el gate y el runner de `0x2C` al flujo real de sesión/lecturas, con un contrato de transporte inequívoco, propiedad serial única y tests Kotlin. Si no puedes hacerlo por falta de archivos, no inventes el contexto: produce un análisis de brechas y lista de archivos que deben facilitarse.

### Material anterior que debes estudiar primero
1. `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`
2. `opera/claud/CHANGELOG_CLAUDE_V3.md`
3. `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockDefinitionRunner.kt`
4. `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockGate.kt`
5. `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/DynamicBlockResponseValidator.kt`
6. `opera/claud/CLAUDE_2C_INTEGRATION_v3/files/SerialTransactionOwner.kt`
7. `opera/claud/CLAUDE_2C_INTEGRATION_v3/parches/0003-add-2c-gate-validator-owner-runner.patch`
8. `opera/claud/opera_claud_v2/patches/0001-add-2c-dynamic-block-definitions-and-read-gate.patch`
9. `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
10. Captura y análisis: `archivos/Capturas/cheviexplorer-captura-1792610672651.md` y `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.

No volver a aplicar `0002-fix-mr140-injector-cylinder-byte.patch`: el registro del proyecto dice que la corrección y sus pruebas ON/OFF por cuatro cilindros ya están en main. Comprueba la presencia de tests en los archivos adjuntos; no lo des por hecho si no los recibes.

### Archivos productivos que debes contrastar
Solicita estos archivos al usuario si no se adjuntan en el paquete de trabajo:
- `app/src/main/java/com/cheviexplorer/android/MainActivity.kt`
- `app/src/main/java/com/cheviexplorer/android/KwpProtocol.kt`
- `app/src/main/java/com/cheviexplorer/android/kwp/KwpBus.kt`
- `app/src/main/java/com/cheviexplorer/android/kwp/IdProbe.kt`
- `app/src/main/java/com/cheviexplorer/android/KwpLaboratoryPlan.kt`
- `app/src/test/java/com/cheviexplorer/android/kwp/IdProbeTest.kt`
- `app/src/test/java/com/cheviexplorer/android/kwp/KwpLaboratoryPlanTest.kt`
- `app/src/test/java/com/cheviexplorer/android/DelphiActuatorProtocolTest.kt`
- El archivo de definición dinámica productivo, si existe; no asumir que está en el árbol.

### Método obligatorio, en orden
**A1. Inventario y línea base**
- Enumera los archivos recibidos, su ruta de destino y, si está disponible, SHA/hash. Indica qué archivos faltan.
- Resume el flujo actual: conexión USB, StartCommunication, cambio de perfil, TesterPresent, escaneo de IDs, lecturas en vivo, desconexión.
- Localiza cada llamada que lee o escribe el puerto y cada cola/buffer RX. Entrega una tabla de rutas seriales con función, executor/hilo, transporte usado y riesgo de concurrencia.
- No diseñes la integración antes de identificar esas rutas.

**A2. Resolver las dependencias de v3**
- Comprueba si `DynamicBlockDefinitions` existe realmente en producción.
- Si no existe, incorpora el archivo completo en la ruta de producción y prueba sus definiciones/frame builder; documenta de qué artefacto deriva cada byte.
- No dejes imports a clases que solo existen dentro de `opera/`.
- Comprueba si los bloques y sus direcciones corresponden al perfil correcto y no mezcles MR-140 con ZF.

**A3. Contrato de transporte y recepción**
- Define en una frase contractual si `exchange(request, timeout)` devuelve (a) eco + respuesta completa o (b) solo respuesta. Usa un solo contrato en todo el flujo.
- Lee el código real de `KwpBus` y `SerialInputOutputManager` antes de decidir; no adivines.
- Si una capa consume el eco, no hagas que el validador lo exija de nuevo.
- Define cómo termina una respuesta: longitud KWP, timeout, cola vacía, fin de trama o mecanismo existente. Evita esperar indefinidamente.
- Prueba explícitamente: respuesta válida con eco, válida sin eco según el contrato, solo eco, timeout, frame truncado, checksum incorrecto, dirección incorrecta, NRC, SID inesperado, `0x7E` intercalado, bytes residuales y respuesta tardía de sesión anterior.
- No descartes RX residual sin registrar la razón y sin impedir que se asocie a la próxima petición.

**A4. Un único propietario del puerto**
- Conecta una única instancia compartida a StartCommunication, TesterPresent, IdProbe, barridos, lecturas en vivo y definiciones `0x2C`.
- No instancies un lock distinto por componente: locks independientes no serializan el mismo puerto.
- Mientras una transacción esté en curso, TesterPresent debe omitirse o aplazarse, nunca escribir/leer en paralelo.
- El dueño debe adquirir/liberar de forma segura ante excepción, cancelación, timeout y desconexión.
- Documenta orden de locks si existen varios, y demuestra que no hay deadlock ni lectura simultánea.
- Asegura que la respuesta que consume una transacción no pueda ser reclamada por otra.
- Si la arquitectura actual no permite hacerlo de forma segura en un parche pequeño, detente, explica la refactorización mínima necesaria y no simules una solución.

**A5. Ciclo de vida del gate**
- Al aceptar StartCommunication, iniciar sesión nueva para el perfil exacto, pero no marcar bloques dinámicos como definidos.
- Resetear/revocar estado en desconexión, reconexión, cambio de perfil/ECU, nueva inicialización, error I/O, timeout, respuesta inválida y fallo/cancelación de una definición.
- Respuestas atrasadas de sesiones antiguas deben rechazarse mediante token/generación de sesión.
- Nunca conservar la aceptación de F0/F1 al reconectar.
- MR-140: define F0 y valida su respuesta antes de F1; habilita lecturas solo tras la política de aceptación que quede demostrada por artefactos. Si la fuente requiere definir ambos antes de leer, usar ese requisito más estricto.
- ZF: gate cerrado por defecto; no activar el soporte mediante una constante modificable sin evidencia física/documental específica y revisión explícita.

**A6. Integración de lecturas**
- Localiza cada punto que puede solicitar `0x21 F0` o `0x21 F1`; incluye búsqueda estática de literales, tablas, funciones, rutas de UI y pruebas.
- El gate debe estar en la capa más baja compartida por todas las lecturas, no solo en la pantalla de laboratorio.
- Si una lectura se intenta antes de definición, denegarla sin enviar bytes al puerto y devolver un estado explícito.
- Mantener `KwpLaboratoryPlan.kt` excluyendo F0/F1 del barrido automático; el camino dinámico autorizado debe ser explícito y comprobar el gate.
- Añadir test que demuestre que no existe un bypass a través del barrido base, extendido, lectura manual o lectura en vivo.

**A7. Validador de respuesta**
- Verifica framing y longitud KWP, checksum, destino del tester, origen esperado para el perfil, SID positivo `0x6C`, identificador del bloque y ausencia de bytes no explicados.
- Rechaza NRC, respuesta de otro servicio, respuesta de TesterPresent `0x7E`, frame truncado, checksum incorrecto, destino/origen equivocados, bloque equivocado, eco parcial y residuos.
- Documenta el tratamiento de bytes que no pertenecen a la respuesta; no los interpretes como éxito.
- No afirmes que estos criterios provienen del OEM si son endurecimiento defensivo añadido por el proyecto.

**A8. Tests y compatibilidad**
- Añade pruebas unitarias Kotlin para cada caso A3/A5/A6/A7 y para orden de definición MR-140.
- Añade pruebas de concurrencia que demuestren que TesterPresent no interrumpe una transacción y de reset que demuestren que una respuesta tardía no abre el gate.
- Conserva tests actuales. No cambies aserciones para hacerlos pasar sin explicación.
- Comprueba que la app puede seguir conectando y ejecutando diagnósticos no dinámicos cuando F0/F1 estén bloqueados.
- No tocar activación de actuadores, aprendizaje, escritura, borrado, HV-240 ni pantallas para habilitarlos.

**A9. Verificación**
- Ejecuta los tests solo si dispones realmente del entorno; adjunta comando completo, salida relevante y SHA de los archivos probados.
- Si no puedes ejecutar Gradle, deja “NO EJECUTADO” y proporciona los comandos exactos para CI; no declares “tests OK” por inspección.
- Separa prueba de modelo Python, test Kotlin, build APK, CI y prueba física.

### Criterios de aceptación del parche
- Compila sin imports inexistentes.
- Todas las rutas seriales usan el propietario único.
- F0/F1 no se consultan sin definición aceptada en la sesión actual.
- Un fallo, timeout, desconexión o cambio de perfil cierra el gate.
- Las respuestas tardías no pueden abrir el gate.
- ZF F0 sigue deshabilitado por defecto.
- No se modifican funciones peligrosas ni se habilita HV-240.
- Los tests existentes se conservan y se añaden los casos relevantes.
- El diff es pequeño, legible y reversible; cada archivo tiene ruta y propósito.

### Entregables de Claude
- `opera/claud/CLAUDE_2C_INTEGRATION_REPORT_V4.md`
- `opera/claud/patches/0004-integrate-2c-gate-production.patch` o archivos completos modificados, con rutas destino preservadas.
- Tests nuevos/modificados.
- `opera/claud/CHANGELOG_CLAUDE_V4.md`
- `opera/claud/MANIFEST_CLAUDE_V4.md`
- ZIP con toda la estructura, README y manifiesto.
- En el informe: tabla antes/después, decisiones de transporte, tabla de rutas seriales, lista de bloqueos, pruebas ejecutadas/no ejecutadas, comandos CI y procedimiento de reversión.
- No afirmar que se integró en main.

---

# PROMPT B — DEEPSEEK
## Auditoría independiente, adversarial y reproducible del parche de Claude

### Rol
Eres revisor independiente de seguridad funcional y calidad de protocolo. No implementes la solución ni reescribas el parche de Claude: busca errores, bypasses, supuestos no justificados y pruebas que falten. Tu prioridad es detectar cómo podría fallar el diseño aunque el caso feliz funcione.

### Material que debes leer
- `opera/deekseep/DEEPSEEK_BLOCKERS.md`
- `opera/deekseep/DEEPSEEK_TECHNICAL_REVIEW.md`
- `opera/deekseep/DEEPSEEK_TEST_MATRIX.csv`
- `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`
- Los cuatro componentes de Claude v3 y el parche 0003 descritos en el Prompt A.
- Informe, patch, fuentes y tests Claude v4, que el usuario debe adjuntar después.
- `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.
- Si falta el código productivo actual, no inventes conclusiones: indica qué archivos faltan.

### Método paso a paso
**B1. Reproducir el contexto**
- Enumera los archivos revisados y versión/hash cuando se proporcionen.
- Identifica qué partes del informe de Claude son hechos observables y cuáles son afirmaciones sin evidencia.
- No reutilices el resultado de pruebas Python como si fuese JUnit o CI.

**B2. Auditar arquitectura serie**
- Dibuja o describe la ruta completa TX→buffer/driver→RX→parser→respuesta.
- Lista cada escritor/lector del puerto y verifica si todos usan la misma instancia de propietario.
- Busca carreras entre TesterPresent, StartCommunication, barrido, lectura en vivo y definición dinámica.
- Considera timeout seguido de respuesta tardía, buffer no vaciado, respuesta parcial, cancelación y desconexión durante la lectura.
- Señala deadlocks, doble lectura, pérdida de respuesta o asociación a una petición incorrecta solo cuando haya evidencia; marca lo demás como riesgo hipotético.

**B3. Auditar gate y bypasses**
- Busca todas las referencias a `0xF0`, `0xF1`, `0x2C`, `0x6C` y a funciones que envían solicitudes `0x21`.
- Comprueba barrido base, extendido, lectura manual, lectura en vivo y cualquier llamada indirecta.
- Comprueba que gate y lector comparten el mismo estado/sesión, no copias independientes.
- Verifica reset para desconexión, reconexión, cambio de perfil, StartCommunication nuevo, timeout, error I/O, rechazo, cancelación y respuesta tardía.
- Comprueba que una respuesta positiva vieja no abre la sesión nueva.

**B4. Auditar el parser de protocolo**
- Revisa longitudes cortas/extendidas, checksum, origen/destino, SID, bloque, NRC, eco, bytes sobrantes y respuesta `0x7E`.
- Prueba mental o unitariamente respuestas adversariales: eco solo, eco truncado, respuesta concatenada, dos respuestas seguidas, checksum válido pero dirección incorrecta, SID correcto con bloque equivocado, NRC con SID distinto y bytes residuales.
- Evalúa si el parser acepta más bytes de los que explica la trama o ignora datos relevantes.
- Distingue requisito del estándar, convención del EXE y endurecimiento defensivo introducido por el parche.

**B5. Auditar pruebas y regresiones**
- Compara tests previos con los nuevos.
- Identifica cobertura ausente para condiciones negativas y carreras.
- Verifica que no se hayan debilitado tests de IdProbe, checksum, DTC, rangos de IDs o selector de inyectores.
- Revisa que las pruebas sean deterministas, no dependan de hardware ni usen esperas reales innecesarias.
- Si no ejecutas tests, dilo claramente; una inspección del código no es una ejecución.

**B6. Revisar el alcance**
- Confirma que no se habilitaron ZF F0, HV-240, actuadores, adaptación, escritura o borrado.
- Verifica que el texto de la interfaz no presente StartCommunication como perfil validado o bloques listos.
- Registra cualquier cambio fuera de alcance.

### Formato requerido de hallazgos
Cada hallazgo debe contener:
- ID único (DS-001, DS-002…).
- Severidad: Blocker / High / Medium / Low.
- Tipo: defecto demostrado / riesgo probable / hipótesis / mejora.
- Archivo y símbolo/línea o evidencia exacta.
- Condición que activa el problema.
- Efecto observable.
- Reproducción o test propuesto.
- Resultado esperado.
- Criterio concreto para cerrar el hallazgo.
- Si depende de información ausente, especificar cuál.

No declares un defecto demostrado sin evidencia localizada. Ordena por severidad y explica qué bloquea el merge.

### Criterios de aceptación de la auditoría
- La auditoría puede ser repetida por otro desarrollador a partir de la evidencia citada.
- Los hallazgos no mezclan suposiciones con defectos confirmados.
- Incluye cobertura de carreras, respuestas tardías, gate, parser, pruebas y alcance.
- Si no hay patch v4 o faltan fuentes, la conclusión debe ser “auditoría parcial/bloqueada”, no una aprobación.

### Entregables de DeepSeek
- `opera/deekseep/DEEPSEEK_AUDITORIA_2C_V4.md`
- `opera/deekseep/DEEPSEEK_TEST_MATRIX_2C_V4.csv` con columnas: ID, severidad, tipo, archivo, símbolo/línea, precondición, pasos, esperado, observado, estado, criterio de cierre.
- `opera/deekseep/DEEPSEEK_BLOCKERS_ADDENDUM_2026-10-22.md`
- ZIP con README, manifiesto y rutas destino.
- Resumen final de máximo 15 líneas que indique si recomienda integrar, revisar o bloquear y por qué.

---

# PROMPT C — GEMINI
## Investigación de fuentes primarias y matriz de certeza técnica

### Rol
Eres investigador técnico documental. No implementes Kotlin ni infieras soporte a partir de nombres parecidos. Debes determinar qué sabemos realmente del protocolo de las variantes MR-140 y ZF 4HP16, y qué sigue sin demostrarse.

### Material de continuidad
- `opera/gemini/GEMINI_INFORME_COMPLETO.md`
- `opera/gemini/GEMINI_PRIMARY_SOURCES.md`
- `opera/gemini/GEMINI_SERVICE_PROCEDURES.md`
- `opera/gemini/GEMINI_UNRESOLVED_QUESTIONS.md`
- `opera/claud/opera_claud_v2/CLAUDE_2C_DYNAMIC_BLOCKS.md`
- `opera/claud/CLAUDE_2C_INTEGRATION_PROPOSAL.md`
- Si el usuario los adjunta: archivos de definición de bloques y propuesta v4.

### Preguntas que debes resolver una por una
**C1. Estándar**
- Identifica el estándar/edición pertinente para servicio KWP `0x2C`.
- Separa formato general de mensaje de los valores de parámetro, IDs de bloque y semántica específicos del fabricante.
- Aporta referencia bibliográfica exacta y URL de fuente legítima. Si el estándar completo no es accesible, no inventes número de página ni reproduzcas texto no consultado.

**C2. Definiciones concretas**
- Busca evidencia que corresponda específicamente a Chevrolet Lacetti/Daewoo J200, motor 1.8 LDA, ECU Delphi MR-140 y transmisión ZF 4HP16, incluyendo mercado/variante si se conoce.
- Verifica por separado MR-140 F0, MR-140 F1 y ZF F0.
- Para cada definición, detalla byte/campo, significado propuesto, fuente, localización exacta y nivel de certeza.
- Si la evidencia solo procede de un EXE analizado, etiquétala como artefacto de software; no la eleves a fuente OEM.

**C3. Ciclo de vida**
- Investiga si las definiciones son válidas por conexión, sesión, reinicio, cambio de perfil o desconexión.
- No afirmes que la ECU borra/persiste las definiciones sin fuente verificable.
- Si no existe documentación pública, indica qué observación controlada y segura sería necesaria para resolverlo.

**C4. Direcciones, velocidad y cableado**
- Verifica direcciones KWP, baud rate y pinout solo cuando la fuente corresponda a la ECU, variante y mercado exactos.
- Distingue la evidencia de la captura Android de la evidencia OEM.
- No extrapoles un pinout de otro año, motor, mercado o módulo.

**C5. Captura y validación**
- Explica qué demuestra y qué no demuestra el registro `cheviexplorer-captura-1792610672651.md`.
- No lo llames captura independiente del bus.
- Especifica qué evidencia adicional se necesitaría para afirmar que una respuesta `0x6C` fue aceptada por MR-140 o ZF, sin proponer activaciones de riesgo.

### Método de búsqueda y citas
- Prioriza documentación OEM, manual de servicio, esquema eléctrico correspondiente, estándar oficial y documentos de fabricante del equipo.
- Usa fuentes secundarias solo cuando falte primaria y etiqueta esa limitación.
- Para cada fuente, registra título, emisor, edición/fecha, URL, fecha de consulta, sección/página real, fragmento breve y afirmación respaldada.
- Verifica que el enlace abra y que la fuente efectivamente contenga la afirmación.
- Si no se encuentra fuente, escribe “no encontrada en las fuentes consultadas”; no rellenes con conocimiento general.
- Mantén preguntas abiertas explícitas y evita convertir una hipótesis en especificación.

### Entregables de Gemini
- `opera/gemini/GEMINI_2C_PRIMARY_EVIDENCE_V2.md`
- `opera/gemini/GEMINI_2C_SOURCE_MATRIX_V2.csv` con columnas: ID, afirmación, ECU/perfil, fuente, tipo de fuente, URL, fecha, ubicación exacta, cita/fragmento, certeza, limitación.
- `opera/gemini/GEMINI_2C_OPEN_QUESTIONS_V2.md`
- ZIP con README, manifiesto y rutas destino.
- Conclusión separada para MR-140 y ZF: confirmado / parcialmente sustentado / no confirmado; nunca un único veredicto general para ambas ECU.

---

# PROMPT D — GROK
## UX segura del laboratorio y guía de pruebas que el usuario pueda hacer desde Android

### Rol
Eres diseñador de UX de herramientas de diagnóstico y responsable de redactar un procedimiento de prueba comprensible para una persona que solo dispone de un teléfono Android. No implementes código de producción y no presentes un mockup como función ya instalada.

### Material previo
- `opera/grok/GROK_INFORME_COMPLETO.md`
- `opera/grok/GROK_AUDIT_CHANGELOG.md`
- `opera/grok/GROK_COMPONENT_MATRIX.md`
- `opera/grok/GROK_SCREEN_SPEC.md`
- `opera/grok/GROK_UI_SYSTEM.md`
- Recursos existentes en `opera/grok/mockups/` y `opera/grok/kotlin_mockups/`
- `opera/INTEGRACION_BITACORA_CONTINUIDAD.md`
- Análisis de captura Android en `archivos/Capturas/ANALISIS_cheviexplorer-captura-1792610672651.md`.

### Método
**D1. Auditoría de estados**
Define por separado el texto visible, condición técnica para mostrarlo, acción disponible y forma de recuperación para:
- Adaptador no detectado.
- Adaptador detectado, permiso USB pendiente/denegado.
- Puerto abierto y baud rate seleccionado.
- StartCommunication enviado sin respuesta.
- StartCommunication positivo, pero perfil aún no validado.
- Sesión activa y diagnósticos básicos disponibles.
- Definición dinámica pendiente.
- Definición aceptada en la sesión actual.
- Respuesta inválida / checksum incorrecto / timeout.
- Transacción ocupada; TesterPresent omitido.
- Sesión perdida o reiniciada.
- ECU/perfil no soportado o no verificado.

No usar solo colores: cada estado necesita texto e icono/etiqueta comprensible. Evita mensajes que prometan “ECU identificada” cuando solo se ha recibido una respuesta positiva de inicialización.

**D2. Laboratorio de solo lectura**
- Propón jerarquía, campos, mensajes y estados vacíos.
- Muestra datos crudos y datos decodificados en secciones separadas.
- Cada parámetro debe mostrar ID, bytes recibidos, unidad y estado de validación; si no hay mapa fiable, decir “sin decodificar” en vez de inventar una unidad.
- Oculta o deja inequívocamente deshabilitados actuadores, aprendizaje, escritura y borrado.
- El diseño debe diferenciar “no disponible”, “bloqueado por seguridad” y “no probado”.
- Especifica confirmaciones y prevención de toques accidentales si alguna función futura de riesgo se llegara a aprobar, pero no la habilites ahora.

**D3. Guía de validación Android**
Redacta pasos numerados y aptos para móvil para:
1. Abrir la página de GitHub Actions correspondiente al SHA correcto.
2. Distinguir run en curso, fallido y exitoso.
3. Descargar el artefacto APK de ese run; si requiere iniciar sesión o permisos, explicar el límite.
4. Verificar que el artefacto corresponde al commit indicado.
5. Descargar/instalar sin desinstalar ni borrar datos/logs existentes salvo instrucción explícita.
6. Abrir CheviExplorer, conceder permiso USB y capturar una sesión de lectura segura.
7. Exportar el registro y adjuntarlo para análisis.
8. Separar el resultado de CI de la prueba real con adaptador y de la prueba física en vehículo.

No afirmes que el usuario ha hecho alguno de estos pasos. Incluye un procedimiento de recuperación si el APK no se instala o si se pierde el registro. No le pidas ejecutar definiciones dinámicas no aprobadas, actuadores o adaptación.

**D4. Accesibilidad**
- Revisa contraste, escalado de texto, tamaño táctil, lectura por TalkBack, orden de foco, mensajes de error, estado no dependiente solo del color y protección ante doble toque.
- Presenta una lista priorizada con problema, impacto, solución y criterio verificable.

### Entregables de Grok
- `opera/grok/GROK_2C_SAFE_STATES_V2.md`
- `opera/grok/GROK_ANDROID_ONLY_TEST_GUIDE_V2.md`
- Mockups nuevos solo si resuelven un problema concreto; lista cada archivo y aclara que no es código productivo.
- ZIP con README, manifiesto y rutas destino.
- No tocar Kotlin de producción ni afirmar que la interfaz ya cambió.

---

# PROMPT E — INTEGRADOR (ChatGPT / responsable de integración y QA)
## Control de evidencia, revisión de entregas y decisión de merge

### Rol
Actúa como responsable de integración y control de calidad. Debes contrastar las entregas de A–D contra los archivos actuales y producir una decisión auditable. No des por aprobado un parche porque el informe del autor diga que está listo.

### Material que debes consultar
- Estado real de `main`, SHA y estado de GitHub Actions.
- Bitácora `opera/INTEGRACION_BITACORA_CONTINUIDAD.md` e índice `opera/README_CONTINUIDAD.md`.
- Propuesta y componentes Claude v3, patch v4 y tests.
- Auditoría y matriz DeepSeek.
- Fuentes/matriz Gemini.
- UX y guía Android Grok.
- Captura y análisis en `archivos/Capturas/`.

### Método de integración
**E1. Confirmar estado remoto**
- Verifica SHA real de `main`, fecha y estado final de CI. No reutilices un SHA de este prompt como si fuera actual.
- Distingue el commit de subida de archivos del commit que introduce cambios de aplicación.
- Si una CI sigue en curso, informa “en curso” y espera a tener estado final antes de declarar éxito.

**E2. Inventario de entregas**
- Registra cada archivo, procedencia, ruta de destino, integridad del ZIP y si es informe, fuente, patch, test, mockup o evidencia.
- Comprueba que los archivos del ZIP coinciden con el manifiesto y que no hay archivos basura o de 1 byte sin explicación.
- No sobrescribas informes históricos: incorpora addenda versionados.

**E3. Revisión del parche**
- Comprueba aplicabilidad contra la versión actual, imports, dependencias, alcance del diff y archivos eliminados/modificados.
- Inspecciona la integración de la propiedad serial única, contrato de eco, gate, reset, respuesta tardía y todos los caminos que consultan F0/F1.
- Revisa cobertura de tests positivos, negativos, concurrencia y regresión.
- Verifica que ZF F0, HV-240, actuadores, aprendizaje, escritura y borrado siguen bloqueados.
- Registra cada hallazgo con ruta/símbolo/evidencia; no basta con decir “parece correcto”.

**E4. Resolver discrepancias**
- Compara afirmaciones de Claude con DeepSeek; documenta desacuerdos y su evidencia.
- Usa Gemini para elevar o reducir certeza documental, no para sustituir tests.
- Usa Grok para verificar claridad de estados y pasos Android, no como prueba de funcionamiento del protocolo.
- Cuando dos fuentes discrepen, no elijas silenciosamente: deja decisión, fundamento y evidencia pendiente.

**E5. Validación**
- Comprueba CI de un SHA concreto y reporta por separado compilación, JUnit, análisis estático y artefacto APK.
- Si tienes herramientas para ejecutar pruebas, registra comandos y salida; si no, declara no ejecutadas.
- No equiparar CI verde con compatibilidad física.
- No afirmar pruebas con vehículo a menos que exista una captura verificable y descripción de las condiciones físicas.

**E6. Decisión y mantenimiento**
- Decisión explícita: integrar / solicitar cambios / bloquear por ahora.
- Crear PR solo si el cambio es seguro, revisable y los bloqueantes se han resuelto. Si no, no crear o no fusionar; explicar el bloqueo.
- Actualizar bitácora e índice con fecha, SHA, PR, CI, archivos, pruebas y próximos pasos.
- Preparar una entrega útil para el usuario Android: links directos, estado de PR/CI y el paso siguiente único más importante.

### Criterios para aceptar la integración
- Ningún import roto ni archivo productivo ausente.
- Propietario único compartido por todas las operaciones TX/RX.
- Gate en la ruta de lectura más baja y común; sin bypass.
- Respuestas validadas y asociadas a la transacción correcta.
- Reset de sesión completo y respuesta tardía rechazada.
- Tests Kotlin suficientes, CI verde en SHA exacto y artefacto asociado a ese SHA.
- No se activa ninguna función fuera del alcance autorizado.
- La documentación distingue evidencia estática, CI y evidencia física.
- Si falla cualquiera de estos criterios, no declarar “integrado y validado”.

### Entregables del integrador
- `opera/INTEGRACION_REPORTE_V4.md`
- Matriz de archivos revisados y veredictos.
- Registro de hallazgos abiertos/cerrados con evidencia.
- ZIP con el informe y cualquier parche aprobado, con rutas destino y manifiesto.
- Actualización de bitácora e índice.
- Resumen para el usuario con PR/CI/SHA y un siguiente paso concreto.
- No afirmar pruebas físicas no realizadas.

---

# Plantilla común de informe para cualquier agente

Cada informe principal debe seguir esta estructura y conservar los encabezados aunque una sección quede como “No aplica” o “Bloqueado por falta de información”:

1. **Resumen ejecutivo:** qué se hizo y qué no.
2. **Material recibido:** lista de archivos, versiones/hashes y ausencias.
3. **Contexto previo:** qué se reutiliza de entregas anteriores y qué no se repite.
4. **Método:** pasos concretos realizados.
5. **Hallazgos:** ID, severidad, evidencia, efecto, recomendación.
6. **Cambios:** ruta, descripción, razón y dependencias.
7. **Pruebas:** comando, entorno, resultado, evidencia; indicar no ejecutadas.
8. **Riesgos y limitaciones:** supuestos explícitos.
9. **Criterios de aceptación:** aprobado/rechazado/pendiente por criterio.
10. **Integración:** orden de aplicación, prerequisitos y reversión.
11. **Archivos entregados:** rutas exactas y contenido.
12. **Preguntas pendientes:** qué dato concreto permitiría cerrarlas.
13. **Conclusión:** qué puede hacerse a continuación sin exceder la evidencia.

## Regla final
No entregar solo texto de respuesta ni solo un ZIP sin explicar su contenido. El informe debe ser autosuficiente, los archivos deben conservar rutas destino, y cada resultado técnico debe poder rastrearse hasta un archivo, una fuente o una ejecución real.