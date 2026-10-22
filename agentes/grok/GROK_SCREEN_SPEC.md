# CheviExplorer — Screen Specifications

**Versión:** 1.2  
**Fecha:** 2026-10-17  
**Revisión:** Post-auditoría independiente; alineación con `MainActivity.kt` reciente  
**Estado:** Especificación de diseño. Aplicado al documento ≠ implementado / ≠ probado en dispositivo.

---

## Clasificación de evidencia (usar en toda la spec)

| Etiqueta | Significado |
|----------|------------|
| CONFIRMADO EN CÓDIGO | Método o flujo presente en el repositorio |
| CONFIRMADO EN CAPTURA | Respuesta documentada (p. ej. INVESTIGACION_KWP) |
| PROBADO EN DISPOSITIVO | Verificado en hardware (esta revisión de diseño no lo declara) |
| PENDIENTE | Sin evidencia suficiente |
| INFERIDO | Hipótesis a validar |

---

## 1. Matriz de correspondencia (métodos verificados en revisión consultada)

Referencias: `MainActivity.kt`, `kwp/IdProbe.kt`, `KwpLaboratoryPlan.kt`, `KwpProtocol.kt`, `DelphiActuatorCatalog.kt`.

| Zona UI actual / propuesta | Método(s) en código | Evidencia | Notas de diseño |
|----------------------------|---------------------|-----------|-----------------|
| Status | `setStatus` | CONFIRMADO EN CÓDIGO | Mantener causa visible en errores |
| Conectar / desconectar | `requestUsbConnection`, `openSerialPort`, cierre de puerto en flujo disconnect | CONFIRMADO EN CÓDIGO | Estados diferenciados (ver §2) |
| Perfil ECU spinner | `ecuProfile` — opciones **MR-140** y **ZF 4HP16** | CONFIRMADO EN CÓDIGO | HV-240: regla única §3 |
| Inicializar ECU | `initializeSelectedEcu`, `classifyInitResult` | CONFIRMADO EN CÓDIGO | Éxito solo con respuesta validada |
| Identificación | `requestEcuIdentification` | CONFIRMADO EN CÓDIGO | Mostrar raw; no inventar campos decodificados |
| Lectura DTC | `readDtcCodes` | CONFIRMADO EN CÓDIGO | Borrado: no habilitar sin secuencia validada |
| Live / IDs 0x21 | `readConfirmedParameterIds`, `startLiveParameterPolling`, `stopLiveParameterPolling`, `probeLocalIdentifiers`, `runLocalIdentifierScan` | CONFIRMADO EN CÓDIGO | Hex + “Sin datos confirmados” |
| Catálogo Delphi (texto) | `showDelphiCatalog`, `refreshLiveCatalogText` | CONFIRMADO EN CÓDIGO | No equivale a fórmulas validadas |
| Laboratorio plan IDs | `KwpLaboratoryPlan.baseIds` / `extendedIds`; `validateLiveParameterMap`, `confirmExtendedLocalIdentifierScan` | CONFIRMADO EN CÓDIGO | Contadores: ver definiciones §6 |
| Sondeo IdProbe | `IdProbe.sondear` | CONFIRMADO EN CÓDIGO | Estados: positiva / NRC / sin respuesta/timeout/checksum (agrupado en código) |
| Detener barrido / live | `stopLiveParameterPolling` | CONFIRMADO EN CÓDIGO | UI ya expone acción; mensaje indica que consultas ya iniciadas pueden terminar su espera — **no** afirmar cancelación instantánea de todo el pipeline sin más verificación |
| Exportar log | `exportLog` | CONFIRMADO EN CÓDIGO | Conservar |
| Actuadores MR-140 UI | `updateActuatorControlsEnabled`, `selectedMr140Actuator`, `readMr140ActuatorState`, `confirmMr140ActuatorControl`, `runMr140ActuatorTransaction`, `exchangeMr140ActuatorFrame` | CONFIRMADO EN CÓDIGO | Catálogo desde EXE; **validación en vehículo y seguridad: PENDIENTE / no declarar PROBADO EN DISPOSITIVO** |
| Tester Present auto | `startAutomaticTesterPresent` | CONFIRMADO EN CÓDIGO | No confundir con identificación de ECU |

Si un símbolo cambia de nombre en un commit futuro, actualizar esta matriz; no inventar métodos.

---

## 2. Estados de conexión y comunicación

Orden lógico (no equivalencias):

