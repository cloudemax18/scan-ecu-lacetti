package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.graphics.Typeface
import android.view.View
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.Spinner
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Mock de Inicio. Perfiles del APK real: solo MR-140 y ZF 4HP16.
 * HV-240 no está en el spinner (no disponible / no validada).
 *
 * Callbacks son stubs de UI — cablear a requestUsbConnection / initializeSelectedEcu
 * en MainActivity sin duplicar protocolo.
 */
object HomeScreen {

    data class Callbacks(
        val onDisconnect: () -> Unit = {},
        val onInitReadOnly: () -> Unit = {},
        val onGoDiagnostic: () -> Unit = {},
        val onGoLab: () -> Unit = {}
    )

    fun build(context: Context, callbacks: Callbacks = Callbacks()): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }

        root.addView(TextView(context).apply {
            text = "CheviExplorer"
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.titleSp
            typeface = Typeface.DEFAULT_BOLD
        })
        root.addView(TextView(context).apply {
            text = "ANDROID · KKL 409.1 · CH340/CH341"
            setTextColor(UiTokens.accent)
            textSize = 11f
            setPadding(0, UiComponents.dp(context, 2f), 0, UiComponents.dp(context, 12f))
        })

        // Puerto abierto = accent, NO success (puerto ≠ KWP validado)
        root.addView(
            UiComponents.statusBadge(
                context,
                title = "Puerto serie abierto · 10400 8N1",
                subtitle = "Ajuste de puerto. No equivale a comunicación KWP ni a ECU identificada.",
                kind = "port"
            ),
            lp(context)
        )

        root.addView(UiComponents.sectionLabel(context, "Perfil de ECU"), lp(context, top = 16))
        val profiles = listOf(
            "Motor Delphi MR-140",
            "Transmisión ZF 4HP16"
            // HV-240 deliberadamente ausente: no habilitada en código actual
        )
        root.addView(Spinner(context).apply {
            adapter = ArrayAdapter(context, android.R.layout.simple_spinner_dropdown_item, profiles)
            minimumHeight = UiComponents.dp(context, UiTokens.minTouchDp.toFloat())
            background = UiComponents.roundedSurface(context)
        }, lp(context))

        root.addView(TextView(context).apply {
            text = "HV-240: no disponible en el spinner (pendiente de validación; no hereda 0x11 ni secuencias MR-140)."
            setTextColor(UiTokens.warning)
            textSize = 11f
            setPadding(0, UiComponents.dp(context, 6f), 0, 0)
        })

        val disconnect = UiComponents.primaryButton(context, "Desconectar adaptador")
        disconnect.setOnClickListener { callbacks.onDisconnect() }
        root.addView(disconnect, lp(context, top = 12))

        val init = UiComponents.secondaryButton(context, "Inicializar ECU · solo lectura")
        init.setOnClickListener { callbacks.onInitReadOnly() }
        root.addView(init, lp(context, top = 8))

        val dtc = UiComponents.secondaryButton(context, "Ir a Diagnóstico")
        dtc.setOnClickListener { callbacks.onGoDiagnostic() }
        root.addView(dtc, lp(context, top = 8))

        val lab = UiComponents.secondaryButton(context, "Laboratorio KWP")
        lab.setOnClickListener { callbacks.onGoLab() }
        root.addView(lab, lp(context, top = 8))

        root.addView(
            UiComponents.warningNote(
                context,
                "Solo identificación y lectura en exploración. Escritura, borrado y actuadores requieren validación. Perfil seleccionado ≠ ECU identificada. MOCK — no es captura del APK."
            ),
            lp(context, top = 14)
        )
        return root
    }

    private fun lp(context: Context, top: Int = 0): LinearLayout.LayoutParams =
        LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        ).apply {
            topMargin = UiComponents.dp(context, top.toFloat())
        }
}
