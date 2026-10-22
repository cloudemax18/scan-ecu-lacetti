package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.graphics.Typeface
import android.view.View
import android.widget.LinearLayout
import android.widget.ProgressBar
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Laboratorio KWP (referencia).
 * Barrido base real en código: 01–40 + FB. F0/F1 están en deferredDynamicIds (aplazados).
 * No presentar F0/F1 como explorables activos.
 */
object LabScreen {

    data class Counters(
        val planned: Int = 67,
        val attempts: Int = 30,
        val positives: Int = 4,
        val nrc: Int = 18,
        val noResponseGroup: Int = 8
    )

    fun build(
        context: Context,
        counters: Counters = Counters(),
        onStop: () -> Unit = {},
        onExport: () -> Unit = {}
    ): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }
        root.addView(TextView(context).apply {
            text = "Laboratorio KWP"
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.sectionTitleSp
            typeface = Typeface.DEFAULT_BOLD
        })
        root.addView(TextView(context).apply {
            text = "Base 01–40 + FB · F0/F1 aplazados · solo lectura"
            setTextColor(UiTokens.accent)
            textSize = UiTokens.captionSp
            setPadding(0, 0, 0, d)
        })

        val panel = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            background = UiComponents.roundedSurface(context)
            setPadding(d, d, d, d)
        }
        fun stat(label: String, value: String, color: Int = UiTokens.textPrimary): LinearLayout {
            val box = LinearLayout(context).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(UiComponents.dp(context, 8f), UiComponents.dp(context, 8f), UiComponents.dp(context, 8f), UiComponents.dp(context, 8f))
                background = UiComponents.roundedSurface(context, UiTokens.pageBackground)
            }
            box.addView(TextView(context).apply {
                text = value
                setTextColor(color)
                textSize = 20f
                typeface = Typeface.MONOSPACE
            })
            box.addView(TextView(context).apply {
                text = label
                setTextColor(UiTokens.textSecondary)
                textSize = 10f
            })
            return box
        }
        val grid = LinearLayout(context).apply { orientation = LinearLayout.VERTICAL }
        val r1 = LinearLayout(context).apply { orientation = LinearLayout.HORIZONTAL }
        r1.addView(stat("Planificados", counters.planned.toString()), LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).apply { marginEnd = 8 })
        r1.addView(stat("Intentos", counters.attempts.toString()), LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        val r2 = LinearLayout(context).apply { orientation = LinearLayout.HORIZONTAL }
        r2.addView(stat("Positivos (0x61)", counters.positives.toString(), UiTokens.success), LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).apply { marginEnd = 8 })
        r2.addView(stat("NRC (0x7F)", counters.nrc.toString(), UiTokens.warning), LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        val r3 = LinearLayout(context).apply { orientation = LinearLayout.HORIZONTAL }
        r3.addView(stat("Sin resp./timeout/chk*", counters.noResponseGroup.toString(), UiTokens.textSecondary), LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        grid.addView(r1)
        grid.addView(r2, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT).apply { topMargin = 8 })
        grid.addView(r3, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT).apply { topMargin = 8 })
        panel.addView(grid)
        panel.addView(ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal).apply {
            max = counters.planned.coerceAtLeast(1)
            progress = counters.attempts.coerceIn(0, max)
        }, LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT).apply {
            topMargin = d
        })
        root.addView(panel)

        root.addView(TextView(context).apply {
            text = "* Agrupado como en IdProbe si el código no separa timeout/checksum. F0/F1 no forman parte del barrido base (KwpLaboratoryPlan.deferredDynamicIds)."
            setTextColor(UiTokens.textSecondary)
            textSize = 11f
            setPadding(0, d, 0, d)
        })

        val actions = LinearLayout(context).apply { orientation = LinearLayout.HORIZONTAL }
        val stop = UiComponents.primaryButton(context, "Detener").apply {
            backgroundTintList = android.content.res.ColorStateList.valueOf(UiTokens.errorRed)
        }
        stop.setOnClickListener { onStop() }
        val export = UiComponents.secondaryButton(context, "Exportar log")
        export.setOnClickListener { onExport() }
        actions.addView(stop, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).apply {
            marginEnd = UiComponents.dp(context, 8f)
        })
        actions.addView(export, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        root.addView(actions)

        root.addView(TextView(context).apply {
            text = "Detener → stopLiveParameterPolling() (parada cooperativa). MOCK — no simula ECU real."
            setTextColor(UiTokens.textSecondary)
            textSize = 11f
            setPadding(0, d, 0, 0)
        })
        return root
    }
}