1. USB no detectado  
2. Permiso USB pendiente o denegado  
3. Adaptador detectado (VID/PID)  
4. Puerto serie abierto (baud = ajuste de puerto, no prueba de ECU)  
5. Inicialización KWP en curso  
6. Comunicación KWP validada (respuesta esperada + checksum OK según `classifyInitResult` / capturas)  
7. ECU objetivo identificada (solo si hay evidencia de identificación; bytes raw ≠ decodificación de fabricante/HW/SW)  
8. Consulta en curso  
9. Error recuperable (causa visible + Reintentar / Desconectar)  
10. Desconexión durante operación  

**Reglas:**
- Adaptador detectado ≠ ECU conectada.
- Baud seleccionado ≠ KWP establecido.
- Éxito de comunicación solo con evidencia de respuesta, no solo por abrir puerto.

---

## 3. Perfiles de ECU — regla única HV-240

| Perfil | En spinner actual | Operaciones de diagnóstico |
|--------|-------------------|----------------------------|
| Motor Delphi MR-140 (0x11) | Sí | Según capacidades CONFIRMADO EN CÓDIGO / CAPTURA |
| Transmisión ZF 4HP16 (0x18) | Sí | Según capacidades propias; no heredar motor |
| Motor Delphi HV-240 | **No en spinner actual** | **Regla de diseño v1.2:** si se muestra, etiqueta **“Pendiente de validación — conexión no habilitada”** y **bloquear** init/lectura/actuadores hasta confirmar dirección, StartCommunication y respuestas propias. **No** reutilizar automáticamente 0x11 ni secuencias MR-140. |

**Perfil seleccionado ≠ ECU identificada.**

### Capacidades (resumen)

| Función | MR-140 | HV-240 | ZF 4HP16 |
|---------|--------|--------|----------|
| StartCommunication en captura | CONFIRMADO EN CAPTURA | PENDIENTE | CONFIRMADO EN CAPTURA |
| UI / métodos init | CONFIRMADO EN CÓDIGO | PENDIENTE (bloquear) | CONFIRMADO EN CÓDIGO |
| DTC read request en código | CONFIRMADO EN CÓDIGO | PENDIENTE | CONFIRMADO EN CÓDIGO |
| 0 DTC en captura | CONFIRMADO EN CAPTURA (MR-140) | PENDIENTE | PENDIENTE (no generalizar “0 DTC”) |
| IDs 0x21 bytes | CONFIRMADO EN CAPTURA (02/03/04 etc.) | PENDIENTE | CONFIRMADO EN CAPTURA (varios IDs) |
| Decodificación / unidades | PENDIENTE | PENDIENTE | PENDIENTE |
| Borrado DTC UI | No habilitar | No habilitar | No habilitar |
| Actuadores DriverIM | Código + catálogo EXE (CONFIRMADO EN CÓDIGO); validación vehículo PENDIENTE | No | No habilitado (texto en UI: destino 0x11) |

---

## 4. Datos en vivo e identificación

Cada fila debe poder mostrar:

1. Identificador / consulta KWP  
2. Respuesta bruta (hex)  
3. Valor decodificado **solo si** fórmula validada en vehículo  
4. Unidad **solo si** confirmada  
5. Timestamp de última lectura válida  
6. Estado: válido | pendiente de validación | obsoleto | error  

- Sin interpretación confirmada → hex + **“Sin datos confirmados”**.  
- No mostrar valor antiguo como “actual” tras fallo o parada.  
- **Favoritos de IDs:** opcional / futuro; no requisito de la primera integración (no hay almacenamiento confirmado como requisito).  
- Identificación ECU: etiquetar bytes por ID; raw ≠ mapa de fabricante/hardware/software validado.

---

## 5. Diagnóstico DTC

- Lectura separada de borrado.  
- **Borrar DTC:** deshabilitado hasta secuencia exacta + evidencia por perfil.  
- No inventar Presente / Histórico / Pendiente sin respuesta validada que los distinga.  
- Sin descripción en catálogo → código + “Sin descripción confirmada”.  
- **“0 DTC” solo** donde la captura del perfil lo respalde (MR-140 documentado). Para ZF/HV-240 u otros: “resultado no confirmado para este perfil” o mostrar respuesta bruta — **no** presentar 0 DTC como universal.

---

## 6. Laboratorio KWP — contadores (definiciones operativas)

Basado en lo que `IdProbe.sondear` distingue hoy:

| Categoría UI | Definición operativa | En código actual |
|--------------|----------------------|------------------|
| Planificados | Número de IDs en la lista del barrido (`ids.size` / plan) | CONFIRMADO EN CÓDIGO (listas en plan / IdProbe.IDS) |
| Intentos | Una transacción iniciada por ID en el bucle | INFERIDO / contar por resultados.size |
| Positivos | SID 0x61 y payload coherente con ID | CONFIRMADO EN CÓDIGO (rama sid == 0x61) |
| NRC | SID 0x7F con código NRC | CONFIRMADO EN CÓDIGO |
| Sin respuesta / timeout / checksum | `frame == null` u estado agrupado en IdProbe | CONFIRMADO EN CÓDIGO como **cadena agrupada** — **no** afirmar contadores separados de timeout vs checksum inválido vs sin respuesta si el código no los separa |
| Respuesta inesperada / trama corta | Otras ramas de IdProbe | CONFIRMADO EN CÓDIGO |

**Reglas de diseño:**
- No inventar contadores que el código no separe.  
- Un timeout no se cuenta también como NRC.  
- Una respuesta inválida no se cuenta como positiva.  
- Estado final: completado | detenido por usuario | error.  
- Botón Detener: visible; llama `stopLiveParameterPolling()`. Documentar el comportamiento real (parada cooperativa; consultas ya en espera pueden terminar) — no afirmar aborto inmediato de todo el bus sin evidencia adicional.

Exportación: `exportLog()` de solicitudes/respuestas disponibles en el registro.

---

## 7. Servicio y actuadores — matriz por procedimiento

**No** declarar de forma global que “no deben existir” funciones de servicio.  
**No** inventar actuadores.  
Controles de ejecución permanecen sujetos a validación y seguridad.

### 7.1 Catálogo DriverIM MR-140 (CONFIRMADO EN CÓDIGO + origen EXE)

Fuente de labels/IDs: `DelphiActuatorCatalog.mr140` (reconstruido desde menú DriverIM / Graf.pas según comentarios del código). Destino 0x11. ZF no habilitado para esta rutina en el código revisado.

| Procedimiento (label catálogo) | localId | Notas de trama (código) | Precondiciones (texto UI actual, no PROBADO EN DISPOSITIVO aquí) | Estado UI diseño |
|--------------------------------|---------|-------------------------|-------------------------------------------------------------------|------------------|
| Prueba inyector 1..4 | 0x32 + índice | service 0x30, control según ON/OFF | Motor apagado, contacto ON, P/N, freno; manos lejos de partes móviles | Código presente; **validación vehículo PENDIENTE**; confirmar riesgos antes de uso real |
| Relé A/C | 0x15 | 0x30 … | Idem | Igual |
| Relé ventilador baja/alta | 0x13 / 0x14 | 0x30 … | Idem | Igual |
| MIL | 0x10 | 0x30 … | Idem | Igual |
| Relé bomba combustible | 0x12 | 0x30 … | Idem | Igual |
| Lazo retroalimentación combustible | 0x37 | 0x30 … | Idem | Igual |
| Regulador ralentí | 0x18 | 0x30 … | Idem | Igual |
| Calentador sonda lambda | 0x40 | 0x30 … | Idem | Igual |
| Leer estado | — | 0x30 01 | — | `readMr140ActuatorState` |
| Activar 3 s / Desactivar | — | 0x30 07 FF / 00 | OFF automático tras 3 s intentado; si se pierde enlace no se garantiza liberación | `confirmMr140ActuatorControl` |

**Criterio de aceptación de diseño:** la UI puede exponer el catálogo y los botones **solo** con advertencias visibles, perfil MR-140, y controles deshabilitados cuando el perfil no sea MR-140 o no haya puerto (`updateActuatorControlsEnabled`). No declarar “seguro en vehículo” sin PROBADO EN DISPOSITIVO.

### 7.2 Adaptación de acelerador (Obuchenie / throttle)

- En `KwpProtocol` existe reconstrucción `buildMr140ThrottleAdaptationRequest` (service 0x30, 0x2C, …) — CONFIRMADO EN CÓDIGO en revisiones que la incluyen.  
- **Estado de interfaz designado:** **pendiente de extracción y validación de la rutina completa** del EXE (precondiciones, secuencia de salida, resultado esperado).  
- **No** confundir adaptación con prueba de otros actuadores.  
- Controles de ejecución de adaptación: **deshabilitados** en UI de diseño hasta completar verificación documentada (bytes literales, perfil, precondiciones, salida, evidencia).

### 7.3 Otros actuadores / ZF

- No inventar.  
- ZF: no habilitar sin reconstruir rutina original (coherente con texto de UI actual).

---

## 8. Registro / Ajustes

- Log mono + exportar + limpiar: conservar (`exportLog`).  
- Ajustes: baud (existe), tema light PENDIENTE, acerca de, actualizaciones (`checkForUpdates` etc. si presentes).

---

## 9. Navegación

Alinear con `showScreen` / secciones ya construidas en `buildUi`. No exigir bottom nav de 5 ítems. Agrupar si el ancho lo requiere.
