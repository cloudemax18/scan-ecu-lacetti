# Distribución de CheviExplorer

## APK de pruebas (debug)

Cada push a `main`, pull request a `main` y ejecución manual corre los tests KWP y compila un APK debug. Descárgalo desde **Actions → ejecución → Artifacts → CheviExplorerAndroid-debug-…**. Los artefactos debug caducan a los 14 días.

La variante debug usa el identificador `com.cheviexplorer.android.debug`, por lo que puede coexistir con la variante release.

## Publicar APK release firmado

1. Crea una clave de firma Android persistente y guárdala en un lugar seguro fuera del repositorio. No generes una clave nueva para cada publicación.
2. En **Settings → Secrets and variables → Actions**, configura estos cuatro repository secrets:
   - `ANDROID_KEYSTORE_BASE64`: archivo keystore codificado en Base64.
   - `ANDROID_KEYSTORE_PASSWORD`: contraseña del keystore.
   - `ANDROID_KEY_ALIAS`: alias de la clave.
   - `ANDROID_KEY_PASSWORD`: contraseña de la clave.
3. Crea y sube un tag semántico, por ejemplo `v0.2.0`.
4. Actions ejecuta tests, compila el release firmado y publica `CheviExplorer-release.apk) como asset del GitHub Release.

No se incluye una clave ni contraseña en el repositorio. Sin los cuatro secrets, el job de publicación falla explícitamente en vez de publicar un APK sin firma válida. Conserva la misma clave para todas las versiones; cambiarla puede impedir actualizar una instalación existente.

El `versionCode` procede de `GITHUB_RUN_NUMBER`, y `versionName` usa la etiqueta `v*` en builds etiquetados. El APK debug y el release tienen application IDs distintos.

## Actualización desde la app

La comprobación de actualizaciones está disponible en el APK release y consulta el último GitHub Release. Solo reconoce el asset `CheviExplorer-release.apk`; descarga el archivo y abre el instalador estándar de Android. Android puede solicitar permiso para instalar aplicaciones desconocidas. La instalación nunca se hace silenciosamente.

## Subir una captura a GitHub

La app permite subir explícitamente el registro actual como un **Gist secreto/no listado**. En la app, toca **Subir captura a GitHub**, revisa la advertencia y proporciona un token clásico de GitHub con alcance `gist`. El token se usa solo para la solicitud y no se guarda ni se incrusta en el APK.

Un Gist secreto no es privado por control de acceso: cualquiera que tenga su URL puede leerlo. Las capturas pueden incluir identificadores del vehículo; no subas registros que no quieras compartir. Revoca el token cuando ya no lo necesites.

## Seguridad y continuidad

- No hay subida automática de registros.
- No se incorporan credenciales al código ni a los artefactos.
- La firma release depende de secrets configurados por el mantenedor.
- No se cambia la lógica K-Line ni los servicios de diagnóstico existentes.
