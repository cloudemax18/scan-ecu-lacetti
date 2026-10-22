# CheviExplorer

Aplicación Android en desarrollo para investigar y diagnosticar, mediante K-Line/KWP2000 y un adaptador USB KKL, las unidades del Chevrolet Lacetti/Daewoo J200 1.8 LDA automático. El trabajo de referencia incluye Delphi MR-140 y la transmisión ZF 4HP16.

> **Estado y seguridad:** este repositorio contiene código de aplicación, investigación, registros y propuestas de agentes. La presencia de una rutina, trama o mockup no significa que esté validada en un vehículo. Mantener F0/F1 fuera de los barridos automáticos, ZF F0 y HV-240 bloqueados, y actuadores/adaptaciones/escrituras/borrado deshabilitados hasta revisión y evidencia específica.

## Inicio rápido

- **Estado del proyecto y decisiones técnicas:** [Bitácora de integración](opera/INTEGRACION_BITACORA_CONTINUIDAD.md)
- **Índice de continuidad:** [opera/README_CONTINUIDAD.md](opera/README_CONTINUIDAD.md)
- **Prompts multiagente disponibles en main:** [versión del 21 de octubre](opera/PROMPTS_CONTINUACION_MULTIAGENTE_2026-10-21.md). [Versión ampliada en revisión (PR #13)](https://github.com/cloudemax18/scan-ecu-lacetti/pull/13).
- **Investigación KWP y pendientes:** [INVESTIGACION_KWP.md](INVESTIGACION_KWP.md)
- **Auditoría de referencias K-Line:** [AUDITORIA_REFERENCIAS_KLINE.md](AUDITORIA_REFERENCIAS_KLINE.md)
- **Procedimiento del laboratorio KWP:** [KWP_LABORATORIO.md](KWP_LABORATORIO.md)
- **Revisión del portado Delphi:** [PORTADO_DELPHI_ACTUADORES.md](PORTADO_DELPHI_ACTUADORES.md)
- **Mapa y reglas de organización:** [docs/ORGANIZACION_REPOSITORIO.md](docs/ORGANIZACION_REPOSITORIO.md)

## Estructura

| Ruta | Contenido |
| --- | --- |
| `app/` | Aplicación Android, recursos y pruebas Kotlin |
| `.github/workflows/` | Flujos de CI, análisis y generación de artefactos |
| `docs/` | Índices, convenciones y documentación de mantenimiento |
| `archivos/` | Fuentes de referencia, capturas, dumps y materiales de análisis; conservar procedencia |
| `opera/` | Informes históricos y entregas de Claude, DeepSeek, Gemini y Grok |
| `tools/` | Herramientas auxiliares de análisis y verificación |

## Validación

Consultar [GitHub Actions](https://github.com/cloudemax18/scan-ecu-lacetti/actions) para comprobar qué SHA se ejecutó y qué jobs terminaron. Distinguir siempre:

1. análisis estático o revisión documental;
2. pruebas de modelo/scripts;
3. pruebas Kotlin/JUnit y compilación CI;
4. prueba con adaptador USB;
5. prueba física en vehículo.

Una CI verde no demuestra compatibilidad física con MR-140, ZF 4HP16 ni HV-240.

## Desarrollo

- Proyecto Android con Gradle Kotlin DSL.
- No subir claves de firma, contraseñas, tokens, archivos locales de configuración ni artefactos de compilación.
- Mantener los informes de agentes como evidencia histórica; añadir revisiones fechadas en vez de sobrescribirlos silenciosamente.
- Antes de integrar un parche, comprobar que aplica sobre el SHA actual, revisar el diff y ejecutar las pruebas correspondientes.
