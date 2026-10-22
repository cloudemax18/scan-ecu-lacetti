# GROK UI Audit — Prompt 4 (auditoría de UI y plan incremental)

**Fecha:** 2026-10-20  
**SHA de partida (`main`):** `8fdd627370e88acce253d774916b66e36e47b1c2`  
**Commit de referencia:** *Fix MR-140 injector selector for all cylinders* (2026-10-21T01:42:12Z)  
**Alcance:** solo `opera/grok/` y mockups HTML. **No** se modificó Kotlin, recursos `app/src/main/`, protocolo ni pruebas.  
**Autor de esta auditoría:** Grok (diseño UX/UI + consistencia visual).

---

## 1. Distinción obligatoria: mockup ≠ APK

| Artefacto | Qué es | Qué no es |
|-----------|--------|-----------|
| HTML en `opera/grok/mockups/` | Referencia visual de diseño | Captura del APK, prueba de implementación |
| `MainActivity.buildUi()` | UI real (Android Views programáticas) | No usa Compose; no usa layouts XML de pantallas |
| Este informe | Auditoría y plan de integración incremental | Declaración de “pantalla ya implementada” |

**No se usa ningún mockup como evidencia de que el APK ya muestra esa interfaz.**

---

## 2. Evidencia consultada

### 2.1 Documentos `opera/grok/` (locales + remoto)
- `GROK_INFORME_COMPLETO.md`, `GROK_AUDIT_CHANGELOG.md`, `GROK_COMPONENT_MATRIX.md`, `GROK_SCREEN_SPEC.md`, `GROK_UI_SYSTEM.md`
- `GROK_MOCKUP_INFORME.md`, `GROK_MOCKUP_CHANGELOG.md` (entrega mockups 1.2.1)
- `mockups/README_MOCKUPS.md` y siete HTML (+ `index.html` local)

**Nota:** en `main` remoto los mockups siguen en tamaños de v1.2 (oct-17). Los HTML locales de esta sesión incluyen correcciones 1.2.1 + incrementos Prompt 4; deben sincronizarse vía PR/commit del mantenedor.

### 2.2 Código real (`app/src/main/`)
- `MainActivity.kt` (~2045 líneas): `buildUi()`, `makeScreen` / `showScreen`, spinners, botones, estados `setStatus`
- `KwpLaboratoryPlan.kt`: `baseIds`, `extendedIds`, `deferredDynamicIds = [0xF0, 0xF1]`
- `DelphiActuatorCatalog.kt`: catálogo MR-140 DriverIM

### 2.3 Tokens de color en código (CONFIRMADO EN CÓDIGO)

| Token | Valor | Uso en `buildUi()` |
|-------|-------|---------------------|
| Fondo | `#0C0C0E` | `pageBackground` |
| Superficie | `#17171B` | `cardBackground` |
| Accent | `#007AFF` | títulos, nav activa |
| Texto | `#FFFFFF` | primario |
| Texto sec. | `#A0A0AB` | status, subtítulos |
| Borde | `#2B2B32` | stroke de cards |
| ON actuador | `#1E9E66` | tint botón Activar |
| OFF actuador | `#FF9500` | tint botón Desactivar |
| Error | `#FF3B30` | **PROPUESTO** (no constante en código revisado) |

### 2.4 Pantallas reales del APK (CONFIRMADO EN CÓDIGO)

`navNames`: **Inicio · Diagnóstico · Datos ECU · En vivo · Pruebas · Registro · Ajustes** (7 secciones, no 5).

Perfiles en spinner: **solo** `"Motor Delphi MR-140"`, `"Transmisión ZF 4HP16"`. **HV-240 no está en el spinner.**

---

## 3. Auditoría por archivo de mockup

### `01_inicio.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Badge puerto abierto en verde en versiones antiguas | Alta (honestidad de estado) | Corregido en 1.2.1 (accent azul) |
| Listaba HV-240 como opción de perfil | Media | Ajustado: texto “spinner real solo MR-140/ZF; HV-240 no disponible” |
| Nav de 5 ítems vs 7 del APK | Baja (referencia) | Documentado; no obligatorio copiar 5 tabs |
| Acciones “Ir a Diagnóstico / Lab” como botones aparte | Baja | En APK la nav inferior cambia de sección |

