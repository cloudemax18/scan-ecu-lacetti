# CLAUDE_ACTUATOR_AND_ADAPTATION.md
Solo rutinas que **existen realmente** en `CheviExplorer1.8.exe` (volcados `main.pas`/`Graf.pas`). Nada se completa por intuición. Fecha: 2026-10-20 (v2). **Análisis estático; ninguna rutina se ha probado en el vehículo ni con el APK. Reconstruir el EXE no autoriza su uso físico.**
Etiquetas: `CONFIRMADO_EXE`, `CONFIRMADO_VEHICULO`, `HIPOTESIS`, `NO_VERIFICADO`, "no determinado". **Ninguna de estas rutinas está validada en vehículo por este análisis ni existe una captura del EXE ejecutándolas.**

## 0. Qué existe y qué no
| Rutina | MR-140 (`0x12`) | ZF 4HP16 (`0x22`) |
|---|---|---|
| Aprendizaje de acelerador (`Button_Obuchenie`) | **Existe** (habilitado en `N_MR140Click` L12126) | No (deshabilitado en `N_ZFClick` L12341) |
| Reset / borrado de aprendizajes (`Button_Sbros`) | **Existe** (ECUReset `11 01`) | No (deshabilitado) |
| Actuadores individuales (`DriveIM`, `test_ON/OFF`) | **Existe** (12 entradas, 9 IDs) | No hay rama `0x22` en `CaseIMSelect`/`DriveIMClick` |
| `Test_DK` | Abre un gráfico, **no envía comando** | deshabilitado |
| `SecurityAccess` (`27`) | No se invoca | No se invoca |
| Adaptación de cambios / TCC / presiones en ZF | **No existe en el EXE** | **No existe en el EXE** |
Cualquier "adaptación de caja ZF" o prueba de solenoides ZF **no está en el EXE**: no se debe implementar a partir de este análisis.

---
## 1. Aprendizaje de acelerador — `TForm1.Button_ObuchenieClick` (`main.pas` L14950–15290)
**Es una rutina distinta de los actuadores.** Usa el identificador `0x2C` con el mismo servicio `30` pero con lógica de bucle y criterio de éxito propios.

### 1.1 Precondiciones (todas `CONFIRMADO_EXE`)
- Sesión MR-140 abierta, F0 definido por `2C F0` en `Start` (sin eso `21 F0` no es replicable; ver `CLAUDE_EXE_FUNCTION_INVENTORY.md` §1).
- `MessageBox` de advertencia (0x4ED9EC/0x4ED9F8, L14962–14971) — texto original (ruso), traducido: *"Antes del procedimiento de aprendizaje: poner el freno de mano; apagar el aire acondicionado; palanca de cambios en parking/neutro; **arrancar el motor**. ¿Continuar?"*. Solo continúa con "Sí".
- El motor debe estar encendido: se comprueba **después** de enviar el comando (ver 1.2).

### 1.2 Secuencia byte a byte
| # | Acción | TX / condición | Lectura | Referencia |
|---|---|---|---|---|
| 1 | Enviar comando | `84 11 F1 30 2C 07 FF E8` | `ReadFile` 0x10 (16) bytes | `WriteReadComm` L14997, dirección 0x4ED7B0 |
| 2 | Validar | `RX[11] == 0x70` (SID de respuesta; eco de 8 bytes, respuesta desde el índice 8) | — | 0x4ED7B5 |
| 2f | Si no es `0x70` | llama a `0x4E9784` (procedimiento sin nombre en el volcado; en `Start` se usa igual para abortar) y sale | — | 0x4ED7BE |
| 3 | Leer F0 una vez | `82 11 F1 21 F0 95` vía `VspomRaschetParam(BL=F0, readcount=0x29, params 1..[4F6DD0])` | 41 bytes (6 eco + 35) | 0x4ED7DA |
| 3v | Validar | `RX[9] == 0x61` | — | 0x4ED7E6 (si falla: `0x4E9784` y salir) |
| 4 | Comprobar motor | `RPM (ID 9)` en la fila de muestra actual `>= 500.0` | — | 0x4ED804–0x4ED811; constante VA 0x4EDACC = 500.0 |
| 4f | Si RPM < 500 | `MessageBox` "Двигатель должен быть запущен" (el motor debe estar en marcha) y salir **sin** `MenuItem_Stop` | — | 0x4ED813–0x4ED829 |
| 5 | Mostrar progreso | Formulario `FormProgress`: título "Обучение выполняется..." y etiqueta "Нажмите до упора и удерживайте педаль газа..." (*pisar a fondo y mantener el acelerador*); botón Cancelar (`Progress.Button1Click` escribe la bandera VA `0x4F721E`) | — | L15056–15108, `Progress.pas` |
| 6 | Bucle | Repetir hasta éxito o cancelación: `Sleep(100 ms)` + `ProcessMessages` + nueva lectura F0 (`21 F0`, 41 bytes) + `inc` índice de muestra | — | 0x4ED893 en adelante |

