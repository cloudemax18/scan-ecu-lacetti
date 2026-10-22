# CHANGELOG_CLAUDE_V3.md (nuevo; no reescribe el changelog v2)
## v3 — 2026-10-22 (análisis estático; sin pruebas en vehículo ni APK; sin Gradle)
- Nuevo `CLAUDE_2C_INTEGRATION_PROPOSAL.md`: diseño, flujo de estado, invariantes, riesgos, decisiones pendientes.
- Nuevo parche `0003` (solo archivos nuevos): `DynamicBlockResponseValidator`, `DynamicBlockGate`, `SerialTransactionOwner`, `DynamicBlockDefinitionRunner` + 3 clases de test JUnit (37 pruebas). **No ejecutadas.**
- Nuevo `tools/model_2c_gate.py`: modelo en Python de la lógica, 6 pruebas OK. No es el Kotlin.
- NO hecho: contraste con `MainActivity`/`KwpBus`/`IdProbe`/`KwpProtocol` actuales y parche de integración (faltan esos archivos). No se repite el parche 0002. ZF F0 queda bloqueado por política (`zfEnabled=false`). Sin UI de actuadores, sin `0x30`, sin adaptación, sin HV-240.
- v2 intacto.
