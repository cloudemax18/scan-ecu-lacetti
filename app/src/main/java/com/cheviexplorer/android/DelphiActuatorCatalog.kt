package com.cheviexplorer.android

/** Actuadores expuestos por el menú DriverIM del ejecutable Delphi para selector ECU 0x12 (MR-140). */
internal data class DelphiActuator(
    val label: String,
    val localId: Int,
    /** Para el ID 0x32, el EXE selecciona un inyector/cilindro con este índice de combo 0..3. */
    val injectorIndex: Int? = null
)

internal object DelphiActuatorCatalog {
    val mr140: List<DelphiActuator> = listOf(
        DelphiActuator("Prueba inyector 1", 0x32, 0),
        DelphiActuator("Prueba inyector 2", 0x32, 1),
        DelphiActuator("Prueba inyector 3", 0x32, 2),
        DelphiActuator("Prueba inyector 4", 0x32, 3),
        DelphiActuator("Relé del aire acondicionado", 0x15),
        DelphiActuator("Relé ventilador · baja velocidad", 0x13),
        DelphiActuator("Relé ventilador · alta velocidad", 0x14),
        DelphiActuator("Lámpara de avería (MIL)", 0x10),
        DelphiActuator("Relé de bomba de combustible", 0x12),
        DelphiActuator("Lazo de retroalimentación de combustible", 0x37),
        DelphiActuator("Prueba regulador de ralentí", 0x18),
        DelphiActuator("Calentador de sonda lambda", 0x40)
    )
}