### 1.3 Criterio de éxito/fallo (valores extraídos del EXE)
Sea `RPM = ID 9` (`x/4`, 16 bit BE) y `MAP = ID 1` (kPa, 1 byte), de la muestra más reciente.
- Cuenta una muestra válida si **`RPM > 4300.0`** (VA 0x4EDB70) **y** `RPM` es mayor que la de **dos muestras antes** **y** **`MAP > 80.0`** (VA 0x4EDB74).
- Se necesitan **dos** muestras válidas (el contador debe superar 1).
- Una vez alcanzadas, el bucle continúa hasta que **`RPM < 2000.0`** (VA 0x4EDB78), es decir hasta que se suelta el pedal.
- No hay `timeout` global en el bucle (solo la bandera de cancelación): **no determinado** qué ocurre si nunca se cumple.
- Cancelación: botón del formulario → `[0x4F721E]=1` → oculta el formulario y sale sin mensaje de éxito.
- Fallo del ECU: el bucle no inspecciona NRC; si `RX[9] != 0x61` en cualquier lectura de F0 **no se evalúa en el bucle** (solo en la primera lectura) — no determinado.

### 1.4 Pasos finales
- Mensaje de éxito (0x4EDB84): *"Aprendizaje terminado. Suelte el pedal del acelerador, apague el encendido durante 10 segundos y vuelva a encenderlo. Realice el borrado de errores."* (ver `CONFIRMADO_EXE`).
- A continuación el EXE dispara `MenuItem_Stop` (`81 11 F1 82 05`).
- **No existe** en el EXE ningún comando de "fin de aprendizaje" (`30 2C 00` o similar) ni ninguna secuencia automática de contacto: el apagado de 10 s lo hace el usuario.
- Orden de riesgo (`CONFIRMADO_EXE`): el comando `30 2C 07 FF` se envía **antes** de comprobar que el motor está en marcha; si no lo está el EXE muestra error pero el ECU ya recibió el comando.

### 1.5 Estado Android (`KwpProtocol.buildMr140ThrottleAdaptationRequest`)
Solo construye la trama (`84 11 F1 30 2C 07 FF E8`, igual a la del EXE, test `reconstructsThrottleAdaptationSeparatelyFromActuatorTests`). No hay bucle, ni criterios, ni lectura de F0. **No exponer en la UI sin F0 + bucle**: la trama sola no reproduce el procedimiento.
Prueba física mínima y riesgos: ver `CLAUDE_GAPS_AND_TESTS.md`.

---
## 2. Reset de aprendizajes — `TForm1.Button_SbrosClick` (`main.pas` L14793–14948)
- Habilitado solo para MR-140 (L12126…); ZF lo deshabilita.
- Para selectores `0x11`/`0x13` el EXE usa `SecurityAccess` + `83 DST F1 30 50 04` (no aplica aquí).
- Rama de MR-140 (L14867–14901):
  1. `MessageBox` (Sí=6): *"Se realizará el borrado de todos los aprendizajes (adaptaciones) con reinicio de la ECU. ¿Continuar?"*.
  2. TX `82 11 F1 11 01 96` (ECUReset, `11 01`), `ReadFile` 12 bytes.
  3. Éxito si `RX[9] == 0x51` (selector `0x12`); mensaje "Сброс выполнен успешно". Si no: "Сброс не выполнен… Попробуйте в другой раз".
  4. Para `0x22` (si el menú existiera) **no hay comprobación** (el EXE siempre muestra éxito) — pero está deshabilitado.
- No hay `Sleep` posterior ni reapertura de sesión en esta rutina. Tras el reset la sesión probablemente se pierde (**no determinado**).
- Esto es **borrado de aprendizajes + reinicio**, no "aprendizaje".

