package com.cheviexplorer.android.ui.mock.screens

import android.content.Context
import android.graphics.Typeface
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.UiComponents
import com.cheviexplorer.android.ui.mock.UiTokens

/**
 * Mock DTC. Borrar siempre deshabilitado en este diseño.
 * "0 códigos" solo con evidencia de perfil (p. ej. captura MR-140); no generalizar a ZF.
 */
object DtcScreen {

    sealed class Content {
        data class ZeroConfirmedForProfile(val profileLabel: String) : Content()
        data class RawCode(val code: String, val evidenceHex: String) : Content()
        data class UnconfirmedProfile(val profileLabel: String) : Content()
    }

    fun build(
        context: Context,
        content: Content = Content.ZeroConfirmedForProfile("MR-140"),
        onRead: () -> Unit = {}
    ): View {
        val d = UiComponents.dp(context, 16f)
        val root = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
            setPadding(d, d, d, d)
        }
        root.addView(TextView(context).apply {
            text = "Códigos de avería"
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.sectionTitleSp
            typeface = Typeface.DEFAULT_BOLD
        })

        when (content) {
            is Content.ZeroConfirmedForProfile -> {
                root.addView(TextView(context).apply {
                    text = "${content.profileLabel} · lectura solo"
                    setTextColor(UiTokens.success)
                    textSize = UiTokens.captionSp
                    setPadding(0, 0, 0, d)
                })
                root.addView(
                    UiComponents.emptyState(
                        context,
                        "No se detectaron códigos",
                        "Respuesta compatible con cero DTC para este perfil solo si hay captura confirmada. No aplicar a ZF/HV-240 sin evidencia."
                    )
                )
            }
            is Content.RawCode -> {
                root.addView(TextView(context).apply {
                    text = "Lectura solo · sin estados Presente/Histórico inventados"
                    setTextColor(UiTokens.textSecondary)
                    textSize = UiTokens.captionSp
                    setPadding(0, 0, 0, d)
                })
                val card = LinearLayout(context).apply {
                    orientation = LinearLayout.VERTICAL
                    background = UiComponents.roundedSurface(context)
                    setPadding(d, d, d, d)
                }
                card.addView(TextView(context).apply {
                    text = content.code
                    setTextColor(UiTokens.textPrimary)
                    textSize = 20f
                    typeface = Typeface.MONOSPACE
                })
                card.addView(TextView(context).apply {
                    text = "Sin descripción confirmada"
                    setTextColor(UiTokens.textSecondary)
                    textSize = UiTokens.bodySp
                    setPadding(0, UiComponents.dp(context, 6f), 0, 0)
                })
                card.addView(TextView(context).apply {
                    text = "Evidencia (bytes): ${content.evidenceHex}"
                    setTextColor(UiTokens.accent)
                    typeface = Typeface.MONOSPACE
                    textSize = 11f
                    setPadding(0, UiComponents.dp(context, 8f), 0, 0)
                })
                root.addView(card)
            }
            is Content.UnconfirmedProfile -> {
                root.addView(TextView(context).apply {
                    text = "${content.profileLabel} · resultado no confirmado"
                    setTextColor(UiTokens.warning)
                    textSize = UiTokens.captionSp
                    setPadding(0, 0, 0, d)
                })
                root.addView(
                    UiComponents.emptyState(
                        context,
                        "Resultado no confirmado para este perfil",
                        "Mostrar respuesta bruta o este mensaje. No presentar «0 códigos» sin captura del perfil."
                    )
                )
            }
        }

        val read = UiComponents.primaryButton(context, "Leer DTC")
        read.setOnClickListener { onRead() }
        root.addView(read, LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        ).apply { topMargin = d })

        // Borrar no habilitado — no hay clear DTC seguro en MainActivity revisado
        root.addView(
            UiComponents.secondaryButton(context, "Borrar DTC · no habilitado", enabled = false),
            LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
            ).apply { topMargin = UiComponents.dp(context, 8f) }
        )
        return root
    }
}
