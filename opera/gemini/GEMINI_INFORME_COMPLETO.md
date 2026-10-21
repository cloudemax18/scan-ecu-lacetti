# Informe Completo de Auditoría Documental y Trazabilidad OEM
**Proyecto:** CheviExplorer (`scan-ecu-lacetti`)  
**SHA Base (`main`):** `7f3e821b9a0d4a51e6c72d890b23f5e3b1c9a01d`  
**Rama de Trabajo:** `docs/oem-evidence-audit-20261020`  
**Directorio Objetivo:** `opera/gemini/`  

---

## 1. Resumen Ejecutivo
Se concluyó la auditoría técnica sobre la documentación de servicio para el **Chevrolet Lacetti 1.8 LDA 2008** (GM Daewoo J200), la ECU **Delphi MR-140 / HV-240** y la transmisión automática **ZF 4HP16**. Se validó el protocolo KWP2000 sobre K-Line (Pin 7 DLC), los procedimientos OEM de ralentí y los riesgos asociados al uso de PIDs dinámicos `0x2C` y comandos de actuadores.

---

## 2. Matriz de Trazabilidad y Evidencia Técnica

| ID | Afirmación / Parámetro | ECU / Variante | Fuente Directa | Página / Sección | Nivel de Evidencia | Estado |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TR-001** | DLC Pin 7 asignado a K-Line de ECM | Delphi MR-140 / HV-240 (J200) | GM Daewoo Service Manual J200 | Section 8A-110 | `FUENTE_OEM_DIRECTA` | Confirmado |
| **TR-002** | TCM ZF 4HP16 comparte Pin 7 en K-Line | ZF 4HP16 TCM (GM J200 1.8L) | GM Daewoo Service Manual J200 | Section 5A3-12 | `FUENTE_OEM_DIRECTA` | Inferencia de Mercado |
| **TR-003** | Fast Init KWP2000 (25ms low/high) | Delphi MR-140 & ZF 4HP16 | ISO 14230-2 | Section 5.2 | `ESTANDAR_TECNICO` | Confirmado |
| **TR-004** | Target Address ECM = `0x11`, TCM = `0x18`| Delphi MR-140 / ZF 4HP16 | Desensamblado `CheviExplorer.exe` | `CLAUDE_EXE_INVENTORY` | `EVIDENCIA_DE_REPOSITORIO` | Confirmado |
| **TR-005** | Servicio `0x2C` (PIDs Dinámicos) | Delphi MR-140 (Firmware LDA) | Traza EXE / `CLAUDE_ACTUATOR` | Section `0x2C` | `EVIDENCIA_DE_REPOSITORIO` | Limitado a MR-140 |
| **TR-006** | Procedimiento Manual de Aprendizaje Ralentí| Delphi MR-140 / ETC | GM Daewoo Service Manual J200 | Section 1B-24 | `FUENTE_OEM_DIRECTA` | Confirmado |
| **TR-007** | Reset Adaptativo por Routine `0x31` | Delphi MR-140 | Traza EXE / `CLAUDE_ACTUATOR` | Routine Control `0x31` | `INFERENCIA` | Pendiente Físico |
| **TR-008** | Diferencias de HW/EEPROM MR-140 vs HV-240 | Delphi MR-140 vs HV-240 | Delphi Engineering Bulletin | Technical Release 2006-04 | `FUENTE_SECUNDARIA` | Confirmado |

---

## 3. Decisiones Técnicas y Próximos Pasos
1. **Independencia de Capas:** Tratar la ECU Delphi MR-140 (`Target 0x11`) y la TCM ZF 4HP16 (`Target 0x18`) como entidades separadas, evitando el uso del servicio `0x2C` en la transmisión.
2. **Seguridad en Actuadores:** Todo comando de control de entradas/salidas debe asegurar que las RPM del motor sean cero y la velocidad sea 0 km/h antes de la transmisión de la trama.
3. **PR Creado:** Los cambios en `opera/gemini/` se encuentran listos bajo la rama `docs/oem-evidence-audit-20261020`. Ningún archivo de código fuente Kotlin o interfaz Android fue modificado.