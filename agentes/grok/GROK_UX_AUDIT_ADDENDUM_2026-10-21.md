# Addendum de auditoría UX — 2026-10-21

**Agente:** Grok (UX/UI diagnóstico automotriz)  
**SHA main observado al redactar (API):** comprobar de nuevo en GitHub antes de integrar; bitácora citaba fases 0x2C y docs recientes.  
**Material de entrada:** `opera/grok/*`, `opera/INTEGRACION_BITACORA_CONTINUIDAD.md`, mensajes `setStatus` / flujo StartCommunication en MainActivity (lectura, sin editar).  
**Restricciones cumplidas:** sin editar Kotlin, sin generar APK, sin nuevos comandos de diagnosis, sin presentar mockups como producción, sin pruebas en marcha.

---

## 1. Problema de comunicación central

La bitácora y el código coinciden en:

> Una respuesta positiva de **StartCommunication** no demuestra que el perfil completo esté inicializado ni que existan los bloques dinámicos **0x2C**.

**Riesgo UX:** si la barra solo dice “Conectado” o verde genérico, el usuario (y agentes) interpretan “listo para F0/F1 / mapa completo / servicio avanzado”.

**Propuesta:** estados graduados documentados en `GROK_2C_UX_STATES.md` (S0–S10), con énfasis en:

- **Sesión iniciada** ≠ **Definición 0x2C pendiente** ≠ **Lectura válida**

---

## 2. Qué existe en código vs propuesta UX

| Tema | En código / repo (evidencia de lectura) | Propuesta UX (este addendum) |
|------|----------------------------------------|------------------------------|
| Puerto abierto + “protocolo sin validar” | Sí, `setStatus` | Mantener y no sustituir por “Conectado” a secas |
| `validatedStartProfile` tras 0xC1 | Sí | Etiqueta visible “Sesión iniciada” + nota de límites |
| F0/F1 fuera de barrido auto | Sí (plan + PR #7) | UI no debe listarlos como explorables |
| Textos unificados Timeout vs NRC vs pérdida sesión | Parcial (logs, toasts) | Tabla S7–S9 y microcopy |
| Modo solo lectura sin actuadores | La app tiene actuadores protegidos en Pruebas | Vista/modo revisión **propuesto**; no se pide quitar protecciones |
| HV-240 no conectable | Spinner sin HV-240 | Seguir sin ofrecer conexión |
| Integración 0x2C en MainActivity | Pendiente (bitácora) | Estados S5/S6 listos para cuando exista |
| Mockups HTML / Kotlin mock | Referencia en `opera/grok/` | No son el APK |

---

## 3. Revisión de solo lectura (diseño)

Ver sección 5 de `GROK_2C_UX_STATES.md`.

Resumen: acciones de conectar, inicializar lectura, DTC, datos hex, exportar log; **sin** botones de actuador ni aprendizaje; texto fijo de modo revisión.  
Compatible con la guía Android-only para no empujar al usuario a DriverIM en pruebas de continuidad.

---

## 4. Accesibilidad

| Requisito | Propuesta medible | Estado |
|-----------|-------------------|--------|
| Contraste texto/fondo | Pares blanco/#0C0C0E y secundario/#A0A0AB sobre superficie; medir en dispositivo | Requisito; **no** se declara WCAG cumplido sin medición |
| Tamaño táctil | Controles primarios ≥ 48 dp | Alineado a tokens de diseño Grok |
| Error legible | Texto completo + código NRC si hay; no solo icono rojo | Propuesta S7–S9 |
| No solo color | Punto + etiqueta corta + detalle | Propuesta capa de estados |
| Controles seguros | Actuadores fuera del modo revisión; confirmaciones ya existentes en código no se debilitan aquí | Política |
| Movimiento | Guía prohíbe prueba en marcha | `GROK_ANDROID_ONLY_TEST_GUIDE.md` |

---

## 5. Guía Android-only

Entregable: `GROK_ANDROID_ONLY_TEST_GUIDE.md`.

Cubre: Actions → run/SHA → artefacto → exportar log de la app actual → instalar → sesión solo lectura → capturar TX/RX → plantilla de informe.  
No instruye a circular ni a activar actuadores.

---

## 6. Mockups

- **No se reescribe** el sistema visual completo.  
- Los HTML/Kotlin mock previos siguen siendo **referencia**.  
- Si se añade un mock puntual de barra de estados 0x2C, es ilustrativo y se etiqueta MOCK / no APK.  
- **No** se afirma implementación en producción.

---

## 7. Archivos de este entregable

Rutas de destino recomendadas en el repo (el mantenedor copia; **este agente no sube a GitHub**):

```
opera/grok/GROK_2C_UX_STATES.md
opera/grok/GROK_ANDROID_ONLY_TEST_GUIDE.md
opera/grok/GROK_UX_AUDIT_ADDENDUM_2026-10-21.md
```

Informes originales (`GROK_INFORME_COMPLETO.md`, etc.) **no se sobrescriben**.

---

## 8. Pruebas realmente ejecutadas aquí

| Acción | Resultado |
|--------|-----------|
| Lectura bitácora continuidad | Completada |
| Grep MainActivity setStatus / StartCommunication / validatedStartProfile | Completada (lectura) |
| Edición Kotlin / build APK | **No** |
| Prueba en vehículo | **No** |
| Push a GitHub | **No** |

---

## 9. Pendientes

1. Unificar microcopy de estado en MainActivity (trabajo Kotlin futuro, fuera de alcance).  
2. Integración segura 0x2C cuando cierren bloqueantes de la bitácora.  
3. Medición de contraste en dispositivo real.  
4. Usuario: un run Actions + log exportado según la guía Android-only.

---

## 10. Resumen en una frase

Documentamos **cómo decir la verdad de la sesión** (0x81/0xC1 ≠ 0x2C ≠ mapa validado), **qué etiquetas usar**, una **revisión solo lectura de diseño**, y una **guía usable solo con Android**, sin confundir propuesta UX con APK implementado.
