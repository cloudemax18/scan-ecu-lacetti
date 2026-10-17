# CheviExplorer UI — Informe completo (revisión 1.2)

**Fecha:** 2026-10-17  
**Versión:** 1.2  
**Material de entrada:** Auditoría independiente v1.1; `MainActivity.kt` (UI multi-pantalla, colores actuales, DriverIM); `IdProbe.kt`; `KwpLaboratoryPlan.kt`; `DelphiActuatorCatalog.kt`; `KwpProtocol.kt`; INVESTIGACION_KWP (capturas previas).  
**Alcance:** Corrección de especificación de diseño. **No se autoriza ni se realiza cambio de código en esta entrega.**

---

## 1. Respuesta a la lista de aceptación de la auditoría

| Criterio de aceptación | Cumplimiento en v1.2 |
|------------------------|----------------------|
| Paleta con colores reales del código o marcada como rediseño | **Sí** — base = código; error token propuesto como diseño a medir |
| HV-240 no conectable hasta evidencia; no reutiliza MR-140 | **Sí** — regla única en SCREEN_SPEC §3 |
| Servicio: matriz por procedimiento EXE / evidencia / estado | **Sí** — §7 actuadores + adaptación pendiente |
| CONFIRMADO EN CÓDIGO / CAPTURA / PROBADO EN DISPOSITIVO | **Sí** — en system, screen e informe |
| Métodos de la matriz verificados contra revisión actual | **Sí** — lista de métodos de MainActivity consultada |
| DTC “0” limitado al perfil/captura | **Sí** |
| Contadores lab definidos; no inventados | **Sí** — alineados a IdProbe |
| Accesibilidad comprobable, no conformidad previa | **Sí** |
| Changelog distingue documento vs código | **Sí** — “Aplicado al documento” |
| Cinco documentos actualizados | **Sí** |

---

## 2. Decisiones principales (1.2)

1. **Paleta:** la fuente de verdad visual actual es `#0C0C0E` / `#17171B` / `#007AFF` / `#FFFFFF` / `#A0A0AB` / `#2B2B32`. Se abandona la descripción incorrecta de `#101820` como “ya usado”.
2. **HV-240:** una sola regla — no habilitado hasta evidencia propia; sin herencia automática de MR-140.
3. **Actuadores:** documentar el catálogo DriverIM presente en código y el origen EXE; no declarar seguridad en vehículo; adaptación de acelerador como pendiente de validación de rutina completa; no inventar otros actuadores.
4. **Evidencia graduada:** se deja de usar “CONFIRMADO” ambiguo que pueda leerse como prueba en dispositivo.
5. **Laboratorio:** contadores solo donde el código distingue ramas; timeout/checksum pueden estar agrupados.
6. **Views:** se mantiene la estrategia de no forzar Compose.
7. **Esta entrega no modifica el repositorio de la app** y no declara PROBADO EN DISPOSITIVO.

---

## 3. Incompatibilidades v1.1 corregidas

| Problema auditoría | Corrección 1.2 |
|--------------------|----------------|
| Colores inventados como “ya usados” | Tokens = valores de `buildUi()` |
| HV-240 contradictorio | Bloqueo explícito |
| “No servicio” global vs EXE/código | Matriz por procedimiento |
| Confirmado ≈ funciona en dispositivo | Tres niveles + PENDIENTE |
| Detener “cableado real” sin matices | `stopLiveParameterPolling` + parada cooperativa |
| 0 DTC genérico | Solo captura MR-140 donde aplica |
| Contadores lab genéricos | Definiciones vs IdProbe |
| Accesibilidad “cumple” | Requisitos a medir |

---

## 4. Evidencia consultada (esta revisión)

