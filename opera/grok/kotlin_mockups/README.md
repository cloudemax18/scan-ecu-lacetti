# Kotlin UI mockups — CheviExplorer (referencia de diseño)

**No es código de producción conectado a KWP.**  
**No modifica** `MainActivity.kt` ni el transporte USB/K-Line.

Esta carpeta traduce los HTML de `opera/grok/mockups/` a **constructores de Views** alineados con el estilo real de la app (`buildUi()` en MainActivity: LinearLayout, ScrollView, Spinner, Button).

## Propósito

- Referencia implementable para integrar UI de forma incremental.
- Misma paleta que el código: `#0C0C0E`, `#17171B`, `#007AFF`, `#FFFFFF`, `#A0A0AB`, `#2B2B32`.
- Textos honestos: puerto ≠ KWP; hex + «Sin datos confirmados»; HV-240 no disponible; F0/F1 aplazados; borrar DTC deshabilitado.

## Contenido

| Archivo | Rol |
|---------|-----|
| `UiTokens.kt` | Colores, tipografía, radios, tamaños táctiles |
| `UiComponents.kt` | Badge, botones, filas de datos, empty state, nav |
| `screens/HomeScreen.kt` | Inicio / perfil / estado conexión |
| `screens/ConnectionScreen.kt` | Escalera de estados KKL (diseño; en APK vive en Inicio) |
| `screens/DtcScreen.kt` | DTC lectura sola |
| `screens/LiveDataScreen.kt` | Datos en vivo (hex) |
| `screens/LabScreen.kt` | Laboratorio 0x21 |
| `screens/ActuatorsScreen.kt` | DriverIM MR-140 / empty ZF |
| `CheviExplorerMockUiHost.kt` | Host de ejemplo para previsualizar secciones |
| `REFERENCE_ALL_SCREENS.png` | Imagen referencial de todas las pantallas (si generada) |

## Integración sugerida

1. Revisar textos y estados contra `GROK_UI_AUDIT_PROMPT4.md`.
2. Copiar solo helpers/tokens a la app si se desea.
3. Cablear **eventos de UI** a métodos ya existentes (`requestUsbConnection`, `readDtcCodes`, etc.) sin duplicar protocolo.
4. No habilitar HV-240, clear DTC, F0/F1 ni adaptación hasta evidencia.

## Distinción

| | |
|--|--|
| Este código | Mock / referencia de layout |
| MainActivity actual | UI real del APK |
| HTML mockups | Referencia visual en navegador |
