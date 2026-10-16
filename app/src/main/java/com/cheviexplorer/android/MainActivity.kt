package com.cheviexplorer.android

import android.app.Activity
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
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.Spinner
import android.widget.TextView
import android.widget.Toast
import com.hoho.android.usbserial.driver.UsbSerialPort
import com.hoho.android.usbserial.driver.UsbSerialProber
import com.hoho.android.usbserial.util.SerialInputOutputManager
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.Executors

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
    private val executor = Executors.newSingleThreadExecutor()
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
        registerReceiver(permissionReceiver, IntentFilter(ACTION_USB_PERMISSION))
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
        val note = TextView(this).apply {
            text = "Funciones: detección USB, enlace serie, inicialización K-Line de prueba para MR-140 o ZF 4HP16, registro hexadecimal RX y exportación. El botón de inicialización envía únicamente la trama inicial candidata del software original; no lee parámetros, no borra averías y no activa actuadores."
            textSize = 13f; setTextColor(0xFFFFD180.toInt()); setPadding(0, 12, 0, 12)
        }
        root.addView(note, lp(-1, -2))
        root.addView(TextView(this).apply { text = "REGISTRO DE COMUNICACIÓN"; textSize = 12f; setTextColor(0xFF90A4AE.toInt()); setPadding(0, 6, 0, 8) }, lp(-1, -2))
        log = TextView(this).apply { textSize = 12f; typeface = android.graphics.Typeface.MONOSPACE; setTextColor(0xFFECEFF1.toInt()); setPadding(10, 10, 10, 10) }
        val scroll = ScrollView(this).apply { setBackgroundColor(0xFF18232C.toInt()); addView(log) }
        root.addView(scroll, LinearLayout.LayoutParams(-1, 0, 1f))
        val save = Button(this).apply { text = "Exportar captura RX"; setOnClickListener { exportLog() } }
        root.addView(save, lp(-1, -2))
        val clear = Button(this).apply { text = "Limpiar registro"; setOnClickListener { log.text = "" } }
        root.addView(clear, lp(-1, -2))
        setContentView(root)
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
        val frame = if (isEngine) {
            byteArrayOf(0x81.toByte(), 0x11, 0xF1.toByte(), 0x83.toByte())
        } else {
            byteArrayOf(0x81.toByte(), 0x18, 0xF1.toByte(), 0x8A.toByte())
        }
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
                // Some USB-serial drivers do not implement buffer purging. This is
                // optional; record it and continue to the mandatory BREAK capability check.
                try {
                    serialPort.purgeHwBuffers(true, true)
                } catch (e: UnsupportedOperationException) {
                    appendLog("AVISO INIT $profile: el controlador no admite purgeHwBuffers(); se continúa.")
                }

                Thread.sleep(100)

                // The original software uses a timed BREAK sequence before sending
                // the init frame. Never send the frame if the adapter cannot generate
                // BREAK: that would look like a valid attempt but is not a valid init.
                stage = "prueba de señal BREAK"
                try {
                    serialPort.setBreak(true)
                    Thread.sleep(24)
                    serialPort.setBreak(false)
                    Thread.sleep(24)
                } catch (e: UnsupportedOperationException) {
                    appendLog("ERROR INIT $profile: el controlador USB (${serialPort.javaClass.simpleName}) no admite BREAK.")
                    appendLog("No se envió TX. La inicialización original requiere controlar la línea K-Line; esta biblioteca/controlador no expone esa función para este adaptador.")
                    runOnUiThread {
                        Toast.makeText(this@MainActivity, "El controlador no admite BREAK; no se envió la trama", Toast.LENGTH_LONG).show()
                    }
                    return@execute
                }

                stage = "envío de trama"
                appendLog("TX $profile  " + frame.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) })
                serialPort.write(frame, 1000)
                stage = "espera de respuesta"
                Thread.sleep(1500)
                appendLog("INIT $profile finalizada; comprueba si apareció RX después de TX.")
            } catch (e: Exception) {
                val detail = e.message?.takeIf { it.isNotBlank() } ?: "(sin mensaje)"
                appendLog("ERROR INIT $profile en $stage: ${e.javaClass.simpleName}: $detail")
            }
        }
    }

    private fun disconnect() {
        try { ioManager?.listener = null; ioManager?.stop() } catch (_: Exception) {}
        ioManager = null
        try { port?.close() } catch (_: Exception) {}
        port = null
        connectButton.text = "Buscar / conectar cable"
        setStatus("Desconectado")
        appendLog("Puerto serie cerrado.")
    }

    override fun onNewData(data: ByteArray) {
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
        super.onDestroy()
    }
}
