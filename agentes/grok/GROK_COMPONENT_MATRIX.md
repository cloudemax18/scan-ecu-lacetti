# CheviExplorer — Matriz de componentes

**Versión:** 1.2  
**Fecha:** 2026-10-17  
**Estado:** Documento de diseño. No implica que el componente esté extraído como clase reutilizable en código.

| Componente (diseño) | Uso previsto | Análogo en código actual | Variantes de estado |
|---------------------|--------------|--------------------------|---------------------|
| StatusBar | Todas las secciones | `status` TextView + `setStatus` | Desconectado → KWP validado → error |
| ConnectionBadge | Inicio / conexión | Puede unificarse con status | USB / permiso / puerto / KWP / error |
| PrimaryButton | Acciones | `addAction`, botones tint accent | enabled / disabled / running |
| DataRow | Datos en vivo / raw | `liveOutput`, textos de catálogo | válido / pendiente / obsoleto / error / sin datos confirmados |
| DtcList / DtcCard | Diagnóstico | Flujo `readDtcCodes` | con códigos / vacío / error; sin Presente/Histórico inventados |
| EmptyState | Varias | Textos de ayuda en cards | sin adaptador, permiso, sin KWP, servicio no validado |
| LabProgress / labOutput | Laboratorio | `labOutput`, `setLabStatus` | idle / running / completed / stopped |
| LogView | Registro | `log` ScrollView MONOSPACE | — |
| LogExportBar | Registro / Lab | `exportLog` | — |
| ProfileSpinner | Inicio | `ecuProfile` | MR-140, ZF; HV-240 solo si “no habilitado” |
| ActuatorSpinner + ON/OFF/Read | Laboratorio / DriverIM | `actuatorSpinner`, `actuatorOnButton`, `actuatorOffButton`, `actuatorReadButton` | enabled solo MR-140 + puerto (`updateActuatorControlsEnabled`) |
| Screen host | Navegación | `makeScreen` / `showScreen` | — |

## Responsive

| Ancho | Comportamiento |
|-------|----------------|
| Compact | Una columna, botones anchos |
| Landscape | Más altura a log / live; botones accesibles |
