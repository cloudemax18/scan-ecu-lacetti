# CheviExplorer — Design System (Android)

**Versión:** 1.2  
**Fecha:** 2026-10-17  
**Revisión:** Corrección post-auditoría independiente v1.1  
**Documentos de entrada:** Auditoria_CheviExplorer_UI_v1.1_para_Grok.md; código `MainActivity.kt` (rev. reciente ~2045 líneas), `KwpProtocol.kt`, `IdProbe.kt`, `KwpLaboratoryPlan.kt`, `DelphiActuatorCatalog.kt`  
**Alcance:** Solo interfaz y experiencia de usuario. No define protocolos ni interpreta bytes de ECU.  
**Estado de este documento:** Especificación de diseño. **Aplicado al documento ≠ implementado en código.**

---

## 1. Estrategia de implementación de UI

| Opción | Decisión | Motivo |
|--------|----------|--------|
| Conservar Android Views | **Elegida (corto/medio plazo)** | `MainActivity.buildUi()` construye la UI con Views programáticas (LinearLayout, TextView, Button, Spinner, ScrollView, GradientDrawable). Existe navegación por pantallas (`makeScreen` / `showScreen`). |
| Migrar a Jetpack Compose | Diferida | Solo tras estabilizar diagnóstico y validar capturas; plan incremental. |
| Híbrido Compose parcial | No recomendada ahora | Doble sistema de estado y riesgo sobre USB/KWP. |

**Reglas:**
- No crear una segunda implementación de USB / K-Line / KWP.
- Conservar y conectar la UI a las funciones existentes (ver matriz de métodos en SCREEN_SPEC).
- Separar eventos de interfaz de operaciones de diagnóstico.
- Una pantalla del diseño **no se presenta como implementada** hasta existir en código y estar cableada.
- Clasificación de evidencia (obligatoria en todo el set de documentos):
  - **CONFIRMADO EN CÓDIGO** — existe método/flujo en el repositorio.
  - **CONFIRMADO EN CAPTURA** — respuesta real documentada (p. ej. INVESTIGACION_KWP.md).
  - **PROBADO EN DISPOSITIVO** — interacción ejecutada y verificada en hardware (esta auditoría de diseño **no** declara PROBADO EN DISPOSITIVO).
  - **PENDIENTE** — no hay evidencia suficiente.
  - **INFERIDO** — interpretación que necesita validación.

---

## 2. Principios visuales

- Taller profesional, uso estacionario, legible bajo luz intensa.
- Contraste alto; botones grandes (mín. 48×48 dp; preferible 52–56 dp).
- Estados inequívocos: **icono + texto + color** (nunca solo color).
- Nunca inventar lecturas, DTC, unidades ni resultados de actuador no validados. Usar **“Sin datos confirmados”** o hex bruto.
- Dark mode prioritario (coincide con la UI actual del código).
- Navegación simple; no forzar bottom navigation de 5 ítems.

---

## 3. Tokens de color

### 3.1 Paleta base actual del código (CONFIRMADO EN CÓDIGO)

Valores leídos de `MainActivity.buildUi()` en la revisión consultada:

| Token en código | Hex | Uso en UI actual |
|-----------------|-----|------------------|
| `pageBackground` | `#0C0C0E` | Fondo de página |
| `cardBackground` | `#17171B` | Superficies / tarjetas |
| `accent` | `#007AFF` | Acento (botones tint, enlaces) |
| `primaryText` | `#FFFFFF` | Texto principal |
| `secondaryText` | `#A0A0AB` | Texto secundario |
| `borderColor` | `#2B2B32` | Bordes de `roundedSurface` |
| Actuador ON (tint) | `#1E9E66` | Botón activar (en código) |
| Actuador OFF (tint) | `#FF9500` | Botón desactivar (en código) |

**Regla:** No se afirma que `#101820` / `#18232C` / `#263541` sean los colores del código actual. Esos valores pertenecían a una revisión anterior o a una propuesta no alineada.

### 3.2 Decisión de diseño para v1.2

**Conservar la paleta actual del código como base** y extender solo tokens semánticos de estado que aún no existen como constantes nombradas:

| Token semántico | Hex propuesto | Uso | Nota |
|-----------------|---------------|-----|------|
| background | `#0C0C0E` | Fondo | Ya en código |
| surface | `#17171B` | Cards | Ya en código |
| primary / accent | `#007AFF` | Acciones | Ya en código |
| on-surface | `#FFFFFF` | Texto principal | Ya en código |
| on-surface-variant | `#A0A0AB` | Texto secundario | Ya en código |
| outline | `#2B2B32` | Bordes | Ya en código |
| success | `#1E9E66` | KWP validado / OK | Alineado con tint ON existente |
| warning | `#FF9500` | Datos no validados / precondiciones | Alineado con tint OFF existente |
| error | `#FF3B30` | Errores, permiso denegado | **Propuesta de diseño** (no constante actual); medir contraste antes de implementar |
| error-container | `#3B1212` | Fondo error suave | Propuesta de diseño |

