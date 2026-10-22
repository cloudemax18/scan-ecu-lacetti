package kwp

/**
 * Decodificación de la respuesta de lectura de DTC, según Button_DTCClick del CheviExplorer.
 * NO COMPILADO NI PROBADO en este entorno.
 *
 * Trama (sin eco): [fmt, 0xF1, ecu, SID(0x58|0x59), nDTC, registros..., checksum]
 *  - MR-140 (petición 84 11 F1 19 DA FF 00): registros de 4 bytes.
 *  - ZF / resto de motores y cajas (petición 84 .. F1 18 00 00 00): registros de 3 bytes.
 *  - nDTC == 0  ->  "Sin averías" (el original muestra "Ошибок нет").
 * Registro: [b0, b1, estado, (extra)]
 *  - letra: b0 >> 6 : 0=P, 1=C, 2=B, 3=U ; código = letra + hex2(b0 & 0x3F) + hex2(b1)
 *  - estado: (estado & 0x60): 0x20 = almacenado, 0x40 = actual, 0x60 = intermitente
 */
enum class EstadoDtc { ALMACENADO, ACTUAL, INTERMITENTE, DESCONOCIDO }

data class Dtc(val codigo: String, val estado: EstadoDtc, val estadoRaw: Int)

object DtcDecoder {
    fun decodificar(trama: ByteArray, bytesPorRegistro: Int): List<Dtc>? {
        if (trama.size < 6) return null
        val len = trama[0].toInt() and 0x3F
        val hdr = if (len == 0) 4 else 3
        val n = if (len == 0) trama[3].toInt() and 0xFF else len
        if (trama.size < hdr + n + 1) return null
        val sid = trama[hdr].toInt() and 0xFF
        if (sid != 0x58 && sid != 0x59) return null
        val cuenta = trama[hdr + 1].toInt() and 0xFF
        val res = ArrayList<Dtc>()
        for (i in 0 until cuenta) {
            val p = hdr + 2 + i * bytesPorRegistro
            if (p + 2 >= hdr + n + 1) return null
            val b0 = trama[p].toInt() and 0xFF
            val b1 = trama[p + 1].toInt() and 0xFF
            val st = trama[p + 2].toInt() and 0xFF
            val letra = "PCBU"[b0 shr 6]
            val codigo = letra + "%02X".format(b0 and 0x3F) + "%02X".format(b1)
            val estado = when (st and 0x60) {
                0x20 -> EstadoDtc.ALMACENADO
                0x40 -> EstadoDtc.ACTUAL
                0x60 -> EstadoDtc.INTERMITENTE
                else -> EstadoDtc.DESCONOCIDO
            }
            res.add(Dtc(codigo, estado, st))
        }
        return res
    }
}
