# DEEPSEEK_BLOCKERS_ADDENDUM_2026-10-21

## Addendum de bloqueantes para la integración de 0x2C

**Fecha**: 2026-10-21
**Base**: Auditoría de la propuesta de Claude (archivo no accesible).
**Nota**: Este addendum no sustituye a DEEPSEEK_BLOCKERS.md; lo complementa.

---

### BLOQUEANTE-2C-01: Checksum no validado en recepción

- **Estado**: Confirmado (arrastrado de auditorías previas).
- **Evidencia**: KwpProtocol.kt no existe; IdProbe no valida CS; KwpBus devuelve ByteArray? sin verificar.
- **Riesgo**: una RX con CS corrupto puede interpretarse como dato válido de F0/F1.
- **Condición para desbloquear**: función de validación de checksum invocada antes de interpretar cualquier payload, con prueba unitaria que demuestre que una trama con CS corrupto no produce datos.

### BLOQUEANTE-2C-02: Gate 0x2C no atómico (F0 aceptada, F1 rechazada)

- **Estado**: Hipótesis ALTA (pendiente de confirmar con el patch de Claude).
- **Evidencia**: no se ha podido revisar la lógica del gate.
- **Riesgo**: si 2C F0 es positivo y 2C F1 devuelve NRC, la app podría habilitar F0 con gate incompleto.
- **Condición para desbloquear**: definición F0+F1 todo-o-nada; prueba unitaria con F0 positivo + F1 NRC.

### BLOQUEANTE-2C-03: Lecturas F0/F1 sin verificar gate de sesión actual

- **Estado**: Confirmado en código previo.
- **Evidencia**: IdProbe lista F0/F1 en ids sin precondición de gate.
- **Riesgo**: la app puede enviar 21 F0/F1 antes de que 2C se haya completado.
- **Condición para desbloquear**: IdProbe consulta estado de gate que se activa solo tras 2C positivo y se reinicia al cambiar ECU o reconectar.

### BLOQUEANTE-2C-04: Concurrencia TesterPresent vs peticiones diagnósticas

- **Estado**: Hipótesis ALTA.
- **Evidencia**: sin evidencia de mutex en artefactos previos.
- **Riesgo**: RX de TesterPresent podría asociarse a una petición 21 F0 pendiente.
- **Condición para desbloquear**: cola o mutex con correlación por SID esperado; prueba unitaria con corrutinas.

### BLOQUEANTE-2C-05: Herencia de perfil entre MR-140, ZF 4HP16 y HV-240

- **Estado**: Hipótesis MEDIA.
- **Evidencia**: sin ProfileGuard visible.
- **Riesgo**: un gate definido para MR-140 podría aplicarse a ZF 4HP16 o HV-240.
- **Condición para desbloquear**: reinicio de estado al cambiar perfil; prueba unitaria de cambio sin reinicio.

---

## Tabla resumen

| ID | Bloqueante | Severidad | Estado |
|---|---|---|---|
| BLOQUEANTE-2C-01 | Checksum no validado | BLOQUEANTE | Confirmado |
| BLOQUEANTE-2C-02 | Gate 0x2C no atómico | BLOQUEANTE (potencial) | Hipótesis |
| BLOQUEANTE-2C-03 | F0/F1 sin gate de sesión | ALTO | Confirmado |
| BLOQUEANTE-2C-04 | Concurrencia TesterPresent | ALTO | Hipótesis |
| BLOQUEANTE-2C-05 | Herencia de perfil | MEDIO | Hipótesis |

**No se ha modificado ningún archivo. No se ha ejecutado CI. No se han realizado pruebas físicas.**