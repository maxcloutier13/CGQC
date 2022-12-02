//Intro Stuff
["cgqc_config_showIntro", "CHECKBOX", 
    ["Show Intro", "Montre le popup avec logo en début de mission"], 
    ["CGQC", "Intro"],  
    true
] call CBA_fnc_addSetting;

["cgqc_config_author", "EDITBOX",
    ["Auteur:", "Le nom du créateur de la map, pour display dans l'intro"], 
    ["CGQC", "Intro"], 
    "Cpl. Quelque chose"
] call CBA_fnc_addSetting;

["cgqc_config_mission_name", "EDITBOX",
    ["Auteur:", "Le nom du créateur de la map, pour display dans l'intro"], 
    ["CGQC", "Intro"], 
    "Le nom de ta mission"
] call CBA_fnc_addSetting;

// Random ===================================================================================================
["cgqc_setting_skip_transition", "CHECKBOX",
    ["Transition", "Transition lors d'un loadout swtich "], 
    ["CGQC", "Divers"], 
    true
] call CBA_fnc_addSetting;

// Channels =================================================================================================
["cgqc_config_hide_channels", "CHECKBOX",
    ["Hide Channels", "Cache les channels global/side/group pour utiliser plutôt le mod pour partager la map"], 
    ["CGQC", "Radios"], 
    true
] call CBA_fnc_addSetting;

// Radio stuff ==============================================================================================
["cgqc_config_DefaultRadios", "CHECKBOX",
    ["Radios CGQC", "Utilise les noms de channels CGQC par défaut"], 
    ["CGQC", "Radios"], 
    true, true
] call CBA_fnc_addSetting;

["cgqc_config_ch1", "EDITBOX",
    ["Channel 1:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Spartan/HQ",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch2", "EDITBOX",
    ["Channel 2:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Griffon/HQ",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch3", "EDITBOX",
    ["Channel 3:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Centaure/HQ",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch4", "EDITBOX",
    ["Channel 4:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Inter/Spartan",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch5", "EDITBOX",
    ["Channel 5:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Inter/Griffon",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch6", "EDITBOX",
    ["Channel 6:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Inter/Centaure",
	true
] call CBA_fnc_addSetting;

["cgqc_config_ch7", "EDITBOX",
    ["Channel 7:", "Nom affiché dans le jeux"], 
    ["CGQC", "Radios"], 
    "Inter/Recon",
	true
] call CBA_fnc_addSetting;

// Maximum mags ===============================================================================================
["cgqc_setting_limitMags_on", "CHECKBOX",
    ["Limite les Mags", "Limite le nombre de magazines par soldat"], 
    ["CGQC", "Limit Mags"], 
    true
] call CBA_fnc_addSetting;

["cgqc_setting_limitMags","SLIDER",
    ["Maximum Mags/joueur", "Combien de mags maximum?"],
    ["CGQC", "Limit Mags"], 
    [6, 22, 8, 0]
] call CBA_fnc_addSetting;