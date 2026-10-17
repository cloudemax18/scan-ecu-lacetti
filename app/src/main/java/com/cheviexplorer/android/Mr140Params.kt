package com.cheviexplorer.android

/**
 * Parámetros en vivo del MR-140 (Lacetti 1.8), extraídos del CheviExplorer original.
 * Tabla preliminar integrada en la app; las fórmulas y offsets aún requieren validación con capturas físicas.
 *
 * Petición: [0x82, 0x11, 0xF1, 0x21, localId, checksum]  (checksum = suma de bytes mod 256)
 * Respuesta positiva: [fmt, 0xF1, 0x11, 0x61, localId, datos..., checksum]
 * `dataIndex` cuenta desde el primer byte de `datos` (justo después de 0x61 localId).
 */
private enum class Mr140Raw { U8, U16_BE, U16_LE }

private class Mr140Parameter(
    val id: Int,
    val nombre: String,
    val unidad: String?,
    val localId: Int,
    val dataIndex: Int,
    val raw: Mr140Raw,
    val decimales: Int,
    val estados: List<String>?,
    val fn: (Double) -> Double,
) {
    fun leer(datos: ByteArray): Double? {
        val i = dataIndex
        val x = when (raw) {
            Mr140Raw.U8 -> if (i < datos.size) (datos[i].toInt() and 0xFF).toDouble() else return null
            Mr140Raw.U16_BE -> if (i + 1 < datos.size) (((datos[i].toInt() and 0xFF) shl 8) or (datos[i + 1].toInt() and 0xFF)).toDouble() else return null
            Mr140Raw.U16_LE -> if (i + 1 < datos.size) (((datos[i + 1].toInt() and 0xFF) shl 8) or (datos[i].toInt() and 0xFF)).toDouble() else return null
        }
        return fn(x)
    }
}

