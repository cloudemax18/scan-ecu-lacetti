# Procedimientos Oficiales de Servicio, Diagnóstico y Seguridad
**Proyecto:** CheviExplorer (`scan-ecu-lacetti`)  
**Vehículo:** Chevrolet Lacetti 1.8 LDA (2008) | **ECU:** Delphi MR-140 | **AT:** ZF 4HP16  

---

## 1. Procedimiento OEM de Aprendizaje del Ralentí (Idle Learn Routine)
* **Fuente OEM:** GM Daewoo J200 Service Manual, Section 1B-24.
* **Nivel de Evidencia:** `FUENTE_OEM_DIRECTA`
* **Precondiciones Obligatorias:**
  1. Voltaje de batería entre $12.5\text{ V}$ y $14.5\text{ V}$.
  2. Temperatura del refrigerante del motor (ECT) $> 85^\circ\text{C}$ (Motor a temperatura normal de operación).
  3. Temperatura del aire de admisión (IAT) $> 10^\circ\text{C}$.
  4. Transmisión en posición **P** (Park) o **N** (Neutral).
  5. Consumidores eléctricos auxiliares completamente apagados (A/C, desempañador, luces, ventilación de cabina).
* **Secuencia Paso a Paso:**
  1. Girar la llave de encendido a posición **ON** (Key-ON, Motor OFF) durante **5 segundos**.
  2. Girar a posición **OFF** (Key-OFF) durante **5 segundos**.
  3. Girar a posición **ON** durante **5 segundos**.
  4. Arrancar el motor y dejarlo funcionar en ralentí constante en posición **P/N** durante **3 minutos** continuos.
  5. Encender el sistema de Aire Acondicionado (A/C) en velocidad baja durante **10 segundos** (si el vehículo cuenta con A/C).
  6. Apagar el Aire Acondicionado durante **10 segundos**.
  7. Girar la llave a posición **OFF** durante al menos **10 segundos** para permitir que la ECU guarde los valores adaptativos de posición mínima de mariposa en la EEPROM.

---

## 2. Protocolos de Diagnóstico y Control KWP2000 (MR-140 / ZF 4HP16)
* **Nivel de Evidencia:** `EVIDENCIA_DE_REPOSITORIO` / `ESTANDAR_TECNICO`
* **Precondiciones de Seguridad para Actuadores (Servicio `0x30` / `0x31`):**
  * **RPM del Motor = 0** (Motor Apagado para pruebas críticas de inyectores/bombas).
  * **Velocidad del Vehículo = 0 km/h**.
  * **Tensión de Batería > 12.0 V**.
* **Secuencia de Comunicación:**
  1. **Fast Init:** Pulso bajo (25ms) + Pulso alto (25ms) en Pin 7 a 10,400 bps.
  2. **Inicio de Sesión:** Petición `StartDiagnosticSession (Service 10h)` con modo `81h` (Estándar) u `85h` (Extendida) dirigida al nodo `0x11` (ECM) o `0x18` (TCM).
  3. **Prueba de Actuadores (Input/Output Control - Service 0x30):**
     * Trama de activación: `[Header] 0x30 [Actuator_ID] [Control_Option 0x07] [State] [CS]`
     * Trama de devolución de control: `[Header] 0x30 [Actuator_ID] [Control_Option 0x00] [CS]`
  4. **Cierre de Sesión:** Envío de `StopDiagnosticSession (Service 82h)` antes de desconectar el enlace físico.