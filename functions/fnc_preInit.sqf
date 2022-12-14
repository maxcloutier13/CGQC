// --- preInit ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing

// CGQC Variables ===================================================================================================
// *** Init **********************
cgqc_preInit_done = false;
cgqc_postInitClient_done = false;
cgqc_postInitServer_done = false;
// *** Player **********************
cgqc_player_known = true;
cgqc_player_patch = "";
cgqc_player_patch_found = false;
cgqc_player_rank = 1;
cgqc_player_rank_name = "";
cgqc_player_rank_found = false;
// *** Perks **********************
cgqc_perks_basic = false;
cgqc_perks_recon = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;
// Advanced perks 
cgqc_perks_ghillie_isOn = false;
cgqc_perks_ghillie_uniform = "";
cgqc_perk_player_stash_on = false;
// Zeus perks
cgqc_zeus_crate = false;
cgqc_zeus_cargo = false;
// *** Mk2 **********************
cgqc_mk2_arsenal_init_done = false;
cgqc_mk2_arsenal_locked = true;
// *** Refueling *****************
cgqc_flag_supply = false;
cgqc_flag_supply_rapide = false;







// Addon Options ===================================================================================================
_menu_name = "CGQC";
//_menu_name = "AA_CGQC";
//Intro Stuff
["cgqc_config_showIntro", "CHECKBOX", ["Show Original Intro", "Montre le popup avec logo en début de mission"], 
    [_menu_name, "Intro"], true] call CBA_fnc_addSetting;
["cgqc_config_author", "EDITBOX", ["Auteur:", "Le nom du créateur de la map, pour display dans l'intro"], 
    [_menu_name, "Intro"], "Cpl. Quelque chose"] call CBA_fnc_addSetting;
["cgqc_config_mission_name", "EDITBOX", ["Nom de la mission:", "Le nom du ta mission, pour display dans l'intro"], 
    [_menu_name, "Intro"], "Le nom de ta mission"] call CBA_fnc_addSetting;
// Options skippables ===================================================================================================
["cgqc_setting_show_transition", "CHECKBOX", ["Show Transition", "Transition lors d'un loadout swtich "], 
    [_menu_name, "Skip"], true] call CBA_fnc_addSetting;
["cgqc_setting_show_welcome", "CHECKBOX", ["Show Msg de Bienvenue", "Message de bienvenue avec la patch si dispo"], 
    [_menu_name, "Skip"], true] call CBA_fnc_addSetting;
// Channels =================================================================================================
["cgqc_config_hide_channels", "CHECKBOX",["Lock Channels (pour le map sharing)", "Cache les channels global/side/group pour utiliser plutôt le mod pour partager la map"], 
    [_menu_name, "Radios"], false] call CBA_fnc_addSetting;
// Radio stuff ==============================================================================================
["cgqc_config_DefaultRadios", "CHECKBOX", ["Radios CGQC", "Utilise les noms de channels CGQC par défaut"], 
    [_menu_name, "Radios"], true] call CBA_fnc_addSetting;
["cgqc_config_ch1", "EDITBOX", ["Channel 1:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Spartan/HQ"] call CBA_fnc_addSetting;
["cgqc_config_ch2", "EDITBOX", ["Channel 2:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Griffon/HQ"] call CBA_fnc_addSetting;
["cgqc_config_ch3", "EDITBOX", ["Channel 3:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Centaure/HQ"] call CBA_fnc_addSetting;
["cgqc_config_ch4", "EDITBOX", ["Channel 4:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"],  "Inter/Spartan"] call CBA_fnc_addSetting;
["cgqc_config_ch5", "EDITBOX", ["Channel 5:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Inter/Griffon"] call CBA_fnc_addSetting;
["cgqc_config_ch6", "EDITBOX", ["Channel 6:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Inter/Centaure"] call CBA_fnc_addSetting;
["cgqc_config_ch7", "EDITBOX", ["Channel 7:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Inter/Recon"] call CBA_fnc_addSetting;
["cgqc_config_ch8", "EDITBOX", ["Channel 8:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Libre"] call CBA_fnc_addSetting;
["cgqc_config_ch9", "EDITBOX", ["Channel 9:", "Nom affiché dans le jeux"], 
    [_menu_name, "Radios"], "Libre"] call CBA_fnc_addSetting;

// Maximum mags ===============================================================================================
["cgqc_setting_limitMags", "CHECKBOX", ["Limite Mags dans l'arsenal", "Limite le nombre de magazines par soldat"], 
    [_menu_name, "Limit Mags and Mk2 Lock"], true] call CBA_fnc_addSetting;
["cgqc_setting_limitMags_max","SLIDER", ["Maximum 5.56", "Combien de mags 5.56 maximum?"],
    [_menu_name, "Limit Mags and Mk2 Lock"], [6, 18, 6, 0]] call CBA_fnc_addSetting;
["cgqc_mk2_arsenal_locked", "CHECKBOX", ["Lock mk2 arsenal?", "Limite les rôles et l'arsenal selon les rangs"], 
    [_menu_name, "Limit Mags and Mk2 Lock"], true] call CBA_fnc_addSetting;
// Training ===============================================================================================
["cgqc_flag_isTraining", "CHECKBOX", ["Training setup?", "Utilise un setup simplifié de radios pour la map de training"], 
    [_menu_name, "Training"], false] call CBA_fnc_addSetting;

/*
["cgqc_setting_limit_ranks", "CHECKBOX",
    ["Loadout limités aux rangs", "Limite l'inventaire mk2 selon le rang"], 
    [_menu_name, "Limit Mags"], 
    true
] call CBA_fnc_addSetting;


["cgqc_config_fortify", "EDITBOX",
    ["Fortify:", "Les items que l'outil fortify permet de construire"], 
    [_menu_name, "Divers"], 
    "Land_BagFence_Short_F, Land_BagFence_Long_F, Land_BagFence_Round_F, Land_Plank_01_4m_F, Land_Plank_01_8m_F, Land_fortified_nest_small_EP1, Land_CamoNetVar_NATO"
] call CBA_fnc_addSetting;

["cgqc_setting_limitMags_always", "CHECKBOX",
    ["Limite Mags en tout temps", "Limite le nombre de magazines par soldat"], 
    [_menu_name, "Loadouts"], 
    false
] call CBA_fnc_addSetting;
*/

cgqc_preInit_done = true;