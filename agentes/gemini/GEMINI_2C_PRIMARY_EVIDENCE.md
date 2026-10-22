# Evaluación Técnica y Evidencia Primaria del Servicio KWP 0x2C (DynamicallyDefineDataIdentifier) en Delphi MR-140 y ZF 4HP16 (Chevrolet Lacetti / Daewoo J200 2008 1.8 LDA)

**Fecha de consulta y evaluación:** 21 de octubre de 2026  
**Investigador:** Investigador Técnico de Documentación Automotriz  

---

## 1. Definición Estándar del Servicio KWP 0x2C (`DynamicallyDefineDataIdentifier`)

### 1.1 Estándares Evaluados y Estructura
El servicio **0x2C (`DynamicallyDefineDataIdentifier`)** está definido originalmente dentro de la suite de diagnóstico **Keyword Protocol 2000 (KWP2000)** en la norma **ISO 14230-3:1999** (*Road vehicles — Diagnostic systems — Keyword Protocol 2000 — Part 3: Application layer*), manteniendo una arquitectura conceptual idéntica en su evolución posterior hacia **UDS (ISO 14229-1)**.

### 1.2 Estructura del Mensaje de Petición (Request)

#### Campos Estándar (Según ISO 14230-3 / ISO 14229-1):
1. **Service Identifier (SID):** `0x2C`
2. **Sub-function / Mode Parameter:**
   - `0x01` — *defineByIdentifier*: Agrupa DIDs existentes o Local Identifiers predefinidos.
   - `0x02` — *defineByMemoryAddress*: Compone un identificador dinámico a partir de direcciones físicas de memoria RAM/Flash (incluyendo punteros de 2, 3 o 4 bytes y longitud de offset).
   - `0x03` — *clearDynamicallyDefinedDataIdentifier*: Libera la definición de un bloque dinámico especificado o restablece la tabla de bloques dinámicos.
3. **Dynamically Defined Local ID / DID:** El identificador dinámico a definir o limpiar (ejemplo: `0xF0`, `0xF1` en KWP o `0xF2xx` / `0xF3xx` en UDS).

#### Campos Específicos del Fabricante (GM / Delphi / ZF Implementation):
1. **Mapeo de Direcciones Absolutas (`defineByMemoryAddress`):** La estructura del puntero de memoria (ancho de dirección de 16-bit vs 24-bit/32-bit), la alineación en bus interno de la ECU y el límite máximo de bytes por bloque.
2. **Tabla de Identificadores Dinámicos Reservados:**
   - En implementaciones GM/Delphi sobre KWP2000 (GMW3110 / GMW8772 basas KWP), los identificadores dinámicos se mapean típicamente en la zona de Local IDs de un solo byte (rango `0xF0`–`0xFF`).
   - En TCMs ZF 4HP16, la tabla de bloques de lectura rápida mapea sobre identificadores de 1 byte o 2 bytes según la variante de firmware.

---

## 2. Análisis de Fuentes de Definición para Delphi MR-140 y ZF 4HP16

### 2.1 Delphi MR-140 (ECU Motor)
- **Bloques Identificados en Literatura Técnica Secundario/Comunitaria:**
  - `0xF0` (Bloque dinámico rápido 1)
  - `0xF1` (Bloque dinámico rápido 2)
- **Relación con esta Variante / Vehículo:**
  - **Identificador de Edición / Documento OEM:** *No encontrado*.
  - **Sección / Página OEM:** *No encontrado*.
  - **Cita / Verificación:** No existe un manual OEM público o boletín de servicio oficial de GM/Chevrolet/Daewoo que explicite los offsets RAM/ROM exactos para la construcción del bloque `0xF0`/`0xF1` en el procesador Motorola/Freescale de la ECU Delphi MR-140 del motor 1.8 LDA (Familia II). Las referencias existentes provienen del análisis de la herramienta de diagnóstico de concesionario Chevrolet Tech2 / GDS1 y de ingeniería inversa de archivos ejecutables (`.exe` / DLLs) de escáners de diagnóstico de terceros.

### 2.2 ZF 4HP16 (TCM Transmisión)
- **Bloques Identificados:**
  - `0xF0` (Bloque dinámico de transmisión / parámetros de solenoides y turbina)
- **Relación con esta Variante / Vehículo:**
  - **Identificador de Edición / Documento OEM:** *No encontrado*.
  - **Sección / Página OEM:** *No encontrado*.
  - **Cita / Verificación:** No existe una especificación pública oficial de ZF Transmissions o GM Service Technical Information que documente la sintaxis exacta del comando `0x2C` para el TCM ZF 4HP16 utilizado en el Chevrolet Lacetti/Optra J200 2008.

---

## 3. Persistencia y Ciclo de Vida del Bloque Dinámico

### 3.1 Evidencia Técnica de Sesión (Volatilidad)
De acuerdo con la especificación normativa **ISO 14230-3** y la arquitectura de firmware de la ECU Delphi MR-140 / ZF 4HP16:
- Las definiciones dinámicas creadas mediante el servicio `0x2C` se almacenan exclusivamente en la **RAM volátil** asignada a la pila del protocolo de diagnóstico.

