set_global_assignment -entity "pll_contador" -library "lib_pll_contador" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_contador" -library "lib_pll_contador" -name IP_TOOL_VERSION "15.0"
set_global_assignment -entity "pll_contador" -library "lib_pll_contador" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_contador" -name SPD_FILE [file join $::quartus(sip_path) "pll_contador.spd"]

set_global_assignment -library "lib_pll_contador" -name MISC_FILE [file join $::quartus(sip_path) "pll_contador_sim/pll_contador.vo"]
