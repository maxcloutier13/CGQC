// --- preInit ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing

// CGQC Variables ===================================================================================================
// *** Init **********************
cgqc_preInit_done = false;
cgqc_postInitClient_done = false;
cgqc_postInitServer_done = false;
cgqc_2023_preInit_done = false;
cgqc_intro_running = false;
cgqc_intro_done = false;
cgqc_intro_skipped = false;
cgqc_welcome_message = "";
cgqc_welcome_done = false;
cgqc_welcome_pic = "";
cgqc_mk3_transition = false;
cgqc_player_loadAll = true;
// *** Player **********************
cgqc_player_known = true;
cgqc_player_face = "";
cgqc_player_patch = "";
cgqc_player_patch_found = false;
cgqc_custom_playername = "";
cgqc_player_crate = false;
cgqc_player_rank = 0;
cgqc_player_rank_name = "";
cgqc_player_rank_found = false;
cgqc_player_rank_unknown = false;
cgqc_player_role = "";
cgqc_player_beret = "";
cgqc_player_beret_name = "";
cgqc_player_role = "";
cgqc_player_chill = false;
cgqc_player_oldNvg = "";
cgqc_player_oldFace = "";
cgqc_player_slinged_helmet = "";
cgqc_player_max = false;
cgqc_player_23rd = false;
cgqc_roleSwitch_done = true;
cgqc_camoSwitch_done = true;
// *** DLC stuff *******************
cgqc_player_ownedDLCs = [];
cgqc_player_hasAceMedical = false;
cgqc_player_hasContact = false;
cgqc_player_hasAntiPlus = false;
cgqc_player_hasRHS = false;
cgqc_player_hasDrongoFactions = false;
cgqc_player_has23rd = false;
cgqc_player_has2023 = false;
cgqc_player_hasIfa3 = false; 
cgqc_player_hasScandinavia = false;
cgqc_player_hasUnsung = false;
cgqc_player_isModern = false;
cgqc_player_isWw2 = false;
cgqc_player_isVietnam = false;
// *** Perks **********************
cgqc_perks_basic = false;
cgqc_perks_recon = false;
cgqc_perks_diver = false;
cgqc_perks_diver_suit_on = false;
cgqc_perks_para = false;
cgqc_perks_pilot = false;
cgqc_perks_driver = false;
cgqc_perks_pilot_hasCrew = false;
cgqc_perks_driver_hasDriver = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;
cgqc_perks_silence = false;
cgqc_config_fortify_list = [];
cgqc_perks_chem_green = 10;
cgqc_perks_chem_ir = 10;
cgqc_perks_chem_orange = 10;
// Advanced perks 
cgqc_perks_ghillie_isOn = false;
cgqc_perks_ghillie_uniform = "";
cgqc_perk_player_stash_on = false;
cgqc_player_stash_items = [];
cgqc_player_stash_mags = [];
// Zeus perks
cgqc_zeus_crate = false;
cgqc_zeus_cargo = false;
cgqc_zeus_briefing = false;
cgqc_zeus_briefingCmd = false;
cgqc_zeus_mapRestricted = false;
cgqc_zeus_mapRestricted_count = 0;
cgqc_zeus_mapRestricted_txt = "";
cgqc_zeus_mapRestricted_txt_on = false;
// PAX System 
cgqc_pax_prep = false;

// Training stuff 
cgqc_training_mode = false;
cgqc_sniping = false;
cgqc_spawn = false;
cgqc_spawn_vic = "";
// Orientation
cgqc_training_orienteering = false;
cgqc_orienteering_timer = 0;
cgqc_orient_opt_patrols = false;
cgqc_orient_opt_snipers = false;
cgqc_orient_won = false;
cgqc_orient_target_list = [];
// Defense 
cgqc_defense_timer = 0;
cgqc_training_defense = false;
cgqc_defense_done = false;
cgqc_defense_start = false;
// Helicopter training
cgqc_training_heli = false;
// Mortar training 
cgqc_training_mortar = false;
// KOTH training 
cgqc_training_koth = false; 
cgqc_training_koth_towers_count = 1;
cgqc_training_koth_towers = [];
cgqc_training_koth_difficulty = 1;
cgqc_training_koth_list = [];

