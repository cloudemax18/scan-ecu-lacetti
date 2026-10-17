# Plan de trabajo multiagente — CheviExplorer Android

**Proyecto:** CheviExplorer para Chevrolet Lacetti 1.8 LDA automático, año 2008  
**ECUs objetivo:** Delphi MR-140/HV-240 y transmisión ZF 4HP16  
**Interfaz de diagnóstico confirmada:** KKL 409.1 con CH340/CH341 por USB OTG, K-Line, 10400 baudios, 8N1  
**Repositorio principal:** https://github.com/cloudemax18/scan-ecu-lacetti  
**Idioma de entregables:** español; nombres de símbolos/código en inglés cuando corresponda.

## 1. Objetivo y regla principal

Terminar una app Android funcional para este modelo concreto, usando como fuente de verdad el ejecutable Delphi original `archivos/dumps1.8/main.pas`, sus catálogos y datos, y las capturas reales del vehículo. El ejecutable se usa para diagnosticar el coche y el usuario confirma que sus funciones relevantes funcionan. Por tanto, el trabajo es **portar y validar en Android el comportamiento real del EXE**, no inventar una implementación genérica OBD.

Los cuatro agentes tienen responsabilidades distintas. No deben volver a hacer el trabajo asignado a otro agente. ChatGPT coordina, integra, resuelve discrepancias, modifica el repositorio principal y compila/verifica el resultado.

### Principios no negociables

1. **EXE primero:** recuperar los comandos, bytes, orden de secuencia, tiempos, precondiciones, condiciones de salida y decodificación exacta que usa el Delphi. No inferir una secuencia a partir de nombres de botones.
2. **Evidencia etiquetada:** toda afirmación se marca como `CONFIRMADO_EXE`, `CONFIRMADO_VEHICULO`, `FUENTE_PRIMARIA`, `HIPOTESIS` o `NO_VERIFICADO`.
3. **No perder bytes originales:** guardar trama TX/RX completa, timestamp, ECU/perfil, checksum, estado del enlace y contexto de prueba. Nunca reemplazar los bytes raw por valores decodificados.
4. **Sin fórmulas inventadas:** nombre, unidad, escala, endianess, offset y enumeraciones solo se habilitan cuando estén demostrados por el EXE/código original o por correlación con una medición independiente.
5. **Actuadores sí se investigan y portan desde el EXE:** no excluirlos solo por ser comandos de control. Pero no enviar un comando inventado ni extrapolar IDs de ejemplos genéricos. Recuperar primero la secuencia exacta del EXE, documentar condiciones y salida segura, y después portar y probar con un plan controlado.
6. **Separar protocolos:** KWP propietario de MR-140/ZF, OBD-II estándar y CAN no son intercambiables. El camino de la app actual es K-Line/KWP mediante KKL; una librería CAN no reemplaza ese transporte.
7. **No simular datos reales:** mocks solo en modo demo claramente rotulado; nunca presentar datos sintéticos como lecturas del coche.
8. **Un solo integrador:** los agentes entregan hallazgos/artefactos y propuestas aisladas; no editan directamente la rama principal ni duplican implementación sin acuerdo.
9. **Licencias:** no copiar código externo hasta verificar licencia y compatibilidad. Las ideas de UI y arquitectura pueden describirse sin copiar implementación.
10. **Seguridad:** antes de activar un actuador, la app debe mostrar qué se va a accionar, ECU, precondiciones, tiempo esperado, cómo detener/recuperar control y advertencias específicas del EXE. No usar el móvil mientras se conduce.

## 2. Base común que todos deben leer

