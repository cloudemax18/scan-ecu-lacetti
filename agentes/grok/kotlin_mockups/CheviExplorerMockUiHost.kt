package com.cheviexplorer.android.ui.mock

import android.app.Activity
import android.os.Bundle
import android.widget.FrameLayout
import android.widget.HorizontalScrollView
import android.widget.LinearLayout
import android.widget.TextView
import com.cheviexplorer.android.ui.mock.screens.ActuatorsScreen
import com.cheviexplorer.android.ui.mock.screens.ConnectionScreen
import com.cheviexplorer.android.ui.mock.screens.DtcScreen
import com.cheviexplorer.android.ui.mock.screens.HomeScreen
import com.cheviexplorer.android.ui.mock.screens.LabScreen
import com.cheviexplorer.android.ui.mock.screens.LiveDataScreen

/**
 * Host de previsualización de mockups (referencia).
 * NO registrar en el manifiesto de producción sin revisión.
 * NO conecta USB/KWP — solo infla layouts de diseño.
 *
 * Uso típico en depuración: Activity temporal o fragmento que
 * llama a [show] con el id de sección.
 */
class CheviExplorerMockUiHost : Activity() {

    private lateinit var host: FrameLayout

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(UiTokens.pageBackground)
        }
        root.addView(buildTabBar())
        host = FrameLayout(this)
        root.addView(host, LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            0,
            1f
        ))
        setContentView(root)
        show("home")
    }

    private fun buildTabBar(): HorizontalScrollView {
        val scroll = HorizontalScrollView(this)
        val row = LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            setPadding(8, 12, 8, 12)
        }
        listOf(
            "home" to "Inicio",
            "conn" to "Conexión",
            "dtc" to "DTC",
            "live" to "En vivo",
            "lab" to "Lab",
            "act" to "Actuadores",
            "act_zf" to "ZF vacío"
        ).forEach { (id, label) ->
            row.addView(TextView(this).apply {
                text = label
                setTextColor(UiTokens.accent)
                setPadding(20, 16, 20, 16)
                setOnClickListener { show(id) }
            })
        }
        scroll.addView(row)
        return scroll
    }

    fun show(id: String) {
        val view = when (id) {
            "conn" -> ConnectionScreen.build(this)
            "dtc" -> DtcScreen.build(this)
            "live" -> LiveDataScreen.build(this)
            "lab" -> LabScreen.build(this)
            "act" -> ActuatorsScreen.build(this, ActuatorsScreen.Mode.Mr140)
            "act_zf" -> ActuatorsScreen.build(this, ActuatorsScreen.Mode.ZfOrHvBlocked)
            else -> HomeScreen.build(this)
        }
        host.removeAllViews()
        host.addView(view)
    }
}
