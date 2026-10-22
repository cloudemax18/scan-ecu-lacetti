package com.cheviexplorer.android.ui.mock

import android.content.Context
import android.content.res.ColorStateList
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

/**
 * Componentes reutilizables de referencia (Views).
 * No envían comandos KWP.
 */
object UiComponents {

    fun dp(context: Context, value: Float): Int =
        TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value,
            context.resources.displayMetrics
        ).toInt()

    fun roundedSurface(
        context: Context,
        fill: Int = UiTokens.surface,
        stroke: Int = UiTokens.border,
        radiusDp: Float = UiTokens.radiusCardDp
    ): GradientDrawable = GradientDrawable().apply {
        setColor(fill)
        cornerRadius = radiusDp * context.resources.displayMetrics.density
        setStroke(dp(context, 1f).coerceAtLeast(1), stroke)
    }

    fun statusBadge(
        context: Context,
        title: String,
        subtitle: String,
        /** port | ok | warn | err | off */
        kind: String
    ): LinearLayout {
        val dotColor = when (kind) {
            "ok" -> UiTokens.success
            "warn" -> UiTokens.warning
            "err" -> UiTokens.errorRed
            "off" -> UiTokens.textSecondary
            else -> UiTokens.accent // puerto / en curso — no confundir con KWP OK
        }
        val row = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            background = roundedSurface(context)
            setPadding(dp(context, 14f), dp(context, 12f), dp(context, 14f), dp(context, 12f))
            gravity = Gravity.CENTER_VERTICAL
        }
        val dot = View(context).apply {
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(dotColor)
            }
        }
        val textCol = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(context, 10f), 0, 0, 0)
        }
        textCol.addView(TextView(context).apply {
            text = title
            setTextColor(UiTokens.textPrimary)
            textSize = UiTokens.bodySp
            typeface = Typeface.DEFAULT_BOLD
        })
        textCol.addView(TextView(context).apply {
            text = subtitle
            setTextColor(UiTokens.textSecondary)
            textSize = UiTokens.captionSp
            setPadding(0, dp(context, 2f), 0, 0)
        })
        row.addView(dot, LinearLayout.LayoutParams(dp(context, 10f), dp(context, 10f)))
        row.addView(textCol, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        return row
    }

    fun primaryButton(context: Context, label: String, enabled: Boolean = true): Button =
        Button(context).apply {
            text = label
            isEnabled = enabled
            isAllCaps = false
            textSize = 15f
            setTextColor(UiTokens.textPrimary)
            backgroundTintList = ColorStateList.valueOf(
                if (enabled) UiTokens.accent else UiTokens.border
            )
            minimumHeight = dp(context, UiTokens.minTouchDp.toFloat())
        }

    fun secondaryButton(context: Context, label: String, enabled: Boolean = true): Button =
        Button(context).apply {
            text = label
            isEnabled = enabled
            isAllCaps = false
            textSize = 15f
            setTextColor(if (enabled) UiTokens.textPrimary else UiTokens.textSecondary)
            background = roundedSurface(context, UiTokens.surface, UiTokens.border, UiTokens.radiusButtonDp)
            minimumHeight = dp(context, UiTokens.minTouchDp.toFloat())
        }

    fun sectionLabel(context: Context, text: String): TextView =
        TextView(context).apply {
            this.text = text
            setTextColor(UiTokens.textSecondary)
            textSize = UiTokens.captionSp
            setPadding(0, 0, 0, dp(context, 6f))
        }

    fun emptyState(context: Context, title: String, body: String): LinearLayout {
        val box = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            background = roundedSurface(context)
            setPadding(dp(context, 24f), dp(context, 24f), dp(context, 24f), dp(context, 24f))
            gravity = Gravity.CENTER
        }
        box.addView(TextView(context).apply {
            text = title
            setTextColor(UiTokens.textPrimary)
            textSize = 16f
            typeface = Typeface.DEFAULT_BOLD
            gravity = Gravity.CENTER
        })
        box.addView(TextView(context).apply {
            text = body
            setTextColor(UiTokens.textSecondary)
            textSize = UiTokens.captionSp
            gravity = Gravity.CENTER
            setPadding(0, dp(context, 8f), 0, 0)
        })
        return box
    }

    fun warningNote(context: Context, message: String): TextView =
        TextView(context).apply {
            text = message
            setTextColor(UiTokens.warning)
            textSize = UiTokens.captionSp
            setPadding(dp(context, 12f), dp(context, 12f), dp(context, 12f), dp(context, 12f))
            background = GradientDrawable().apply {
                setColor(0x1FFF9500)
                cornerRadius = UiTokens.radiusButtonDp * context.resources.displayMetrics.density
                setStroke(dp(context, 1f), 0x59FF9500)
            }
        }

    fun dataRowHex(
        context: Context,
        idLabel: String,
        hex: String,
        meta: String
    ): LinearLayout {
        val card = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            background = roundedSurface(context)
            setPadding(dp(context, 14f), dp(context, 12f), dp(context, 14f), dp(context, 12f))
        }
        val top = LinearLayout(context).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }
        top.addView(TextView(context).apply {
            text = idLabel
            setTextColor(UiTokens.accent)
            typeface = Typeface.MONOSPACE
            textSize = 14f
        }, LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f))
        top.addView(TextView(context).apply {
            text = "Sin datos confirmados"
            setTextColor(UiTokens.warning)
            textSize = 10f
            setPadding(dp(context, 8f), dp(context, 3f), dp(context, 8f), dp(context, 3f))
            background = GradientDrawable().apply {
                setColor(0x2EFF9500)
                cornerRadius = 6f * context.resources.displayMetrics.density
            }
        })
        card.addView(top)
        card.addView(TextView(context).apply {
            text = hex
            setTextColor(UiTokens.textPrimary)
            typeface = Typeface.MONOSPACE
            textSize = UiTokens.monoSp
            setPadding(0, dp(context, 8f), 0, 0)
        })
        card.addView(TextView(context).apply {
            text = meta
            setTextColor(UiTokens.textSecondary)
            textSize = 11f
            setPadding(0, dp(context, 6f), 0, 0)
        })
        return card
    }
}