Cualquier cambio de hex respecto a la tabla 3.1 debe documentarse como **rediseño** y migrarse de forma explícita en código, no presentarse como “ya usado”.

### 3.3 Light mode

Opcional / PENDIENTE de implementación. No declarar tokens light como implementados.

### 3.4 Estados de conexión (icono + texto + color)

| Estado | Color semántico | Texto orientativo |
|--------|-----------------|-------------------|
| USB no detectado | secondary + outline | No se detecta adaptador |
| Permiso pendiente / denegado | warning / error | Permiso USB… |
| Puerto serie abierto | primary | Puerto abierto · baud · sin KWP validado |
| Inicialización KWP en curso | primary + indicador | Inicializando KWP… |
| Comunicación KWP validada | success | Comunicación establecida con [perfil] |
| Error recuperable | error | Causa visible |
| Datos no validados | warning | Sin datos confirmados |

**Regla:** el baud seleccionado es un ajuste de puerto. Abrir el puerto **no** prueba que la ECU acepte ese baud ni que KWP esté establecido. El mensaje de éxito de comunicación depende de respuesta validada.

---

## 4. Tipografía

- Sistema / Roboto.
- Título app: ~28 sp.
- Body: 14–16 sp; labels 12–14 sp.
- **Monospace** para hex, DTC, logs, timestamps.
- Respetar escala de fuente del sistema.

---

## 5. Espaciado y táctil

- Padding pantalla ~16–20 dp.
- Touch target mínimo **48×48 dp** (preferible 52–56 dp en acciones primarias).
- Gap listas 8–12 dp.

---

## 6. Componentes (Views)

Definidos para mapeo a Views existentes o nuevas:

| Componente | Rol | Notas |
|------------|-----|-------|
| StatusBar / status TextView | Perfil + estado comunicación | Ya existe `status` |
| ConnectionBadge | Estado diferenciado | Puede ser el mismo status enriquecido |
| PrimaryButton | Acciones | `addAction` / botones actuales |
| DataRow | ID + bruto + estado | Live / catálogo |
| DtcCard / lista DTC | Resultados lectura | Sin estados Presente/Histórico inventados |
| EmptyState | Sin datos / servicio no validado | |
| ProgressPanel / labOutput | Contadores y log de lab | Solo categorías que el código distingue |
| LogView + LogExportBar | Registro | `log`, `exportLog()` |
| ProfileSpinner | MR-140 / ZF / HV-240 | HV-240: ver regla única en SCREEN_SPEC |
| Actuator controls | DriverIM MR-140 | Ver matriz de procedimientos; ejecución condicionada |

---

## 7. Accesibilidad (requisitos comprobables, no conformidad declarada)

**No se declara conformidad WCAG hasta medir.**

| Requisito | Criterio de verificación |
|-----------|--------------------------|
| Contraste texto | Medir pares concretos: `#FFFFFF` sobre `#0C0C0E`, `#A0A0AB` sobre `#0C0C0E`/`#17171B`, `#007AFF` sobre fondo, error/warning propuestos |
| Touch target | ≥ 48×48 dp en botones y spinners |
| TalkBack | `contentDescription` en iconos/botones de estado |
| Escalado de fuente | Layout no recorta labels a 1.3×–1.5× |
| No solo color | Cada estado de conexión y de fila de datos tiene texto |
| Reducir movimiento | Si el sistema lo pide, sin animaciones de progreso no esenciales |
| Foco / deshabilitado | Estados enabled/disabled visibles (p. ej. actuadores con `updateActuatorControlsEnabled`) |

Tabla de pares a medir en implementación (PENDIENTE de medición):

| Texto | Fondo | Objetivo |
|-------|-------|----------|
| `#FFFFFF` | `#0C0C0E` | ≥ 4.5:1 |
| `#A0A0AB` | `#0C0C0E` | ≥ 4.5:1 |
| `#FFFFFF` | `#17171B` | ≥ 4.5:1 |
| `#007AFF` | `#0C0C0E` | ≥ 3:1 (UI grande) / texto según rol |

---

## 8. Responsive

- Prioridad portrait compacto.
- Landscape: más espacio a log y listas; no romper botones.
- Navegación actual por `showScreen` (CONFIRMADO EN CÓDIGO): mantener secciones claras sin exigir bottom nav de 5 ítems.

---

## 9. Navegación

La app ya organiza contenido en pantallas/secciones (`makeScreen` / `showScreen`).  
**No** es requisito obligatorio un bottom navigation de 5 destinos. Preferir la estructura existente o tabs/secciones ligeras: Inicio · Diagnóstico · Datos · Laboratorio · Registro · Ajustes (agrupar si hace falta).