### `02_conexion_kkl.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Presenta pantalla dedicada de pasos | Media (diseño vs código) | En APK la conexión vive en Inicio + `setStatus` + log; mockup es **objetivo de claridad**, no copia 1:1 |
| Catálogo de estados incompleto en v1.2 remota | Alta | Completado en 1.2.1 (USB, permiso, puerto, init, validado, timeout, NRC, desconexión) |
| Confundir baud con KWP | Alta | Texto mockup y código alineados: *protocolo ECU sin validar* tras abrir puerto |

### `03_diagnostico_dtc.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Generalizar “0 códigos” a todos los perfiles | Alta | Variantes A/B/C en 1.2.1 |
| Borrar DTC visible como disponible | Crítica | Disabled en mockup; **no hay clear DTC** en MainActivity revisado |
| Estados Presente/Histórico inventados | Alta | Evitados; descripción “Sin descripción confirmada” |

### `04_datos_en_vivo.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Valores decodificados sin fórmula | Crítica | Mockup usa hex + “Sin datos confirmados” |
| Favoritos como requisito | Baja | Marcado opcional/futuro |

### `05_laboratorio_kwp.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| F0/F1 como parte del barrido base en copy | Alta | **Código:** `deferredDynamicIds` excluye F0/F1 de `baseIds`; **bug de etiqueta APK:** botón aún dice “01–40, F0, F1, FB”. Mockup actualizado: base = 01–40+FB; F0/F1 aplazados |
| Contadores inventados (timeout vs checksum) | Media | Alineados a agrupación IdProbe |
| Actuadores en mockup aparte vs en misma sección Pruebas | Info | Ver §4 matriz |

### `06_servicio_actuadores.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Actuadores como pantalla top-level | Baja | En APK están dentro de **Pruebas**; mockup separado es especificación de jerarquía futura o card |
| Presentar ZF/HV con controles | Crítica | Empty state correcto |
| Omitir advertencias / validación pendiente | Alta | Advertencias y “no PROBADO EN DISPOSITIVO” presentes |
| Adaptación acelerador ejecutable | Crítica | UI deshabilitada en copy mockup |

### `07_flujo_navegacion.html`
| Problema | Severidad | Estado |
|----------|-----------|--------|
| Flujo 5 tabs no refleja APK | Media | Documentadas 7 secciones reales |
| Falta mapa mockup→método | Media | Cubierto en matriz §4 |

### `README_MOCKUPS.md` (remoto v1.2)
- Desactualizado respecto a 1.2.1 y Prompt 4; debe actualizarse en el mismo PR de sincronización.

---

## 4. Matriz de pantallas (función real · UX · cambio mínimo)

| Pantalla (diseño / APK) | Función real disponible (código) | Estado actual UI APK | Problema UX | Cambio mínimo propuesto | Accesibilidad | Dependencia técnica |
|-------------------------|----------------------------------|----------------------|-------------|-------------------------|---------------|---------------------|
| Inicio | `setStatus`, spinner perfiles, `requestUsbConnection`, `openSerialPort`, `initializeSelectedEcu` | Implementada (Views) | Status mono-línea; no escalera de estados | Mejorar textos de `setStatus` por fase; no añadir HV-240 al spinner | Status legible; botones ≥48dp | Ninguna de protocolo |
| Conexión (diseño) | Mismos métodos; permiso USB callback | **No es pantalla aparte** | Usuario no ve checklist | Opcional: card de pasos en Inicio *o* mantener solo status+log | Anunciar cambios con `setStatus` claro | No duplicar transporte |
| Diagnóstico / DTC | `readDtcCodes` | Implementada | “0 DTC” sin matiz de perfil | Mensaje según perfil/captura; borrar no añadir | Lista legible | Parser DTC existente |
| Datos ECU | Identificación / raw | Implementada (TextViews) | Raw vs decodificado | Etiquetar raw explícitamente | — | Sin fórmulas nuevas |
| En vivo | `startLiveParameterPolling`, `stopLiveParameterPolling`, `validateLiveParameterMap` | Implementada | Riesgo de leer hex como medida | Badge “Sin datos confirmados” en UI real | Tipografía mono para hex | Catálogo IDs confirmados |
| Pruebas / Lab | `runLocalIdentifierScan`, `IdProbe`, `exportLog` | Implementada | Etiqueta botón cita F0/F1 | **Cambiar label del botón** a “01–40, FB” (sin F0/F1) | Progreso comprensible | `KwpLaboratoryPlan.baseIds` ya correcto |
| Actuadores (en Pruebas) | `readMr140ActuatorState`, `confirmMr140ActuatorControl`, `updateActuatorControlsEnabled` | Implementada (MR-140) | Pueden parecer “seguros” | Mantener diálogos/warnings; no habilitar en ZF | Confirmación explícita | Solo destino 0x11 |
| HV-240 | — | **No en spinner** | Si se añade mal, conexión falsa | No añadir hasta evidencia; si se lista, disabled + “no validada” | — | Evidencia propia |
| F0/F1 exploración | `deferredDynamicIds` | Excluidos de scans | Label engañoso | Quitar F0/F1 del texto del botón | — | 0x2C dinámico aplazado |
| Borrar DTC / reset / adaptación | No clear DTC en MainActivity | No disponible | Botones fantasma | No mostrar o disabled permanente hasta diseño seguro | — | Validación EXE |
| Registro | `exportLog`, log TextView | Implementada | — | Conservar | — | — |
| Ajustes | baud spinner, notas | Implementada | — | Baud ≠ prueba KWP (ya en copy) | — | — |
| Error / desconexión | `setStatus`, toasts | Parcial | Recuperación poco guiada | Botones Reintentar/Desconectar explícitos en status | — | Estados de puerto |