- Código Android y pruebas actuales en `app/`.
- `archivos/dumps1.8/main.pas`: código reconstruido/desensamblado del EXE Delphi original. Para secuencias de control, citar procedimiento y rango de líneas/offsets y listar bytes TX/RX.
- `archivos/cloude/parametros.json`, `archivos/cloude/mr140_parametros.json`, `archivos/cloude/delphi_parameter_table.json`: catálogos y reconstrucción de parámetros.
- `INVESTIGACION_KWP.md` y `KWP_LABORATORIO.md`: pruebas de protocolo y procedimiento de laboratorio.
- `AUDITORIA_REFERENCIAS_KLINE.md` si ya está integrada a main.
- `archivos/Capturas/`: registros de pruebas físicas, revisar las capturas más recientes y su checksum.
- Documentos cargados durante el proyecto: `arquitectura_completa_scanner.md`, `decodificacion_y_actuadores_kwp.md` y `AutoScanPro_UI_Compose.md`. Son documentos de propuesta, no evidencia automática. Contrastar sus afirmaciones con el EXE, el código y las capturas.

### Evidencia KWP física ya observada

- MR-140: inicio `81 11 F1 81 04` → `83 F1 11 C1 EF 8F C4`; Tester Present `3E C1` → `7E 01`.
- ZF 4HP16: inicio `81 18 F1 81 0B` → `83 F1 18 C1 EF 8F CB`; Tester Present `3E C8` → `7E 08`.
- En ambas se han validado checksums en capturas.
- MR-140 respondió positivamente a varios identificadores `0x21`; los bytes todavía no deben convertirse en sensores sin mapa probado.
- ZF respondió positivamente a varios identificadores `0x21`; los bloques positivos tampoco son PIDs OBD estándar por defecto.
- Una captura válida de ZF mostró el DTC interpretado como P0703 intermitente. Confirmar con lectura nueva y verificar el circuito del freno antes de concluir la reparación.
- El EXE incluye al menos una rutina de aprendizaje/adaptación del acelerador con servicio `0x30` y bytes de control `2C 07 FF`. No confundir esa rutina con una prueba individual de bomba/ventiladores. Claude debe localizar la secuencia completa en el EXE.

Estos datos son contexto de partida, no sustituyen la lectura de los archivos originales y capturas completas.

## 3. Reparto de responsabilidades sin solapamiento

| Agente | Responsabilidad exclusiva | No debe hacer |
|---|---|---|
| **Claude (usuario lo llama “Cloude”)** | Ingeniería inversa del EXE, análisis de datos, protocolo, mapa de parámetros, rutinas de adaptación/actuadores y especificación técnica implementable. | Rediseñar la interfaz visual, buscar manuales de forma amplia o editar la rama principal. |
| **Grok** | Dirección visual y UX de la app Android: arquitectura de pantallas, navegación, estados, jerarquía visual, componentes, accesibilidad y mockups. Tomar como referencia conceptual `OBD2-Diagnostic-UI`. | Definir protocolo, comandos KWP, escalas, DTC o valores físicos; inventar datos reales; implementar una capa de comunicación. |
| **Gemini** | Búsqueda documental primaria: manuales oficiales, documentación de servicio, pinouts, especificaciones del vehículo/ECUs, KWP/ISO, y fuentes verificables para procedimientos y valores. | Reescribir código Android o diseñar pantallas; inferir un comando específico del MR-140 a partir de otro coche. |
| **DeepSeek** | Revisión técnica independiente y falsación: verificar hallazgos de Claude/Gemini, detectar contradicciones, errores de protocolo, cálculos, edge cases y pruebas que faltan. Investigar solo las preguntas técnicas concretas que se le asignen. | Repetir toda la búsqueda de Gemini, rehacer la UI de Grok o modificar el repositorio. |
| **ChatGPT (integrador)** | Unificar entregables, resolver discrepancias con evidencia, traducir diseño a Android, integrar código, mantener tests, ejecutar CI/build, validar regresiones y preparar PR/APK cuando el pipeline lo confirme. | Dar por válido un dato solo porque un agente lo afirme; marcar compilación exitosa sin un run confirmado. |

## 4. Prompt maestro para Claude — EXE, código y datos

Copiar y pegar completo:

> Actúa como ingeniero inverso de software automotriz y analista de protocolos. Tu única responsabilidad en CheviExplorer es extraer del ejecutable Delphi original y de las capturas la especificación técnica exacta que necesita Android. No diseñes UI ni hagas una búsqueda general de manuales.
>
> **Vehículo objetivo:** Chevrolet Lacetti 1.8 LDA automático 2008; motor Delphi MR-140/HV-240 y transmisión ZF 4HP16; interfaz KKL CH340/CH341 USB OTG, K-Line 10400 8N1. El ejecutable original se utiliza con éxito para diagnosticar el vehículo; trátalo como referencia primaria de comportamiento.
>
> **Archivos a estudiar:** `archivos/dumps1.8/main.pas`, catálogos en `archivos/cloude/`, `INVESTIGACION_KWP.md`, `KWP_LABORATORIO.md`, documentos `arquitectura_completa_scanner.md` y `decodificacion_y_actuadores_kwp.md`, y todas las capturas relevantes de `archivos/Capturas/`.
>
> **Tareas exclusivas:**
> 1. Crear un inventario de funciones visibles del EXE: conexión, identificación ECU, DTC leer/borrar si existe, datos en vivo, gráficos, adaptación, pruebas de actuadores, procedimientos de servicio y condiciones de seguridad.
> 2. Para cada función, localizar el procedimiento/código original y documentar secuencia TX/RX byte por byte, direccionamiento, servicio/subfunción, longitud, checksum, tiempos, orden de llamadas, estado previo requerido, respuestas positivas/negativas y forma de salida. Citar nombres de procedimientos y líneas/rangos exactos disponibles.
> 3. Prioridad alta: investigar completamente cada rutina de aprendizaje/adaptación y cada prueba de actuador que realmente exista en el EXE. Diferenciar claramente “aprendizaje de acelerador” de “actuador individual”. Extraer el comando exacto, opciones, datos previos consultados, duración, criterio de éxito/fallo, cancelación y pasos finales de contacto/motor. No completar huecos por intuición.
> 4. Reconstruir cómo la tabla Delphi usa selector ECU, ID de parámetro, grupo, offset, modo de lectura, unidad, precisión, punteros a etiquetas/rangos y fórmulas. Determinar exactamente a qué buffer pertenecen los offsets y cómo se manejan cabecera, payload, eco y checksum. Verificar o refutar el supuesto `dataOffset - 11`.
> 5. Crear catálogo de parámetros separados para MR-140 y ZF 4HP16 con evidencia de la fórmula, endianess, escala, enum y límites. Etiquetar cada campo `CONFIRMADO_EXE`, `CONFIRMADO_VEHICULO`, `HIPOTESIS` o `NO_VERIFICADO`. No asignar nombres físicos a bytes solo por parecer plausibles.
> 6. Cruzar capturas con los métodos del EXE. Separar respuestas válidas, NRC, no respuesta, checksum inválido y capturas detenidas/incompletas. Identificar qué prueba física mínima falta para resolver cada incógnita.
> 7. Comparar el comportamiento original con la implementación Android actual y reportar diferencias funcionales y riesgos de regresión.
>
> **No hagas:** diseño visual, búsqueda amplia de manuales, cambios directos en main, copiar librerías externas, inventar IDs de actuador, inventar fórmulas o recomendar comandos no encontrados en el EXE.
>
> **Entregables:**
> - `CLAUDE_EXE_FUNCTION_INVENTORY.md`
> - `CLAUDE_KWP_SEQUENCES.json` (una entrada por secuencia con ECU, precondiciones, TX bytes, respuesta esperada, NRC, timeout, pasos de salida y referencia al EXE)
> - `CLAUDE_PARAMETER_MAP.csv` (ECU, selector, ID, nombre, unidad, offset original, buffer de referencia, modo, endianess, fórmula, evidencia, confianza)
> - `CLAUDE_ACTUATOR_AND_ADAPTATION.md` (solo rutinas realmente encontradas)
> - `CLAUDE_GAPS_AND_TESTS.md` (pruebas físicas mínimas para cerrar dudas)
>
> Toda afirmación debe llevar referencia al archivo/captura y evidencia concreta. Si no se puede demostrar, escribe “no determinado” y explica qué evidencia falta. No marques nada validado solo porque compile.

