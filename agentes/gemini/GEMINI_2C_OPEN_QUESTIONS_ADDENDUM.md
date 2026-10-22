# Adenda de Preguntas Abiertas y Vacíos de Documentación OEM — Servicio KWP 0x2C

**Proyecto:** Investigación de Protocolo KWP2000 en Delphi MR-140 y ZF 4HP16 (Chevrolet Lacetti / Daewoo J200 2008)  
**Fecha:** 21 de octubre de 2026  

---

## 1. Vacíos de Documentación Identificados

1. **Ausencia de Manual de Especificación Interna de Firmware Delphi MR-140:**
   - *Vacío:* No se dispone públicamente de la tabla de direccionalidad de memoria RAM/ROM (*RAM Memory Map*) de la ECU Delphi MR-140 para el procesador Freescale/Motorola usado en la calibración 1.8L LDA.
   - *Impacto:* La construcción de la sintaxis `0x2C 0x02` (*defineByMemoryAddress*) depende del conocimiento exacto de las direcciones offset de variables como RPM, ECT, MAP, TPS y estado de inyectores.

2. **Ausencia de Captura de Traza de Bus Real (RX Log):**
   - *Vacío:* No se cuenta con un registro hexadecimal pasivo de bus (*K-Line sniffer trace*) que confirme la aceptación con respuesta positiva (`0x6C`) ante un comando `0x2C` enviado a la dirección `0x11` o `0x18`.
   - *Impacto:* De acuerdo con las restricciones metodológicas, la presencia de código en herramientas software no constituye prueba fehaciente de ejecución exitosa en el chip físico sin la correspondiente respuesta `0x6C`.

---

## 2. Documentos y Requisitos Técnicos Necesarios para Resolver los Vacíos

Para resolver definitivamente las dudas abiertas, se requiere acceder o generar alguno de los siguientes elementos:

1. **Documento Técnico de Ingeniería General Motors / Delphi Automotive:**
   - *Título / Referencia esperada:* `Delphi MR-140 Diagnostic Specification & KWP2000 Implementation Manual` o `GM GMW8772 Diagnostic Layer Implementation for Engine Control Modules`.
   - *Contenido esperado:* Tabla de DIDs dinámicos soportados (`0xF0`, `0xF1`), longitud máxima de payload y mapa de memoria RAM con direcciones fijas para variables de motor.

2. **Captura de Traza de Bus K-Line en Vehículo Real (Hardware Log):**
   - *Herramienta:* Analizador de bus (ej. Saleae Logic, PEAK Microchip K-Line sniffer, o interfaz FTDI con wireshark/serial log).
   - *Secuencia de Validación:*
     1. Request: `82 11 F1 2C 01 F0 ... [CS]` (o formato `defineByAddress`).
     2. Response: `82 F1 11 6C 01 F0 [CS]` (Respuesta Positiva).
     3. Request: `81 11 F1 21 F0 [CS]` (ReadDataByLocalIdentifier para bloque `0xF0`).
     4. Response: `8X F1 11 61 F0 [DATA...] [CS]`.

---

## 3. Matriz de Estado de Incertidumbres

| Tópico / Pregunta | Estado Actual | Documento / Captura Requerida |
| :--- | :--- | :--- |
| **Sintaxis ISO 14230-3 del Servicio 0x2C** | **RESUELTO** (Estándar ISO) | Ninguno (ISO 14230-3 verificado). |
| **Pinout y Velocidad K-Line (Pin 7, 10.4 kbps)** | **RESUELTO** (Manual OEM J200) | Ninguno (Manual Chevrolet verificado). |
| **Soporte Físico de 0x2C en Firmware Delphi MR-140** | **ABIERTO / PENDIENTE DE VALIDACIÓN** | Traza RX real `0x6C` o Manual Delphi MR-140. |
| **Soporte Físico de 0x2C en Firmware ZF 4HP16** | **ABIERTO / PENDIENTE DE VALIDACIÓN** | Traza RX real `0x6C` o Manual ZF Diagnostics. |
| **Persistencia del Bloque tras Apagado** | **RESUELTO** (Cero persistencia / Volátil) | Ninguno (Comportamiento Estándar KWP2000). |
