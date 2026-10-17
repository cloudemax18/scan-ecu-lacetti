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
    @Volatile private var liveDataRunning = false
    @Volatile private var liveDataTask: java.util.concurrent.Future<*>? = null
    private val liveDataExecutor = Executors.newSingleThreadExecutor()
    private lateinit var liveOutput: TextView
    private lateinit var liveCatalogOutput: TextView
    private lateinit var liveStartButton: Button
    private lateinit var liveScanButton: Button
    private lateinit var labOutput: TextView
    private lateinit var labExtendedScanButton: Button
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
        val pageBackground = 0xFF101820.toInt()
        val cardBackground = 0xFF1B2A35.toInt()
        val accent = 0xFF56C7B5.toInt()
        val primaryText = 0xFFF3F7FA.toInt()
        val secondaryText = 0xFFB0BEC5.toInt()

        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(16, 12, 16, 8)
            setBackgroundColor(pageBackground)
        }

        val header = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(2, 4, 2, 10)
        }
        val title = TextView(this).apply {
            text = "CheviExplorer"
            textSize = 25f
            setTextColor(primaryText)
            setTypeface(null, android.graphics.Typeface.BOLD)
        }
        header.addView(title, lp(-1, -2))
        header.addView(TextView(this).apply {
            text = "LACETTI 1.8 · KKL 409.1"
            textSize = 11f
            letterSpacing = 0.08f
            setTextColor(accent)
            setPadding(0, 2, 0, 8)
        }, lp(-1, -2))
        status = TextView(this).apply {
            text = "Desconectado"
            textSize = 13f
            setTextColor(primaryText)
            setPadding(12, 10, 12, 10)
            setBackgroundColor(cardBackground)
        }
        header.addView(status, lp(-1, -2))
        root.addView(header, lp(-1, -2))

        val screenHost = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
        }
        root.addView(screenHost, LinearLayout.LayoutParams(-1, 0, 1f))

        val screens = linkedMapOf<String, ScrollView>()
        fun makeScreen(name: String): LinearLayout {
            val body = LinearLayout(this).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(0, 4, 0, 14)
            }
            val scroll = ScrollView(this).apply {
                isFillViewport = true
                visibility = android.view.View.GONE
                addView(body)
            }
            screens[name] = scroll
            screenHost.addView(scroll, LinearLayout.LayoutParams(-1, -1))
            return body
        }
        fun addSection(parent: LinearLayout, heading: String, subtitle: String? = null) {
            parent.addView(TextView(this).apply {
                text = heading
                textSize = 19f
                setTextColor(primaryText)
                setTypeface(null, android.graphics.Typeface.BOLD)
                setPadding(2, 10, 2, 4)
            }, lp(-1, -2))
            if (subtitle != null) parent.addView(TextView(this).apply {
                text = subtitle
                textSize = 13f
                setTextColor(secondaryText)
                setPadding(2, 0, 2, 10)
            }, lp(-1, -2))
        }
        fun addCard(parent: LinearLayout, content: LinearLayout) {
            content.setPadding(14, 12, 14, 12)
            content.setBackgroundColor(cardBackground)
            val params = lp(-1, -2).apply { bottomMargin = 10 }
            parent.addView(content, params)
        }
        fun addLabel(parent: LinearLayout, label: String) {
            parent.addView(TextView(this).apply {
                text = label
                textSize = 13f
                setTextColor(secondaryText)
                setPadding(0, 8, 0, 4)
            }, lp(-1, -2))
        }
        fun addAction(parent: LinearLayout, label: String, onClick: () -> Unit): Button {
            val button = Button(this).apply {
                text = label
                isAllCaps = false
                textSize = 14f
                setOnClickListener { onClick() }
            }
            parent.addView(button, lp(-1, -2).apply { bottomMargin = 4 })
            return button
        }

        // Inicio: conexión y selección del módulo.
        val home = makeScreen("Inicio")
        addSection(home, "Conexión", "Conecta el adaptador al teléfono mediante USB OTG.")
        val connectionCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addLabel(connectionCard, "Módulo seleccionado")
        ecuProfile = Spinner(this).apply {
            adapter = ArrayAdapter(this@MainActivity, android.R.layout.simple_spinner_dropdown_item,
                listOf("Motor Delphi MR-140", "Transmisión ZF 4HP16"))
        }
        connectionCard.addView(ecuProfile, lp(-1, -2))
        addLabel(connectionCard, "La velocidad habitual de K-Line es 10400 baud.")
        baud = Spinner(this).apply {
            adapter = ArrayAdapter(this@MainActivity, android.R.layout.simple_spinner_dropdown_item,
                listOf("10400 baud · K-Line", "9600 baud", "38400 baud", "4800 baud"))
        }
        connectionCard.addView(baud, lp(-1, -2))
        connectButton = Button(this).apply {
            text = "Buscar / conectar cable"
            isAllCaps = false
            setOnClickListener { requestUsbConnection() }
        }
        connectionCard.addView(connectButton, lp(-1, -2).apply { topMargin = 10 })
        addCard(home, connectionCard)
        addSection(home, "Acceso rápido", "Las funciones avanzadas están separadas por categoría.")
        val quickCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addAction(quickCard, "Inicializar ECU") { initializeSelectedEcu() }
        addAction(quickCard, "Leer códigos de avería") { readDtcCodes() }
        addCard(home, quickCard)
        addSection(home, "Vehículo")
        val vehicleCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        vehicleCard.addView(TextView(this).apply {
            text = "Chevrolet Lacetti · 1.8 LDA · automático · 2008"
            textSize = 14f
            setTextColor(primaryText)
        }, lp(-1, -2))
        vehicleCard.addView(TextView(this).apply {
            text = "Adaptador compatible esperado: KKL 409.1 con CH340/CH341."
            textSize = 12f
            setTextColor(secondaryText)
            setPadding(0, 6, 0, 0)
        }, lp(-1, -2))
        addCard(home, vehicleCard)

        // Diagnóstico: acciones de identificación y averías.
        val diagnosis = makeScreen("Diagnóstico")
        addSection(diagnosis, "Diagnóstico", "Consultas de solo lectura para el módulo seleccionado.")
        val diagnosisCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addAction(diagnosisCard, "Inicializar comunicación con ECU") { initializeSelectedEcu() }
        addAction(diagnosisCard, "Consultar identificación · 1A 80") { requestEcuIdentification() }
        addAction(diagnosisCard, "Leer códigos de avería (DTC)") { readDtcCodes() }
        addCard(diagnosis, diagnosisCard)
        val safetyCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        safetyCard.addView(TextView(this).apply {
            text = "Solo lectura"
            textSize = 15f
            setTextColor(accent)
            setTypeface(null, android.graphics.Typeface.BOLD)
        }, lp(-1, -2))
        safetyCard.addView(TextView(this).apply {
            text = "El borrado de averías, funciones de seguridad y activación de actuadores no están habilitados."
            textSize = 13f
            setTextColor(secondaryText)
            setPadding(0, 5, 0, 0)
        }, lp(-1, -2))
        addCard(diagnosis, safetyCard)

        // Datos ECU: lecturas confirmadas y sondeo exploratorio.
        val ecuData = makeScreen("Datos ECU")
        addSection(ecuData, "Datos de la ECU", "Se muestran respuestas confirmadas; los bytes sin mapa validado permanecen en hexadecimal.")
        val dataCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addAction(dataCard, "Consultar datos brutos confirmados") { readConfirmedParameterIds() }
        addAction(dataCard, "Ver catálogo Delphi reconstruido") { showDelphiCatalog() }
        addAction(dataCard, "Enviar Tester Present") { sendTesterPresentOnce() }
        addAction(dataCard, "Explorar IDs KWP 0x21 · solo lectura") { probeLocalIdentifiers() }
        addCard(ecuData, dataCard)
        val rawCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        rawCard.addView(TextView(this).apply {
            text = "Importante sobre la interpretación"
            textSize = 15f
            setTextColor(accent)
            setTypeface(null, android.graphics.Typeface.BOLD)
        }, lp(-1, -2))
        rawCard.addView(TextView(this).apply {
            text = "Los IDs MR-140 02/03/04 tienen respuestas positivas reales, pero aún no se ha validado el mapa de campos ni sus fórmulas. No se etiquetan como RPM, temperatura u otros valores hasta confirmarlo."
            textSize = 13f
            setTextColor(secondaryText)
            setPadding(0, 6, 0, 0)
        }, lp(-1, -2))
        addCard(ecuData, rawCard)

        // En vivo: catálogo del ejecutable original y bloques KWP con respuesta física confirmada.
        val live = makeScreen("En vivo")
        addSection(live, "Datos en vivo", "Lectura periódica de bloques KWP confirmados. Los bytes no se convierten en magnitudes sin fórmula validada.")
        val liveControls = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        liveOutput = TextView(this).apply {
            text = "Sin lectura. Inicializa la ECU seleccionada y pulsa Iniciar lectura."
            textSize = 13f
            typeface = android.graphics.Typeface.MONOSPACE
            setTextColor(primaryText)
            setPadding(10, 10, 10, 10)
        }
        liveControls.addView(liveOutput, lp(-1, -2))
        liveStartButton = addAction(liveControls, "Iniciar lectura en vivo") { startLiveParameterPolling() }
        liveScanButton = addAction(liveControls, "Validar mapa KWP (solo lectura)") { validateLiveParameterMap() }
        addAction(liveControls, "Detener lectura / exploración") { stopLiveParameterPolling() }
        addCard(live, liveControls)
        addSection(live, "Catálogo del EXE", "Parámetros reconstruidos. Se marcan como pendientes hasta verificar consulta y fórmula.")
        liveCatalogOutput = TextView(this).apply {
            textSize = 12f
            typeface = android.graphics.Typeface.MONOSPACE
            setTextColor(secondaryText)
            setPadding(10, 10, 10, 10)
        }
        val liveCatalogCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        liveCatalogCard.addView(liveCatalogOutput, lp(-1, -2))
        addCard(live, liveCatalogCard)
        refreshLiveCatalogText()
        ecuProfile.onItemSelectedListener = object : android.widget.AdapterView.OnItemSelectedListener {
            override fun onItemSelected(parent: android.widget.AdapterView<*>?, view: android.view.View?, position: Int, id: Long) {
                stopLiveParameterPolling()
                refreshLiveCatalogText()
            }
            override fun onNothingSelected(parent: android.widget.AdapterView<*>?) = Unit
        }

        // Laboratorio: secuencia guiada de validación y captura exclusivamente de lectura.
        val lab = makeScreen("Laboratorio")
        addSection(lab, "Laboratorio KWP", "Ejecuta los pasos en orden para cada módulo. Mantén el vehículo inmóvil, contacto en ON y no cambies de ECU durante una prueba.")
        val labIntro = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        labIntro.addView(TextView(this).apply {
            text = "Objetivo: recopilar tramas TX/RX, checksum, respuestas positivas, NRC, timeouts, DTC e identificación para completar el mapa de datos. No se envían servicios de escritura ni de actuadores."
            textSize = 13f
            setTextColor(secondaryText)
        }, lp(-1, -2))
        labOutput = TextView(this).apply {
            text = "Estado: esperando inicio. Conecta el KKL, selecciona el módulo y pulsa los pasos en orden. Las capturas detalladas se guardan en Registro."
            textSize = 12f
            typeface = android.graphics.Typeface.MONOSPACE
            setTextColor(primaryText)
            setPadding(0, 10, 0, 6)
        }
        labIntro.addView(labOutput, lp(-1, -2))
        addCard(lab, labIntro)
        addSection(lab, "Secuencia recomendada", "Paso 1–3 establecen el enlace y una línea base; 4–6 reúnen el máximo de datos de lectura.")
        val labSteps = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addAction(labSteps, "1 · Inicializar ECU seleccionada") { setLabStatus("Paso 1: inicialización solicitada. Confirma en Registro que StartCommunication tuvo checksum válido."); initializeSelectedEcu() }
        addAction(labSteps, "2 · Leer identificación ECU (1A 80)") { setLabStatus("Paso 2: consultando identificación. Los campos se aceptan solo si SID y checksum coinciden."); requestEcuIdentification() }
        addAction(labSteps, "3 · Leer DTC actuales (solo lectura)") { setLabStatus("Paso 3: leyendo DTC. Repite al final para comprobar si la sesión cambió."); readDtcCodes() }
        addAction(labSteps, "4 · Barrido base 01–40, F0, F1, FB") { setLabStatus("Paso 4: exploración base del servicio 0x21. Los positivos se conservan en bruto; NRC y timeouts se registran por ID."); validateLiveParameterMap() }
        labExtendedScanButton = addAction(labSteps, "5 · Barrido ampliado 41–EF y F2–FF") { confirmExtendedLocalIdentifierScan() }
        addAction(labSteps, "6 · Releer bloques positivos conocidos") { setLabStatus("Paso 6: repitiendo los bloques con respuesta positiva física conocida."); readConfirmedParameterIds() }
        addAction(labSteps, "7 · Leer DTC finales") { setLabStatus("Paso 7: comprobación final de DTC. No se borran códigos."); readDtcCodes() }
        addAction(labSteps, "Detener prueba / exploración") { stopLiveParameterPolling(); setLabStatus("Solicitud de parada enviada. Comprueba Registro para confirmar el cierre del barrido.") }
        addAction(labSteps, "Exportar todo el registro de pruebas") { exportLog() }
        addCard(lab, labSteps)
        val labSafety = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        labSafety.addView(TextView(this).apply { text = "Antes de ejecutar"; textSize = 15f; setTextColor(accent); setTypeface(null, android.graphics.Typeface.BOLD) }, lp(-1, -2))
        labSafety.addView(TextView(this).apply {
            text = "• Vehículo inmóvil, freno de estacionamiento aplicado y selector en P.\n• Contacto ON; no arranques ni cambies el selector durante el barrido.\n• Inicializa una sola ECU cada vez.\n• El barrido ampliado puede tardar varios minutos; consulta únicamente IDs mediante 0x21.\n• No se exploran servicios de escritura, programación, borrado ni actuadores.\n• Exporta el registro antes de limpiar la pantalla Registro."
            textSize = 13f; setTextColor(secondaryText); setPadding(0, 6, 0, 0)
        }, lp(-1, -2))
        addCard(lab, labSafety)

        // Registro: el log es independiente de las pantallas de diagnóstico.
        val logs = makeScreen("Registro")
        addSection(logs, "Registro de comunicación", "Tramas y respuestas recibidas durante esta sesión.")
        log = TextView(this).apply {
            textSize = 12f
            typeface = android.graphics.Typeface.MONOSPACE
            setTextColor(0xFFECEFF1.toInt())
            setPadding(12, 12, 12, 12)
            setTextIsSelectable(true)
        }
        val logCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        logCard.setPadding(0, 0, 0, 0)
        logCard.addView(log, lp(-1, -2))
        logCard.setBackgroundColor(cardBackground)
        logs.addView(logCard, lp(-1, -2).apply { bottomMargin = 10 })
        val logActions = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
        }
        addAction(logActions, "Exportar captura RX") { exportLog() }
        addAction(logActions, "Limpiar registro") { log.text = "" }
        addCard(logs, logActions)

        // Ajustes: notas y distribución de la app.
        val settings = makeScreen("Ajustes")
        addSection(settings, "Ajustes", "Configuración del adaptador y mantenimiento de la aplicación.")
        val serialCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        addLabel(serialCard, "Velocidad serie")
        // El selector de velocidad vive en Inicio; este texto evita duplicar controles.
        serialCard.addView(TextView(this).apply {
            text = "La velocidad se configura desde Inicio. Usa 10400 baud para K-Line salvo que las pruebas indiquen otra cosa."
            textSize = 13f
            setTextColor(secondaryText)
        }, lp(-1, -2))
        addAction(serialCard, "Buscar actualización de CheviExplorer") { checkForUpdates() }
        addCard(settings, serialCard)
        val notesCard = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        notesCard.addView(TextView(this).apply {
            text = "Estado de desarrollo"
            textSize = 15f
            setTextColor(accent)
            setTypeface(null, android.graphics.Typeface.BOLD)
        }, lp(-1, -2))
        notesCard.addView(TextView(this).apply {
            text = "MR-140: lectura DTC y datos 02/03/04 en bruto. ZF 4HP16: inicialización y exploración de IDs comprobadas. La decodificación de parámetros de transmisión y los mapas de datos siguen en investigación."
            textSize = 13f
            setTextColor(secondaryText)
            setPadding(0, 6, 0, 0)
        }, lp(-1, -2))
        addCard(settings, notesCard)

        val nav = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(0, 6, 0, 2)
            setBackgroundColor(pageBackground)
        }
        val navNames = listOf("Inicio", "Diagnóstico", "Datos ECU", "En vivo", "Lab", "Registro", "Ajustes")
        fun showScreen(name: String) {
            screens.forEach { (screenName, view) ->
                view.visibility = if (screenName == name) android.view.View.VISIBLE else android.view.View.GONE
            }
        }
        navNames.forEach { name ->
            val navButton = TextView(this).apply {
                text = when (name) {
                    "Diagnóstico" -> "DTC"
                    "Datos ECU" -> "Datos"
                    "En vivo" -> "En vivo"
                    else -> name
                }
                textSize = 11f
                gravity = Gravity.CENTER
                setTextColor(if (name == "Inicio") accent else secondaryText)
                setPadding(2, 10, 2, 10)
                setOnClickListener {
                    showScreen(if (name == "Lab") "Laboratorio" else name)
                    for (i in 0 until nav.childCount) {
                        val child = nav.getChildAt(i) as TextView
                        val selected = child.tag == name
                        child.setTextColor(if (selected) accent else secondaryText)
                        child.setTypeface(null, if (selected) android.graphics.Typeface.BOLD else android.graphics.Typeface.NORMAL)
                    }
                }
                tag = name
            }
            nav.addView(navButton, LinearLayout.LayoutParams(0, -2, 1f))
        }
        root.addView(nav, lp(-1, -2))
        showScreen("Inicio")
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
     * Consulta identificadores con respuesta positiva observada en capturas físicas.
     * Los bytes se conservan en bruto: los offsets de la tabla Delphi son del buffer original,
     * no de cada respuesta individual, y no se usan aquí para inventar decodificaciones.
     */
    private fun readConfirmedParameterIds() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            appendLog("DATOS ECU cancelados: conecta primero el adaptador USB.")
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        val ids = if (isEngine) listOf(0x02, 0x03, 0x04) else listOf(0x01, 0x02, 0x03, 0x04, 0x11)
        if (validatedStartProfile != profile) {
            appendLog("DATOS ECU cancelados: inicializa primero $profile.")
            Toast.makeText(this, "Inicializa primero $profile", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            appendLog("DATOS ECU cancelados: se requiere 10400 baudios.")
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }

        testerPresentTask?.cancel(false)
        testerPresentTask = null
        appendLog("DATOS ECU $profile: consulta de solo lectura para IDs con respuestas positivas previas: " +
            ids.joinToString(", ") { "0x%02X".format(it) } + ". Sin decodificación de campos.")
        executor.execute {
            var completed = false
            try {
                for (localId in ids) {
                    var stage = "preparación de captura"
                    try {
                        val frame = KwpProtocol.buildLocalIdentifierRequest(source, localId)
                        synchronized(initRxLock) {
                            initRxBuffer.reset()
                            captureInitRx = true
                        }
                        stage = "envío de ID %02X".format(localId)
                        appendLog("TX $profile ID %02X: %s".format(localId, frame.toHex()))
                        writeSerialFrame(serialPort, frame, 1000)
                        stage = "espera de respuesta"
                        Thread.sleep(1200)
                        val rxBytes = synchronized(initRxLock) {
                            captureInitRx = false
                            initRxBuffer.toByteArray()
                        }
                        if (rxBytes.isEmpty()) {
                            appendLog("$profile ID %02X: sin respuesta RX en 1200 ms.".format(localId))
                            continue
                        }
                        val echoAt = indexOfFrame(rxBytes, frame)
                        val candidate = if (echoAt >= 0) {
                            appendLog("ECO TX $profile ID %02X detectado.".format(localId))
                            rxBytes.copyOfRange(echoAt + frame.size, rxBytes.size)
                        } else rxBytes
                        if (candidate.isEmpty()) {
                            appendLog("$profile ID %02X: solo eco TX; no se interpreta como respuesta ECU.".format(localId))
                            continue
                        }
                        val response = KwpProtocol.findResponse(
                            candidate,
                            expectedSource = source,
                            expectedPayloadPrefix = byteArrayOf(0x61, localId.toByte())
                        ) ?: KwpProtocol.findResponse(
                            candidate,
                            expectedSource = source,
                            expectedPayloadPrefix = byteArrayOf(0x7F, 0x21)
                        )
                        if (response == null) {
                            appendLog("$profile ID %02X: no se encontró respuesta 61 %02X ni 7F 21; RX raw=%s"
                                .format(localId, localId, candidate.toHex()))
                            continue
                        }
                        appendLog("RX $profile ID %02X: %s".format(localId, response.bytes.toHex()))
                        appendLog("VALIDACIÓN $profile ID %02X: %s".format(localId, response.description))
                        if (!response.valid) {
                            appendLog("$profile ID %02X: checksum incorrecto; respuesta descartada.".format(localId))
                            continue
                        }
                        val payload = response.payload
                        when {
                            payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x61 &&
                                (payload[1].toInt() and 0xFF) == localId -> {
                                val data = payload.copyOfRange(2, payload.size)
                                appendLog("DATOS RAW $profile ID %02X (%d bytes): %s".format(localId, data.size, data.toHex()))
                                if (!isEngine) {
                                    val descriptor = DelphiParameterCatalog.find(0x22, localId)
                                    if (descriptor != null) {
                                        appendLog("CATÁLOGO DELPHI ID %02X: %s%s; offset buffer original=%d; modo=%s; valor no decodificado."
                                            .format(
                                                localId,
                                                descriptor.name,
                                                descriptor.unit?.let { " ($it)" } ?: "",
                                                descriptor.dataOffset,
                                                DelphiParameterCatalog.readModeLabel(descriptor.readMode)
                                            ))
                                    }
                                }
                            }
                            payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x7F &&
                                (payload[1].toInt() and 0xFF) == 0x21 ->
                                appendLog("$profile ID %02X: respuesta negativa KWP NRC=0x%02X."
                                    .format(localId, payload[2].toInt() and 0xFF))
                            else ->
                                appendLog("$profile ID %02X: SID/identificador inesperado; payload raw=%s"
                                    .format(localId, payload.toHex()))
                        }
                        val remaining = candidate.drop(response.bytes.size).toByteArray()
                        if (remaining.isNotEmpty()) appendLog("RX $profile ID %02X restante/no clasificada: %s".format(localId, remaining.toHex()))
                    } catch (e: Exception) {
                        synchronized(initRxLock) { captureInitRx = false }
                        appendLog("ERROR $profile ID %02X en %s: %s: %s".format(
                            localId, stage, e.javaClass.simpleName, e.message ?: "(sin mensaje)"))
                    }
                    Thread.sleep(100)
                }
                completed = true
                appendLog("DATOS ECU $profile finalizados. Revisa RX/checksum; no se asignan unidades a bytes sin mapa validado.")
            } catch (e: Exception) {
                appendLog("ERROR DATOS ECU $profile: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            } finally {
                synchronized(initRxLock) { captureInitRx = false }
                if (validatedStartProfile == profile && serialPort.isOpen) {
                    startAutomaticTesterPresent(profile, source, serialPort)
                }
                if (!completed) appendLog("DATOS ECU $profile incompletos; revisa el registro RX.")
            }
        }
    }

    private fun setLabStatus(message: String) {
        if (!::labOutput.isInitialized) return
        runOnUiThread { labOutput.text = message }
    }

    private fun refreshLiveCatalogText() {
        val selector = if (ecuProfile.selectedItemPosition == 0) 0x12 else 0x22
        val profile = if (selector == 0x12) "MR-140" else "ZF 4HP16"
        val entries = DelphiParameterCatalog.forSelector(selector)
        liveCatalogOutput.text = buildString {
            append("Módulo: ").append(profile).append(" · ").append(entries.size).append(" parámetros\n\n")
            entries.forEach { p ->
                append("ID ").append("%02X".format(p.id)).append(" · ").append(p.name)
                p.unit?.takeIf { it.isNotBlank() }?.let { append(" (").append(it).append(")") }
                append("\nEstado: pendiente de mapear respuesta KWP")
                append(" · grupo ").append(p.group)
                append(" · modo ").append(DelphiParameterCatalog.readModeLabel(p.readMode))
                append("\n\n")
            }
        }
    }

    private fun startLiveParameterPolling() {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        if (validatedStartProfile != profile) {
            Toast.makeText(this, "Inicializa primero $profile", Toast.LENGTH_LONG).show()
            return
        }
        val selectedBaud = when (baud.selectedItemPosition) { 1 -> 9600; 2 -> 38400; 3 -> 4800; else -> 10400 }
        if (selectedBaud != 10400) {
            Toast.makeText(this, "Selecciona 10400 baudios", Toast.LENGTH_LONG).show()
            return
        }
        if (liveDataRunning) return
        val ids = if (isEngine) listOf(0x02, 0x03, 0x04) else listOf(0x01, 0x02, 0x03, 0x04, 0x11)
        liveDataRunning = true
        liveStartButton.isEnabled = false
        testerPresentTask?.cancel(false)
        testerPresentTask = null
        liveOutput.text = "Conectando con $profile…\nLos bloques se mostrarán en hexadecimal hasta validar sus fórmulas."
        appendLog("EN VIVO $profile: sondeo periódico de IDs confirmados " + ids.joinToString { "0x%02X".format(it) } + ".")
        liveDataTask = liveDataExecutor.submit {
            try {
                while (liveDataRunning && port === serialPort && serialPort.isOpen &&
                    validatedStartProfile == profile && ecuProfile.selectedItemPosition == (if (isEngine) 0 else 1)) {
                    val cycle = StringBuilder()
                    cycle.append("Módulo: ").append(profile).append("\n")
                    cycle.append("Actualización: ").append(dateFormat.format(Date())).append("\n")
                    cycle.append("Respuestas positivas con checksum válido\n\n")
                    for (localId in ids) {
                        if (!liveDataRunning || Thread.currentThread().isInterrupted) break
                        var dataText = "Sin respuesta"
                        try {
                            val request = KwpProtocol.buildLocalIdentifierRequest(source, localId)
                            synchronized(initRxLock) {
                                initRxBuffer.reset()
                                captureInitRx = true
                            }
                            writeSerialFrame(serialPort, request, 1000)
                            Thread.sleep(850)
                            val rx = synchronized(initRxLock) {
                                captureInitRx = false
                                initRxBuffer.toByteArray()
                            }
                            if (rx.isNotEmpty()) {
                                val echoAt = indexOfFrame(rx, request)
                                val candidate = if (echoAt >= 0) rx.copyOfRange(echoAt + request.size, rx.size) else rx
                                val response = KwpProtocol.findResponse(
                                    candidate, expectedSource = source,
                                    expectedPayloadPrefix = byteArrayOf(0x61, localId.toByte())
                                ) ?: KwpProtocol.findResponse(
                                    candidate, expectedSource = source,
                                    expectedPayloadPrefix = byteArrayOf(0x7F, 0x21)
                                )
                                if (response != null && response.valid) {
                                    val payload = response.payload
                                    if (payload.size >= 2 && (payload[0].toInt() and 0xFF) == 0x61 &&
                                        (payload[1].toInt() and 0xFF) == localId) {
                                        val bytes = payload.copyOfRange(2, payload.size)
                                        dataText = if (bytes.isEmpty()) "(bloque vacío)" else bytes.toHex()
                                    } else if (payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x7F) {
                                        dataText = "ECU rechazó solicitud · NRC 0x%02X".format(payload[2].toInt() and 0xFF)
                                    } else {
                                        dataText = "Respuesta no reconocida: " + payload.toHex()
                                    }
                                } else if (response != null) {
                                    dataText = "Checksum incorrecto"
                                } else {
                                    dataText = "Trama no reconocida"
                                }
                            }
                        } catch (e: InterruptedException) {
                            Thread.currentThread().interrupt()
                            break
                        } catch (e: Exception) {
                            dataText = "Error: " + (e.message ?: e.javaClass.simpleName)
                        } finally {
                            synchronized(initRxLock) { captureInitRx = false }
                        }
                        cycle.append("ID ").append("%02X".format(localId)).append(": ").append(dataText).append("\n")
                        if (liveDataRunning) runOnUiThread {
                            liveOutput.text = cycle.toString() + "\nNota: son bytes de bloque, no magnitudes físicas decodificadas."
                        }
                        Thread.sleep(120)
                    }
                    if (liveDataRunning) Thread.sleep(900)
                }
            } catch (e: InterruptedException) {
                Thread.currentThread().interrupt()
            } catch (e: Exception) {
                appendLog("ERROR EN VIVO " + profile + ": " + (e.message ?: e.javaClass.simpleName))
            } finally {
                synchronized(initRxLock) { captureInitRx = false }
                liveDataRunning = false
                runOnUiThread {
                    liveStartButton.isEnabled = true
                    if (validatedStartProfile == profile && port === serialPort && serialPort.isOpen) {
                        startAutomaticTesterPresent(profile, source, serialPort)
                    }
                }
                appendLog("EN VIVO " + profile + " detenido.")
            }
        }
    }

    private fun validateLiveParameterMap() {
        runLocalIdentifierScan((0x01..0x40).toList() + listOf(0xF0, 0xF1, 0xFB), "base")
    }

    private fun confirmExtendedLocalIdentifierScan() {
        AlertDialog.Builder(this)
            .setTitle("Barrido KWP ampliado")
            .setMessage("Se enviarán hasta 189 consultas de lectura 0x21 a IDs aún no validados (41–EF y F2–FF). La ECU puede rechazar la mayoría; el proceso puede tardar varios minutos. No se envían comandos de escritura ni actuadores. Hazlo con el vehículo inmóvil y solo si la comunicación base es estable. ¿Continuar?")
            .setNegativeButton("Cancelar", null)
            .setPositiveButton("Iniciar barrido") { _, _ ->
                setLabStatus("Paso 5: barrido ampliado en curso. No desconectes el adaptador.")
                runLocalIdentifierScan((0x41..0xEF).toList() + (0xF2..0xFF).toList(), "ampliado")
            }
            .show()
    }

    private fun runLocalIdentifierScan(ids: List<Int>, scanLabel: String) {
        val serialPort = port
        if (serialPort == null || !serialPort.isOpen) {
            Toast.makeText(this, "Primero conecta el adaptador USB", Toast.LENGTH_LONG).show()
            return
        }
        val isEngine = ecuProfile.selectedItemPosition == 0
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val source = if (isEngine) 0x11 else 0x18
        if (validatedStartProfile != profile) {
            Toast.makeText(this, "Inicializa primero $profile", Toast.LENGTH_LONG).show()
            return
        }
        if (liveDataRunning) {
            Toast.makeText(this, "Detén primero la lectura en vivo", Toast.LENGTH_LONG).show()
            return
        }
        // Rango definido por el llamador; todas las peticiones usan el servicio de lectura 0x21.
        liveDataRunning = true
        liveStartButton.isEnabled = false
        liveScanButton.isEnabled = false
        if (::labExtendedScanButton.isInitialized) labExtendedScanButton.isEnabled = false
        testerPresentTask?.cancel(false)
        testerPresentTask = null
        liveOutput.text = "Validando mapa KWP de $profile…\nSe consultan solo identificadores de lectura (servicio 0x21). No se envían comandos de escritura."
        appendLog("VALIDACIÓN KWP $profile ($scanLabel): lectura 0x21 de ${ids.size} identificadores.")
        setLabStatus("Barrido $scanLabel iniciado para $profile: ${ids.size} IDs. Revisa Registro para ver cada TX/RX.")
        liveDataTask = liveDataExecutor.submit {
            val positives = mutableListOf<String>()
            val negatives = mutableMapOf<Int, Int>()
            var noResponse = 0
            try {
                for (localId in ids) {
                    if (!liveDataRunning || Thread.currentThread().isInterrupted ||
                        port !== serialPort || !serialPort.isOpen || validatedStartProfile != profile) break
                    var result = "sin respuesta"
                    try {
                        val request = KwpProtocol.buildLocalIdentifierRequest(source, localId)
                        synchronized(initRxLock) {
                            initRxBuffer.reset()
                            captureInitRx = true
                        }
                        writeSerialFrame(serialPort, request, 1000)
                        Thread.sleep(450)
                        val rx = synchronized(initRxLock) {
                            captureInitRx = false
                            initRxBuffer.toByteArray()
                        }
                        val echoAt = indexOfFrame(rx, request)
                        val candidate = if (echoAt >= 0) rx.copyOfRange(echoAt + request.size, rx.size) else rx
                        val response = KwpProtocol.findResponse(candidate, expectedSource = source,
                            expectedPayloadPrefix = byteArrayOf(0x61, localId.toByte()))
                            ?: KwpProtocol.findResponse(candidate, expectedSource = source,
                                expectedPayloadPrefix = byteArrayOf(0x7F, 0x21))
                        if (response == null) {
                            noResponse++
                        } else if (!response.valid) {
                            result = "checksum inválido"
                        } else {
                            val payload = response.payload
                            if (payload.size >= 2 && (payload[0].toInt() and 0xFF) == 0x61 &&
                                (payload[1].toInt() and 0xFF) == localId) {
                                val bytes = payload.copyOfRange(2, payload.size)
                                result = "POSITIVO · " + if (bytes.isEmpty()) "(sin datos)" else bytes.toHex()
                                positives.add("ID %02X: %s".format(localId, result))
                            } else if (payload.size >= 3 && (payload[0].toInt() and 0xFF) == 0x7F) {
                                val nrc = payload[2].toInt() and 0xFF
                                negatives[nrc] = (negatives[nrc] ?: 0) + 1
                                result = "NRC %02X".format(nrc)
                            }
                        }
                        appendLog("MAPA KWP $profile ID %02X: %s".format(localId, result))
                    } catch (e: InterruptedException) {
                        Thread.currentThread().interrupt()
                        break
                    } catch (e: Exception) {
                        appendLog("MAPA KWP $profile ID %02X error: %s".format(localId, e.message ?: e.javaClass.simpleName))
                    } finally {
                        synchronized(initRxLock) { captureInitRx = false }
                    }
                }
            } catch (e: Exception) {
                appendLog("VALIDACIÓN KWP $profile error: " + (e.message ?: e.javaClass.simpleName))
            } finally {
                synchronized(initRxLock) { captureInitRx = false }
                liveDataRunning = false
                runOnUiThread {
                    liveStartButton.isEnabled = true
                    liveScanButton.isEnabled = true
                    if (::labExtendedScanButton.isInitialized) labExtendedScanButton.isEnabled = true
                    liveOutput.text = buildString {
                        append("Validación finalizada: ").append(profile).append("\n")
                        append("Respuestas positivas: ").append(positives.size).append("\n")
                        append("Sin respuesta: ").append(noResponse).append("\n")
                        append("Rechazos NRC: ").append(negatives.values.sum()).append("\n")
                        if (negatives.isNotEmpty()) {
                            append("NRC por código: ").append(negatives.entries.sortedBy { it.key }
                                .joinToString { "0x%02X=%d".format(it.key, it.value) }).append("\n")
                        }
                        append("\nBLOQUES POSITIVOS (checksum validado)\n")
                        if (positives.isEmpty()) append("No se encontraron respuestas positivas en el rango consultado.\n")
                        positives.forEach { append(it).append("\n") }
                        append("\nLas lecturas positivas son bloques brutos; sus campos físicos todavía deben mapearse.")
                    }
                    if (validatedStartProfile == profile && port === serialPort && serialPort.isOpen) {
                        startAutomaticTesterPresent(profile, source, serialPort)
                    }
                    labOutput.text = "Barrido $scanLabel finalizado: $profile\nIDs consultados: ${ids.size}\nRespuestas positivas: ${positives.size}\nSin respuesta: $noResponse\nRechazos NRC: ${negatives.values.sum()}\n\nLos datos positivos están en Registro y el resumen completo en En vivo. Exporta el registro para compartir la captura."
                }
                appendLog("VALIDACIÓN KWP $profile ($scanLabel) finalizada; IDs=" + ids.size + ", positivos=" + positives.size + ", sin respuesta=" + noResponse + ".")
            }
        }
    }

    private fun stopLiveParameterPolling() {
        liveDataRunning = false
        liveDataTask?.cancel(true)
        liveDataTask = null
        liveStartButton.isEnabled = true
        if (::liveScanButton.isInitialized) liveScanButton.isEnabled = true
        if (::labExtendedScanButton.isInitialized) labExtendedScanButton.isEnabled = true
        appendLog("Solicitud de detener lectura en vivo/exploración.")
    }

    private fun showDelphiCatalog() {
        val isEngine = ecuProfile.selectedItemPosition == 0
        val selector = if (isEngine) 0x12 else 0x22
        val profile = if (isEngine) "MR-140" else "ZF 4HP16"
        val entries = DelphiParameterCatalog.forSelector(selector)
        val lines = entries.map { p ->
            val unit = p.unit?.takeIf { it.isNotBlank() }?.let { " ($it)" } ?: ""
            "ID %02X · %s%s\nOffset buffer: %d · Grupo: %d · Modo: %s · Precisión: %d".format(
                p.id, p.name, unit, p.dataOffset, p.group,
                DelphiParameterCatalog.readModeLabel(p.readMode), p.precision
            )
        }
        AlertDialog.Builder(this)
            .setTitle("Catálogo Delphi · $profile (${entries.size})")
            .setItems(lines.toTypedArray()) { _, which ->
                val p = entries[which]
                appendLog("CATÁLOGO DELPHI $profile ID %02X: %s; offset=%d, grupo=%d, modo=%s, precisión=%d. El offset pertenece al buffer Delphi original."
                    .format(p.id, p.name, p.dataOffset, p.group, DelphiParameterCatalog.readModeLabel(p.readMode), p.precision))
            }
            .setPositiveButton("Cerrar", null)
            .show()
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

        // Pausa Tester Present antes de programar la consulta: así no puede ganar la carrera
        // entre el clic y el inicio de la captura RX ni contaminar la respuesta DTC.
        testerPresentTask?.cancel(false)
        testerPresentTask = null
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
                appendLog("ERROR LECTURA DTC $profile en $stage: ${e.javaClass.simpleName}: ${e.message ?: "(sin mensaje)"}")
            } finally {
                synchronized(initRxLock) { captureInitRx = false }
                if (validatedStartProfile == profile && port === serialPort && serialPort.isOpen) {
                    startAutomaticTesterPresent(profile, source, serialPort)
                }
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
        if (::liveStartButton.isInitialized) stopLiveParameterPolling()
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
        liveDataExecutor.shutdownNow()
        super.onDestroy()
    }
}