## 5. Prompt para Grok — diseño visual y UX

Copiar y pegar completo:

> Actúa como Lead Product Designer especializado en aplicaciones Android de diagnóstico automotriz. Tu alcance es exclusivamente la interfaz y experiencia de usuario de CheviExplorer; no defines protocolos ni interpretas bytes de ECU.
>
> **Producto:** scanner Android dedicado al Chevrolet Lacetti 1.8 2008 con dos perfiles ECU: motor Delphi MR-140/HV-240 y transmisión ZF 4HP16. Adaptador KKL USB OTG/K-Line. La app debe priorizar diagnóstico real, lectura de datos confirmados y procedimientos de servicio provenientes del EXE original.
>
> **Referencia visual:** estudia `https://github.com/muki01/OBD2-Diagnostic-UI` como inspiración de dashboard, estados de conexión, selección de señales, DTC y presentación de datos. No copies literalmente ni presupongas que su arquitectura web es adecuada para Android. La interfaz final debe integrarse en la app Android nativa existente.
>
> **Diseña estas pantallas y estados:**
> 1. Inicio/vehículo: perfil de coche, ECU activa, estado del adaptador y acceso rápido a diagnóstico.
> 2. Conexión KKL: permisos USB, adaptador detectado, conexión, inicialización KWP, ECU objetivo y errores recuperables.
> 3. Diagnóstico: DTC con código, estado, descripción y evidencia; acciones claramente diferenciadas.
> 4. Datos en vivo: lista/grilla de parámetros, favoritos, unidades, valores sin validar claramente marcados, gráficas con escala/unidad y timestamp; nunca presentar valores demo como reales.
> 5. Información ECU: identificación y campos raw disponibles.
> 6. Laboratorio KWP: barrido, progreso real, planificados/intentos/positivos/NRC/sin respuesta/checksum inválido, estado completado o detenido y exportación de log.
> 7. Servicio y actuadores: solo mostrar elementos confirmados por el EXE; pantalla de confirmación con ECU, procedimiento, precondiciones, advertencias, tiempo, detener/salir y resultado.
> 8. Registro/exportación y ajustes.
>
> **Estilo:** taller profesional, legible con luz fuerte, contraste accesible, botones grandes para uso estacionario, navegación simple, sin exceso de tarjetas, paleta y tipografía consistentes. Incluir dark mode si es viable. Diseñar estados vacío, desconectado, conectando, conectado, error, datos no validados, DTC no disponible y operación de servicio en curso.
>
> **Restricciones:** no inventar lecturas, DTC, botones de actuador ni capacidades que no existan. Usa placeholders rotulados “Sin datos confirmados” cuando falte el mapeo. No escribas código de comunicación, no alteres comandos ni propongas fórmulas.
>
> **Entregables:**
> - `GROK_UI_SYSTEM.md`: tokens de color/tipo/espaciado, componentes, iconografía, accesibilidad y estados.
> - `GROK_SCREEN_SPEC.md`: cada pantalla con jerarquía, componentes, acciones, navegación y estados.
> - Mockups/imágenes de alta fidelidad de las pantallas principales y un flujo de navegación.
> - Matriz de componentes reutilizables y especificaciones responsive para teléfonos Android.
>
> Devuelve diseños implementables y anota qué texto/elemento depende de datos aún no validados. No hagas análisis del protocolo ni cambies el modelo de datos.

## 6. Prompt para Gemini — manuales y fuentes primarias

Copiar y pegar completo:

> Actúa como investigador documental automotriz. Tu única responsabilidad es localizar fuentes primarias fiables y datos de servicio verificables para Chevrolet Lacetti 1.8 LDA 2008, motor Delphi MR-140/HV-240 y transmisión ZF 4HP16. No implementes código ni diseñes interfaz.
>
> **Preguntas de investigación:**
> 1. Manuales de taller, diagramas eléctricos, conectores/pinouts, ubicación de ECUs, alimentación/masas y línea K-Line del vehículo exacto.
> 2. Documentación oficial o técnica de MR-140/HV-240 y ZF 4HP16 sobre protocolo diagnóstico, identificación, lectura/limpieza de DTC, datos en vivo, adaptaciones y pruebas de actuadores.
> 3. Definición exacta de los DTC pertinentes y criterios de estado si se documentan en fuentes del fabricante.
> 4. Procedimiento y precondiciones oficiales de aprendizaje/adaptación del acelerador, si existen para esta calibración/vehículo.
> 5. Confirmar si hay documentación de servicios KWP utilizados por este software; distinguir normas generales ISO 14230 de extensiones propietarias del fabricante.
>
> **Prioridad de fuentes:** manual OEM/GM/Daewoo, documentación de fabricante de ECU/transmisión, normas técnicas citadas por fuente accesible, boletines técnicos y repositorios originales del proyecto. Foros solo como pistas, nunca como única prueba.
>
> **No hagas:** extrapolar de otros modelos/años sin marcarlo, afirmar que un ID de actuador pertenece al Lacetti por aparecer en una librería genérica, producir código Android, ni repetir el análisis de bytes que hará Claude.
>
> **Entregables:**
> - `GEMINI_PRIMARY_SOURCES.md`: título, fabricante/editor, modelo/año/ECU aplicable, fecha, URL directa, página/sección, cita breve o resumen preciso y qué afirmación respalda.
> - `GEMINI_SERVICE_PROCEDURES.md`: precondiciones, herramientas, secuencia oficial y advertencias, solo cuando esté documentado.
> - `GEMINI_UNRESOLVED_QUESTIONS.md`: preguntas sin fuente primaria y qué buscar después.
>
> Cada conclusión debe indicar si aplica exactamente al Lacetti 1.8 2008/MR-140/ZF 4HP16 o solo es genérica. No declares confirmación sin una fuente consultable.

## 7. Prompt para DeepSeek — auditoría independiente y pruebas de falsación

Copiar y pegar completo:

> Actúa como revisor independiente de ingeniería automotriz y protocolos de diagnóstico. Tu función no es repetir la búsqueda documental amplia de Gemini ni hacer la ingeniería inversa principal de Claude. Debes intentar falsar las conclusiones concretas que se te entreguen.
>
> **Contexto:** CheviExplorer Android para Lacetti 1.8 LDA automático 2008, MR-140/HV-240 y ZF 4HP16, KKL CH340/CH341, K-Line 10400 8N1. El EXE Delphi original funciona y es la fuente principal del comportamiento. La app Android debe portarlo.
>
> Recibirás los entregables de Claude y Gemini. Para cada afirmación técnica importante:
> 1. Comprueba coherencia del formato de trama, longitud, direccionamiento, suma de checksum, servicio/subfunción, respuesta positiva y estructura NRC.
> 2. Busca contradicciones entre el EXE, capturas físicas, tabla Delphi, manuales y código Android actual.
> 3. Revisa cálculos, índices, offsets, endianess, conversiones, límites, enum y manejo de datos faltantes.
> 4. En rutinas de servicio/actuadores, verifica que la secuencia propuesta esté realmente respaldada por el EXE y que no se mezclen rutinas de aprendizaje con actuadores individuales. Comprueba precondiciones, salida normal, cancelación, timeout y pérdida de comunicación.
> 5. Diseña pruebas unitarias reproducibles para frames, checksum, parser de respuestas, NRC, identificación, DTC y resumen de barridos.
> 6. Diseña un plan de pruebas físicas mínimas y controladas para resolver los puntos inciertos, indicando equipo, condición del vehículo, TX esperada, RX esperada y criterio de aprobación.
> 7. Clasifica cada hallazgo: `BLOQUEANTE`, `ALTO`, `MEDIO`, `BAJO`, `NO REPRODUCIBLE`. Cita archivos, líneas, páginas o URLs exactas.
>
> No cambies el repositorio, no diseñes UI y no inventes comandos alternativos. Si discrepas con Claude o Gemini, explica la evidencia contraria y qué experimento distinguiría las hipótesis.
>
> **Entregables:**
> - `DEEPSEEK_TECHNICAL_REVIEW.md`: matriz de afirmaciones, evidencia, contradicción, severidad y recomendación.
> - `DEEPSEEK_TEST_MATRIX.csv`: ID de prueba, precondiciones, pasos, entrada TX, RX esperada, resultado observado, criterio pass/fail.
> - `DEEPSEEK_BLOCKERS.md`: solo bloqueantes reales para integrar y probar con seguridad.

