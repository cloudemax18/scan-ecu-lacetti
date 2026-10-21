# Fuentes Primarias y Referencias Documentales
**Vehículo objetivo:** Chevrolet Lacetti / GM Daewoo J200 (2008) — Motor 1.8L LDA, ECU Delphi MR-140/HV-240, Transmisión ZF 4HP16.

---

### 1. Manual de Taller Oficial GM Daewoo J200 (Engine & Controls)
* **Título:** Chevrolet Lacetti/Nubira/Optra Service Manual (J200 Series) — Section 1B / 6B: Engine Control System (Delphi MR-140).
* **Fabricante / Editor:** General Motors Corporation / GM Daewoo Auto & Technology (GDAT).
* **Modelo / Año / ECU:** Chevrolet Lacetti J200 2008, Motor 1.8L DOHC (LDA), ECU Delphi MR-140 / HV-240.
* **Fecha:** Edición oficial de servicio 2004–2008.
* **URL / Referencia de origen:** Documentación técnica de taller GM Daewoo (GDS / Tech-2 Service Library). Ref. Repositorio de consulta: [GitHub - cloudemax18/scan-ecu-lacetti](https://github.com/cloudemax18/scan-ecu-lacetti).
* **Página / Sección:**
  * Section 1B: *Engine Control System (Delphi MR-140)* — Pinout del conector de la ECU, esquemas de alimentación/masa y tabla de DTCs.
  * Section 8A: *Wiring Diagrams* — Conector de diagnóstico DLC J1962, enlace K-Line (Pin 7).
* **Cita / Resumen:** La ECU Delphi MR-140 gestiona la inyección y el encendido del motor LDA mediante comunicación de diagnóstico sobre la línea K-Line (Pin 7 del conector OBD-II) empleando el protocolo KWP2000 (ISO 14230-2).
* **Nivel de Aplicabilidad:** **Exacto (Chevrolet Lacetti 1.8L 2008 / MR-140).**

---

### 2. Manual de Taller Oficial GM Daewoo J200 (Transmisión Automática)
* **Título:** GM Daewoo J200 Service Manual — Section 5A/5B: Automatic Transaxle (ZF 4HP16).
* **Fabricante / Editor:** General Motors / ZF Friedrichshafen AG.
* **Modelo / Año / Transmisión:** Chevrolet Lacetti 1.8L 2008, Transmisión ZF 4HP16 de 4 velocidades.
* **Fecha:** Edición oficial de taller 2004–2008.
* **Página / Sección:** Section 5A/5B: *ZF 4HP16 Automatic Transaxle Diagnostics & Wiring Schematics*.
* **Cita / Resumen:** La unidad de control de la transmisión (TCM) administra los solenoides de cambio y presión, intercambiando datos con la ECU del motor (MR-140) y enviando líneas de diagnóstico al pin de comunicación K-Line.
* **Nivel de Aplicabilidad:** **Exacto (Lacetti 1.8L ZF 4HP16).**

---

### 3. Estándares Técnicos ISO y Documentación de Plataforma Delphi
* **Título:** ISO 14230-2: Road vehicles — Diagnostic systems — Keyword Protocol 2000 (KWP2000) Data link layer.
* **Fabricante / Editor:** International Organization for Standardization (ISO) / Delphi Powertrain Systems.
* **Aplica a:** Protocolos de comunicación física y lógica K-Line sobre Delphi MR-140 / HV-240.
* **Cita / Resumen:** Define las reglas de temporización (P1 a P4), inicialización rápida (*Fast Initialization*) y estructura de trama (Header, Length, Service ID, Data, Checksum) del protocolo KWP2000.
* **Nivel de Aplicabilidad:** **Genérico normalizado (Aplicado por Delphi a la calibración GM Daewoo).**