| Fuente | Resultado relevante |
|--------|---------------------|
| `MainActivity.kt` colores | `pageBackground 0xFF0C0C0E`, `cardBackground 0xFF17171B`, `accent 0xFF007AFF`, etc. |
| `MainActivity.kt` métodos | requestUsbConnection, openSerialPort, initializeSelectedEcu, readDtcCodes, probeLocalIdentifiers, stopLiveParameterPolling, exportLog, bloque actuadores MR-140, showScreen, etc. |
| `DelphiActuatorCatalog.kt` | Lista MR-140 IDs 0x32 (inyectores), 0x15, 0x13, 0x14, 0x10, 0x12, 0x37, 0x18, 0x40 |
| `IdProbe.kt` | Estados positiva / NRC / sin respuesta/timeout/checksum agrupado / trama corta / inesperada |
| `KwpLaboratoryPlan.kt` | baseIds 01–40 + F0/F1/FB; extendedIds |
| INVESTIGACION_KWP (histórico) | Capturas StartCommunication / DTC / 0x21 por perfil |
| Auditoría externa v1.1 | Lista P0–P2 de aceptación |

**No ejecutado:** APK en vehículo ni batería de pruebas instrumentadas en esta pasada de diseño.

---

## 5. Matriz de trazabilidad (resumen)

| Requisito | Pantalla | Función código | Evidencia | Cambio diseño 1.2 | Criterio aceptación |
|-----------|----------|----------------|-----------|-------------------|---------------------|
| Conexión USB | Inicio | requestUsbConnection / openSerialPort | CÓDIGO | Estados diferenciados | Causa visible si falla |
| Init KWP | Inicio/Lab | initializeSelectedEcu / classifyInitResult | CÓDIGO + CAPTURA (perfiles documentados) | Éxito solo con respuesta | No éxito solo por puerto abierto |
| HV-240 | Perfil | — | PENDIENTE | No conectable | Operaciones bloqueadas |
| DTC read | Diagnóstico | readDtcCodes | CÓDIGO; 0 DTC CAPTURA MR-140 | No generalizar 0 DTC | Texto por perfil |
| Live raw | Datos | polling / probe | CÓDIGO + CAPTURA bytes | Sin fórmulas inventadas | “Sin datos confirmados” |
| Lab stop | Lab | stopLiveParameterPolling | CÓDIGO | Documentar cooperativa | Usuario ve solicitud de parada |
| Actuadores MR-140 | Lab | confirmMr140ActuatorControl et al. | CÓDIGO + catálogo EXE | Matriz + advertencias | Sin “probado seguro” sin dispositivo |
| Adaptación acelerador | Servicio | buildMr140ThrottleAdaptationRequest (si presente) | CÓDIGO parcial | UI deshabilitada / pendiente validación | No ejecutar hasta rutina completa |
| Export | Registro | exportLog | CÓDIGO | Conservar | Archivo exportable |

---

## 6. Limitaciones

- El código de la app **sigue evolucionando**; la matriz de métodos debe re-verificarse en el SHA exacto antes de integrar UI.
- No hay declaración PROBADO EN DISPOSITIVO en este informe.
- Contadores de laboratorio separados (timeout vs checksum) pueden requerir cambio de código futuro; el diseño no los inventa.
- Contraste del token error propuesto (`#FF3B30`) debe medirse antes de adoptarlo.

---

## 7. Pendientes para el equipo de implementación

1. Re-contrastar matriz de métodos con el commit a integrar.  
2. Decidir si HV-240 aparece en spinner (solo “no habilitado”) o se omite hasta captura.  
3. Política de producto sobre DriverIM: ¿mantener UI de actuadores con fuertes advertencias o ocultar hasta pruebas en vehículo firmadas?  
4. Completar ficha de **adaptación de acelerador** (bytes, precondiciones, salida) desde EXE antes de cualquier control.  
5. Medir pares de contraste y touch targets sobre la UI real.  
6. Tras P0 de diseño: cambios de UI en PRs pequeños; compilación y prueba en vehículo **separadas**.

---

## 8. Criterio de finalización de esta revisión de diseño

- Cinco documentos v1.2 coherentes entre sí.  
- Puntos P0 de la auditoría independiente abordados en documentación.  
- Sin cambios de protocolo ni nuevos comandos ECU introducidos por el diseño.  
- Sin afirmación de “aprobado para producción” ni “probado en dispositivo”.  

**Siguiente paso recomendado por la auditoría:** con P0 documentales cerrados, contrastar de nuevo con el SHA de implementación y solo entonces modificar Kotlin en incrementos pequeños.
