# CheviExplorer — Mockups UI v1.2.1 + Prompt 4

**SHA de referencia (main):** `8fdd627370e88acce253d774916b66e36e47b1c2`  
**Design system:** GROK_UI_SYSTEM.md v1.2  
**Auditoría completa:** `../GROK_UI_AUDIT_PROMPT4.md`

## Aviso

Estos HTML son **referencia de diseño**. No son capturas del APK ni prueba de implementación.

## Paleta (código real)

`#0C0C0E` · `#17171B` · `#007AFF` · `#FFFFFF` · `#A0A0AB` · `#2B2B32`  
Success/warning alineados a tints actuador (`#1E9E66` / `#FF9500`). Error `#FF3B30` = **propuesto**.

## Contenido

| Archivo | Contenido |
|---------|-----------|
| index.html | Índice |
| 01_inicio.html | Inicio; spinner real = MR-140 + ZF; HV-240 no disponible |
| 02_conexion_kkl.html | Estados USB→KWP + catálogo |
| 03_diagnostico_dtc.html | DTC por perfil; borrar off |
| 04_datos_en_vivo.html | Hex + Sin datos confirmados |
| 05_laboratorio_kwp.html | Base 01–40+FB; F0/F1 aplazados |
| 06_servicio_actuadores.html | DriverIM MR-140; empty ZF/HV |
| 07_flujo_navegacion.html | 7 secciones del APK + reglas |

## APK real (no mockup)

Secciones: Inicio, Diagnóstico, Datos ECU, En vivo, Pruebas, Registro, Ajustes.  
Actuadores viven en **Pruebas**. Conexión no es Activity separada.