// CQB house training stuff
cgqc_cqb_list = [];
cgqc_cqb_list_moving = [];
cgqc_cqb_list_static = [];
cgqc_cqb_list_civ = [];
cgqc_cqb_on = false;
cgqc_cqb_target_nbr = 10;
cgqc_cqb_move = 0;
cgqc_cqb_timer = 0;
cgqc_cqb_timer_random = false; 
cgqc_cqb_civ = false;
cgqc_cqb_nade = false;
cgqc_cqb_tgt_move = 0;
cgqc_cqb_tgt_static = 0;
cgqc_cqb_hostile_class = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F"];
cgqc_cqb_civ_class = ["C_journalist_F", "C_Journalist_01_War_F"];
// *** Mk2 **********************
cgqc_mk2_arsenal_init_done = false;
cgqc_mk2_arsenal_locked = true;
cgqc_mk2_animation_locked = false;
cgqc_mk2_punch_locked = false;
cgqc_mk2_arsenal_ctr = 0;
// *** Mk3 **********************
cgqc_mk3_switching_vest = false;
cgqc_mk3_switching_backpack = false;
// *** Unsung **********************
cgqc_unsung_arsenal_init_done = false;
cgqc_unsung_blufor = ["UNSUNG_W","UNSUNG_ROK","UNSUNG_AUS","UNSUNG_NZ"];
// *** IFA3 **********************
cgqc_ifa3_arsenal_init_done = false;
cgqc_ifa3_blufor = ["LIB_DAK", "LIB_FSJ", "LIB_WEHRMACHT", "LIB_WEHRMACHT_w", "SG_STURM"];
// *** Scandinavia **********************
cgqc_scandinavia_arsenal_init_done = false;
cgqc_scandinavia_blufor = ["NORTH_FIN", "NORTH_NOR","LIB_US_ARMY_w", "LIB_UK_ARMY_w", "LIB_UK_AB_w"];
// *** Refueling *****************
cgqc_flag_supply = false;
cgqc_flag_supply_rapide = false;
// *** Unconscious sounds *****************
cgqc_unconscious_sounds = [];
// *** MapSharing default value (instead of 7) *****************
jibrm_restrictmarkers_shareDistance = 10;

// Check what DLC the player owns 
cgqc_player_ownedDLCs = getDLCs 1;
cgqc_player_hasAceMedical = isClass(configFile >> "cfgPatches" >> "ace_medical_treatment");
cgqc_player_hasAntiPlus = isClass(configFile >> "cfgPatches" >> "A3A_Events");
cgqc_player_hasContact = (1021790 in cgqc_player_ownedDLCs);
cgqc_player_has23rd = isClass(configFile >> "cfgPatches" >> "23rd_Logo_core");
cgqc_player_hasRHS = isClass(configFile >> "cfgPatches" >> "rhsusf_weapons"); 
cgqc_player_hasDrongoFactions = isClass(configFile >> "cfgPatches" >> "DSF_ABUS");
cgqc_player_has2023 = isClass(configFile >> "cfgPatches" >> "CGQC_2022"); // Returns true if 2023 is enabled
cgqc_player_hasScandinavia = isClass(configFile >> "cfgPatches" >> "NORTH_Main"); 
cgqc_player_hasIfa3 = isClass(configFile >> "cfgPatches" >> "WW2_Core_c_IF_Data_c");
cgqc_player_hasUnsung =  isClass(configFile >> "cfgPatches" >> "uns_base");
// Eras
if (cgqc_player_hasIfa3) then {cgqc_player_isWw2 = true;}; // WW2
if (cgqc_player_hasScandinavia) then {cgqc_player_isWw2 = true;}; // WW2
if (cgqc_player_hasUnsung) then {cgqc_player_isVietnam = true;}; // Vietnam 
if (!cgqc_player_isVietnam && !cgqc_player_isWw2) then {
	cgqc_player_isModern = true;
};
//For specific modes of games, skip some options
if (cgqc_player_hasAntiPlus) then {
	cgqc_player_loadAll = false;
};

// Acre default radio 
if (cgqc_player_hasUnsung) then {
	// Weird radio for Vietnam use
	["ACRE_SEM52SL"] call acre_api_fnc_setItemRadioReplacement;
}else{
	// Default modern radio = 152
	["ACRE_PRC152"] call acre_api_fnc_setItemRadioReplacement;
};


// Addon Options ===================================================================================================
_menu_name = "CGQC";

//Wind changer event 
["cgqc_change_fucking_wind", {
	params ["_type"];
	hint format ["Event wind: %1", _type];
	[_type] execVM "\cgqc\functions\fnc_training.sqf";
}] call CBA_fnc_addEventHandler;

//Intro Stuff
["cgqc_config_showIntro", "CHECKBOX", ["Show Original Intro", "Montre le popup avec logo en début de mission"], 
    [_menu_name, "Description et Intro"], true] call CBA_fnc_addSetting;
