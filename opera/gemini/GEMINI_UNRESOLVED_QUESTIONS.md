# Preguntas Pendientes y Brechas Documentales
**Vehículo:** Chevrolet Lacetti 1.8 LDA (2008) | **Sistemas:** Delphi MR-140 & ZF 4HP16

---

## 1. Identificadores Propietarios de Actuadores (Service 30h / 31h)
* **Pregunta:** ¿Cuáles son los IDs exactos de actuador (Input/Output Control) soportados por el firmware de la MR-140 para pruebas directas (p. ej. inyectores individuales, relé de la bomba de combustible, solenoide de purga EVAP, válvula IAC)?
* **Nivel actual:** Desconocido / Genérico. Las librerías genéricas KWP2000 enumeran rangos genéricos que no garantizan compatibilidad con la calibración exacta del Lacetti 1.8 2008.
* **Próximo paso documental:** Realizar un dump de traza de comunicación (bus log) de una herramienta oficial GM (Tech-2 o GDS) durante una sesión activa de actuadores en una MR-140.

## 2. PIDs de Datos en Vivo (Service 22h / Service 21h)
* **Pregunta:** ¿Cuáles son los offset de memoria RAM y PIDs propietarios utilizados por Delphi en la MR-140 para solicitar datos dinámicos avanzados (avance de encendido real, integración de sonda lambda, estado del interruptor P/N de la caja ZF 4HP16)?
* **Nivel actual:** Parcialmente documentado mediante PIDs estándar OBD-II (Mode 01), pero pendiente de verificación para los bloques de datos propietarios KWP.
* **Próximo paso documental:** Consultar o extraer archivos de definición de parámetros de diagnóstico (`*.ecm` / base de datos Tech-2 GM Daewoo) específicos para el binario del motor LDA 1.8L.

## 3. Direccionamiento Físico del Bus K-Line para la TCM ZF 4HP16
* **Pregunta:** ¿La unidad de control de la transmisión automática (TCM ZF 4HP16) responde en la misma dirección lógica K-Line (`Target Address`) que la ECU Delphi MR-140, o requiere un selector de pin/dirección de nodo separada en el conector DLC?
* **Nivel actual:** Requiere confirmación de diagrama de cableado (Pinout del DLC J1962 en J200).
* **Próximo paso documental:** Verificar en la sección 8A del manual J200 si la línea K de la TCM va puenteada al Pin 7 del DLC o si utiliza un pin independiente (p. ej. Pin 12 u 8).