**Leyenda de evidencia:** funciones listadas = CONFIRMADO EN CÓDIGO en SHA citado. “Implementada” = existe en `buildUi`/métodos; **≠ PROBADO EN DISPOSITIVO** salvo capturas externas no usadas aquí.

---

## 5. Criterios de aceptación (mockup vs futura captura APK)

Para cada pantalla, al comparar **captura real del APK** con el mockup:

1. **Paleta:** fondo/superficie/accent medibles ≈ tokens de código (± contraste medido).
2. **Estados de conexión:** no se muestra verde “OK” solo por puerto abierto; texto distingue puerto / KWP / ECU identificada.
3. **HV-240:** no aparece como conectable; si aparece, disabled + “no validada”.
4. **F0/F1:** no se ofrecen como IDs de exploración ejecutables en UI; label de barrido base sin F0/F1.
5. **Datos en vivo:** hex o “Sin datos confirmados” cuando no hay fórmula verificada; nunca RPM/°C inventados.
6. **DTC:** sin botón Borrar activo; “0 códigos” solo con evidencia de ese perfil.
7. **Actuadores:** solo MR-140; warnings visibles; ZF sin controles.
8. **Navegación:** las 7 secciones del APK siguen siendo alcanzables; mockup de 5 tabs no se usa como requisito de producto.
9. **Táctil:** controles primarios ≥ 48 dp en densidad de referencia.
10. **Honestidad:** ningún control parece funcional si `isEnabled=false` o no hay handler seguro.

---

## 6. Decisiones de diseño

1. **Views, no Compose** — el APK actual es 100 % Views programáticas; el diseño no impone migración.
2. **Mockups como referencia, no como verdad de runtime** — la fuente de verdad de capacidades es el código en el SHA de partida.
3. **Estados graduados** — solo los que el código puede sustentar: desconectado, permiso denegado, puerto abierto, init, respuesta/NRC/timeout, lectura bruta, pendiente de validación.
4. **HV-240** — fuera del spinner; no inventar entrada “conectable”.
5. **F0/F1** — aplazados en plan; la UI (y mockups) no deben presentarlos como explorables activos.
6. **Token error `#FF3B30`** — propuesta de diseño; medir contraste antes de promoverlo a constante de código.
7. **Actuadores en Pruebas** — coherente con APK; mockup 06 sigue siendo válido como zoom de esa card.

---

## 7. Riesgos

| Riesgo | Mitigación |
|--------|------------|
| Usuario interpreta mockup como APK terminado | Badges “MOCKUP REVISADO · no PROBADO EN DISPOSITIVO” |
| Label F0/F1 en APK induce exploración incorrecta | Cambio de texto de botón (Kotlin mínimo, fuera de este alcance de archivos) |
| Añadir HV-240 al spinner sin init propio | Política: no en UI hasta evidencia |
| Actuadores usados en vehículo sin validación | Warnings + confirmación; no declarar seguros |
| PR que mezcle UI docs con protocolo | Rama solo `opera/grok/` |

---

## 8. Plan de implementación incremental (solo UI, sin protocolo)

