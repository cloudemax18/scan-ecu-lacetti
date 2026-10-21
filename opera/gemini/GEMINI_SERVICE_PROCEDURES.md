# Procedimientos Oficiales de Servicio y Diagnóstico
**Vehículo:** Chevrolet Lacetti 1.8 LDA (2008) | **ECU:** Delphi MR-140 | **AT:** ZF 4HP16

---

## 1. Procedimiento de Aprendizaje / Reseteo de Valores Adaptativos del Acelerador (Idle Learn Routine)

### Aplicabilidad y Alcance
* **Aplica exactamente:** Chevrolet Lacetti 1.8L LDA 2008 con ECU Delphi MR-140.
* **Nota técnica:** Aplica si la unidad cuenta con cuerpo de aceleración electrónico (Drive-by-Wire / ETC) o tras realizar limpieza/reemplazo del cuerpo de mariposa / IAC en la versión de mariposa mecánica.

### Precondiciones Requeridas
1. Voltaje de la batería: **≥ 12.4 V** (motor apagado).
2. Temperatura del refrigerante del motor (ECT): **≥ 80 °C** (alcanzar temperatura normal de trabajo).
3. Temperatura del aire de admisión (IAT): **≥ 10 °C**.
4. Apagar todos los consumidores eléctricos auxiliares (luces, aire acondicionado, desempañador térmico, equipo de audio).
5. Transmisión en posición **P** (Park) o **N** (Neutral).

### Secuencia Oficial de Aprendizaje Manual (Sin Herramienta de Diagnóstico)
1. Girar la llave a posición **ON** (Ignición habilitada, motor apagado) durante **5 segundos**.
2. Girar la llave a posición **OFF** durante **5 segundos**.
3. Girar la llave a posición **ON** durante **5 segundos**.
4. Encender el motor y dejarlo funcionar en ralentí en posición **P/N** durante **3 minutos** (hasta alcanzar > 80 °C de refrigerante).
5. Encender el aire acondicionado durante **10 segundos** (si está equipado) y luego apagarlo durante **10 segundos**.
6. Girar la llave a posición **OFF** durante al menos **10 segundos** para guardar los datos aprendidos en la EEPROM de la ECU.

### Secuencia Oficial con Diagnóstico KWP2000 / Scanner
1. Conectar la interfaz K-Line al Pin 7 del conector DLC OBD-II.
2. Establecer sesión de diagnóstico KWP2000 (*Fast Init* a 10.4 kbps).
3. Enviar solicitud de rutina de servicio `RoutineControl (Service 31h)` con el ID de rutina de reinicio adaptativo de ralentí (*Idle Adaptation Reset*).
4. Ejecutar el ciclo de apagado y guardado en memoria EEPROM (Key OFF durante al menos 30 segundos).

---

## 2. Lectura y Limpieza de DTCs (Diagnostic Trouble Codes)

### Precondiciones
* Ignición en posición **ON** (Motor encendido o apagado según el criterio del fallo a evaluar).

### Procedimiento KWP2000
1. **Lectura de DTCs:** Enviar servicio KWP `ReadDiagnosticTroubleCodesByStatus (Service 18h)` o `ReadDTC (Service 13h)`.
2. **Interpretación:** Retorna estructura de 2 bytes por DTC según la codificación SAE J2012 / GM Daewoo.
3. **Borrado de DTCs:** Enviar servicio KWP `ClearDiagnosticInformation (Service 14h)`.
4. *Advertencia:* El borrado borra los parámetros adaptativos de combustible a corto plazo y reinicia los monitores de emisiones.