cgqc_config_author = getMissionConfigValue "author";
cgqc_config_mission_name = getMissionConfigValue "onLoadName"; 
/*
["cgqc_config_author", "EDITBOX", ["Auteur:", "Le nom du créateur de la map, pour display dans l'intro"], 
    [_menu_name, "Intro"], "Cpl. Quelque chose"] call CBA_fnc_addSetting;
["cgqc_config_mission_name", "EDITBOX", ["Nom de la mission:", "Le nom du ta mission, pour display dans l'intro"], 
    [_menu_name, "Intro"], "Le nom de ta mission"] call CBA_fnc_addSetting;
*/
// Options skippables ===================================================================================================
["cgqc_setting_show_transition", "CHECKBOX", ["Show Transition", "Transition lors d'un loadout swtich "], 
    [_menu_name, "Skip"], true] call CBA_fnc_addSetting;
["cgqc_setting_show_welcome", "CHECKBOX", ["Show Msg de Bienvenue", "Message de bienvenue avec la patch si dispo"], 
    [_menu_name, "Skip"], true] call CBA_fnc_addSetting;
// Channels =================================================================================================
//["cgqc_config_hide_channels", "CHECKBOX",["Lock Channels (pour le map sharing)", "Cache les channels global/side/group pour utiliser plutôt le mod pour partager la map"], 
//   [_menu_name, "Radios"], false] call CBA_fnc_addSetting;

// Map Sharing =================================================================================================
["cgqc_zeus_mapRestricted", "CHECKBOX",["Restrict map sharing", "Empêche les markeurs magiques"], 
   [_menu_name, "Map Sharing"], false, 1, {jib_restrictmarkers_enabled = cgqc_zeus_mapRestricted;publicVariable "jib_restrictmarkers_enabled";}, false] call CBA_fnc_addSetting;

// Spares =================================================================================================
["cgqc_config_spares", "CHECKBOX",["Add spares to Vehicles", "Inclus un can de fuel + ammo + tracks/tires"], 
[_menu_name, "Spares in Vehicles"], true] call CBA_fnc_addSetting;
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
    [_menu_name, "Radios"], "Inter/Zeus"] call CBA_fnc_addSetting;

// Briefing  ===============================================================================================
["cgqc_setting_briefingCmd_area","SLIDER", ["Commander's Briefing area size", "Square around the Zeus"],
[_menu_name, "Briefing"], [5, 50, 10, 0]] call CBA_fnc_addSetting;
["cgqc_setting_briefing_area","SLIDER", ["General Briefing area size", "Square around the Zeus"],
[_menu_name, "Briefing"], [5, 100, 20, 0]] call CBA_fnc_addSetting;

// Maximum mags ===============================================================================================
["cgqc_setting_limitMags", "CHECKBOX", ["Limite Mags dans l'arsenal", "Limite le nombre de magazines par soldat"], 
    [_menu_name, "Limitations"], true] call CBA_fnc_addSetting;
["cgqc_setting_limitMags_max","SLIDER", ["Maximum 5.56", "Combien de mags 5.56 maximum?"],
    [_menu_name, "Limitations"], [6, 18, 6, 0]] call CBA_fnc_addSetting;
["cgqc_mk2_arsenal_locked", "CHECKBOX", ["Lock mk2 arsenal?", "Limite les rôles et l'arsenal selon les rangs"], 
    [_menu_name, "Limitations"], true] call CBA_fnc_addSetting;
["cgqc_mk2_animation_locked", "CHECKBOX", ["Lock Player animations?", "Limite l'accès des joueurs aux animations/emotes"], 
    [_menu_name, "Limitations"], false, 1, {["animation_setting"] spawn CGQC_fnc_perksZeus}, false] call CBA_fnc_addSetting;
// Training ===============================================================================================
["cgqc_flag_isTraining", "CHECKBOX", ["Training setup?", "Utilise un setup simplifié de radios pour la map de training"], 
    [_menu_name, "Training"], false] call CBA_fnc_addSetting;

