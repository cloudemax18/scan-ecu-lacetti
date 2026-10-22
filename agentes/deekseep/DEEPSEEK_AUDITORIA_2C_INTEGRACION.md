# DEEPSEEK_AUDITORIA_2C_INTEGRACION

## Auditoría independiente de la integración de bloques dinámicos 0x2C

**Fecha**: 2026-10-21
**Alcance**: Propuesta de Claude para definir bloques dinámicos 0x2C y habilitar lecturas F0/F1 en CheviExplorer.
**Limitación crítica**: No se ha podido acceder a `CLAUDE_2C_INTEGRATION_PROPOSAL.md` ni a su diff. Esta auditoría se basa en los artefactos previos revisados y en los principios de KWP2000 (ISO 14230).

**No se ha ejecutado JUnit, Gradle ni CI. No se han realizado pruebas físicas.**

---

### 1. Riesgos identificados y evidencia disponible

| Riesgo | Evidencia | Clasificación |
|---|---|---|
| Carrera TesterPresent vs petición diagnóstica | Sin evidencia de mutex en artefactos previos | Hipótesis ALTA |
| Asociación RX↔petición no unívoca | Sin evidencia de correlación por SID | Hipótesis ALTA |
| Checksum no validado | Confirmado: KwpProtocol.kt no existe | BLOQUEANTE confirmado |
| Framing limitado a <=63 bytes | Confirmado en KwpBus.kt L13 | MEDIO confirmado |
| Dirección origen no verificada | Sin evidencia de validación de frame[2] | ALTO hipótesis |
| NRC incompleto no distinguido | Confirmado: cae en "respuesta inesperada" | ALTO confirmado |
| Timeout/CS/truncada colapsados en null | Confirmado en KwpBus | ALTO confirmado |
| Gate 0x2C no atómico | Depende del patch no visible | Hipótesis ALTA |
| F0/F1 sin gate de sesión | Confirmado: IdProbe lista F0/F1 sin precondición | ALTO confirmado |
| Herencia de perfil | Sin evidencia de ProfileGuard | Hipótesis MEDIA |

### 2. Evidencia necesaria para confirmar hipótesis

| Hipótesis | Evidencia necesaria | Experimento |
|---|---|---|
| Carrera TesterPresent | Código de KwpBus con/sin Mutex | Simular 3E cada 2s + 21 02 |
| Asociación RX | Código de correlación por SID | Enviar 21 02 y 21 03 con RX invertidas |
| Gate no atómico | Lógica del patch | 2C F0 positivo + 2C F1 NRC |
| Gate de sesión anterior | Reinicio de estado | Reconectar y verificar que no se reutiliza gate |
| Herencia de perfil | Validación de perfil | Cambiar perfil sin reiniciar |

### 3. Criterios de aceptación

1. Exclusión mutua: solo una petición diagnóstica en vuelo.
2. Correlación: cada RX se asocia a su petición por SID esperado.
3. Validación completa: CS, longitud, dirección y SID antes de interpretar.
4. Gate atómico: F0 y F1 todo-o-nada.
5. Reinicio de estado al cambiar ECU o reconectar.
6. Perfil vinculante: F0/F1 solo con perfil compatible.
7. Regresión: IdProbe, DTC y TesterPresent sin cambios de comportamiento.

### 4. Conclusión

La propuesta no puede auditarse en contenido. Los riesgos son hipótesis plausibles, no vulnerabilidades confirmadas. La evidencia disponible confirma que la capa de transporte no distingue timeout/CS/truncada y que F0/F1 se consultan sin gate. La integración debe demostrar los 7 criterios antes de considerarse segura.

**No se ha modificado ningún archivo. No se ha ejecutado CI. No se han realizado pruebas físicas.**