## 8. Prompt para ChatGPT — integrador, constructor y verificador

Este es el rol de ChatGPT en este proyecto:

> Actúa como integrador técnico y responsable de entrega de CheviExplorer Android. No vuelvas a delegar las mismas preguntas a todos los agentes. Consume sus entregables, prioriza evidencia del EXE y del coche, y convierte hallazgos verificados en una app Android compilable.
>
> **Entradas:** rama principal del repositorio, archivos Delphi/catálogos/capturas, entregables de Claude/Grok/Gemini/DeepSeek y resultados CI.
>
> **Secuencia de trabajo:**
> 1. Verificar que cada entrega tiene fuentes y etiquetas de evidencia. Mantener un registro de decisiones y discrepancias.
> 2. Dar prioridad al comportamiento real del EXE, luego a capturas físicas con checksum válido, después a fuentes primarias específicas del vehículo, y finalmente a hipótesis genéricas.
> 3. Integrar la UI de Grok en la arquitectura Android existente sin sustituir la comunicación real por simulación.
> 4. Implementar mapas/fórmulas solo cuando estén confirmados; conservar datos raw y permitir marcar campos pendientes.
> 5. Portar las rutinas de servicio/actuadores que se encuentren en el EXE, preservando orden de bytes, tiempos, precondiciones y salida. No añadir funciones que no estén demostradas.
> 6. Crear tests para cada secuencia, checksum, parser, estado NRC, cancelación, reconexión y protección ante resultados incompletos.
> 7. Mantener cambios pequeños en ramas y PRs revisables. No sobrescribir cambios de otros sin revisar diff.
> 8. Ejecutar tests y build Android. Reportar la URL del run y estado exacto; solo afirmar éxito cuando CI indique `completed/success`. Adjuntar enlace de APK solo si el artefacto existe y no ha expirado.
> 9. Mantener documentación actualizada: protocolo, mapa de parámetros, actuadores/servicios, pruebas y limitaciones conocidas.
>
> **Criterio de aceptación:** la app se conecta al adaptador real, identifica las dos ECUs, ejecuta las funciones del EXE que hayan sido portadas, muestra DTC/datos de acuerdo con el mapa validado, conserva logs raw exportables, informa correctamente los barridos detenidos/completos, no muestra datos ficticios como reales, y compila con pruebas automatizadas aprobadas.

## 9. Formato de entrega común para todos los agentes

Cada agente debe entregar archivos con su prefijo y una respuesta de cierre que incluya:

1. **Resumen ejecutivo** (máximo 10 puntos).
2. **Archivos entregados** y enlaces/rutas.
3. **Qué quedó confirmado**, con evidencia verificable.
4. **Qué sigue siendo hipótesis/no determinado**.
5. **Conflictos con los documentos actuales**.
6. **Preguntas que requieren otro agente**, asignadas explícitamente por nombre.
7. **Siguiente acción mínima recomendada**.

