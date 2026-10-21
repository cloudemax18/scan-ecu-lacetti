# Índice de continuidad — CheviExplorer

**Última actualización:** 2026-10-21

## Punto de reanudación
Leer primero [INTEGRACION_BITACORA_CONTINUIDAD.md](INTEGRACION_BITACORA_CONTINUIDAD.md). Contiene el estado conocido, decisiones de seguridad, estado de pruebas, inventario de informes y pasos para retomar el trabajo si se pierde una conversación.

## Documentación de agentes
- Claude: entregables históricos en `opera/claud/`; paquete v2 en `opera/claud/opera_claud_v2/` (incluye `CHANGELOG_CLAUDE.md`, `CLAUDE_2C_DYNAMIC_BLOCKS.md`, `CLAUDE_GAPS_AND_TESTS.md`, JSON/CSV, parches y verificación estática). La revisión está registrada en §12 de la bitácora maestra; la integración 0x2C sigue pendiente.
- DeepSeek: opera/deekseep/DEEPSEEK_INFORME_COMPLETO.md, DEEPSEEK_TECHNICAL_REVIEW.md, DEEPSEEK_BLOCKERS.md, DEEPSEEK_TEST_MATRIX.csv.
- Gemini: opera/gemini/GEMINI_INFORME_COMPLETO.md, GEMINI_PRIMARY_SOURCES.md, GEMINI_SERVICE_PROCEDURES.md, GEMINI_UNRESOLVED_QUESTIONS.md.
- Grok: opera/grok/GROK_INFORME_COMPLETO.md, GROK_AUDIT_CHANGELOG.md, GROK_COMPONENT_MATRIX.md, GROK_SCREEN_SPEC.md, GROK_UI_SYSTEM.md y opera/grok/mockups/.

## Regla de actualización
No reemplazar silenciosamente informes históricos. Añadir estado actual fechado y actualizar la bitácora maestra. Cada paquete externo debe conservar rutas destino, incluir ZIP descargable e informe Markdown. Los agentes no deben afirmar que subieron archivos al repo; el usuario hace la subida manual.

## Limitación
Este estado refleja la revisión estática de Claude v2 del 2026-10-21. Antes de ejecutar nuevos cambios, verificar SHA actual de main, PR y jobs/artefactos de CI.


## Siguiente fase (2026-10-21)
- La revisión de Claude v2 está registrada en la bitácora maestra, §12–13.
- Decisión: no aplicar directamente ninguno de los parches Claude v2. El gate 0x2C debe integrarse al flujo real, validar dirección ECU y serializar transacciones; F0/F1 permanecen fuera del barrido automático.
- Prompts multiagente para la fase siguiente: [PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-21.md](PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-21.md).
- La nueva ronda es propuesta de código + auditoría independiente + investigación de fuentes + revisión UX. No se han ejecutado pruebas de vehículo ni se ha habilitado ninguna operación de actuador.