---
## 3. Actuadores individuales — `Graf.pas` (menú `DriveIM`)
### 3.1 Mapa de entradas (selector `0x12`)
El combo `CaseIM` se rellena en `DriveIMClick` (L5571–L5805, rama `cmp [sel],0x12`) con el ítem 0 = `-` (cadena 0x4DE250) y 12 ítems. `CaseIMSelect` (L6195–6535, tabla VA `0x4DE6AC`) guarda el ID en `[0x4F5888]`:
| ItemIndex | Texto del EXE (ruso) | Significado | ID local |
|---|---|---|---|
| 0 | `-` | sin selección | — |
| 1–4 | форсунка 1…4 | inyector 1…4 | `0x32` |
| 5 | реле кондиционера | relé A/C | `0x15` |
| 6 | реле низкой скорости вентилятора | relé ventilador baja | `0x13` |
| 7 | реле высокой скорости вентилятора | relé ventilador alta | `0x14` |
| 8 | лампа неисправности | lámpara MIL | `0x10` |
| 9 | реле бензонасоса | relé bomba de combustible | `0x12` |
| 10 | петля обратной связи | lazo de realimentación | `0x37` |
| 11 | тест регулятора ХХ | regulador de ralentí | `0x18` |
| 12 | нагреватель ДК | calefactor sonda O2 | `0x40` |
(Estados: `CONFIRMADO_EXE`. Nombres en español = traducción mía de las cadenas del EXE.)

### 3.2 Comandos (todos `CONFIRMADO_EXE`; ninguno probado en vehículo)
| Acción | Trama | Read count | Referencia |
|---|---|---|---|
| Consultar estado (`TForm1.Driver`) | `83 11 F1 30 <ID> 01 chk` | 0x0F | `main.pas` L16344–16510 (pausa previa de 100 ms con `GetTickCount`) |
| ON genérico | `84 11 F1 30 <ID> 07 FF chk` | 0x10 | `test_ONClick` L6747, trama 0x4DEB7B |
| OFF genérico | `84 11 F1 30 <ID> 07 00 chk` | no extraído | `test_OFFClick` L6535, trama 0x4DE97C |
| ON inyector | `85 11 F1 30 32 07 FF <cil> chk`, `cil = ItemIndex − 1` (0..3) | 0x12 | 0x4DEAAA; `dec eax` 0x4DEAE3 |
| OFF inyector | `85 11 F1 30 32 07 00 <cil> chk`, `cil = ItemIndex − 1` | no extraído | 0x4DE91C; `dec eax` 0x4DE953 |
| Devolver control | `83 11 F1 30 <ID> 00 chk` | 0x0F | `FormClose` L5071 (sin comprobación de selector en el tramo leído); `DriveIMClick` L6150 |
- Antes de ON/OFF: `Sleep(100 ms)` (0x4DEA3A).
- Interpretación de respuesta: tras ON compara `RX[14]` y `RX[15]` con 0 para elegir el texto de estado del panel (`stat`); tras OFF compara `RX[14]`, `RX[15]`, `RX[12]`. Textos de estado: cadenas con caracteres no representables en el volcado ("-?-" y variantes); **el texto exacto no se extrajo**.
- `Driver`: estado = `RX[13]` (`0` = apagado, otro = encendido) si `RX[10] == 0x70` (SID positivo).
- Duración: **no hay temporizador de apagado automático** en el EXE: el actuador queda activo hasta pulsar OFF, cambiar de ítem o cerrar el panel (que envía `30 ID 00`). `NO_VERIFICADO` si el ECU limita el tiempo por su cuenta.
- Criterio de éxito/fallo: solo el texto de estado; no hay NRC explícito. **No hay precondiciones de contacto/motor en el EXE** para estas pruebas.
- Pasos finales: `30 ID 00` al cerrar; el EXE no enciende/apaga contacto ni motor.