| Paso | Trabajo | Quién | Criterio hecho |
|------|---------|-------|----------------|
| 0 | Sincronizar mockups 1.2.1 + Prompt 4 a `opera/grok/` en rama `ui/mockup-audit-2026-10-20` | Mantenedor + este pack | Archivos en repo = este informe |
| 1 | Corregir label botón lab: quitar “F0, F1” del texto | Dev Kotlin (PR aparte) | Label = baseIds reales |
| 2 | Refinar `setStatus` strings (puerto vs KWP) si aún ambiguos | Dev | Coincide §5.2 |
| 3 | Badge “Sin datos confirmados” en filas en vivo (Views) | Dev | Criterio 5 |
| 4 | Mensajes DTC por perfil | Dev | Criterio 6 |
| 5 | Medir contraste / touch targets en dispositivo | QA | Criterios 1 y 9 |
| 6 | No habilitar HV-240 / clear DTC / F0-F1 dinámicos | Producto | Criterios 3–4, 6 |

Pasos 1–5 **no** están hechos en esta entrega (no se tocó Kotlin).

---

## 9. Pruebas realmente ejecutadas

| Prueba | Resultado |
|--------|-----------|
| Lectura SHA `main` vía API GitHub | `8fdd627370e88acce253d774916b66e36e47b1c2` |
| Lectura `MainActivity.kt` / `KwpLaboratoryPlan.kt` / `DelphiActuatorCatalog.kt` | Completada |
| Comparación tokens color código ↔ docs | Alineados |
| Auditoría de 7 HTML locales | Completada |
| Comparación tamaños mockup remoto vs local | Remoto aún v1.2; local 1.2.1+ |
| Apertura HTML en navegador automatizada | No ejecutada en esta sesión |
| Compilación APK / prueba en vehículo | **No ejecutada** |
| Apertura de PR en GitHub | **No posible** desde esta sesión (sin push credentials) |

---

## 10. Git y PR (coordinación)

**Rama sugerida:** `ui/mockup-audit-2026-10-20` desde `main` @ `8fdd627…`

**Archivos a incluir (solo `opera/grok/`):**
- Mockups HTML actualizados + `index.html` + `README_MOCKUPS.md`
- `GROK_UI_AUDIT_PROMPT4.md` (este informe)
- `GROK_MOCKUP_CHANGELOG.md` / `GROK_MOCKUP_INFORME.md` si se mantienen
- Specs v1.2 existentes sin reescritura total

**PR (a abrir por el mantenedor):**
- Título: `docs(ui): auditoría mockups Prompt 4 + criterios de aceptación`
- Cuerpo: lista de cambios por archivo, SHA de partida, enlace a este informe, capturas de HTML en navegador (no del APK)
- **Enlace al PR:** *pendiente — no creado desde Grok (sin autenticación de escritura al repo)*

---

## 11. Archivos modificados / generados en esta entrega

```
opera/grok/GROK_UI_AUDIT_PROMPT4.md          (nuevo — este informe)
opera/grok/mockups/01_inicio.html            (ajuste perfiles vs spinner real)
opera/grok/mockups/05_laboratorio_kwp.html   (F0/F1 aplazados; nota label APK)
opera/grok/mockups/07_flujo_navegacion.html  (7 secciones APK documentadas)
opera/grok/mockups/*                         (base 1.2.1 previa conservada)
```

**No modificados:** cualquier `.kt`, `res/`, tests, protocolo.

---

## 12. Pendientes

1. Commit/PR del mantenedor con este pack en `opera/grok/`.
2. PR Kotlin mínimo: label del botón de barrido base sin F0/F1.
3. Medición de contraste y táctiles en dispositivo real.
4. Capturas APK post-cambio para contrastar criterios §5 (no usar mockups como prueba).
5. Decisión de producto sobre card de “pasos de conexión” vs status+log actual.

---

## 13. Resumen ejecutivo

La UI real es **Android Views** en una sola `MainActivity` con **siete secciones**. Los mockups HTML son referencia; varios problemas de honestidad (puerto vs KWP, DTC, hex, ZF/HV, F0/F1) ya estaban mitigados en 1.2.1 o se ajustaron aquí. El hallazgo de código más relevante para UX: **`KwpLaboratoryPlan` aplaza F0/F1, pero el botón de lab aún los nombra** — corrección de texto pendiente en Kotlin. Esta entrega no implementa esa corrección ni abre el PR; entrega el informe, la matriz y los mockups listos para rama `ui/mockup-audit-2026-10-20`.
