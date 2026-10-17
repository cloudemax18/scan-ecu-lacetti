package com.cheviexplorer.android

import android.content.Context
import org.json.JSONArray

/** Loads the original DTC lookup table supplied with the Delphi dump. */
internal object DtcCatalog {
    @Volatile private var cached: Map<String, String?>? = null

    fun description(context: Context, code: String): String? {
        val entries = cached ?: synchronized(this) {
            cached ?: load(context).also { cached = it }
        }
        // A Spanish rendering for the DTC seen in the capture; otherwise preserve
        // the source catalog's original description instead of inventing a translation.
        if (code == "P0703") return "Fallo en el circuito del interruptor/sensor de freno"
        return entries[code]
    }

    private fun load(context: Context): Map<String, String?> {
        val json = context.assets.open("dtc_tablas.json").bufferedReader(Charsets.UTF_8).use { it.readText() }
        val array = JSONArray(json)
        val result = LinkedHashMap<String, String?>()
        for (i in 0 until array.length()) {
            val item = array.getJSONObject(i)
            val group = item.optString("grupo")
            if (group !in setOf("P", "B", "C", "U")) continue
            val code = item.optString("codigo").trim()
            if (code.isEmpty()) continue
            val description = item.optString("descripcion_ru").takeIf { it.isNotBlank() && it != "null" }
            result[code] = description
        }
        return result
    }
}
