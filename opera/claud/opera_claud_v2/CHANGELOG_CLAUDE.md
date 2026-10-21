# CHANGELOG_CLAUDE.md
## v2 — 2026-10-20 (análisis estático; sin pruebas en vehículo ni APK)
- Nuevo `CLAUDE_2C_DYNAMIC_BLOCKS.md`: definiciones `2C` MR-140 F0/F1 y ZF F0 (bytes, checksum, LEN, entradas, respuesta, criterios de aceptación/rechazo, comparación Android).
- `CLAUDE_PARAMETER_MAP.csv`: IDs 67–71 resueltos (código); 10 filas "(sin ID)" para entradas `2C` sin fila de tabla; columna `notas`.
- `CLAUDE_KWP_SEQUENCES.json` (27 entradas): `entradas`, `checksum_calculado`, criterios de aceptación/rechazo, compuerta de lectura, inyectores correctos, precondiciones/abortar, entrada HV-240, preguntas no resueltas; corrección: la casilla de inicio alternativo es `Altinit`.
- Informes actualizados: inventario (§8 IDs 67–71, §9 HV-240), actuadores (ON desfasado / OFF correcto, §6), gaps (§5 pruebas, §6 preguntas).
- `patches/0001` (definiciones `2C` + compuerta + tests JUnit, no tocan `MainActivity`) y `patches/0002` (byte de cilindro ON). Aplican limpio sobre el snapshot (`patch -p1`); **no compilados**.
- `tools/verify_kwp_sequences.py`: 11 pruebas estáticas ejecutadas, OK.
- Límite: contrastado con el snapshot del 2026-10-17; no se leyó el repo vigente ni `opera/claud/` previo, no se mezcló trabajo de otros agentes.
