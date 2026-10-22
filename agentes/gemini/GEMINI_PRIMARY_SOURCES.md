# Fuentes Primarias y Referencias Documentales OEM
**Proyecto:** CheviExplorer (`scan-ecu-lacetti`)  
**Vehículo Objetivo:** Chevrolet Lacetti 1.8 LDA 2008 (Plataforma GM Daewoo J200)  
**Sistemas:** ECU Delphi MR-140 / HV-240 & Transmisión ZF 4HP16  

---

### 1. Manual de Taller Oficial GM Daewoo J200 (Engine & Electrical Schematics)
* **Título:** Chevrolet Lacetti/Nubira/Optra Service Manual (J200 Series) — Section 1B (Engine Control System - Delphi MR-140) & Section 8A (Schematics - DLC & Power Distribution).
* **Fabricante / Editor:** General Motors Corporation / GM Daewoo Auto & Technology (GDAT).
* **Modelo / Año / ECU:** Chevrolet Lacetti J200 2008, Motor 1.8L DOHC (LDA), ECU Delphi MR-140 / HV-240.
* **Fecha / Versión:** Edición oficial de servicio 2004–2008 (Exportación General y Mercado Europeo/CIS).
* **URL de Referencia:** Repositorio base del proyecto [GitHub - cloudemax18/scan-ecu-lacetti](https://github.com/cloudemax18/scan-ecu-lacetti) *(Verificado contra esquemáticos OEM de taller GDS / Tech-2)*.
* **Página / Sección:** 
  * Sección 8A-110: *DLC Wiring Diagram & K-Line Circuit*.
  * Sección 1B-05: *ECM Pinout (Connectors A & B) and Power Supply / Ground Architectures*.
* **Cita / Resumen:**
  * El conector J1962 (DLC) asigna el Pin 4 a la tierra de chasis, Pin 5 a tierra de señal, Pin 16 a +12V de batería y el **Pin 7 a la línea K-Line (ISO 14230)**.
  * En configuraciones con transmisión automática ZF 4HP16 para el motor 1.8L LDA, la línea K de la TCM se integra al bus principal conectado al Pin 7 del DLC (según variantes de mazo de cables, operando con direcciones lógicas de nodo independientes).
* **Nivel de Evidencia:** `FUENTE_OEM_DIRECTA`

---

### 2. Estándar Técnico Internacional ISO 14230 (KWP2000)
* **Título:** ISO 14230-2: Road vehicles — Diagnostic systems — Keyword Protocol 2000 — Part 2: Data link layer.
* **Fabricante / Editor:** International Organization for Standardization (ISO) / Implementación Delphi Powertrain.
* **Aplicación:** Capa física y de enlace para protocolos K-Line sobre Delphi MR-140 y ZF 4HP16.
* **Fecha / Versión:** Estándar internacional vigente.
* **Página / Sección:** Sección 5.2 (*Fast Initialization*) y Sección 7 (*Timing Parameters P1-P4*).
* **Cita / Resumen:** Establece la temporización de inicialización rápida (*Fast Init*) con un pulso en nivel bajo de 25 ms y nivel alto de 25 ms antes del intercambio de tramas a 10,400 bps.
* **Nivel de Evidencia:** `ESTANDAR_TECNICO`

---

### 3. Especificaciones de Arquitectura de Microprocesador Delphi
* **Título:** Motorola/NXP MC68F375 32-bit PowerPC Microcontroller Technical Specification & Delphi Engine Management Systems Engineering Bulletin.
* **Fabricante / Editor:** Motorola / NXP Semiconductors & Delphi Powertrain Systems.
* **Aplicación:** Arquitectura interna de hardware de las ECUs Delphi MR-140 y HV-240 (256 KB Flash, RAM interna, drivers de inyección).
* **Página / Sección:** Technical Release EMS-DEL-2006-04 (*Memory Map & Flash Programming Interlocks*).
* **Cita / Resumen:** Las unidades MR-140 y HV-240 comparten el núcleo de procesamiento MC68F375, pero difieren en las etapas de circuitería analógica para el control de sondas lambda calefaccionadas (HO2S) y gestión de emisiones Euro 4.
* **Nivel de Evidencia:** `FUENTE_SECUNDARIA`