package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.content.res.ColorStateList
import android.graphics.Typeface
import android.view.View
import android.widget.ArrayAdapter
import android.widget.LinearLayout
import android.widget.Spinner
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Actuadores DriverIM MR-140 (referencia).
 * En el APK viven dentro de la sección Pruebas.
 * ZF / HV-240: empty — sin controles.
 * Validación en vehículo: PENDIENTE. No declarar seguro.
 */
object ActuatorsScreen {

    enum class Mode { Mr140, ZfOrHvBlocked }

    /** Etiquetas de ejemplo alineadas al catálogo Delphi (solo UI). */
    private val mr140Labels = listOf(
        "Relé ventilador · baja velocidad · 0x13",
        "Relé ventilador · alta velocidad · 0x14",
        "Relé de bomba de combustible · 0x12",
        "Lámpara de avería (MIL) · 0x10"
    )

    fun build(
        context: Context,
        mode: Mode = Mode.Mr140,
        onRead: () -> Unit = {},
        onOn: () -> Unit = {},
        onOff: () -> Unit = {}
    ): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }

        when (mode) {
            Mode.ZfOrHvBlocked -> {
                root.addView(TextView(context).apply {
                    text = "Servicio y actuadores"
                    setTextColor(UiTokens.textPrimary)
                    textSize = UiTokens.sectionTitleSp
                    typeface = Typeface.DEFAULT_BOLD
                })
                root.addView(TextView(context).apply {
                    text = "ZF / HV-240 · sin rutina habilitada"
                    setTextColor(UiTokens.textSecondary)
                    textSize = UiTokens.captionSp
                    setPadding(0, 0, 0, d)
                })
                root.addView(
                    UiComponents.emptyState(
                        context,
                        "Sin procedimientos confirmados para esta ECU",
                        "No se habilitan actuadores ZF sin reconstruir la rutina original. HV-240: conexión no habilitada. Aprendizaje/adaptación: no disponible."
                    )
                )
                root.addView(
                    UiComponents.secondaryButton(context, "Controles deshabilitados", enabled = false),
                    LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT
                    ).apply { topMargin = d }
                )
            }
            Mode.Mr140 -> {
                root.addView(TextView(context).apply {
                    text = "Actuadores · DriverIM"
                    setTextColor(UiTokens.textPrimary)
                    textSize = UiTokens.sectionTitleSp
                    typeface = Typeface.DEFAULT_BOLD
                })
                root.addView(TextView(context).apply {
                    text = "Catálogo EXE · destino 0x11 · validación vehículo PENDIENTE"
                    setTextColor(UiTokens.textSecondary)
                    textSize = UiTokens.captionSp
                    setPadding(0, 0, 0, d)
                })
                root.addView(
                    UiComponents.warningNote(
                        context,
                        "Motor apagado, contacto ON, P/N, freno. Manos lejos de ventiladores. OFF ~3 s; si se pierde el enlace no se garantiza liberación. Este mock no ejecuta comandos."
                    )
                )
                root.addView(UiComponents.sectionLabel(context, "Actuador del catálogo original"), LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
                ).apply { topMargin = d })
                root.addView(Spinner(context).apply {
                    adapter = ArrayAdapter(context, android.R.layout.simple_spinner_dropdown_item, mr140Labels)
                    minimumHeight = UiComponents.dp(context, UiTokens.minTouchDp.toFloat())
                    background = UiComponents.roundedSurface(context)
                })

                val read = UiComponents.secondaryButton(context, "Leer estado · 0x30 01")
                read.setOnClickListener { onRead() }
                root.addView(read, marginTop(context, 10))

                val on = UiComponents.primaryButton(context, "Activar 3 s · 0x30 07 FF").apply {
                    backgroundTintList = ColorStateList.valueOf(UiTokens.success)
                }
                on.setOnClickListener { onOn() }
                root.addView(on, marginTop(context, 8))

                val off = UiComponents.primaryButton(context, "Desactivar · 0x30 07 00").apply {
                    backgroundTintList = ColorStateList.valueOf(UiTokens.warning)
                    setTextColor(UiTokens.pageBackground)
                }
                off.setOnClickListener { onOff() }
                root.addView(off, marginTop(context, 8))

                root.addView(TextView(context).apply {
                    text = "Adaptación acelerador (0x2C): UI deshabilitada hasta validar rutina completa del EXE.\nCONFIRMADO EN CÓDIGO (catálogo) · no PROBADO EN DISPOSITIVO."
                    setTextColor(UiTokens.textSecondary)
                    textSize = 11f
                    setPadding(0, d, 0, 0)
                })
            }
        }
        return root
    }

    private fun marginTop(context: Context, dp: Int) =
        LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        ).apply { topMargin = UiComponents.dp(context, dp.toFloat()) }
}
