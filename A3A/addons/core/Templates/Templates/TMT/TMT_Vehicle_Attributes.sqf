["attributesVehicles", [

    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    ["TMT_Landrover_w_AA", ["cost", 70]],

    // Mrap weak gun but takes alot of dmg
    ["TMT_KirpiII_MRAP_W", ["cost", 75], ["threat", 50]],
    ["TMT_Kirpi_MRAP_RCWS_W", ["cost", 75], ["threat", 50]],

    // Attack helis
    ["TMT_S70B", ["cost", 100]],         
    ["TMT_AH1W", ["cost", 200]],              
    ["TMT_AH1W_HIRSS", ["cost", 250]],              
    ["TMT_AH1W_DZKK_HIRSS", ["cost", 250]]

]] call _fnc_saveToTemplate;
