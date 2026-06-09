["attributesVehicles", [

    // Weak AA vehicles. Leave threat because they're still dangerous in rebel hands
    ["AMF_VBMR_MISTRAL_CE", ["cost", 70]],

    // IFVs with bonus armour
    ["AMF_EBRC_CE_01", ["cost", 170]],

    // Tank destroyer strykers, not tough
    ["B_AMF_AMX10_RCR_01_F", ["cost", 120], ["threat", 150]],
    ["B_AMF_AMX10_RCR_SEPAR_01_F", ["cost", 130], ["threat", 160]],

    // Attack helis
    ["AMF_gazelle_minigun_f", ["cost", 70]],         // minigun door gunner
    ["AMF_TIGRE_01", ["cost", 250]]

]] call _fnc_saveToTemplate;
