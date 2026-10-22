# Organización del repositorio CheviExplorer

**Propósito:** orientar a colaboradores y agentes, reducir duplicación accidental y proteger la evidencia histórica. Este documento describe el árbol observado; no declara que cada artefacto esté validado.

## Fuente de verdad por tipo

| Necesidad | Ruta principal | Regla |
| --- | --- | --- |
| Código Android productivo | `app/src/main/` | Solo aquí vive el código de producción. |
| Pruebas automatizadas Kotlin | `app/src/test/` | No sustituirlas por simulaciones Python o revisión estática. |
| CI | `.github/workflows/` | Registrar el SHA exacto y resultado final. |
| Estado vigente y decisiones | `opera/INTEGRACION_BITACORA_CONTINUIDAD.md` | Añadir secciones fechadas; no borrar historia. |
| Índice para retomar trabajo | `opera/README_CONTINUIDAD.md` | Mantener enlaces a entregas activas y límites conocidos. |
| Prompts multiagente | `opera/PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-22.md` | Usar prompts detallados, con entradas, método, aceptación y entregables. |
| Investigación técnica general | Archivos Markdown de la raíz y `docs/` | Al actualizar, enlazar desde este índice y el README. |
| Material de referencia, capturas y dumps | `archivos/` | Conservar procedencia y distinguir capturas de la app de instrumentos independientes. |
| Entregas externas | `opera/claud/`, `opera/deekseep/`, `opera/gemini/`, `opera/grok/` | Son fuentes históricas/propuestas; no equivalen automáticamente a integración. |

## Convenciones

1. **No mezclar evidencia con conclusión.** Etiquetar por separado código fuente, análisis estático, pruebas modelo, JUnit, CI, adaptador y vehículo.
2. **No sobrescribir informes históricos.** Crear una versión fechada o una addenda, y actualizar el índice.
3. **No guardar el mismo material en varios lugares** salvo que sea una copia de entrega exigida; si se duplica, indicar cuál es el original.
4. **Parches reversibles.** Entregar el diff completo, rutas de destino, dependencias y pasos de aplicación/reversión.
5. **Entregas de agentes.** Incluir informe Markdown, changelog, manifiesto, fuentes/parches completos, pruebas reales y ZIP con rutas conservadas. No declarar commits o PR inexistentes.
6. **Limpieza conservadora.** Los archivos de tamaño pequeño no se eliminan solo por su nombre. Se puede retirar un archivo vacío o marcador accidental cuando se ha inspeccionado y no contiene evidencia útil. Mantener intactos dumps, capturas y archivos binarios no identificados hasta clasificarlos.
7. **Seguridad KWP.** No habilitar F0/F1 en barridos, ZF F0, HV-240, actuadores, adaptación, escritura o borrado sin validación específica y revisión.

## Árbol de referencia

- `app/`: aplicación y pruebas.
- `.github/workflows/`: automatización.
- `docs/`: guía de organización y documentación mantenible.
- `archivos/`: referencias, capturas, dumps y archivos de trabajo heredados.
- `opera/`: bitácora e informes de agentes.
- `tools/`: herramientas auxiliares.

## Limpieza realizada en esta rama

- Sustituir el README raíz de seis bytes por una portada con enlaces y límites de seguridad.
- Añadir reglas base de `.gitignore` para outputs Android/Gradle, configuración local, secretos y temporales.
- Añadir este mapa de organización.
- Retirar marcadores vacíos/de prueba inspeccionados y el README en minúsculas duplicado, conservando los archivos históricos con contenido.
- No modificar código de producción ni eliminar el archivo binario `archivos/temp.tmp`, porque la lectura textual no permite clasificarlo con seguridad.
