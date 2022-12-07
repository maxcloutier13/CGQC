_menu_name = "CGQC";
//_menu_name = "AA_CGQC";

//Intro Stuff
["cgqc_config_author", "EDITBOX",
    ["Auteur:", "Le nom du créateur de la map, pour display dans l'intro"], 
    [_menu_name, "Intro"], 
    "Cpl. Quelque chose"
] call CBA_fnc_addSetting;

["cgqc_config_mission_name", "EDITBOX",
    ["Nom de la mission:", "Le nom du ta mission, pour display dans l'intro"], 
    [_menu_name, "Intro"], 
    "Le nom de ta mission"
] call CBA_fnc_addSetting;

// Options skippables ===================================================================================================
["cgqc_config_showIntro", "CHECKBOX", 
    ["Show Intro", "Montre le popup avec logo en début de mission"], 
    [_menu_name, "Skip"],  
    true
] call CBA_fnc_addSetting;

["cgqc_setting_show_transition", "CHECKBOX",
    ["Show Transition", "Transition lors d'un loadout swtich "], 
    [_menu_name, "Skip"], 
    true
] call CBA_fnc_addSetting;

["cgqc_setting_show_welcome", "CHECKBOX",
    ["Show Msg de Bienvenue", "Message de bienvenue avec la patch si dispo"], 
    [_menu_name, "Skip"], 
    true
] call CBA_fnc_addSetting;

/*
["cgqc_config_fortify", "EDITBOX",
    ["Fortify:", "Les items que l'outil fortify permet de construire"], 
    [_menu_name, "Divers"], 
    "Land_BagFence_Short_F, Land_BagFence_Long_F, Land_BagFence_Round_F, Land_Plank_01_4m_F, Land_Plank_01_8m_F, Land_fortified_nest_small_EP1, Land_CamoNetVar_NATO"
] call CBA_fnc_addSetting;
*/

// Channels =================================================================================================
["cgqc_config_hide_channels", "CHECKBOX",
    ["Lock Channels (pour le map sharing)", "Cache les channels global/side/group pour utiliser plutôt le mod pour partager la map"], 
    [_menu_name, "Radios"], 
    true
] call CBA_fnc_addSetting;

// Radio stuff ==============================================================================================
["cgqc_config_DefaultRadios", "CHECKBOX",
    ["Radios CGQC", "Utilise les noms de channels CGQC par défaut"], 
    [_menu_name, "Radios"], 
    true
] call CBA_fnc_addSetting;

["cgqc_config_ch1", "EDITBOX",
    ["Channel 1:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Spartan/HQ"
] call CBA_fnc_addSetting;

["cgqc_config_ch2", "EDITBOX",
    ["Channel 2:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Griffon/HQ"
] call CBA_fnc_addSetting;

["cgqc_config_ch3", "EDITBOX",
    ["Channel 3:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Centaure/HQ"
] call CBA_fnc_addSetting;

["cgqc_config_ch4", "EDITBOX",
    ["Channel 4:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Inter/Spartan"
] call CBA_fnc_addSetting;

["cgqc_config_ch5", "EDITBOX",
    ["Channel 5:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Inter/Griffon"
] call CBA_fnc_addSetting;

["cgqc_config_ch6", "EDITBOX",
    ["Channel 6:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Inter/Centaure"
] call CBA_fnc_addSetting;

["cgqc_config_ch7", "EDITBOX",
    ["Channel 7:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], 
    "Inter/Recon"
] call CBA_fnc_addSetting;

// Maximum mags ===============================================================================================
["cgqc_setting_limitMags", "CHECKBOX",
    ["Limite Mags dans l'arsenal", "Limite le nombre de magazines par soldat"], 
    [_menu_name, "Loadouts"], 
    true
] call CBA_fnc_addSetting;

/*
["cgqc_setting_limitMags_always", "CHECKBOX",
    ["Limite Mags en tout temps", "Limite le nombre de magazines par soldat"], 
    [_menu_name, "Loadouts"], 
    false
] call CBA_fnc_addSetting;
*/

["cgqc_setting_limitMags_max","SLIDER",
    ["Maximum 5.56", "Combien de mags 5.56 maximum?"],
    [_menu_name, "Loadouts"], 
    [6, 18, 6, 0]
] call CBA_fnc_addSetting;

["cgqc_setting_limit_ranks", "CHECKBOX",
    ["Loadout limités aux rangs", "Limite l'inventaire mk2 selon le rang"], 
    [_menu_name, "Limit Mags"], 
    true
] call CBA_fnc_addSetting;