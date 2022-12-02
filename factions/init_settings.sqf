["cgqc_config_test", "CHECKBOX", 
    ["T'aimes les chiens?", "?"], 
    "CGQC", 
    false
] call CBA_fnc_addSetting;

["cgqc_config_DefaultRadios", "CHECKBOX",
    ["Radios CGQC", "Utilise les noms de channels CGQC par défaut"], 
    ["CGQC", "Settings de Mission"], 
    true
] call CBA_fnc_addSetting;

["cgqc_config_showIntro", "CHECKBOX", 
    ["Show Intro", "Montre le popup avec logo en début de mission"], 
    ["CGQC", "Settings de Mission"],  
    true
] call CBA_fnc_addSetting;

// Maximum mags
["cgqc_setting_limitMags","SLIDER",
    ["Maximum Mags", "Limite le nombre de magazines par soldat"],
    ["CGQC", "Settings de Mission"], 
    [6, 22, 8, 0]
] call CBA_fnc_addSetting;

