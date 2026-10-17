package com.cheviexplorer.android

import android.app.Activity
import android.app.AlertDialog
import android.net.Uri
import android.os.Build
import androidx.core.content.FileProvider
import java.io.File
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.hardware.usb.UsbManager
import android.os.Bundle
import android.view.Gravity
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import com.hoho.android.usbserial.driver.UsbSerialPort
import com.hoho.android.usbserial.driver.UsbSerialProber
import com.hoho.android.usbserial.util.SerialInputOutputManager
import com.cheviexplorer.android.kwp.IdProbe
import com.cheviexplorer.android.kwp.KwpBus
import com.cheviexplorer.android.kwp.SerialIo
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.runBlocking
import java.io.ByteArrayOutputStream
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.Executors
import java.util.concurrent.ScheduledExecutorService
import java.util.concurrent.ScheduledFuture
import java.util.concurrent.TimeUnit

class MainActivity : Activity(), SerialInputOutputManager.Listener {
    companion object { private const val ACTION_USB_PERMISSION = "com.cheviexplorer.android.USB_PERMISSION" }

    private lateinit var usbManager: UsbManager
    private lateinit var status: TextView
    private lateinit var log: TextView
    private lateinit var baud: Spinner
    private lateinit var connectButton: Button
    private lateinit var ecuProfile: Spinner
    private var port: UsbSerialPort? = null
    private var ioManager: SerialInputOutputManager? = null
    private val REQUEST_SAVE_LOG = 7104
    private val executor: ScheduledExecutorService = Executors.newSingleThreadScheduledExecutor()
    private val testerPresentExecutor: ScheduledExecutorService = Executors.newSingleThreadScheduledExecutor()
    @Volatile private var testerPresentTask: ScheduledFuture<*>? = null
    private val initRxLock = Any()
    private val serialWriteLock = Any()
    private val initRxBuffer = ByteArrayOutputStream()
    private val diagnosticRxQueue = java.util.concurrent.LinkedBlockingQueue<Byte>()
    @Volatile private var captureInitRx = false
    @Volatile private var validatedStartProfile: String? = null
    private var pendingUpdateFile: File? = null
    private val dateFormat = SimpleDateFormat("HH:mm:ss", Locale.US)

    private val permissionReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {
            if (intent.action == ACTION_USB_PERMISSION) {
                val granted = intent.getBooleanExtra(UsbManager.EXTRA_PERMISSION_GRANTED, false)
                if (granted) openSerialPort() else setStatus("Permiso USB denegado")
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        usbManager = getSystemService(Context.USB_SERVICE) as UsbManager
        val usbPermissionFilter = IntentFilter(ACTION_USB_PERMISSION)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(permissionReceiver, usbPermissionFilter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            @Suppress("DEPRECATION")
            registerReceiver(permissionReceiver, usbPermissionFilter)
        }
        buildUi()
        setStatus("Desconectado · Chevrolet Lacetti 1.8 LDA · 2008")
        appendLog("Aplicación iniciada. Conecta el KKL mediante USB OTG.")
        appendLog("Esta versión prueba el enlace serie; el protocolo ECU específico aún debe validarse.")
    }

    private fun buildUi() {
        val root = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL; setPadding(20, 22, 20, 18); setBackgroundColor(0xFF101820.toInt()) }
        val title = TextView(this).apply { text = "CheviExplorer"; textSize = 28f; setTextColor(0xFFFFFFFF.toInt()); gravity = Gravity.CENTER_VERTICAL }
        root.addView(title, lp(-1, -2))
        root.addView(TextView(this).apply { text = "ANDROID · KKL 409.1 · CH340/CH341"; textSize = 12f; setTextColor(0xFFFF6B6B.toInt()); setPadding(0, 4, 0, 16) }, lp(-1, -2))
        status = TextView(this).apply { textSize = 14f; setTextColor(0xFFFFFFFF.toInt()); setPadding(12, 14, 12, 14); setBackgroundColor(0xFF263541.toInt()) }
        root.addView(status, lp(-1, -2))
        root.addView(TextView(this).apply { text = "Velocidad serie"; textSize = 14f; setTextColor(0xFFCFD8DC.toInt()); setPadding(0, 16, 0, 4) }, lp(-1, -2))
        baud = Spinner(this).apply { adapter = ArrayAdapter(this@MainActivity, android.R.layout.simple_spinner_dropdown_item, listOf("10400 baud (K-line, por validar)", "9600 baud", "38400 baud", "4800 baud")) }
        root.addView(baud, lp(-1, -2))
        root.addView(TextView(this).apply { text = "Perfil de ECU"; textSize = 14f; setTextColor(0xFFCFD8DC.toInt()); setPadding(0, 12, 0, 4) }, lp(-1, -2))
        ecuProfile = Spinner(this).apply { adapter = ArrayAdapter(this@MainActivity, android.R.layout.simple_spinner_dropdown_item, listOf("Motor Delphi MR-140", "Transmisión ZF 4HP16")) }
        root.addView(ecuProfile, lp(-1, -2))
        connectButton = Button(this).apply { text = "Buscar / conectar cable"; setOnClickListener { requestUsbConnection() } }
        root.addView(connectButton, lp(-1, -2))
        val initButton = Button(this).apply {
            text = "Inicializar ECU · solo identificación"
            setOnClickListener { initializeSelectedEcu() }
        }
        root.addView(initButton, lp(-1, -2))
        val identifyButton = Button(this).apply {
            text = "Consultar identificación ECU · 1A 80"
            setOnClickListener { requestEcuIdentification() }
        }
        root.addView(identifyButton, lp(-1, -2))
        val dtcButton = Button(this).apply {
            text = "Leer códigos de avería (DTC) · solo lectura"
            setOnClickListener { readDtcCodes() }
        }
        root.addView(dtcButton, lp(-1, -2))
        val liveParamsButton = Button(this).apply {
            text = "Leer datos MR-140 · IDs confirmados 02/03/04"
            setOnClickListener { readMr140Parameters() }
        }
        root.addView(liveParamsButton, lp(-1, -2))
        val testerPresentButton = Button(this).apply {
            text = "Enviar TesterPresent · mantener sesión"
            setOnClickListener { sendTesterPresentOnce() }
        }
        root.addView(testerPresentButton, lp(-1, -2))
        val probeButton = Button(this).apply {
            text = "Explorar IDs KWP 0x21 · solo lectura"
            setOnClickListener { probeLocalIdentifiers() }
        }
        root.addView(probeButton, lp(-1, -2))
        val note = TextView(this).apply {
            text = "Inicializa primero la ECU. MR-140: registros DTC de 4 bytes; ZF 4HP16: registros de 3 bytes. El parser Delphi indica que 59 00 significa sin averías y que el estado 0x60 es intermitente. Los datos MR-140 02/03/04 se muestran en bruto hasta verificar su mapa y fórmulas. Borrado, seguridad y actuadores siguen deshabilitados."
            textSize = 13f; setTextColor(0xFFFFD180.toInt()); setPadding(0, 12, 0, 12)
        }
        root.addView(note, lp(-1, -2))
        root.addView(TextView(this).apply { text = "REGISTRO DE COMUNICACIÓN"; textSize = 12f; setTextColor(0xFF90A4AE.toInt()); setPadding(0, 6, 0, 8) }, lp(-1, -2))
        log = TextView(this).apply { textSize = 12f; typeface = android.graphics.Typeface.MONOSPACE; setTextColor(0xFFECEFF1.toInt()); setPadding(10, 10, 10, 10) }
        val scroll = ScrollView(this).apply { setBackgroundColor(0xFF18232C.toInt()); addView(log) }
        root.addView(scroll, LinearLayout.LayoutParams(-1, 0, 1f))
        val save = Button(this).apply { text = "Exportar captura RX"; setOnClickListener { exportLog() } }
        root.addView(save, lp(-1, -2))
        val update = Button(this).apply {
            text = "Buscar actualización de CheviExplorer"
            setOnClickListener { checkForUpdates() }
        }
        root.addView(update, lp(-1, -2))
        val clear = Button(this).apply { text = "Limpiar registro"; setOnClickListener { log.text = "" } }
        root.addView(clear, lp(-1, -2))
        setContentView(root)
    }

