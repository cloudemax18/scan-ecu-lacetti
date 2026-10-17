package com.cheviexplorer.android

/**
 * Field positions extracted into ident_decodificacion.json.
 * Indices count from the first data byte after the 5A 80 response prefix.
 * This table is limited to the two ECU profiles physically observed in this project.
 */
internal object EcuIdentificationDecoder {
    data class Field(val name: String, val format: String, val length: Int, val index: Int)
    data class Value(val name: String, val value: String)

    private val fields = mapOf(
        "MR-140" to listOf(
            Field("VIN (16 caracteres según parser original)", "ascii", 16, 0),
            Field("Número de programa", "ascii", 10, 48),
            Field("Fecha de programación", "hex", 4, 64)
        ),
        "ZF 4HP16" to listOf(
            Field("Código de software", "ascii", 8, 0),
            Field("Número de programa de arranque (boot)", "ascii", 12, 20),
            Field("Número de programa", "ascii", 12, 32),
            Field("Número de calibración", "ascii", 10, 44),
            Field("Número de pieza", "ascii", 8, 92)
        )
    )

    fun decode(profile: String, payload: ByteArray): List<Value> {
        if (payload.size < 2 ||
            (payload[0].toInt() and 0xFF) != 0x5A ||
            (payload[1].toInt() and 0xFF) != 0x80
        ) return emptyList()
        val data = payload.copyOfRange(2, payload.size)
        return fields[profile].orEmpty().mapNotNull { field ->
            if (field.index < 0 || field.index + field.length > data.size) return@mapNotNull null
            val bytes = data.copyOfRange(field.index, field.index + field.length)
            val value = when (field.format) {
                "ascii" -> bytes
                    .dropWhile { filler(it) }
                    .dropLastWhile { filler(it) }
                    .map { (it.toInt() and 0xFF).toChar() }
                    .joinToString("")
                "hex" -> bytes.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
                "u16_be" -> if (bytes.size >= 2) {
                    (((bytes[0].toInt() and 0xFF) shl 8) or (bytes[1].toInt() and 0xFF)).toString()
                } else ""
                else -> bytes.joinToString(" ") { "%02X".format(it.toInt() and 0xFF) }
            }
            if (value.isBlank()) null else Value(field.name, value)
        }
    }

    private fun filler(byte: Byte): Boolean {
        val value = byte.toInt() and 0xFF
        return value == 0x00 || value == 0xFF || value == 0x20
    }
}
