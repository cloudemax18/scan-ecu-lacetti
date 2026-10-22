# GROK — Estados UX: sesión KWP vs perfil / 0x2C

**Fecha:** 2026-10-21  
**Tipo:** propuesta de UX + mapeo a código actual  
**Alcance:** comunicación clara de que *inicio de comunicación aceptado* ≠ *perfil o lecturas dinámicas validados*  
**No es:** implementación en Kotlin ni captura del APK.

---

## 1. Principio de honestidad

| Hecho técnico (código / bitácora) | Lo que el usuario no debe entender |
|----------------------------------|-------------------------------------|
| Respuesta positiva a **StartCommunication (0x81 → 0xC1)** | “Todo el diagnóstico ya está listo” |
| `validatedStartProfile` asignado tras 0xC1 | “Los bloques dinámicos 0x2C están definidos” |
| Puerto serie abierto a 10400 8N1 | “La ECU habla KWP de forma fiable” |
| Bytes en bruto de 0x21 | “Mediciones con unidad confirmada” |
| IDs F0/F1 en el EXE | “Se pueden explorar en el barrido automático” (PR #7 los excluye hasta 0x2C) |

**Mensaje guía (propuesta de UX):**  
*Sesión de comunicación iniciada. Las definiciones dinámicas (0x2C) y el mapa de lecturas siguen pendientes de validación.*

---

## 2. Capas de estado (propuesta)

Usar **una sola línea de estado** + **subtítulo opcional**. No depender solo del color del punto.

| Capa | Significado | ¿Qué permite la UI? |
|------|-------------|---------------------|
| A · Enlace físico | USB / puerto | Conectar o reintentar permiso |
| B · Sesión KWP | StartCommunication OK | Lecturas solo-lectura básicas según código |
| C · Definición dinámica | 0x2C aplicado y ACK | Lecturas que el diseño reserve a F0/F1 (cuando existan) |
| D · Lectura válida | Respuesta 0x61 + checksum + (si aplica) mapa | Mostrar valor o hex etiquetado |
| E · Error recuperable | Timeout, NRC, pérdida de sesión | Reintentar / reinicializar / desconectar |

**En código actual (CONFIRMADO EN CÓDIGO / bitácora):**  
existen sobre todo A y parte de B (`setStatus`, `validatedStartProfile`).  
**C no está integrado en MainActivity** (integración 0x2C pendiente).  
No presentar C como “ya funciona en la app”.

---

## 3. Etiquetas de estado propuestas

Formato sugerido en la barra de estado:

`●  [ETIQUETA CORTA] · [detalle en una línea]`

| ID | Situación | Etiqueta corta (UI) | Detalle / mensaje completo | Color de apoyo (no único canal) | Existe hoy en código |
|----|-----------|---------------------|----------------------------|----------------------------------|----------------------|
| S0 | Sin adaptador | **Desconectado** | No se detecta adaptador serie USB. Comprueba OTG y el cable KKL. | texto secundario / punto gris | Sí — mensajes tipo “No se detecta adaptador…” |
| S1 | Permiso denegado | **USB sin permiso** | Permiso USB denegado. Ábrelo de nuevo y acepta el permiso del sistema. | error (propuesto #FF3B30) | Sí — `Permiso USB denegado` |
| S2 | Adaptador visto, sin puerto | **Adaptador detectado** | Adaptador USB reconocido. Aún no hay puerto serie ni sesión KWP. | accent #007AFF | Parcial (flujo USB) |
| S3 | Puerto abierto | **Puerto abierto** | Puerto serie abierto · *baud* 8N1. Protocolo ECU **sin validar**. | accent | Sí — `Puerto serie abierto · … · protocolo ECU sin validar` |
| S4 | StartCommunication OK | **Sesión iniciada** | Inicio de comunicación aceptado (0xC1). **No** implica perfil dinámico ni lecturas F0/F1 validadas. | success #1E9E66 solo para “sesión”, no para “todo OK” | Parcial — log 0xC1 + `validatedStartProfile`; la etiqueta de producto puede ser más explícita |
| S5 | 0x2C no hecho | **Definición 0x2C pendiente** | Hace falta definir el bloque dinámico antes de consultar este identificador. Exploración F0/F1 no disponible. | warning #FF9500 | Lógica de exclusión F0/F1 en plan; **texto de producto 0x2C = propuesta** |
| S6 | 0x2C ACK (futuro) | **Bloque definido** | Definición 0x2C aceptada para este perfil. Lectura dinámica aún debe validarse con respuesta positiva. | accent → success solo tras lectura OK | **No implementado en MainActivity** (pendiente integración) |
| S7 | Trama mala | **Respuesta inválida** | La respuesta no pasó comprobación de estructura o checksum. No uses estos bytes como medida. | error | Parcial — logs/parser; etiqueta unificada = propuesta |
| S8 | Sin respuesta a tiempo | **Timeout** | Sin respuesta a tiempo. No es un NRC. Reintenta o comprueba alimentación y K-Line. | warning o error | Parcial — timeouts en lab/lectura |
| S9 | Corte en uso | **Pérdida de sesión** | Se perdió el enlace durante la operación. Vuelve a conectar e inicializar el perfil. | error | Parcial — guards con `validatedStartProfile` / puerto |
| S10 | Perfil incorrecto | **Perfil no compatible** | Esta acción no aplica al perfil seleccionado (p. ej. DriverIM solo MR-140; HV-240 no habilitada). | warning | Parcial — toasts/logs de cancelación |

---

## 4. Microcopy listo para copiar (propuesta)

### 4.1 Tras StartCommunication positivo

- **Estado:** `Sesión iniciada · MR-140` (o ZF)  
- **Nota bajo el estado:**  
  `Comunicación básica aceptada. Definiciones 0x2C y mapa de sensores: pendientes de validación.`

### 4.2 Si el usuario intenta algo que requiere 0x2C

- **Título:** Definición dinámica pendiente  
- **Cuerpo:**  
  `Este identificador necesita un bloque 0x2C que aún no está integrado de forma segura en la app. No se enviará la consulta.`  
- **Acción:** Entendido (solo dismiss)

### 4.3 Timeout vs NRC

- Timeout: `Sin respuesta a tiempo (timeout). No es un rechazo de la ECU.`  
- NRC: `La ECU rechazó la petición · NRC 0xNN` (mostrar código cuando el parser lo tenga)

### 4.4 Pérdida de sesión

- `Sesión interrumpida. Desconecta y vuelve a inicializar antes de leer de nuevo.`

---

## 5. Revisión de solo lectura (diseño)

**Objetivo:** una vista o modo que **solo** muestre identificación, DTC de lectura, datos brutos y log — **sin** botones de actuadores ni aprendizaje.

### 5.1 Qué incluir (propuesta)

1. Barra de estado con capas A/B (y S5 visible si aplica).  
2. Perfil seleccionado (solo informativo).  
3. Acciones: Conectar / Inicializar solo lectura / Leer DTC / Datos en vivo (hex) / Exportar log.  
4. Texto fijo: *Modo revisión · sin actuadores · sin aprendizaje.*

### 5.2 Qué no incluir

- Activar / Desactivar actuadores  
- Adaptación de acelerador / aprendizaje  
- Barrido que cite F0/F1 como ejecutables  
- Borrar DTC  

### 5.3 Relación con el código actual

| Elemento | Código actual |
|----------|----------------|
| Lectura DTC, vivo, lab, export | Existen en MainActivity |
| Actuadores en sección Pruebas | Existen; **no se pide quitar la protección** ni borrarlos del APK |
| Modo “solo revisión” como pantalla dedicada | **Propuesta de UX** — no está como Activity separada |
| Ocultar actuadores en un “modo” | **Propuesta** — requeriría cambio Kotlin futuro; fuera de este entregable |

La revisión de solo lectura es una **recomendación de producto/UI** para pruebas seguras con teléfono; no afirma que el APK ya la tenga.

---

## 6. Criterios de aceptación (cuando se implemente UI)

1. Tras 0xC1, el usuario ve “Sesión iniciada” + nota de límites, no “Diagnóstico completo”.  
2. F0/F1 no aparecen como opciones de exploración activas mientras 0x2C esté pendiente.  
3. Timeout y NRC usan textos distintos.  
4. Estados legibles sin color (icono + texto).  
5. Documentación de prueba no pide circular con el vehículo para validar sesión.

---

## 7. Clasificación de afirmaciones

| Afirmación | Clase |
|------------|--------|
| StartCommunication positivo no valida bloques 0x2C | CONFIRMADO (bitácora + análisis de integración) |
| `validatedStartProfile` tras 0xC1 | CONFIRMADO EN CÓDIGO |
| F0/F1 fuera del barrido automático hasta 0x2C | CONFIRMADO (PR #7 / KwpLaboratoryPlan) |
| Etiquetas S0–S10 unificadas en UI | PROPUESTA DE UX |
| Pantalla “modo revisión” sin actuadores | PROPUESTA DE UX |
| Integración 0x2C en MainActivity | PENDIENTE |