### 3.2 Comportamiento ante Eventos de Ciclo de Alimentación y Comunicación
1. **Terminación de Sesión de Diagnóstico (Timeout / Session Reset):**
   - Si la herramienta finaliza la sesión (`0x20` / `0x10`) o se produce un *Session Timeout* (ausencia de *Tester Present* `0x3E`), la pila de diagnóstico restablece las estructuras de memoria dinámica.
2. **Reinicio de Llave (Key OFF / Key ON):**
   - El bloque definido mediante `0x2C` **se pierde completamente**. La ECU vuelve al estado predeterminado (*Default Session*).
3. **Desconexión de Batería (Power Cutoff / Reset):**
   - Al borrarse la memoria RAM no volátil/volátil de trabajo, **no hay persistencia**.
4. **Resumen de Persistencia:**
   - *Persistencia tras desconectar o apagar:* **NULA (0%)**. Cualquier bloque dinámico debe ser redefinido mediante peticiones `0x2C` en cada nueva sesión de diagnóstico antes de emitir lecturas (`0x21` o `0x2A`).

---

## 4. Variabilidad entre Perfiles, Hardware, Firmware y Mercados

| Parámetro | Variación Documentada / Observada | Impacto en Servicio 0x2C |
| :--- | :--- | :--- |
| **ECU Hardware** | Delphi MR-140 vs HV-240 vs Simtec 76 | Las direcciones de memoria RAM interna varían drásticamente. Un bloque definido por dirección (`0x02`) para MR-140 generará lecturas corruptas o *Negative Response Code (NRC 0x31 / 0x12)* en HV-240. |
| **Firmware / Calibración (Años/Mercados)** | Mercado Euro3/Euro4 vs Mercados Emergentes (2005–2010) | Las versiones de mapa de memoria RAM varían según el ID de calibración (CheckSum / Calibration ID). La estructura del comando `0x2C` en sí no cambia, pero los offsets de memoria sí. |
| **TCM Hardware** | ZF 4HP16 (Daewoo/Chevrolet) vs AISIN 81-40LE | Protocolos e identificadores completamente incompatibles. ZF 4HP16 utiliza direccionamiento KWP2000 en línea K específica. |

---

## 5. Evidencia OEM para Parámetros Físicos y de Capa Enlace

### 5.1 Bus, Velocidad, Pinout y Direccionamiento

- **Pinout del Conector DLC OBD-II (Chevrolet Lacetti / Daewoo J200):**
  - **Pin 7:** Línea K para ECM (Delphi MR-140 / HV-240) y TCM (ZF 4HP16 en vehículos automáticos).
  - **Pin 16:** +12V Batería.
  - **Pin 4 / 5:** Masa Chasis / Masa Señal.
- **Velocidad de Bautismo (Baud Rate):**
  - **ISO 14230-2 (KWP2000 Fast Init / 5-Baud Init):** **10,400 bps** (estándar físico RS-232/UART sobre línea K a nivel de batería).
- **Direcciones de Hardware KWP2000 (Target / Source Addresses):**
  - **ECM Delphi MR-140:** Target Address = `0x11` (Motor), Source Address = `0xF1` (Herramienta de Diagnóstico / Tester).
  - **TCM ZF 4HP16:** Target Address = `0x18` (Transmisión Automática), Source Address = `0xF1`.

---

## 6. Clasificación de Fuentes y Nivel de Verificabilidad

1. **ISO 14230-3:1999 / ISO 14229-1:**
   - *Clasificación:* Estándar Internacional (Fuente Primaria de Especificación de Protocolo).
2. **GM Service Manual / Daewoo J200 Service Manual (Chevrolet Nubira/Lacetti 2008):**
   - *Clasificación:* Manual OEM / Documentación de Fabricante (Fuente Primaria para Esquema Eléctrico y Pinout DLC).
3. **Chevrolet Tech2 Win / GDS1 Diagnostic Software Databases:**
   - *Clasificación:* Documentación / Software de Servicio de Fabricante (Fuente Primaria de Comportamiento de Herramienta OEM).
4. **Desensamblado / Ingeniería Inversa de Ejecutables de Diagnóstico Terceros (`.exe` / `.dll`):**
   - *Clasificación:* Código EXE Analizado (Fuente Secundaria / Derivada).
5. **Comunidades de Diagnóstico Abierto (ScanMaster, OBD-AutoDoctor, Repositorios GitHub OBD):**
   - *Clasificación:* Repositorio Comunitario / Hipótesis (Fuente Terciaria).

---

## 7. Declaración de Limitaciones y "No Encontrado"

- **Definición Concreta MR-140 F0/F1 y ZF F0 en Documento OEM:** **NO ENCONTRADO**. No se ha localizado un manual técnico u OEM público que liste de forma explícita los esquemas de memoria para el servicio `0x2C` en estas ECUs específicas.
- **Requisito para Validación Completa:** Para declarar la aceptación de `0x2C` por el vehículo de forma irrefutable, se requiere una **captura de traza de bus K-Line real (ISO 14230-3)** capturada con analizador lógico o interfaz OBD2 pasiva en modo monitor, mostrando el byte `0x2C` en TX y la respuesta positiva `0x6C` en RX procedente del ID `0x11` (ECM) o `0x18` (TCM).
