# Registro de Preguntas Sin Resolver y Brechas Documentales
**Proyecto:** CheviExplorer (`scan-ecu-lacetti`)  

---

### UQ-001: Mapeo RAM de PIDs en Módulo TCM ZF 4HP16
* **Qué falta:** Tabla exacta de PIDs estándar (Servicio `0x21`) para la lectura de la temperatura del aceite ATF y estados de solenoides en la TCM ZF 4HP16 bajo firmware de exportación J200.
* **Por qué importa:** Solicitar PIDs incompatibles a la TCM provoca bloqueos de bus o respuestas basura interpretadas como fallas de comunicación.
* **Riesgo de asumir una respuesta:** Mostrar datos falsos de temperatura ATF que deriven en un diagnóstico erróneo de sobrecalentamiento.
* **Evidencia necesaria para cerrarla:** Log de traza KWP2000 de una herramienta oficial Scan-100 o GM Tech-2 ejecutando datos en vivo sobre la TCM ZF 4HP16.
* **Agente responsable del siguiente paso:** `DeepSeek` / Investigador de Trazas de Bus.

### UQ-002: Pinout Físico K-Line de la TCM ZF 4HP16 (Mercado CIS vs. EU)
* **Qué falta:** Confirmación de si en todos los Lacetti 1.8 AT 2008 la TCM está en el Pin 7 o si existen variantes con la línea K de la TCM aislada en el Pin 12.
* **Por qué importa:** Una interfaz configurada únicamente para Pin 7 no podrá conectar con la transmisión en vehículos con arnés alternativo.
* **Riesgo de asumir una respuesta:** Imposibilidad de conectar con la transmisión automática en modelos específicos de importación.
* **Evidencia necesaria para cerrarla:** Comprobación de continuidad física entre el Pin 28 de la TCM y el Pin 7 / Pin 12 del DLC en vehículos de mercado ruso/asiático.
* **Agente responsable del siguiente paso:** Usuario / Pruebas de campo con hardware.

### UQ-003: Sub-funciones de Seguridad en Servicio `0x27` para Flasheo de MR-140
* **Qué falta:** Algoritmo Seed/Key implementado por Delphi para desbloquear la escritura de la memoria Flash del procesador MC68F375.
* **Por qué importa:** Requerido estrictamente si el software busca realizar reprogramación de mapas de combustible o calibración de EEPROM.
* **Riesgo de asumir una respuesta:** Bloqueo permanente (*bricking*) de la unidad de control Delphi MR-140.
* **Evidencia necesaria para cerrarla:** Desensamblado del módulo de seguridad de la librería de diagnóstico Tech-2 de GM Daewoo.
* **Agente responsable del siguiente paso:** `Claude` / Ingeniero de Reversa.