package com.cheviexplorer.android

import android.content.Context
import org.json.JSONArray

/**
 * Spanish DTC lookup translated from the repository catalog.
 * The JSON retains descripcion_ru for audit/comparison; the app displays descripcion_es.
 */
internal object DtcCatalog {
    @Volatile private var cached: Map<String, String?>? = null

    fun description(context: Context, code: String): String? {
        val entries = cached ?: synchronized(this) {
            cached ?: load(context).also { cached = it }
        }
        val description = entries[code] ?: return null
        return description.ifBlank { "Sin descripción disponible" }
    }

    private fun load(context: Context): Map<String, String?> {
        val json = context.assets.open("dtc_tablas_es.json")
            .bufferedReader(Charsets.UTF_8).use { it.readText() }
        val array = JSONArray(json)
        val result = LinkedHashMap<String, String?>()
        for (i in 0 until array.length()) {
            val item = array.getJSONObject(i)
            val group = item.optString("grupo")
            if (group !in setOf("P", "B", "C", "U")) continue
            val code = item.optString("codigo").trim()
            if (code.isEmpty()) continue
            val description = item.optString("descripcion_es")
                .takeIf { it.isNotBlank() && it != "null" }
            result[code] = description
        }
        return result
    }
}
