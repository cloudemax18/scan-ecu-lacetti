# Informe de revision de mockups CheviExplorer v1.2.1

**Fecha:** 2026-10-20  
**Entrada:** siete HTML en `opera/grok/mockups/` + specs GROK_* v1.2  
**Salida:** HTML corregidos, README, changelog, este informe  
**Codigo:** no modificado

---

## 1. Pruebas visuales realizadas

| Prueba | Resultado |
|--------|-----------|
| Revision individual de los 7 HTML (contenido, colores, textos) | Completada en artefacto local |
| Coherencia de paleta con tokens documentados | Corregido badge puerto; error marcado propuesto |
| Enlaces de navegacion entre pantallas | Anadidos en nav + index.html |
| Estados de conexion documentados en 02 | Tabla de 10 estados |
| DTC no generaliza 0 codigos | Variante C ZF |
| HV-240 / ZF actuadores | Texto de bloqueo / empty |
| Viewport movil (`max-width`, media query) | Estilos basicos presentes |
| Apertura en navegador automatizada / screenshot APK | **No realizada** en esta sesion |
| Prueba en vehiculo | **No realizada** |

---

## 2. Incoherencias corregidas

| Antes | Despues |
|-------|---------|
| Punto verde en “Puerto abierto · protocolo sin validar” | Punto accent azul + texto explicito puerto ≠ KWP |
| Un solo escenario DTC “0 codigos” | Tres variantes: MR-140 0 DTC, con codigo, ZF no confirmado |
| Nav sin href utiles | Links relativos entre mockups |
| HV-240 ausente o ambiguo | Nota de bloqueo en inicio |
| Actuadores ZF posibles por omision | Empty state explicito |
| Sin distincion mockup/APK | Tags y leyenda en README/informe |

---

## 3. Tabla de trazabilidad

| Pantalla | Archivo HTML | Funcion Android existente (codigo) | Pendiente / diseno | Criterio de aceptacion |
|----------|--------------|------------------------------------|--------------------|------------------------|
| Inicio | 01_inicio.html | `setStatus`, `ecuProfile`, `requestUsbConnection`, `initializeSelectedEcu` | Badge estados finos; HV-240 UI bloqueada | Puerto no se muestra como KWP OK; HV-240 no opera |
| Conexion KKL | 02_conexion_kkl.html | `requestUsbConnection`, `openSerialPort`, `initializeSelectedEcu`, `classifyInitResult` | UI de pasos dedicada si se separa de Main | Cada fallo muestra causa + Reintentar |
| DTC | 03_diagnostico_dtc.html | `readDtcCodes` | Borrar DTC; estados Presente/Historico | Borrar disabled; 0 DTC solo con evidencia de perfil |
| Datos en vivo | 04_datos_en_vivo.html | `readConfirmedParameterIds`, `startLiveParameterPolling`, `stopLiveParameterPolling` | Decodificacion/unidades | Hex + “Sin datos confirmados” sin formula |
| Laboratorio | 05_laboratorio_kwp.html | `probeLocalIdentifiers` / `IdProbe.sondear`, `runLocalIdentifierScan`, `stopLiveParameterPolling`, `exportLog` | Contadores separados timeout vs checksum | Solo categorias que el codigo distingue |
| Actuadores MR-140 | 06_servicio_actuadores.html | `updateActuatorControlsEnabled`, `readMr140ActuatorState`, `confirmMr140ActuatorControl`, catalogo Delphi | Validacion vehiculo; adaptacion 0x2C | Advertencias visibles; no declarar seguro sin prueba |
| Servicio ZF/HV | 06 (variante B) | — (bloqueado en texto UI) | Rutinas propias | Empty / disabled |
| Flujo / nav | 07_flujo_navegacion.html | `makeScreen` / `showScreen` | Bottom nav opcional | No exigir 5 tabs si la Activity usa secciones |

**Importante:** la presencia de un control en el mockup **no** implica que la funcion este implementada en el APK ni probada en dispositivo.

---

## 4. Accesibilidad (requisitos, no conformidad declarada)

- Objetivos táctiles ≥ 48 px en botones de mockup.
- `focus-visible` en botones.
- `role` / `aria-label` basicos en marcos principales.
- Estados no solo por color (texto en badge y pasos).
- Contraste de pares reales: **pendiente de medicion** sobre UI compilada.
- Token error `#FF3B30`: propuesto; medir antes de adoptar en codigo.

---

## 5. Archivos modificados / generados en esta entrega

```
opera/grok/mockups/01_inicio.html
opera/grok/mockups/02_conexion_kkl.html
opera/grok/mockups/03_diagnostico_dtc.html
opera/grok/mockups/04_datos_en_vivo.html
opera/grok/mockups/05_laboratorio_kwp.html
opera/grok/mockups/06_servicio_actuadores.html
opera/grok/mockups/07_flujo_navegacion.html
opera/grok/mockups/index.html
opera/grok/mockups/README_MOCKUPS.md
opera/grok/GROK_MOCKUP_CHANGELOG.md
opera/grok/GROK_MOCKUP_INFORME.md
```

Specs previas (`GROK_UI_SYSTEM.md`, `GROK_SCREEN_SPEC.md`, etc.) se conservan; no se regenero el paquete de diseno desde cero.

---

## 6. Siguiente paso recomendado

1. Copiar/actualizar `opera/grok/mockups/` en el repositorio.  
2. Contrastar matriz de metodos con el SHA actual de `MainActivity.kt`.  
3. Implementar UI en Kotlin por pantallas pequenas.  
4. Compilar y probar en dispositivo de forma separada.  
5. No habilitar HV-240 ni borrado DTC ni adaptacion acelerador sin evidencia.
