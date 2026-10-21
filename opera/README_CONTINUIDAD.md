# Índice de continuidad — CheviExplorer

**Última actualización:** 2026-10-20

## Punto de reanudación
Leer primero [INTEGRACION_BITACORA_CONTINUIDAD.md](INTEGRACION_BITACORA_CONTINUIDAD.md). Contiene el estado conocido, decisiones de seguridad, estado de pruebas, inventario de informes y pasos para retomar el trabajo si se pierde una conversación.

## Documentación de agentes
- Claude: opera/claud/CLAUDE_ACTUATOR_AND_ADAPTATION.md, CLAUDE_EXE_FUNCTION_INVENTORY.md, CLAUDE_KWP_SEQUENCES.json, CLAUDE_PARAMETER_MAP.csv. Paquete final pendiente.
- DeepSeek: opera/deekseep/DEEPSEEK_INFORME_COMPLETO.md, DEEPSEEK_TECHNICAL_REVIEW.md, DEEPSEEK_BLOCKERS.md, DEEPSEEK_TEST_MATRIX.csv.
- Gemini: opera/gemini/GEMINI_INFORME_COMPLETO.md, GEMINI_PRIMARY_SOURCES.md, GEMINI_SERVICE_PROCEDURES.md, GEMINI_UNRESOLVED_QUESTIONS.md.
- Grok: opera/grok/GROK_INFORME_COMPLETO.md, GROK_AUDIT_CHANGELOG.md, GROK_COMPONENT_MATRIX.md, GROK_SCREEN_SPEC.md, GROK_UI_SYSTEM.md y opera/grok/mockups/.

## Regla de actualización
No reemplazar silenciosamente informes históricos. Añadir estado actual fechado y actualizar la bitácora maestra. Cada paquete externo debe conservar rutas destino, incluir ZIP descargable e informe Markdown. Los agentes no deben afirmar que subieron archivos al repo; el usuario hace la subida manual.

## Limitación
Este estado refleja la revisión del 2026-10-20. Antes de ejecutar nuevos cambios, verificar SHA actual de main, PR y jobs/artefactos de CI.
