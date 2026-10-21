package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.graphics.Typeface
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Datos en vivo: ID + hex + «Sin datos confirmados».
 * No etiquetar como RPM/temperatura sin fórmula verificada.
 */
object LiveDataScreen {

    data class Row(val idHex: String, val payloadHex: String, val timestamp: String)

    fun sampleRows(): List<Row> = listOf(
        Row("21 02", "66 FF 30 48 30 33 30 30 38 30 37 31 39 31 67 44 FF FF FF FF", "09:41:12"),
        Row("21 03", "05 BF 9A 4C", "09:41:12"),
        Row("21 04", "00 BA 5B DA", "09:41:13")
    )

    fun build(
        context: Context,
        rows: List<Row> = sampleRows(),
        onStart: () -> Unit = {},
        onStop: () -> Unit = {}
    ): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }
        root.addView(TextView(context).apply {
            text = "Datos en vivo"
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.sectionTitleSp
            typeface = Typeface.DEFAULT_BOLD
        })
        root.addView(TextView(context).apply {
            text = "Solo lectura · IDs 0x21 · sin decodificación inventada"
            setTextColor(UiTokens.success)
            textSize = UiTokens.captionSp
            setPadding(0, 0, 0, d)
        })

        rows.forEach { row ->
            root.addView(
                UiComponents.dataRowHex(
                    context,
                    idLabel = row.idHex,
                    hex = row.payloadHex,
                    meta = "Respuesta bruta · ${row.timestamp} · pendiente de validación · no valor de sensor"
                ),
                LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
                ).apply { bottomMargin = UiComponents.dp(context, 10f) }
            )
        }

        root.addView(TextView(context).apply {
            text = "Si la consulta falla: estado error/vacío; no mantener valor antiguo como actual."
            setTextColor(UiTokens.textSecondary)
            textSize = 11f
            setPadding(0, 0, 0, d)
        })

        val actions = LinearLayout(context).apply { orientation = LinearLayout.HORIZONTAL }
        val start = UiComponents.primaryButton(context, "Iniciar lectura")
        start.setOnClickListener { onStart() }
        val stop = UiComponents.secondaryButton(context, "Detener")
        stop.setOnClickListener { onStop() }
        actions.addView(start, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).apply {
            marginEnd = UiComponents.dp(context, 8f)
        })
        actions.addView(stop, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        root.addView(actions)
        return root
    }
}
