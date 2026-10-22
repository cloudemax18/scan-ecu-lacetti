# Guía de prueba solo con teléfono Android — CheviExplorer

**Fecha:** 2026-10-21  
**Público:** usuario con Android + OTG + adaptador KKL, **sin PC obligatorio**  
**No es:** prueba de conducción, habilitación de actuadores, ni validación de 0x2C en vehículo en marcha.

---

## 0. Seguridad (leer antes)

- Prueba con el **vehículo detenido**, freno de estacionamiento, zona ventilada si el motor debe estar en contacto ON.  
- **No** uses esta guía para probar en marcha.  
- **No** actives actuadores ni aprendizaje en esta guía de revisión.  
- Exporta el **log de la app antigua** antes de sustituir la APK si vas a instalar una build nueva.

---

## 1. Localizar el artefacto correcto en GitHub Actions

1. Abre el repositorio en el navegador del teléfono:  
   `https://github.com/cloudemax18/scan-ecu-lacetti`
2. Menú **Actions** (o “Acciones”).
3. Elige el workflow que **construye la APK** (nombre según el repo; suele ser el de CI/Android).  
   - Evita runs marcados como fallidos (cruz roja).  
   - Prefiere un run en la rama **`main`** salvo que alguien te indique otra rama de prueba.
4. Entra en el **run** concreto (fecha/hora y commit visibles).
5. Anota:
   - **Run number** (p. ej. #219)
   - **Commit SHA** (enlace al commit; copia al menos 7–12 caracteres)
   - Rama
6. Baja hasta **Artifacts** (Artefactos).
7. Descarga el ZIP del artefacto de APK (nombre típico tipo `app-*` / `apk-*`; el nombre exacto depende del workflow).

**Comprobación mínima:** el SHA del run debe coincidir con el que quieras probar (el de la bitácora o el que te indiquen). Si no coincide, no asumas que es “la última buena”.

---

## 2. Descargar y extraer en el teléfono

1. Tras descargar el ZIP, ábrelo con el **gestor de archivos** del teléfono.  
2. Extrae el `.apk` a una carpeta conocida (Descargas o Documentos).  
3. Si hay varios APK (debug/release, flavors), elige el que documente el workflow o el equipo (si no está claro, **no instales** y pregunta).

---

## 3. Antes de instalar una APK nueva

1. Abre la **CheviExplorer ya instalada**.  
2. Si hay sesión o log en pantalla, usa **Exportar log / Exportar registro** (o la opción equivalente en Registro).  
3. Guarda el archivo exportado en una carpeta segura o envíatelo (correo, Drive, etc.).  
4. Anota en una nota del teléfono: fecha, SHA que creías tener, y si el vehículo/adaptador respondían.

**No borres la app antigua hasta haber exportado** si necesitas conservar evidencia TX/RX.

---

## 4. Instalar la APK

1. Ajustes → Seguridad / Apps especiales → **Permitir instalación de orígenes desconocidos** para el gestor de archivos o el navegador (solo el tiempo necesario).  
2. Abre el `.apk` → Instalar.  
   - Si Android ofrece **Actualizar** sobre la existente, puedes hacerlo **después** de exportar logs.  
   - Si pide desinstalar la anterior, exporta primero.  
3. Abre la app y verifica en la UI o en Ajustes/Registro si muestra versión o si el log de arranque menciona el build (no todos los builds lo muestran).

---

## 5. Sesión de prueba de solo lectura (vehículo parado)

### Material

- Teléfono con OTG  
- Adaptador KKL CH340/CH341  
- Cable al puerto de diagnosis del Lacetti (según tu instalación; no se detalla pinout aquí)

### Pasos

1. Conecta OTG → adaptador → vehículo. Contacto según el procedimiento que ya uses para lectura (motor apagado o contacto ON según lo que estés leyendo; **sin circular**).  
2. Abre CheviExplorer.  
3. Elige perfil **MR-140** o **ZF 4HP16** (no HV-240 si no está habilitado).  
4. Conecta / concede **permiso USB** si el sistema lo pide.  
5. Observa la barra de estado:
   - ¿Desconectado / sin permiso / puerto abierto / sesión?  
   - Si dice puerto abierto, **aún no** asumas KWP validado.  
6. Inicializa ECU **solo lectura** (si el botón existe).  
7. Espera mensaje de éxito o error. Un inicio de comunicación aceptado **no** valida bloques 0x2C ni el mapa completo de sensores.  
8. Opcional: **Leer DTC** (solo lectura).  
9. Opcional: lectura en vivo o laboratorio **sin** actuadores.  
10. **Exportar log** al terminar.

### Qué no hacer en esta guía

- Activar relés, inyectores, MIL, etc.  
- Aprendizaje / adaptación  
- Probar “a ver qué pasa” con F0/F1 si la app los bloquea  
- Diagnosticar en movimiento

---

## 6. Capturar mensajes TX/RX

1. En la sección **Registro** (o el TextView de log de la app), deja visible el historial durante la prueba.  
2. Tras cada acción (conectar, inicializar, leer DTC), espera a que aparezcan líneas **TX** y **RX** (o equivalentes).  
3. Exporta el log completo.  
4. Si no hay export, usa capturas de pantalla **consecutivas** del log (desplaza y captura), menos ideal pero usable con solo teléfono.  
5. En el nombre del archivo o en una nota incluye: **fecha, SHA del APK/run, perfil (MR-140/ZF), resultado** (sesión OK / timeout / NRC / permiso denegado).

**Interpretación mínima (usuario):**

| En el log | Significado aproximado |
|-----------|------------------------|
| Permiso denegado | Problema Android/OTG, no de la ECU |
| Puerto abierto / baud | Cable/adaptador a nivel serie; aún no KWP |
| Respuesta positiva StartCommunication / 0xC1 | Sesión básica; no mapa 0x2C |
| NRC 0x… | La ECU rechazó esa petición |
| Timeout / sin respuesta | No hubo respuesta a tiempo; no es lo mismo que NRC |

No hace falta decodificar KWP a mano para informar un resultado útil al proyecto.

---

## 7. Informe mínimo que puedes enviar al proyecto

Copia y rellena:

```
Fecha:
Run Actions #:
SHA (commit):
Perfil: MR-140 / ZF
Estado UI visto: (desconectado / permiso / puerto / sesión / error)
¿StartCommunication OK? sí / no / no sé
DTC: no probado / 0 códigos / códigos / error
¿Actuadores usados? NO (recomendado)
Log exportado: sí / no (nombre archivo)
Notas (timeout, NRC, cable):
```

---

## 8. Qué es esta guía y qué no

| | |
|--|--|
| Instrucciones para humano con Android | Sí |
| Sustituto de prueba unitaria o CI | No |
| Afirmación de que un SHA concreto está probado en tu coche | No, hasta que tú lo registres |
| Permiso para desactivar protecciones de actuadores | No |
