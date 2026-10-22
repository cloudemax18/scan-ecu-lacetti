# CheviExplorer UI — Changelog de auditoría

**Versión del paquete de diseño:** 1.2  
**Fecha:** 2026-10-17  
**Entrada:** Auditoria_CheviExplorer_UI_v1.1_para_Grok.md + código actual del repo  
**Leyenda de estado en este changelog:**  
- **Aplicado al documento** = corregido en los MD de diseño.  
- **No implementado en código por esta entrega** = esta tarea no modifica el APK.

| ID | Prioridad | Cambio | Motivo (auditoría) | Estado |
|----|-----------|--------|--------------------|--------|
| C20 | P0 | Paleta alineada a `#0C0C0E`, `#17171B`, `#007AFF`, `#FFFFFF`, `#A0A0AB`, `#2B2B32` | v1.1 citaba colores que no coinciden con `buildUi()` actual | Aplicado al documento |
| C21 | P0 | Marcar tokens error propuestos como rediseño a medir, no “ya usados” | Evitar afirmaciones falsas de tokens | Aplicado al documento |
| C22 | P0 | HV-240: única regla — visible solo como no conectable / bloqueado; no heredar 0x11 de MR-140 | Contradicción spinner vs capacidades | Aplicado al documento |
| C23 | P0 | Matriz de procedimientos de actuadores + adaptación acelerador pendiente de validación | No descartar globalmente servicio ni inventar pruebas | Aplicado al documento |
| C24 | P0 | Evidencia: CONFIRMADO EN CÓDIGO / EN CAPTURA / PROBADO EN DISPOSITIVO / PENDIENTE | Evitar leer “confirmado” como probado en dispositivo | Aplicado al documento |
| C25 | P0 | Detener: referenciar `stopLiveParameterPolling` y comportamiento cooperativo documentado en UI | No afirmar cancelación total sin verificación | Aplicado al documento |
| C26 | P1 | Matriz de métodos con nombres verificados en MainActivity | Trazabilidad exacta | Aplicado al documento |
| C27 | P1 | “0 DTC” limitado a captura MR-140; no universal | Auditoría §6 | Aplicado al documento |
| C28 | P1 | Baud ≠ KWP establecido; estados de conexión ordenados | Auditoría §7 | Aplicado al documento |
| C29 | P1 | Contadores lab: definiciones; IdProbe agrupa timeout/checksum | Auditoría §8 | Aplicado al documento |
| C30 | P1 | Accesibilidad: requisitos medibles, no conformidad declarada; tabla de pares | Auditoría §9 | Aplicado al documento |
| C31 | P2 | Versionado 1.2 + entrada/salida en cabeceras | Auditoría §10 | Aplicado al documento |
| C32 | P2 | Favoritos IDs = opcional/futuro | Auditoría §11 | Aplicado al documento |
| C33 | P2 | Identificación = raw por ID, no mapa decodificado | Auditoría §12 | Aplicado al documento |
| C34 | P0 | Retirar afirmación de colores `#101820` etc. como “ya usados” | P0.1 auditoría | Aplicado al documento |

**Fuera de alcance de esta entrega:** cambios de protocolo, nuevos comandos ECU, declaración de compilación exitosa, PROBADO EN DISPOSITIVO.
