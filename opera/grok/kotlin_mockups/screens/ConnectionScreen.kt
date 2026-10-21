package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Escalera de estados de conexión (diseño).
 * En el APK actual la conexión vive en Inicio + setStatus + log; esta pantalla
 * es referencia de claridad de estados, no Activity separada obligatoria.
 */
object ConnectionScreen {

    enum class StepState { DONE, RUNNING, WAIT, ERROR }

    data class Step(val title: String, val detail: String, val state: StepState)

    fun defaultSteps(): List<Step> = listOf(
        Step("Permiso USB", "Concedido", StepState.DONE),
        Step("Adaptador detectado", "VID/PID · no implica ECU", StepState.DONE),
        Step("Puerto serie abierto", "10400 8N1 · no es prueba KWP", StepState.DONE),
        Step("Inicialización KWP en curso", "StartCommunication · perfil seleccionado", StepState.RUNNING),
        Step("Comunicación KWP validada", "Respuesta positiva + checksum", StepState.WAIT),
        Step("ECU objetivo identificada", "Solo con evidencia de identificación", StepState.WAIT)
    )

    fun build(
        context: Context,
        steps: List<Step> = defaultSteps(),
        onCancel: () -> Unit = {},
        onRetry: () -> Unit = {}
    ): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }
        root.addView(TextView(context).apply {
            text = "Conexión KKL"
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.sectionTitleSp
            typeface = Typeface.DEFAULT_BOLD
        })
        root.addView(TextView(context).apply {
            text = "Estados diferenciados · baud no es KWP"
            setTextColor(UiTokens.textSecondary)
            textSize = UiTokens.captionSp
            setPadding(0, 0, 0, d)
        })

        steps.forEach { step ->
            root.addView(stepRow(context, step), LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            ).apply { bottomMargin = UiComponents.dp(context, 4f) })
        }

        root.addView(TextView(context).apply {
            text = "TX  81 11 F1 81 04\nEsperando respuesta… (timeout posible)"
            typeface = Typeface.MONOSPACE
            setTextColor(UiTokens.textSecondary)
            textSize = 11f
            setPadding(d, d, d, d)
            background = UiComponents.roundedSurface(context)
        }, LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        ).apply { topMargin = d })

        val actions = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(0, d, 0, 0)
        }
        val cancel = UiComponents.secondaryButton(context, "Cancelar")
        cancel.setOnClickListener { onCancel() }
        val retry = UiComponents.primaryButton(context, "Reintentar")
        retry.setOnClickListener { onRetry() }
        actions.addView(cancel, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).apply {
            marginEnd = UiComponents.dp(context, 8f)
        })
        actions.addView(retry, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        root.addView(actions)
        return root
    }

    private fun stepRow(context: Context, step: Step): LinearLayout {
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = android.view.Gravity.CENTER_VERTICAL
            setPadding(0, UiComponents.dp(context, 8f), 0, UiComponents.dp(context, 8f))
        }
        val (bg, label) = when (step.state) {
            StepState.DONE -> UiTokens.success to "✓"
            StepState.RUNNING -> UiTokens.accent to "…"
            StepState.ERROR -> UiTokens.errorRed to "!"
            StepState.WAIT -> UiTokens.border to "·"
        }
        row.addView(TextView(context).apply {
            text = label
            setTextColor(UiTokens.textPrimary)
            gravity = android.view.Gravity.CENTER
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(bg)
            }
        }, LinearLayout.LayoutParams(UiComponents.dp(context, 28f), UiComponents.dp(context, 28f)))

        val col = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(UiComponents.dp(context, 12f), 0, 0, 0)
        }
        col.addView(TextView(context).apply {
            text = step.title
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.bodySp
        })
        col.addView(TextView(context).apply {
            text = step.detail
            setTextColor(UiTokens.textSecondary)
            textSize = UiTokens.captionSp
        })
        row.addView(col, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        return row
    }
}