### 3.3 Selector de cilindro ON/OFF: EXE frente a Android (`KwpProtocol.buildMr140ActuatorControlRequest`, `DelphiActuatorCatalog`)
- `DelphiActuatorCatalog` define el inyector con `injectorIndex` 0..3 ("índice de combo 0..3"), pero el combo real del EXE tiene el ítem 0 = `-` y los inyectores son `ItemIndex` **1..4**; el byte enviado es siempre `ItemIndex−1 = 0..3`.
- Android: ON usa `injectorIndex − 1` → inyector "1" envía `FF`, "2" envía `00`, "3" `01`, "4" `02`. OFF usa `injectorIndex` → `00..03`. El test unitario `preservesDelphiInjectorSpecialCaseForAllFourCylinders` fija ese desfase (`85 11 F1 30 32 07 FF FF EE`).
- Efecto: pulsar ON en "Prueba inyector 2" activaría el cilindro que el EXE llama "inyector 1" y `FF` no es un valor que use el EXE. ON y OFF no actúan sobre el mismo cilindro. `CONFIRMADO_EXE` (código); efecto físico `NO_VERIFICADO`.
- El resto del catálogo (IDs `0x15,0x13,0x14,0x10,0x12,0x37,0x18,0x40`) coincide con el EXE.
- **Verificado de nuevo en v2** sobre los bytes del EXE: ON `0x4DEAE3` y OFF `0x4DE953` hacen `call [CaseIM+0xCC]` (`TComboBox.ItemIndex`) seguido de `dec eax`; el ítem 0 del combo es `-` (cadena `0x4DE250`) y hay 13 ítems en total.
- Corrección precisa: en el snapshot, **ON está mal** (`injectorIndex−1`) y **OFF está bien** (`injectorIndex`). Parche `patches/0002-fix-mr140-injector-cylinder-byte.patch` (envía `injectorIndex` en ambos y reescribe el test); no compilado/ejecutado.
- Tramas correctas según el EXE (checksum calculado): inyector 1 ON `85 11 F1 30 32 07 FF 00 EF` / OFF `… 07 00 00 F0`; inyector 2 ON `… FF 01 F0` / OFF `… 00 01 F1`; inyector 3 ON `… FF 02 F1` / OFF `… 00 02 F2`; inyector 4 ON `… FF 03 F2` / OFF `… 00 03 F3`.

## 4. `Test_DK` (no es actuador)
`TForm1.Test_DKClick` (L16512): busca en la tabla las filas del selector actual con nombre "Сигнал ДК1" (ID 13) y "Кратковременная коррекция топливоподачи" (ID 27), activa la bandera VA `0x4F7234` (el ciclo de datos entonces solo lee F0) y abre el gráfico (`TGrafForm.ShowModal`). No envía comando de actuación.

## 5. Lo que no se encontró (no inventar)
- Aprendizajes de marcha lenta / mezcla / inmovilizador / lazo (solo el ID `0x2C` del acelerador).
- Cualquier rutina ZF distinta de lectura (DTC, ident, bloque F0).
- Condiciones de seguridad adicionales (velocidad = 0, temperatura): **no hay comprobaciones** en el EXE salvo las del mensaje de advertencia del aprendizaje (texto, no verificadas por código) y RPM ≥ 500.

## 6. Precondiciones, respuesta esperada y cómo abortar (resumen v2)
| Rutina | Precondiciones en el EXE (código) | Respuesta esperada | Abortar | Autorización física |
|---|---|---|---|---|
| Actuador individual | Elegir un ítem (ID en `[0x4F5888]`); `Sleep(100)`; ninguna comprobación de contacto/motor/velocidad | `70 …` (SID `0x70`); estado en `RX[13]` (consulta) o `RX[14]/RX[15]` (ON); semántica no determinada | OFF `84 11 F1 30 <ID> 07 00 chk` (inyector `85 … 07 00 <cil>`); devolver control `83 11 F1 30 <ID> 00 chk`; cerrar el panel; no hay apagado automático | **NO autorizada** |
| Aprendizaje de acelerador | Mensaje de advertencia (freno de mano, A/C apagado, P/N, motor en marcha); F0 legible | `70` a `30 2C 07 FF`; luego F0 con `61` | Botón Cancelar → bandera `0x4F721E`; el EXE **no** envía comando de cancelación al ECU | **NO autorizada** |
| Reset `11 01` | Confirmación `MessageBox` | `RX[9]==0x51` | — (acción puntual) | **NO autorizada** |
| ZF (cualquiera) | — | — | — | **No existe en el EXE; no atribuir a ZF** |
Dependencia nueva (v2): el aprendizaje necesita leer F0 (RPM = ID 9, MAP = ID 1). En Android F0 solo es utilizable tras `DEFINE_F0_MR140` aceptada (`CLAUDE_2C_DYNAMIC_BLOCKS.md`); sin ello no replicar la rutina.