internal object Mr140 {
    const val ECU = 0x11
    const val TESTER = 0xF1
    private val params: List<Mr140Parameter> = listOf(
    Mr140Parameter(1, "Presión absoluta del colector de admisión", "kPa", 0xF0, 0, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(2, "Velocidad del vehículo", "km/h", 0xF0, 1, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(3, "Avance de encendido", "° cigüeñal", 0xF0, 2, Mr140Raw.U8, 1, null) { x -> ((x/2)-64) },
    Mr140Parameter(4, "Temperatura del aire de admisión", "°C", 0xF0, 3, Mr140Raw.U8, 0, null) { x -> (x-40) },
    Mr140Parameter(5, "Posición de la mariposa", "%", 0xF0, 4, Mr140Raw.U8, 0, null) { x -> (x/2.56) },
    Mr140Parameter(6, "Caudal másico de aire", "g/s", 0xF0, 5, Mr140Raw.U16_BE, 0, null) { x -> (x/128) },
    Mr140Parameter(7, "Carga del motor", "%", 0xF0, 7, Mr140Raw.U8, 0, null) { x -> (x/2.56) },
    Mr140Parameter(8, "RPM de ralentí deseadas", "rpm", 0xF0, 8, Mr140Raw.U8, 0, null) { x -> (x*12.5) },
    Mr140Parameter(9, "RPM del motor", "rpm", 0xF0, 9, Mr140Raw.U16_BE, 0, null) { x -> (x/4) },
    Mr140Parameter(11, "Tensión de la red de a bordo", "V", 0xF0, 13, Mr140Raw.U8, 1, null) { x -> (x/10) },
    Mr140Parameter(12, "Señal del sensor de posición de mariposa", "V", 0xF0, 14, Mr140Raw.U8, 1, null) { x -> (x/51) },
    Mr140Parameter(13, "Señal del sensor de oxígeno 1", "V", 0xF0, 15, Mr140Raw.U8, 3, null) { x -> (x/230) },
    Mr140Parameter(14, "Señal del sensor de oxígeno 2", "V", 0xF0, 16, Mr140Raw.U8, 3, null) { x -> (x/230) },
    Mr140Parameter(15, "Corrección de combustible a largo plazo", "%", 0xF0, 17, Mr140Raw.U8, 1, null) { x -> (((x*200)/256)-100) },
    Mr140Parameter(17, "Señal del sensor de nivel de combustible", "V", 0xF0, 19, Mr140Raw.U8, 1, null) { x -> (x/51) },
    Mr140Parameter(18, "Luz de nivel bajo de combustible", null, 0xF0, 20, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x10) shr 4)).toDouble() },
    Mr140Parameter(19, "Corte de combustible", null, 0xF0, 20, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x40) shr 6)).toDouble() },
    Mr140Parameter(21, "Luz de avería (MIL)", null, 0xF0, 20, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x4) shr 2)).toDouble() },
    Mr140Parameter(22, "Posición de la válvula de purga del canister", "%", 0xF0, 21, Mr140Raw.U8, 1, null) { x -> (x/2.56) },
    Mr140Parameter(24, "Posición del motor de ralentí (IAC)", "pasos", 0xF0, 23, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(26, "Temperatura del refrigerante", "°C", 0xF0, 25, Mr140Raw.U8, 0, null) { x -> (x-40) },
    Mr140Parameter(27, "Corrección de combustible a corto plazo", "%", 0xF0, 26, Mr140Raw.U8, 1, null) { x -> (((x*200)/256)-100) },
    Mr140Parameter(28, "Presión barométrica", "kPa", 0xF0, 27, Mr140Raw.U8, 0, null) { x -> (((x*94)/256)+10) },
    Mr140Parameter(29, "Relación aire-combustible", null, 0xF0, 28, Mr140Raw.U8, 1, null) { x -> (x/10) },
    Mr140Parameter(31, "Tiempo de funcionamiento del motor", "s", 0xF1, 1, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(32, "Retardo del ángulo de encendido", "° cigüeñal", 0xF1, 3, Mr140Raw.U8, 1, null) { x -> (x/11.6) },
    Mr140Parameter(33, "Tiempo de inyección", "ms", 0xF1, 4, Mr140Raw.U16_BE, 2, null) { x -> (x/65.5) },
    Mr140Parameter(34, "Posición deseada del motor de ralentí", "pasos", 0xF1, 6, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(35, "Solicitud de A/C", null, 0xF1, 7, Mr140Raw.U8, 0, listOf("No","Sí")) { x -> (((x.toInt() and 0x10) shr 4)).toDouble() },
    Mr140Parameter(36, "Relé del compresor de A/C", null, 0xF1, 7, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x20) shr 5)).toDouble() },
    Mr140Parameter(37, "Protección del catalizador", null, 0xF1, 7, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x40) shr 6)).toDouble() },
    Mr140Parameter(38, "Relé de la bomba de combustible", null, 0xF1, 7, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x80) shr 7)).toDouble() },
    Mr140Parameter(39, "Solenoide de purga del canister", null, 0xF1, 8, Mr140Raw.U8, 0, listOf("Cerrado","Abierto")) { x -> (((x.toInt() and 0x10) shr 4)).toDouble() },
    Mr140Parameter(40, "Control de la mezcla (lazo)", null, 0xF1, 9, Mr140Raw.U8, 0, listOf("Lazo abierto","Lazo cerrado")) { x -> ((x.toInt() and 0x1)).toDouble() },
    Mr140Parameter(41, "Sensor de oxígeno 1 listo", null, 0xF1, 9, Mr140Raw.U8, 0, listOf("No","Sí")) { x -> (((x.toInt() and 0x2) shr 1)).toDouble() },
    Mr140Parameter(42, "Inmovilizador", null, 0xF1, 9, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x4) shr 2)).toDouble() },
    Mr140Parameter(43, "Aprendizaje de combustible", null, 0xF1, 9, Mr140Raw.U8, 0, listOf("No","Sí")) { x -> (((x.toInt() and 0x8) shr 3)).toDouble() },
    Mr140Parameter(44, "Aumento de potencia", null, 0xF1, 9, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x10) shr 4)).toDouble() },
    Mr140Parameter(45, "Relé del ventilador (baja velocidad)", null, 0xF1, 10, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x1) shr 0)).toDouble() },
    Mr140Parameter(46, "Relé del ventilador (alta velocidad)", null, 0xF1, 10, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x2) shr 1)).toDouble() },
    Mr140Parameter(47, "Solenoide del embrague del convertidor", null, 0xF1, 10, Mr140Raw.U8, 0, listOf("Apagado","Encendido")) { x -> (((x.toInt() and 0x8) shr 3)).toDouble() },
    Mr140Parameter(48, "Palanca en posición P/N", null, 0xF1, 10, Mr140Raw.U8, 0, listOf("No","Sí")) { x -> (((x.toInt() and 0x40) shr 6)).toDouble() },
    Mr140Parameter(49, "Contador de activaciones del sensor de detonación", null, 0xF1, 11, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(50, "Tensión de referencia 5 V", "V", 0xF1, 12, Mr140Raw.U8, 2, null) { x -> (x/51.2) },
    Mr140Parameter(51, "Temperatura del refrigerante al arranque", "°C", 0xF1, 13, Mr140Raw.U8, 0, null) { x -> (x-40) },
    Mr140Parameter(52, "Temperatura del aire de admisión al arranque", "°C", 0xF1, 14, Mr140Raw.U8, 0, null) { x -> (x-40) },
    Mr140Parameter(53, "Señal del circuito de alta presión del A/C", "V", 0xF1, 15, Mr140Raw.U8, 2, null) { x -> (x/51.2) },
    Mr140Parameter(54, "Total de fallos de encendido", null, 0xF1, 16, Mr140Raw.U8, 0, null) { x -> x },
    Mr140Parameter(55, "Fallos de encendido cilindro 1", null, 0xF1, 17, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(56, "Fallos de encendido cilindro 2", null, 0xF1, 19, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(57, "Fallos de encendido cilindro 3", null, 0xF1, 21, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(58, "Fallos de encendido cilindro 4", null, 0xF1, 23, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(59, "Temperatura del catalizador", "°C", 0xF1, 25, Mr140Raw.U8, 0, null) { x -> ((x*3)+300) },
    Mr140Parameter(61, "Transiciones mezcla pobre/rica", null, 0xF1, 27, Mr140Raw.U16_BE, 0, null) { x -> x },
    Mr140Parameter(62, "Posición deseada de EGR", "%", 0xF1, 29, Mr140Raw.U8, 0, null) { x -> (x/2.56) },
    Mr140Parameter(64, "Posición de EGR", "%", 0xF1, 32, Mr140Raw.U8, 0, null) { x -> (x/2.56) },
    )

    fun checksum(b: ByteArray, len: Int = b.size): Int {
        var s = 0
        for (i in 0 until len) s += b[i].toInt() and 0xFF
        return s and 0xFF
    }

    /** Petición ReadDataByLocalIdentifier (0x21). */
    fun buildRequest(id: Int): ByteArray {
        val f = byteArrayOf(0x82.toByte(), ECU.toByte(), TESTER.toByte(), 0x21, id.toByte(), 0)
        f[5] = checksum(f, 5).toByte()
        return f
    }

    /** Devuelve los bytes de datos si la trama es una respuesta 0x61 válida para [id]. */
    fun parseResponseData(trama: ByteArray, id: Int): ByteArray? {
        if (trama.size < 6) return null
        val len = (trama[0].toInt() and 0x3F)
        val hdr = if (len == 0) 4 else 3
        val n = if (len == 0) (trama[3].toInt() and 0xFF) else len
        if (trama.size < hdr + n + 1) return null
        if (checksum(trama, hdr + n) != (trama[hdr + n].toInt() and 0xFF)) return null
        if ((trama[hdr].toInt() and 0xFF) != 0x61 || (trama[hdr + 1].toInt() and 0xFF) != id) return null
        return trama.copyOfRange(hdr + 2, hdr + n)
    }

    data class Reading(val id: Int, val name: String, val value: Double, val unit: String?, val decimals: Int, val states: List<String>?) {
        fun display(): String {
            val rendered = String.format(java.util.Locale.US, "%.${decimals}f", value)
            val state = states?.getOrNull(value.toInt())
            return if (state != null) "$name: $state" else "$name: $rendered" + (unit?.let { " $it" } ?: "")
        }
    }

    fun decodeGroup(localId: Int, data: ByteArray): List<Reading> =
        params.filter { it.localId == localId }.mapNotNull { p ->
            p.leer(data)?.let { Reading(p.id, p.nombre, it, p.unidad, p.decimales, p.estados) }
        }
}
