package com.cheviexplorer.android.ui.mock

/**
 * Tokens visuales alineados a MainActivity.buildUi() (CONFIRMADO EN CÓDIGO).
 * errorRed es PROPUESTO — no existe como constante de producto hasta medir contraste.
 */
object UiTokens {
    const val pageBackground = 0xFF0C0C0E.toInt()
    const val surface = 0xFF17171B.toInt()
    const val accent = 0xFF007AFF.toInt()
    const val textPrimary = 0xFFFFFFFF.toInt()
    const val textSecondary = 0xFFA0A0AB.toInt()
    const val border = 0xFF2B2B32.toInt()

    /** Alineado a tint ON de actuadores en código. */
    const val success = 0xFF1E9E66.toInt()

    /** Alineado a tint OFF de actuadores en código. */
    const val warning = 0xFFFF9500.toInt()

    /** PROPUESTO — no declarar como valor ya usado en código. */
    const val errorRed = 0xFFFF3B30.toInt()

    const val titleSp = 22f
    const val sectionTitleSp = 18f
    const val bodySp = 14f
    const val captionSp = 12f
    const val monoSp = 12f

    /** Objetivo táctil mínimo (dp). */
    const val minTouchDp = 48

    const val radiusCardDp = 14f
    const val radiusButtonDp = 12f
    const val paddingScreenDp = 16
}