    private fun checkForUpdates() {
        if (BuildConfig.DEBUG) {
            appendLog("ACTUALIZACIONES: buscando la última compilación debug exitosa en GitHub Actions.")
            executor.execute {
                try {
                    val buildUrl = GitHubDistribution.fetchLatestSuccessfulDebugBuild()
                    runOnUiThread {
                        AlertDialog.Builder(this)
                            .setTitle("Compilación debug disponible")
                            .setMessage("Se encontró la última compilación exitosa de CheviExplorer en GitHub Actions. Abre la ejecución para descargar el artefacto APK debug. La instalación manual puede requerir desinstalar una compilación debug firmada con otra clave.")
                            .setNegativeButton("Cancelar", null)
                            .setPositiveButton("Abrir compilación") { _, _ ->
                                startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(buildUrl)))
                            }
                            .show()
                    }
                } catch (e: Exception) {
                    appendLog("ERROR BUSCANDO DEBUG EN ACTIONS: ${e.message ?: e.javaClass.simpleName}")
                    runOnUiThread {
                        Toast.makeText(this, "No se pudo comprobar la compilación debug en GitHub Actions", Toast.LENGTH_LONG).show()
                    }
                }
            }
            return
        }
        appendLog("ACTUALIZACIONES: consultando GitHub Releases.")
        executor.execute {
            try {
                val latest = GitHubDistribution.fetchLatestRelease()
                val remoteVersion = latest.tagName.removePrefix("v")
                val localVersion = BuildConfig.VERSION_NAME
                if (!isVersionNewer(remoteVersion, localVersion)) {
                    appendLog("ACTUALIZACIONES: versión instalada $localVersion; release más reciente detectado ${latest.tagName}.")
                    runOnUiThread {
                        Toast.makeText(this, "CheviExplorer está actualizado ($localVersion)", Toast.LENGTH_LONG).show()
                    }
                    return@execute
                }
                runOnUiThread {
                    AlertDialog.Builder(this)
                        .setTitle("Actualización disponible")
                        .setMessage("Versión instalada: $localVersion\nNueva versión: ${latest.tagName}\n\nSe descargará el APK release firmado desde GitHub.")
                        .setNegativeButton("Ahora no", null)
                        .setPositiveButton("Descargar e instalar") { _, _ -> downloadAndInstall(latest) }
                        .show()
                }
            } catch (e: Exception) {
                appendLog("ERROR BUSCANDO ACTUALIZACIÓN: ${e.message ?: e.javaClass.simpleName}")
                runOnUiThread {
                    Toast.makeText(this, "No se pudo comprobar GitHub Releases", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    private fun isVersionNewer(remote: String, local: String): Boolean {
        fun parts(value: String): List<Int> =
            Regex("\\d+").findAll(value).take(4).mapNotNull { it.value.toIntOrNull() }.toList()
        val a = parts(remote)
        val b = parts(local)
        if (a.isEmpty() || b.isEmpty()) return remote != local
        for (i in 0 until maxOf(a.size, b.size)) {
            val av = a.getOrElse(i) { 0 }
            val bv = b.getOrElse(i) { 0 }
            if (av != bv) return av > bv
        }
        return false
    }

    private fun downloadAndInstall(release: GitHubDistribution.ReleaseInfo) {
        appendLog("ACTUALIZACIONES: descargando ${release.tagName} desde GitHub.")
        executor.execute {
            try {
                val apk = File(cacheDir, "updates/CheviExplorer-release.apk")
                GitHubDistribution.downloadApk(release.apkUrl, apk)
                runOnUiThread {
                    pendingUpdateFile = apk
                    installDownloadedApk(apk)
                }
            } catch (e: Exception) {
                appendLog("ERROR DESCARGANDO APK: ${e.message ?: e.javaClass.simpleName}")
                runOnUiThread {
                    Toast.makeText(this, "No se pudo descargar el APK de actualización", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

    private fun installDownloadedApk(apk: File) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O && !packageManager.canRequestPackageInstalls()) {
            pendingUpdateFile = apk
            AlertDialog.Builder(this)
                .setTitle("Permitir instalación")
                .setMessage("Android necesita permiso para instalar APK descargados fuera de Play Store. Actívalo para CheviExplorer y vuelve a la aplicación.")
                .setNegativeButton("Cancelar") { _, _ -> pendingUpdateFile = null }
                .setPositiveButton("Abrir ajustes") { _, _ ->
                    startActivity(Intent(android.provider.Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES, Uri.parse("package:$packageName")))
                }
                .show()
            return
        }
        pendingUpdateFile = null
        try {
            val uri = FileProvider.getUriForFile(this, "$packageName.fileprovider", apk)
            val intent = Intent(Intent.ACTION_VIEW).apply {
                setDataAndType(uri, "application/vnd.android.package-archive")
                addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            }
            startActivity(intent)
        } catch (e: Exception) {
            appendLog("ERROR ABRIENDO INSTALADOR: ${e.message ?: e.javaClass.simpleName}")
            Toast.makeText(this, "No se pudo abrir el instalador de Android", Toast.LENGTH_LONG).show()
        }
    }

    override fun onResume() {
        super.onResume()
        val apk = pendingUpdateFile
        if (apk != null && (Build.VERSION.SDK_INT < Build.VERSION_CODES.O || packageManager.canRequestPackageInstalls())) {
            installDownloadedApk(apk)
        }
    }

    private fun lp(w: Int, h: Int) = LinearLayout.LayoutParams(w, h)

    private fun exportLog() {
        val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = "text/plain"
            putExtra(Intent.EXTRA_TITLE, "cheviexplorer-captura-${System.currentTimeMillis()}.txt")
        }
        startActivityForResult(intent, REQUEST_SAVE_LOG)
    }

    @Deprecated("Deprecated in Android API, retained for minSdk compatibility")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_SAVE_LOG && resultCode == RESULT_OK && data?.data != null) {
            try {
                contentResolver.openOutputStream(data.data!!)?.use { output ->
                    output.write(log.text.toString().toByteArray(Charsets.UTF_8))
                } ?: throw IllegalStateException("No se pudo abrir el archivo de destino")
                Toast.makeText(this, "Captura exportada", Toast.LENGTH_LONG).show()
            } catch (e: Exception) {
                appendLog("ERROR al exportar captura: ${e.message ?: e.javaClass.simpleName}")
                Toast.makeText(this, "No se pudo guardar la captura", Toast.LENGTH_LONG).show()
            }
        }
    }

    private fun requestUsbConnection() {
        if (port != null) { disconnect(); return }
        val drivers = UsbSerialProber.getDefaultProber().findAllDrivers(usbManager)
        if (drivers.isEmpty()) {
            setStatus("No se detecta adaptador serie USB")
            appendLog("No hay dispositivos USB serie compatibles. Comprueba OTG, alimentación y cable.")
            Toast.makeText(this, "No se detecta el KKL / CH340 / CH341", Toast.LENGTH_LONG).show()
            return
        }
        val driver = drivers.first()
        val device = driver.device
        appendLog("USB detectado: VID=%04X PID=%04X".format(device.vendorId, device.productId))
        if (!usbManager.hasPermission(device)) {
            val pi = PendingIntent.getBroadcast(this, 0, Intent(ACTION_USB_PERMISSION), PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
            usbManager.requestPermission(device, pi)
        } else openSerialPort()
    }

    private fun openSerialPort() {
        try {
            val driver = UsbSerialProber.getDefaultProber().findAllDrivers(usbManager).firstOrNull()
                ?: throw IllegalStateException("No se encuentra el dispositivo USB")
            val connection = usbManager.openDevice(driver.device) ?: throw IllegalStateException("Android no pudo abrir el dispositivo USB")
            val serialPort = driver.ports.first()
            serialPort.open(connection)
            val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
            serialPort.setParameters(selectedBaud, 8, UsbSerialPort.STOPBITS_1, UsbSerialPort.PARITY_NONE)
            port = serialPort
            validatedStartProfile = null
            ioManager = SerialInputOutputManager(serialPort, this).also { it.start() }
            connectButton.text = "Desconectar"
            setStatus("Puerto serie abierto · $selectedBaud baud · protocolo ECU sin validar")
            appendLog("Puerto abierto: ${driver.javaClass.simpleName}, $selectedBaud baud, 8N1.")
            appendLog("No se han enviado bytes a la ECU. Esperando datos del enlace.")
        } catch (e: Exception) {
            appendLog("ERROR USB: ${e.message ?: e.javaClass.simpleName}")
            setStatus("Error al abrir el puerto")
            disconnect()
        }
    }

    private fun initializeSelectedEcu() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            appendLog("INIT cancelada: el puerto serie no está abierto.")
            return
        }

        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        // Captured/original-program StartCommunication request (service 0x81).
        // This is the only ECU request currently enabled in this test build.
        val frame = KwpProtocol.buildStartCommunicationRequest(if (isEngine) 0x11 else 0x18)
        val selectedBaud = when (baud.selectedItemPosition) {
            1 -> 9600
            2 -> 38400
            3 -> 4800
            else -> 10400
        }
        if (selectedBaud != 10400) {
            Toast.makeText(this, "Selecciona 10400 baudios para estos perfiles", Toast.LENGTH_LONG).show()
            appendLog("INIT cancelada: $profile requiere el perfil de prueba a 10400 baudios.")
            return
        }

        appendLog("INIT $profile: comprobando soporte de inicialización K-Line; trama candidata, aún no validada.")
        executor.execute {
            var stage = "limpieza de búfer"
            try {
                try {
                    serialPort.purgeHwBuffers(true, true)
                } catch (e: UnsupportedOperationException) {
                    appendLog("AVISO INIT $profile: el controlador no admite purgeHwBuffers(); se continúa.")
                }

                Thread.sleep(300)
                stage = "prueba de señal BREAK"
                try {
                    serialPort.setBreak(false)
                    Thread.sleep(24)
                    serialPort.setBreak(true)
                    Thread.sleep(24)
                    serialPort.setBreak(false)
                    Thread.sleep(24)
                } catch (e: UnsupportedOperationException) {
                    appendLog("ERROR INIT $profile: el controlador USB (${serialPort.javaClass.simpleName}) no admite BREAK.")
                    appendLog("No se envió TX. Se cancela para evitar una inicialización K-Line inválida.")
                    runOnUiThread {
                        Toast.makeText(this@MainActivity, "El controlador no admite BREAK; no se envió la trama", Toast.LENGTH_LONG).show()
                    }
                    return@execute
                }

                stage = "envío de trama"
                synchronized(initRxLock) {
                    initRxBuffer.reset()
                    captureInitRx = true
                }
                appendLog("TX $profile  " + frame.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) })
                writeSerialFrame(serialPort, frame, 1000)
                stage = "espera de respuesta"
                Thread.sleep(1500)
                val rawRxBytes = synchronized(initRxLock) {
                    captureInitRx = false
                    initRxBuffer.toByteArray()
                }
                val rxBytes = discardLeadingInitZero(rawRxBytes, profile)
                classifyInitResult(profile, frame, rxBytes)
            } catch (e: Exception) {
                synchronized(initRxLock) { captureInitRx = false }
                val detail = e.message?.takeIf { it.isNotBlank() } ?: "(sin mensaje)"
                appendLog("ERROR INIT $profile en $stage: ${e.javaClass.simpleName}: $detail")
            }
        }
    }

    private fun classifyInitResult(profile: String, txFrame: ByteArray, rxBytes: ByteArray) {
        val hex = rxBytes.toHex()
        if (rxBytes.isEmpty()) {
            appendLog("RESULTADO $profile: SIN RESPUESTA RX durante 1500 ms.")
            appendLog("No se confirma comunicación con la ECU; revisar BREAK, cableado K-Line y alimentación.")
            return
        }

        var candidate = rxBytes
        var hadEcho = false
        if (rxBytes.size >= txFrame.size && rxBytes.copyOfRange(0, txFrame.size).contentEquals(txFrame)) {
            hadEcho = true
            candidate = rxBytes.copyOfRange(txFrame.size, rxBytes.size)
            appendLog("ECO TX detectado: ${txFrame.toHex()}")
        }

        if (candidate.isEmpty()) {
            appendLog("RESULTADO $profile: SOLO ECO TX (RX = trama enviada).")
            appendLog("Esto no demuestra respuesta de la ECU; no marcar como conectado.")
            return
        }

        val frameCheck = KwpProtocol.findResponse(candidate, expectedSource = if (profile == "MR-140") 0x11 else 0x18)
        if (frameCheck != null) {
            appendLog("RX CANDIDATA $profile: ${frameCheck.bytes.toHex()}")
            appendLog("VALIDACIÓN DE TRAMA: ${frameCheck.description}")
            if (frameCheck.valid) {
                appendLog("RESULTADO $profile: trama con formato/dirección/checksum coherentes.")
                val keys = KwpProtocol.startCommunicationKeys(frameCheck)
                if (keys != null) {
                    val keyHex = keys.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
                    appendLog("KWP StartCommunication: respuesta positiva 0xC1 al servicio 0x81; bytes de clave=$keyHex.")
                    validatedStartProfile = profile
                    startAutomaticTesterPresent(profile, if (profile == "MR-140") 0x11 else 0x18, serialPort = port)
                    appendLog("Estas claves no son una identificación de ECU; se puede probar el servicio de identificación 1A 80.")
                } else {
                    appendLog("Respuesta estructural válida, pero no se ha confirmado respuesta positiva al servicio StartCommunication.")
                }
            } else {
                appendLog("RESULTADO $profile: se detectó una cabecera candidata, pero la trama no supera todas las validaciones.")
            }
            val remaining = candidate.drop(frameCheck.bytes.size).toByteArray()
            if (remaining.isNotEmpty()) appendLog("RX restante/no clasificada: ${remaining.toHex()}")
        } else {
            appendLog("RESULTADO $profile: ${if (hadEcho) "ECO TX + " else ""}RX sin trama K-Line reconocible: $hex")
            appendLog("No se confirma una respuesta válida de la ECU.")
        }
    }

    private fun requestEcuIdentification() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("IDENT ECU cancelada: conecta primero el adaptador USB.")
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        if (validatedStartProfile != profile) {
            appendLog("IDENT ECU cancelada: inicializa primero $profile y confirma la respuesta positiva StartCommunication.")
            Toast.makeText(this, "Inicializa primero el perfil seleccionado", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("IDENT ECU cancelada: $profile requiere 10400 baudios en esta prueba.")
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }

        val frame = KwpProtocol.buildEcuIdentificationRequest(source)
        appendLog("IDENT ECU $profile: solicitud de lectura 1A 80 reconstruida del programa original.")
        executor.execute {
            var stage = "preparación de captura"
            try {
                synchronized(initRxLock) {
                    initRxBuffer.reset()
                    captureInitRx = true
                }
                stage = "envío de solicitud 1A 80"
                appendLog("TX IDENT $profile  ${frame.toHex()}")
                writeSerialFrame(serialPort, frame, 1000)
                stage = "espera de respuesta"
                Thread.sleep(1500)
                val rxBytes = synchronized(initRxLock) {
                    captureInitRx = false
                    initRxBuffer.toByteArray()
                }
                if (rxBytes.isEmpty()) {
                    appendLog("IDENT ECU $profile: sin respuesta RX durante 1500 ms.")
                    return@execute
                }

                var echoIndex = -1
                if (rxBytes.size >= frame.size) {
                    for (i in 0..(rxBytes.size - frame.size)) {
                        if (rxBytes.copyOfRange(i, i + frame.size).contentEquals(frame)) {
                            echoIndex = i
                            break
                        }
                    }
                }
                val candidate = if (echoIndex >= 0) {
                    appendLog("ECO TX IDENT detectado: ${frame.toHex()}")
                    rxBytes.copyOfRange(echoIndex + frame.size, rxBytes.size)
                } else rxBytes

                if (candidate.isEmpty()) {
                    appendLog("IDENT ECU $profile: solo eco TX; no se recibió respuesta adicional.")
                    return@execute
                }
                val response = KwpProtocol.findResponse(candidate, expectedSource = source)
                if (response == null) {
                    appendLog("IDENT ECU $profile: RX sin trama reconocible: ${candidate.toHex()}")
                    return@execute
                }
                appendLog("RX IDENT CANDIDATA $profile: ${response.bytes.toHex()}")
                appendLog("VALIDACIÓN IDENT: ${response.description}")
                when {
                    !response.valid -> appendLog("IDENT ECU $profile: checksum inválido; no se interpreta el contenido.")
                    KwpProtocol.isPositiveResponseTo(response, 0x1A) -> {
                        val rawPayload = response.payload.toHex()
                        appendLog("IDENT ECU $profile: respuesta positiva 0x5A al servicio 0x1A.")
                        appendLog("PAYLOAD IDENT RAW (incluye 5A 80): $rawPayload")
                        val fields = EcuIdentificationDecoder.decode(profile, response.payload)
                        if (fields.isEmpty()) {
                            appendLog("IDENT ECU $profile: el payload no coincide con el prefijo/longitud esperados; no se asignan campos.")
                        } else {
                            fields.forEach { appendLog("IDENTIFICACIÓN $profile · ${it.name}: ${it.value}") }
                            appendLog("AVISO: campos decodificados con ident_decodificacion.json; contrastar con el ejecutable original, especialmente VIN MR-140 (parser original lee 16 de 17 caracteres).")
                        }
                    }
                    KwpProtocol.isNegativeResponseTo(response, 0x1A) -> {
                        val nrc = response.payload[2].toInt() and 0xFF
                        appendLog("IDENT ECU $profile: respuesta negativa KWP, NRC=0x%02X.".format(nrc))
                    }
                    else -> appendLog("IDENT ECU $profile: trama válida, pero el SID no coincide con una respuesta positiva/negativa reconocida para 1A.")
                }
                val remaining = candidate.drop(response.bytes.size).toByteArray()
                if (remaining.isNotEmpty()) appendLog("RX IDENT restante/no clasificada: ${remaining.toHex()}")
            } catch (e: Exception) {
                synchronized(initRxLock) { captureInitRx = false }
                appendLog("ERROR IDENT ECU $profile en $stage: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            }
        }
    }


    /**
     * Read-only raw-data query for MR-140 identifiers confirmed by physical captures.
     * The ZF profile is intentionally not supported until its own parameter map is verified.
     */
    private fun readMr140Parameters() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("PARÁMETROS MR-140 cancelados: conecta primero el adaptador USB.")
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        if (ecuProfile.selectedItemPosition != 0) {
            appendLog("PARÁMETROS EN VIVO: solo hay tabla preliminar para MR-140; no se envía ninguna solicitud a ZF 4HP16.")
            Toast.makeText(this, "Selecciona Motor Delphi MR-140", Toast.LENGTH_LONG).show()
            return
        }
        if (validatedStartProfile != "MR-140") {
            appendLog("PARÁMETROS MR-140 cancelados: inicializa primero la ECU.")
            Toast.makeText(this, "Inicializa primero MR-140", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("PARÁMETROS MR-140 cancelados: se requiere 10400 baudios.")
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }

        appendLog("MR-140: lectura de solo lectura de IDs 02/03/04 confirmados por capturas físicas; datos sin decodificar.")
        executor.execute {
            for (localId in listOf(0x02, 0x03, 0x04)) {
                var stage = "captura"
                try {
                    val frame = KwpProtocol.buildMr140ParameterRequest(localId)
                    synchronized(initRxLock) {
                        initRxBuffer.reset()
                        captureInitRx = true
                    }
                    stage = "envío del grupo %02X".format(localId)
                    appendLog("TX MR-140 grupo %02X: %s".format(localId, frame.toHex()))
                    writeSerialFrame(serialPort, frame, 1000)
                    stage = "espera de respuesta"
                    Thread.sleep(1200)
                    val rxBytes = synchronized(initRxLock) {
                        captureInitRx = false
                        initRxBuffer.toByteArray()
                    }
                    if (rxBytes.isEmpty()) {
                        appendLog("MR-140 grupo %02X: sin respuesta RX en 1200 ms.".format(localId))
                        continue
                    }
                    val echoAt = indexOfFrame(rxBytes, frame)
                    val candidate = if (echoAt >= 0) {
                        appendLog("ECO TX grupo %02X detectado.".format(localId))
                        rxBytes.copyOfRange(echoAt + frame.size, rxBytes.size)
                    } else rxBytes
                    if (candidate.isEmpty()) {
                        appendLog("MR-140 grupo %02X: solo eco; no se interpreta como respuesta ECU.".format(localId))
                        continue
                    }
                    val response = KwpProtocol.findResponse(
                        candidate,
                        expectedSource = 0x11,
                        expectedPayloadPrefix = byteArrayOf(0x61, localId.toByte())
                    ) ?: KwpProtocol.findResponse(
                        candidate,
                        expectedSource = 0x11,
                        expectedPayloadPrefix = byteArrayOf(0x7F, 0x21)
                    )
                    if (response == null) {
                        appendLog(
                            "MR-140 grupo %02X: no se encontró respuesta 61 %02X ni 7F 21; RX raw=%s"
                                .format(localId, localId, candidate.toHex())
                        )
                        continue
                    }
                    appendLog("RX MR-140 grupo %02X: %s".format(localId, response.bytes.toHex()))
                    appendLog("VALIDACIÓN grupo %02X: %s".format(localId, response.description))
                    if (!response.valid) {
                        appendLog("MR-140 grupo %02X: checksum incorrecto; se descarta.".format(localId))
                        continue
                    }
                    val payload = response.payload
                    if (payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x61 &&
                        (payload[1].toInt() and 0xFF) == localId) {
                        val data = payload.copyOfRange(2, payload.size)
                        appendLog("DATOS GRUPO %02X (%d bytes): %s".format(localId, data.size, data.toHex()))
                        appendLog("MR-140 ID %02X: datos brutos solamente; aún no hay un mapa de campos validado.".format(localId))
                    } else if (payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x7F &&
                        (payload[1].toInt() and 0xFF) == 0x21) {
                        appendLog("MR-140 grupo %02X: respuesta negativa KWP NRC=0x%02X.".format(localId, payload[2].toInt() and 0xFF))
                    } else {
                        appendLog("MR-140 grupo %02X: SID/identificador inesperado; payload raw=%s".format(localId, payload.toHex()))
                    }
                } catch (e: Exception) {
                    synchronized(initRxLock) { captureInitRx = false }
                    appendLog("ERROR MR-140 grupo %02X en %s: %s: %s".format(localId, stage, e.javaClass.simpleName, e.message ?: "(sin mensaje)"))
                }
            }
        }
    }

    /**
     * Sends the read-only DTC request reconstructed from Button_DTCClick in main.pas.
     * The ECU-specific response payload is logged raw until its record layout is verified.
     */
    private fun readDtcCodes() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("LECTURA DTC cancelada: conecta primero el adaptador USB.")
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        val requestService = if (isEngine) 0x19 else 0x18
        if (validatedStartProfile != profile) {
            appendLog("LECTURA DTC cancelada: inicializa primero $profile y confirma StartCommunication.")
            Toast.makeText(this, "Inicializa primero el perfil seleccionado", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("LECTURA DTC cancelada: $profile requiere 10400 baudios.")
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }

        val frame = KwpProtocol.buildDtcReadRequest(source, isEngine)
        appendLog("LECTURA DTC $profile: solicitud de solo lectura reconstruida de main.pas.")
        executor.execute {
            var stage = "preparación de captura"
            try {
                synchronized(initRxLock) {
                    initRxBuffer.reset()
                    captureInitRx = true
                }
                stage = "envío de solicitud DTC"
                appendLog("TX DTC $profile  ${frame.toHex()}")
                writeSerialFrame(serialPort, frame, 1000)
                stage = "espera de respuesta"
                Thread.sleep(1800)
                val rxBytes = synchronized(initRxLock) {
                    captureInitRx = false
                    initRxBuffer.toByteArray()
                }
                if (rxBytes.isEmpty()) {
                    appendLog("LECTURA DTC $profile: sin respuesta RX durante 1800 ms.")
                    return@execute
                }

                val echoAt = indexOfFrame(rxBytes, frame)
                val candidate = if (echoAt >= 0) {
                    appendLog("ECO TX DTC detectado: ${frame.toHex()}")
                    rxBytes.copyOfRange(echoAt + frame.size, rxBytes.size)
                } else rxBytes
                if (candidate.isEmpty()) {
                    appendLog("LECTURA DTC $profile: solo eco TX; no se recibió respuesta ECU.")
                    return@execute
                }
                val response = KwpProtocol.findResponse(candidate, expectedSource = source)
                if (response == null) {
                    appendLog("LECTURA DTC $profile: RX sin trama KWP reconocible: ${candidate.toHex()}")
                    return@execute
                }
                appendLog("RX DTC CANDIDATA $profile: ${response.bytes.toHex()}")
                appendLog("VALIDACIÓN DTC: ${response.description}")
                when (val decoded = DtcResponseDecoder.decode(response, requestService, isMr140 = isEngine)) {
                    is DtcResponseDecoder.Result.Invalid ->
                        appendLog("LECTURA DTC $profile: respuesta no interpretable: ${decoded.reason}.")
                    is DtcResponseDecoder.Result.Negative ->
                        appendLog("LECTURA DTC $profile: respuesta negativa KWP, NRC=0x%02X.".format(decoded.nrc))
                    is DtcResponseDecoder.Result.Unexpected ->
                        appendLog("LECTURA DTC $profile: SID inesperado; payload RX: ${decoded.rawPayload.toHex()}")
                    is DtcResponseDecoder.Result.Positive -> {
                        appendLog("LECTURA DTC $profile: respuesta positiva 0x%02X.".format(decoded.responseService))
                        decoded.subfunctionOrStatus?.let {
                            appendLog("DTC: byte de control/estado recibido = 0x%02X.".format(it))
                        }
                        appendLog("DATOS DTC RAW $profile (incluye SID): ${decoded.rawPayload.toHex()}")
                        when {
                            decoded.noFaultsConfirmed -> {
                                appendLog("DTC $profile: sin averías (contador 0 confirmado por el parser Delphi).")
                            }
                            decoded.records.isNotEmpty() -> {
                                decoded.records.forEach { record ->
                                    val description = DtcCatalog.description(this, record.code)
                                    val suffix = description?.let { " — $it" } ?: ""
                                    appendLog("DTC $profile: ${record.code} · estado=${record.state.labelEs} (0x%02X)%s".format(record.statusByte, suffix))
                                }
                                appendLog("AVISO: confirma los DTC decodificados en la ECU; no se suprimen registros aunque el vehículo de prueba se considere sin averías.")
                            }
                            decoded.recordBytes.isEmpty() -> {
                                appendLog("DTC $profile: la respuesta no contiene registros DTC.")
                                appendLog(if (isEngine) "MR-140: 59 00 coincide con el caso sin averías del parser Delphi para esta solicitud." else "ZF 4HP16: respuesta sin registros; no se declara ausencia de averías sin validar este caso en el parser Delphi.")
                            }
                            else -> appendLog("DTC $profile: bytes de registro incompletos: ${decoded.recordBytes.toHex()}")
                        }
                        if (decoded.malformedTail.isNotEmpty()) {
                            appendLog("DTC: bytes sobrantes fuera de un registro completo: ${decoded.malformedTail.toHex()}")
                        }
                        if (decoded.recordBytes.isNotEmpty()) {
                            appendLog("REGISTROS DTC RAW: ${decoded.recordBytes.toHex()}")
                        }
                    }
                }
                val remaining = candidate.drop(response.bytes.size).toByteArray()
                if (remaining.isNotEmpty()) appendLog("RX DTC restante/no clasificada: ${remaining.toHex()}")
            } catch (e: Exception) {
                synchronized(initRxLock) { captureInitRx = false }
                appendLog("ERROR LECTURA DTC $profile en $stage: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            }
        }
    }

    /**
     * Sends one KWP TesterPresent (service 0x3E) using the frame shape
     * found in the original Delphi TimerTesterPresentTimer. Manual only
     * until the original timer interval is confirmed.
     */
    private fun discardLeadingInitZero(bytes: ByteArray, profile: String): ByteArray {
        // Some CH340/CH341 adapters report the K-Line initialization BREAK as a leading 00 byte.
        // Drop only that single leading byte; never alter bytes in the middle of a response.
        if (bytes.isNotEmpty() && bytes[0].toInt() == 0) {
            appendLog("INIT $profile: descartado byte RX 00 inicial compatible con BREAK del CH340/CH341.")
            return bytes.copyOfRange(1, bytes.size)
        }
        return bytes
    }

    private fun startAutomaticTesterPresent(profile: String, targetAddress: Int, serialPort: UsbSerialPort?) {
        testerPresentTask?.cancel(false)
        if (serialPort == null || !serialPort.isOpen) return
        val frame = KwpProtocol.buildTesterPresentRequest(targetAddress)
        appendLog("TESTER PRESENT automático activado para $profile: intervalo de 2 s mientras la sesión esté abierta.")
        testerPresentTask = testerPresentExecutor.scheduleAtFixedRate({
            try {
                if (validatedStartProfile != profile || port !== serialPort || !serialPort.isOpen ||
                    ecuProfile.selectedItemPosition != (if (profile == "MR-140") 0 else 1)) {
                    testerPresentTask?.cancel(false)
                    return@scheduleAtFixedRate
                }
                // Do not interleave TesterPresent bytes with an in-flight diagnostic response.
                // The KWP frame parser consumes a continuous RX stream; overlapping writes can
                // corrupt checksums and make DTC replies look malformed.
                if (synchronized(initRxLock) { captureInitRx }) {
                    appendLog("TESTER PRESENT automático $profile omitido: hay una consulta diagnóstica en curso.")
                    return@scheduleAtFixedRate
                }
                writeSerialFrame(serialPort, frame, 500)
                appendLog("TX TESTER PRESENT automático $profile  ${frame.toHex()}")
            } catch (e: Exception) {
                appendLog("ERROR TESTER PRESENT automático $profile: ${e.message ?: e.javaClass.simpleName}")
                testerPresentTask?.cancel(false)
            }
        }, 2, 2, TimeUnit.SECONDS)
    }

    /** Sonda IDs locales mediante el mismo flujo RX asíncrono de la app; no abre una segunda lectura USB. */
    private fun probeLocalIdentifiers() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("SONDEO KWP cancelado: conecta primero el adaptador USB.")
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        if (validatedStartProfile != profile) {
            appendLog("SONDEO KWP cancelado: inicializa primero $profile.")
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("SONDEO KWP cancelado: selecciona 10400 baudios.")
            return
        }

        // Pausa el timer durante el sondeo para evitar que su TX contamine la respuesta.
        testerPresentTask?.cancel(false)
        testerPresentTask = null
        appendLog("SONDEO KWP $profile: inicio de IDs 0x21 (exploratorio; coche detenido).")
        executor.execute {
            var finished = false
            try {
                synchronized(initRxLock) {
                    initRxBuffer.reset()
                    diagnosticRxQueue.clear()
                    captureInitRx = true
                }
                val serialIo = object : SerialIo {
                    override fun write(data: ByteArray) {
                        writeSerialFrame(serialPort, data, 1000)
                    }

                    override fun read(max: Int, timeoutMs: Int): ByteArray {
                        if (max <= 0 || timeoutMs < 0) return ByteArray(0)
                        val first = try {
                            diagnosticRxQueue.poll(timeoutMs.toLong(), TimeUnit.MILLISECONDS)
                        } catch (e: InterruptedException) {
                            Thread.currentThread().interrupt()
                            return ByteArray(0)
                        } ?: return ByteArray(0)
                        val out = ByteArrayOutputStream()
                        out.write(first.toInt())
                        while (out.size() < max) {
                            val next = diagnosticRxQueue.poll()
                            if (next == null) break
                            out.write(next.toInt())
                        }
                        return out.toByteArray()
                    }
                }
                val bus = KwpBus(serialIo, CoroutineScope(SupervisorJob() + Dispatchers.IO), source)
                bus.log = { message -> appendLog("KWP BUS $profile: $message") }
                val results = runBlocking {
                    try { IdProbe.sondear(bus) } finally { bus.close() }
                }
                results.forEach { result ->
                    appendLog("ID 0x%02X: %s%s".format(
                        result.id,
                        result.estado,
                        result.datos?.takeIf { it.isNotEmpty() }?.let { " · datos=" + it.joinToString(" ") { b -> "%02X".format(b.toInt() and 0xFF) } } ?: ""
                    ))
                }
                appendLog("SONDEO KWP $profile finalizado. IDs sin respuesta no se consideran compatibles.")
                finished = true
            } catch (e: Exception) {
                appendLog("ERROR SONDEO KWP $profile: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            } finally {
                synchronized(initRxLock) { captureInitRx = false }
                if (validatedStartProfile == profile && serialPort.isOpen) {
                    startAutomaticTesterPresent(profile, source, serialPort)
                }
                if (!finished) appendLog("SONDEO KWP incompleto; revisa los TX/RX y checksums.")
            }
        }
    }

    private fun sendTesterPresentOnce() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("TESTER PRESENT cancelado: conecta primero el adaptador USB.")
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        if (validatedStartProfile != profile) {
            appendLog("TESTER PRESENT cancelado: inicializa primero $profile y confirma StartCommunication.")
            Toast.makeText(this, "Inicializa primero el perfil seleccionado", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("TESTER PRESENT cancelado: $profile requiere 10400 baudios.")
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }

        val frame = KwpProtocol.buildTesterPresentRequest(source)
        appendLog("TESTER PRESENT $profile: envío manual de 0x3E (también hay mantenimiento automático si la sesión está validada).")
        executor.execute {
            var stage = "preparación de captura"
            try {
                synchronized(initRxLock) {
                    initRxBuffer.reset()
                    captureInitRx = true
                }
                stage = "envío del servicio 0x3E"
                appendLog("TX TESTER PRESENT $profile  ${frame.toHex()}")
                writeSerialFrame(serialPort, frame, 1000)
                stage = "espera de respuesta"
                Thread.sleep(700)
                val rxBytes = synchronized(initRxLock) {
                    captureInitRx = false
                    initRxBuffer.toByteArray()
                }
                if (rxBytes.isEmpty()) {
                    appendLog("TESTER PRESENT $profile: sin RX durante 700 ms; puede no haber respuesta explícita.")
                    return@execute
                }
                val echoAt = indexOfFrame(rxBytes, frame)
                val candidate = if (echoAt >= 0) {
                    appendLog("ECO TX TESTER PRESENT detectado: ${frame.toHex()}")
                    rxBytes.copyOfRange(echoAt + frame.size, rxBytes.size)
                } else rxBytes
                if (candidate.isEmpty()) {
                    appendLog("TESTER PRESENT $profile: solo eco TX; no se interpreta como respuesta ECU.")
                } else {
                    val response = KwpProtocol.findResponse(candidate, expectedSource = source)
                    if (response == null) {
                        appendLog("TESTER PRESENT $profile: RX adicional sin trama KWP reconocible: ${candidate.toHex()}")
                    } else {
                        appendLog("RX TESTER PRESENT CANDIDATA $profile: ${response.bytes.toHex()}")
                        appendLog("VALIDACIÓN TESTER PRESENT: ${response.description}")
                    }
                }
            } catch (e: Exception) {
                synchronized(initRxLock) { captureInitRx = false }
                appendLog("ERROR TESTER PRESENT $profile en $stage: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            }
        }
    }

    private fun writeSerialFrame(serialPort: UsbSerialPort, frame: ByteArray, timeoutMs: Int) {
        synchronized(serialWriteLock) {
            serialPort.write(frame, timeoutMs)
        }
    }

    private fun indexOfFrame(bytes: ByteArray, frame: ByteArray): Int {
        if (bytes.size < frame.size) return -1
        for (i in 0..(bytes.size - frame.size)) {
            if (bytes.copyOfRange(i, i + frame.size).contentEquals(frame)) return i
        }
        return -1
    }

    private fun ByteArray.toHex(): String =
        joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }

    private fun disconnect() {
        testerPresentTask?.cancel(false)
        testerPresentTask = null
        try { ioManager?.listener = null; ioManager?.stop() } catch (_: Exception) {}
        ioManager = null
        try { port?.close() } catch (_: Exception) {}
        port = null
        validatedStartProfile = null
        connectButton.text = "Buscar / conectar cable"
        setStatus("Desconectado")
        appendLog("Puerto serie cerrado.")
    }

    override fun onNewData(data: ByteArray) {
        synchronized(initRxLock) {
            if (captureInitRx) {
                initRxBuffer.write(data)
                data.forEach { diagnosticRxQueue.offer(it) }
            }
        }
        val hex = data.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
        runOnUiThread { appendLog("RX  $hex") }
    }

    override fun onRunError(e: Exception) {
        runOnUiThread { appendLog("ERROR serie: ${e.message}"); setStatus("Error en comunicación USB") }
    }

    private fun setStatus(value: String) { runOnUiThread { status.text = value } }
    private fun appendLog(value: String) {
        val line = "[${dateFormat.format(Date())}] $value\n"
        runOnUiThread { log.append(line) }
    }

    override fun onDestroy() {
        disconnect()
        try { unregisterReceiver(permissionReceiver) } catch (_: Exception) {}
        executor.shutdownNow()
        testerPresentExecutor.shutdownNow()
        super.onDestroy()
    }
}
