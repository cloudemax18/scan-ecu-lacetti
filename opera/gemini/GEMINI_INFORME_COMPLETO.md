# Informe Completo de Investigación Documental Automotriz
**Proyecto:** Análisis de Diagnóstico e Integración K-Line / KWP2000  
**Objetivo:** Chevrolet Lacetti 1.8 LDA 2008 (Delphi MR-140 / HV-240 & ZF 4HP16)  
**Repositorio Base:** https://github.com/cloudemax18/scan-ecu-lacetti  

---

## 1. Resumen Ejecutivo
El presente documento constituye el informe técnico completo de la investigación documental realizada para el modelo **Chevrolet Lacetti 1.8 LDA 2008** (chasis GM Daewoo J200). Se recopilaron y organizaron los datos técnicos oficiales referentes a los esquemas de diagnóstico, protocolos KWP2000, procedimientos de servicio y vacíos documentales pendientes de verificación en bus real.

---

## 2. Búsquedas Ejecutadas y Estado de Fuentes

### Fuentes Consultadas y Verificadas (Primarias / Oficiales)
1. **GM Daewoo J200 Service Manual (Lacetti/Optra/Nubira 2004–2008):**
   * *Sección 1B/6B (Engine Controls):* Confirmación de arquitectura de la ECU Delphi MR-140/HV-240, línea K-Line (Pin 7 DLC), alimentación de batería/ignición y masas principales.
   * *Sección 5A/5B (Automatic Transaxle):* Información sobre el sistema de transmisión automática ZF 4HP16.
2. **Especificación ISO 14230 (KWP2000):**
   * Verificación del estándar de transmisión serie sobre K-Line (10.4 kbps, *Fast Initialization*, estructura de bytes de solicitud/respuesta).
3. **Repositorio del Proyecto:**
   * Archivos y trazas alojadas en [cloudemax18/scan-ecu-lacetti](https://github.com/cloudemax18/scan-ecu-lacetti).

### Fuentes Descartadas o Desestimadas
* **Foros y Blogs No Oficiales:** Se revisaron únicamente como guía de búsqueda de códigos de fallas comunes, pero se descartaron como evidencia técnica primaria.
* **Librerías Genéricas Multimarca de GitHub:** Descartadas para la asignación directa de PIDs de actuadores, para evitar asociar identificadores de Opel/Vauxhall o Chevrolet US que no coinciden con la calibración del firmware MR-140 del motor LDA.

---

## 3. Matriz de Aplicabilidad de Resultados

| Elemento Técnico | Configuración / Protocolo | Aplicabilidad Confirmada | Grado de Certeza |
| :--- | :--- | :--- | :--- |
| **ECU Motor** | Delphi MR-140 / HV-240 | Exacto Lacetti 1.8 LDA 2008 | **Fuente Primaria (OEM)** |
| **Transmisión** | ZF 4HP16 (4 velocidades AT) | Exacto Lacetti 1.8 LDA 2008 | **Fuente Primaria (OEM)** |
| **Físico Diagnóstico** | K-Line (ISO 9141-2 / ISO 14230) Pin 7 DLC | Exacto Lacetti J200 | **Fuente Primaria (OEM)** |
| **Protocolo Lógico** | KWP2000 (*Fast Init* / 10.4 kbps) | Exacto Delphi MR-140 | **Especificación Oficial** |
| **Procedimiento Aprendizaje** | Idle Learn Routine (Manual / KWP) | Exacto Lacetti 1.8 LDA | **Manual de Servicio OEM** |
| **PIDs / Actuadores Propietarios** | Service 22h / 30h / 31h Specific IDs | Pendiente / Parcial | **Requiere Validación Traza** |

---

## 4. Entregables Generados en este Dossier
1. `GEMINI_PRIMARY_SOURCES.md`: Inventario de manuales oficiales, normas técnicas e hipervínculos de referencia.
2. `GEMINI_SERVICE_PROCEDURES.md`: Guía de precondiciones y secuencia paso a paso para el reseteo de ralentí y borrado de fallas.
3. `GEMINI_UNRESOLVED_QUESTIONS.md`: Lista de incógnitas técnicas a confirmar en fase de análisis de trazas de bus.
4. `GEMINI_INFORME_COMPLETO.md`: Documento consolidado del trabajo realizado.

---

## 5. Próximos Pasos Recomendados
1. Comparar las tramas de comunicación obtenidas en el repositorio con la estructura formal ISO 14230-2 para confirmar la dirección de origen (`Source Address`) y destino (`Target Address`) de la ECU MR-140 y la TCM ZF 4HP16.
2. Evitar la ejecución de comandos de prueba de actuadores (`Service 30h/31h`) sin antes haber verificado el ID exacto en la tabla de comandos de la calibración del vehículo.