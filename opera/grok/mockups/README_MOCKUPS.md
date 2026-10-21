# CheviExplorer — Mockups UI v1.2

**Fecha:** 2026-10-17 (pack mockups)  
**Design system:** GROK_UI_SYSTEM.md v1.2  
**Paleta (código real):** `#0C0C0E` fondo · `#17171B` surface · `#007AFF` accent · `#FFFFFF` / `#A0A0AB` texto · `#1E9E66` success · `#FF9500` warning · `#FF3B30` error (propuesto)

## Contenido

| Archivo | Pantalla / contenido |
|---------|----------------------|
| `01_inicio.html` | Inicio / vehículo · perfil · badge conexión · acciones |
| `02_conexion_kkl.html` | Flujo de estados USB → puerto → KWP |
| `03_diagnostico_dtc.html` | DTC vacío (0 códigos) y con código + borrar deshabilitado |
| `04_datos_en_vivo.html` | Filas ID + hex + “Sin datos confirmados” |
| `05_laboratorio_kwp.html` | Contadores reales · Detener · resultados |
| `06_servicio_actuadores.html` | DriverIM MR-140 con advertencias · empty ZF/HV |
| `07_flujo_navegacion.html` | Mapa de navegación y reglas de flujo |

## Cómo verlos

Abrir cada `.html` en un navegador (Chrome / Firefox / Edge).  
Son mockups de referencia visual alineados con la spec v1.2; **no** son capturas del APK ni pantallas implementadas.

## Notas de diseño reflejadas

- Adaptador detectado ≠ ECU conectada  
- Baud = ajuste de puerto, no prueba de KWP  
- Datos sin fórmulas validadas → hex + badge warning  
- Borrar DTC deshabilitado  
- Contadores de lab sin inventar categorías que el código no separe  
- HV-240 / ZF actuadores: bloqueados o empty según spec  
- Adaptación acelerador: no ejecutable hasta validar rutina completa  

## Relación con el paquete de especificación

Ver también `CheviExplorer_UI_Design_v1.2.zip` (documentos GROK_*.md).