// Fortify twavle
["cgqc_config_fortify", "CHECKBOX", ["Custom ACE Fortify", "Les items que l'outil fortify permet de construire"], 
    [_menu_name, "Fortify"], true
] call CBA_fnc_addSetting;
// Item list
["cgqc_config_fortify_1", "EDITBOX", ["Item 1:", "Item 1"], 
    [_menu_name, "Fortify"],"Land_BagFence_Short_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_2", "EDITBOX", ["Item 2:", "Item 2"], 
    [_menu_name, "Fortify"],"Land_BagFence_Long_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_3", "EDITBOX", ["Item 3:", "Item 3"], 
    [_menu_name, "Fortify"],"Land_BagFence_Round_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_4", "EDITBOX", ["Item 4:", "Item 4"], 
    [_menu_name, "Fortify"],"Land_Plank_01_4m_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_5", "EDITBOX", ["Item 5:", "Item 5"], 
    [_menu_name, "Fortify"],"Land_Plank_01_8m_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_6", "EDITBOX", ["Item 6:", "Item 6"], 
    [_menu_name, "Fortify"],"Land_CamoNetVar_NATO"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_7", "EDITBOX", ["Item 7:", "Item 7"], 
    [_menu_name, "Fortify"],"Land_fortified_nest_small_EP1"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_8", "EDITBOX", ["Item 8:", "Item 8"], 
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;
["cgqc_config_fortify_9", "EDITBOX", ["Item 9:", "Item 9"], 
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;
["cgqc_config_fortify_10", "EDITBOX", ["Item 10:", "Item 10"], 
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;

// Player custom Options ===================================================================================================
// Check that 2023 is not present 
if (!cgqc_player_has2023) then {
_menu_name = "CGQC Player settings";
	["cgqc_config_sidearm", "CHECKBOX", ["Custom Sidearm", "À vos risques et périls. Assurez vous d'avoir une classe valide"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], false] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_pistol", "EDITBOX", ["Pistolet", "Ton pistolet préféré"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], "cgqc_gun_p99_wood"] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_mag", "EDITBOX", ["Magazine", "Chargeur"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], "30Rnd_9x21_Mag"] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_mag_nbr","SLIDER", ["Nbr de Magazine", "Nombre de chargeurs de pistol"],
		[_menu_name, "Sidearm Perso (Vanilla)"], [2, 8, 2, 0]] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_acc", "EDITBOX", ["Laser/Flashlight", "Accessoire"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], ""] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_suppress", "EDITBOX", ["Silencieux", "Silencieux"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], "muzzle_snds_l"] call CBA_fnc_addSetting;
	["cgqc_config_sidearm_optic", "EDITBOX", ["Optique", "Optique"], 
		[_menu_name, "Sidearm Perso (Vanilla)"], ""] call CBA_fnc_addSetting;
};
// === Custom arsenal categories ===============================================================================
private _medical = [
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_epinephrine",
	"Empty_bloodIV_250",
	"Empty_bloodIV_500",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_splint",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"FSGm_ItemMedicBag",
	"FF_Painkiller",
	"ACE_adenosine",
	"ACE_bodyBag"
];

private _electronics = [
	"ACRE_PRC117F",
	"ACRE_PRC148",
	"ACRE_PRC152",
	"ACRE_PRC343",
	"ACRE_PRC77",
	"cgqc_radios_zeus",
	"ACE_ATragMX",
	"ACRE_BF888S",
	"ACE_Cellphone",
	"ACE_DAGR",
	"ACE_DeadManSwitch",
	"ACE_Kestrel4500",
	"ACE_M26_Clacker",
	"Ace_Clacker",
	"Ace_Microdagr",
	"MineDetector",
	"ACRE_SEM52SL",
	"ACRE_SEM70",
	"ACE_UAVBattery",
	"Laserbatteries",
	"ACRE_VHF30108SPIKE",
	"ACRE_VHF30108",
	"ACRE_VHF30108MAST",
	"ACE_Flashlight_KSF1",
	"ace_flashlight_xl50",
	"ACE_IR_Strobe_Item",
	"ACE_HuntIR_monitor",
	"ACE_Flashlight_MX991",
	"REV_pelican_item",
	"REV_darter_item",
	"REV_demine_item",
	"ItemAndroid",
	"ItemcTabHCam",
	"ItemcTab",
	"WBK_HeadLampItem"
];
[_medical, "Medical", "cgqc\textures\medical.paa", 0] call ace_arsenal_fnc_addRightPanelButton;
[_electronics, "Electronics", "cgqc\textures\electronics.paa", 1] call ace_arsenal_fnc_addRightPanelButton;

// === Sounds ===============================================================================
cgqc_unconscious_sounds = [
	"cgqc\sounds\scream_01.wav",
	"cgqc\sounds\scream_02.wav",
	"cgqc\sounds\scream_03.wav",
	"cgqc\sounds\scream_04.wav",
	"cgqc\sounds\scream_05.wav",
	"cgqc\sounds\scream_06.wav",
	"cgqc\sounds\scream_07.wav",
	"cgqc\sounds\scream_08.wav",
	"cgqc\sounds\scream_09.wav",
	"cgqc\sounds\scream_10.wav",
	"cgqc\sounds\scream_11.wav",
	"cgqc\sounds\scream_12.wav",
	"cgqc\sounds\scream_13.wav",
	"cgqc\sounds\scream_14.wav",
	"cgqc\sounds\scream_15.wav",
	"cgqc\sounds\scream_16.wav"
];

// Loading dialogs
_vehDialog = [] spawn compile PreprocessFileLineNumbers "\cgqc\dialogs\dia_vic_fnc.sqf";
waitUntil {scriptDone _vehDialog};

// PAX Units definitions
#include "\cgqc\cfg_paxUnits.hpp"

// **************************************************************************************************************
cgqc_preInit_done = true;