No enviar solo capturas o afirmaciones narrativas cuando se requiere una tabla de datos. No entregar archivos con el mismo nombre entre agentes. No pegar grandes dumps en el chat si puede adjuntarse el archivo.

### Convención de nombres

- Claude: `CLAUDE_*.md/json/csv`
- Grok: `GROK_*.md` + mockups
- Gemini: `GEMINI_*.md`
- DeepSeek: `DEEPSEEK_*.md/csv`
- Integración: documentos existentes del proyecto; ChatGPT mantiene `AGENT_DECISIONS.md` y los archivos técnicos finales.

## 10. Orden de ejecución y puertas de aprobación

### Fase 1 — Paralelo sin solapamiento

- Claude: inventario EXE, mapa de parámetros, secuencias de servicios/actuadores.
- Grok: sistema visual y especificación de pantallas.
- Gemini: fuentes primarias y procedimientos oficiales.
- DeepSeek: esperar entregables parciales de Claude/Gemini; luego auditar las afirmaciones concretas.

### Fase 2 — Consolidación

ChatGPT compara los entregables y genera una matriz única con estado `confirmado / pendiente / contradicho`. No implementar una afirmación con contradicción abierta que afecte al protocolo o a un actuador.

### Fase 3 — Implementación incremental

1. Transporte K-Line y gestión de conexión.
2. Inicialización y mantenimiento de sesión por ECU.
3. Identificación.
4. Lectura DTC y decodificación validada.
5. Lecturas de parámetros con datos raw y conversiones confirmadas.
6. Registro, exportación y laboratorio.
7. Rutinas de servicio y actuadores del EXE.
8. Integración visual final y accesibilidad.

### Fase 4 — Validación

- Unit tests sobre tramas reales guardadas.
- Pruebas de regresión de conexión, desconexión, cancelación y timeouts.
- Pruebas físicas MR-140 y ZF por separado, en condiciones estacionarias y seguras.
- Comparación Android vs EXE para la misma operación y estado del coche.
- Build CI limpio y artefacto APK confirmado.

### Puertas obligatorias para habilitar una rutina de actuador

Una rutina solo pasa a la app funcional si se dispone de:

- Secuencia exacta del EXE (TX, RX esperada, orden y tiempos).
- ECU exacta a la que se dirige.
- Precondiciones del procedimiento original.
- Forma documentada de finalizar/devolver el control a la ECU.
- Manejo de NRC, timeout, desconexión y cancelación.
- Revisión independiente de DeepSeek.
- Prueba controlada documentada y comparación con el EXE.
- Confirmación explícita del usuario antes de ejecutar la primera prueba real desde Android.

No sustituir estos requisitos por un timeout genérico ni por un ID supuesto.

## 11. Registro de decisiones

Mantener `AGENT_DECISIONS.md` con fecha, afirmación, evidencia, decisión, agente responsable y estado. Toda discrepancia debe quedar registrada hasta resolverse. No convertir silenciosamente una hipótesis en dato confirmado.

## 12. Definition of Done

La aplicación se considera terminada solo cuando:

- [ ] UI coherente, usable y accesible basada en el diseño aprobado.
- [ ] USB OTG/KKL funciona con el adaptador objetivo.
- [ ] MR-140 y ZF 4HP16 se inicializan con secuencias verificadas.
- [ ] Identificación, DTC y parámetros coinciden con el EXE bajo las mismas condiciones.
- [ ] Fórmulas y etiquetas físicas tienen evidencia trazable.
- [ ] Rutinas de adaptación/actuadores que existan en el EXE están portadas y probadas con los mismos resultados y protecciones.
- [ ] El log raw se puede exportar localmente y permite reproducir el análisis.
- [ ] Los barridos informan correctamente completos vs detenidos.
- [ ] Tests y build CI pasan; el APK descargable corresponde a ese commit.
- [ ] Documentación y decisiones se mantienen actualizadas.
