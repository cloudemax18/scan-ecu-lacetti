# CheviExplorer — Mockups UI v1.2.1 (revisados)

**Fecha revision:** 2026-10-20  
**Design system:** GROK_UI_SYSTEM.md v1.2  
**Ubicacion:** `opera/grok/mockups/`  
**Estado:** Mockups revisados de referencia visual. **No** son capturas del APK. **No** declaran PROBADO EN DISPOSITIVO.

## Paleta

| Token | Hex | Origen |
|-------|-----|--------|
| background | `#0C0C0E` | Codigo MainActivity |
| surface | `#17171B` | Codigo |
| accent | `#007AFF` | Codigo |
| text | `#FFFFFF` | Codigo |
| text-sec | `#A0A0AB` | Codigo |
| border | `#2B2B32` | Codigo |
| success | `#1E9E66` | Alineado tint ON codigo |
| warning | `#FF9500` | Alineado tint OFF codigo |
| error | `#FF3B30` | **PROPUESTO** (no constante actual) |

## Archivos

| Archivo | Pantalla |
|---------|----------|
| `index.html` | Indice de navegacion |
| `01_inicio.html` | Inicio / perfil / badge |
| `02_conexion_kkl.html` | Estados de conexion + catalogo |
| `03_diagnostico_dtc.html` | DTC (3 variantes de perfil) |
| `04_datos_en_vivo.html` | Hex + Sin datos confirmados |
| `05_laboratorio_kwp.html` | Contadores lab |
| `06_servicio_actuadores.html` | DriverIM / empty ZF-HV |
| `07_flujo_navegacion.html` | Flujo y reglas |

## Correcciones v1.2.1 (sobre mockups previos)

1. Badge de **puerto abierto** usa accent azul, no verde success (puerto ≠ KWP validado).
2. Estados documentados: USB no detectado, permiso denegado, puerto, init KWP, validado, timeout, NRC, desconexion.
3. DTC: variante ZF “resultado no confirmado”; 0 codigos solo con nota de captura MR-140.
4. HV-240: texto de bloqueo; no hereda MR-140.
5. ZF: sin actuadores ni aprendizaje.
6. Navegacion entre HTML; botones min 48px; focus-visible; role/aria basicos.
7. Etiquetas “MOCKUP REVISADO · no PROBADO EN DISPOSITIVO”.

## Como ver

Abrir `index.html` o cada HTML en navegador (movil o escritorio). Responsive basico con `max-width: 360px` del marco telefono y media queries.

## Distinciones

| Termino | Significado |
|---------|------------|
| Mockup revisado | HTML de diseno corregido en esta entrega |
| CONFIRMADO EN CODIGO | Existe metodo en el repositorio |
| APK implementado | UI construida en Kotlin y compilada |
| PROBADO EN DISPOSITIVO | Verificado en hardware/vehiculo |

## No incluido

- Cambios de protocolo o Kotlin
- Simulacion funcional de ECU
- Declaracion de conformidad WCAG completa (requisitos medibles en informe)
