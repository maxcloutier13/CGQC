// --- loadMk3Menu ----------------------------------------------------------
// Ace menu for mk3 sheeits
 params ["_crate_array", ["_type", "default"]];
//_crate = (_this select 0) select 0;
//_type = _this select 1;
_crate = _crate_array select 0;
diag_log format ["[CGQC_FNC] loadMk3Menu %1/%2 started", _crate, _type];

diag_log "[CGQC_FNC] loadMk3Menu - waiting for postInit to finish";
waitUntil {!isNil "cgqc_start_postInitClient_done"};
waitUntil {cgqc_start_postInitClient_done};
diag_log "[CGQC_FNC] loadMk3Menu - postInit finished!";
waitUntil{ !isNull (findDisplay 46) };
diag_log "[CGQC_FNC] loadMk3Menu - Checking for Interface";
if (hasInterface) then {
	diag_log "[CGQC_FNC] loadMk3Menu - hasInterface - loading menu";
	switch (_type) do {
		// Command ========================================================================
		case "para":{
			// Jumping uniform
			diag_log "[CGQC_FNC] loadMk3Menu - para menu";
			_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		case "dive":{
			// Diving uniform
			diag_log "[CGQC_FNC] loadMk3Menu - diving menu";
			_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		default	{ // Normal mk3 Arsenal
			if (cgqc_flag_isTraining) then {
				diag_log "[CGQC_FNC] loadMk3Menu - training mode: adding respawn point";
				// Respawn point in front of Arsenal
				cgqc_mk2_arsenal_ctr = cgqc_mk2_arsenal_ctr + 1;
				[west, getPosATL _crate, format["Arsenal West %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
				[east, getPosATL _crate, format["Arsenal East %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
				[independent, getPosATL _crate, format["Arsenal Independant %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
			};
			// Zeus Options
			_action = [ "menu_zeus_options", "Zeus Options", "", {hint 'Arsenal Options';}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Zeus lock toggle ===============================================================================================
			_action = [ "menu_zeus_lock", "Lock Arsenal by Rank", "", {hint 'Arsenal lock!'; cgqc_mk2_arsenal_locked = true; publicVariable "cgqc_mk2_arsenal_locked"}, {!cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus && !cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_unlock", "Unlock Arsenal. Ignore Rank", "", {hint 'Arsenal unlocked!'; cgqc_mk2_arsenal_locked = false; publicVariable "cgqc_mk2_arsenal_locked"}, {cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus && !cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;

			// Max Mags  ===============================================================================================
			_action = [ "menu_zeus_maxMags", "Max Mags", "", {hint 'Limit Maximum Mags'}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// on/off
			_action = [ "menu_zeus_maxMags_on", "Limit: ON", "", {cgqc_setting_limitMags = true; publicVariable "cgqc_setting_limitMags";hint "Mags Limited"}, {!cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_off", "Limit: OFF", "", {cgqc_setting_limitMags = false; publicVariable "cgqc_setting_limitMags";hint "Mags Unlimited"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Numbers
			_action = [ "menu_zeus_maxMags_6", "SetMax: 6", "", {cgqc_setting_limitMags_max = 6; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 6"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_8", "SetMax: 8", "", {cgqc_setting_limitMags_max = 8; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 8"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_12", "SetMax: 12", "", {cgqc_setting_limitMags_max = 12; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 12"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "15", "SetMax: 15", "", {cgqc_setting_limitMags_max = 15; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 15"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_maxMags_20", "SetMax: 20", "", {cgqc_setting_limitMags_max = 20; publicVariable "cgqc_setting_limitMags_max";hint "MaxMags: 20"}, {cgqc_setting_limitMags} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_zeus_options", "menu_zeus_maxMags" ], _action ] call ace_interact_menu_fnc_addActionToObject;


			// Flag that arsenal is unlocked or in training mode
			_normalTxt = format["--- Arsenal Normal: %1 ---", cgqc_player_rank_name];
			_action = [ "mode_training", _normalTxt, "", {""}, {!cgqc_flag_isTraining && cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

			_action = [ "mode_unlocked", "--- Arsenal is UNLOCKED ---", "", {""}, {!cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

			_action = [ "mode_training", "--- Arsenal in TRAINING MODE ---", "", {""}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

			if (!cgqc_player_has2023 && !cgqc_player_hasUnsung && !cgqc_player_hasIfa3) then {
				diag_log "[CGQC_FNC] loadMk3Menu - loading vanilla stuff";
				//waitUntil {sleep 1; cgqc_mk2_arsenal_init_done};
				// Vanilla ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_vanilla", "Vanilla", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_side isEqualTo WEST} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//  Loadout switcher
				_action = [ "menu_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//  Arsenal Complet
				_action = [ "menu_vanilla_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\vanilla\load_vanilla.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Infanterie ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_loadout_inf", "Infanterie", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Rifleman Carbine hk416
				_action = [ "menu_inf_RFcarbine", "Rifleman Carbine 416", "", {["vanilla_rifleman", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Lead ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_loadout_lead", "Commandement", "", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team Leader
				_action = [ "menu_loadout_inf_TL", "Team Leader", "", {["vanilla_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			};
			// Vietnam arsenal if Unsung is pressent ===============================================================================================
			if (cgqc_player_hasUnsung) then {
				diag_log "[CGQC_FNC] loadMk3Menu - loading unsung stuff";
				// Spawnmodule faction
				//cgqc_spawn_module setVariable ["VehicleFactions", "UNSUNG_W"];
				// Unsung ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_unsung", "Vietnam", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Unsung Arsenal Complet
				_action = [ "menu_unsung_complete", "Arsenal: Vietnam", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\unsung\load_unsung.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Unsung Loadout switcher ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_unsung_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Basic soldier
				// 1-0 - TL
				_action = [ "menu_unsung_10", "1-0 -Team Leader", "", {["unsung_10", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 1-1 - Radio man
				_action = [ "menu_unsung_11", "1-1 -Radio guy", "", {["unsung_11", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 1-2 - Medic
				_action = [ "menu_unsung_12", "1-2 -Medic", "", {["unsung_12", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			};
			// Mk2 Arsenal if 2023 mod is present  ===============================================================================================
			if (cgqc_player_has2023) then {
				diag_log "[CGQC_FNC] loadMk3Menu - loading 2023 stuff";
				// SWAT ***********************************************************************************
				_action = [ "menu_swat", "SWAT", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Loadout switcher ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_swat_roles", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Assaulter
				_action = [ "menu_swat_roles_mp5sd6", "Assaulter", "", {["swat_assaulter", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Breacher Shotgun
				_action = [ "menu_swat_roles_breach", "Breacher", "", {["swat_breacher", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Sniper
				_action = [ "menu_swat_roles_sniper", "Sniper", "", {["swat_sniper", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team leader
				_action = [ "menu_swat_roles_tl", "Team Leader", "", {["swat_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat", "menu_swat_roles"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Alternative Primaries ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_swat_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" ], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_p90", "p90", "", {["swat_p90"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_mp5", "MP5sd6", "", {["swat_mp5sd6"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_blk", ".300 Blackout", "", {["swat_blk"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_mp7", "MP7 AP", "", {["swat_mp7"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_socom", "Socom 16", "", {["swat_socom"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_swat_alt_m24", "M24", "", {["swat_m24"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_swat" , "menu_swat_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// 2023 ***********************************************************************************
				_action = [ "menu_2023", "2023", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Mk1 Loadout switcher ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2", "Loadouts/Rôles MK3", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Infanterie ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_inf", "Infanterie", "\cgqc\textures\cgqc_ace_rifle.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Rifleman mk18
				//_action = [ "menu_mk2_inf_RFCQB", "Rifleman CQB mk18", "", {["2023_rifle_cqb"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Rifleman M4
				_action = [ "menu_mk2_inf_RF", "Rifleman", "", {["2023_rifle_carb"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Rifleman M16
				//_action = [ "menu_mk2_inf_RF_m16", "Rifleman Rifle M16a4", "", {["2023_rifle_rifle"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Grenadier
				_action = [ "menu_mk2_inf_Grenadier", "Grenadier", "", {["2023_rifle_grenadier"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Junior specialists
				// Sharpshooter
				_action = [ "menu_mk2_inf_mrk", "Sharpshooter", "", {["2023_rifle_shoot"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Repair Engineer
				_action = [ "menu_mk2_inf_eng", "Combat Engineer", "", {["2023_rifle_eng"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Combat Lifesaver
				_action = [ "menu_mk2_inf_life", "Combat Lifesaver", "", {["2023_rifle_life"] call CGQC_fnc_switchRole;}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Specialists ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_spec", "Spécialistes", "\cgqc\textures\cgqc_ace_specialists", {""}, {player getVariable 'cgqc_player_rank' > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Medic
				_action = [ "menu_mk2_inf_medic", "Squad Medic", "", {["2023_medic"] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Engineer
				_action = [ "menu_mk2_inf_eng", "Engineer", "", {["2023_eng"] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Saboteur
				_action = [ "menu_mk2_inf_saboteur", "Saboteur", "", {["2023_eng_saboteur"] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Autorifleman
				_action = [ "menu_mk2_inf_auto", "AutoRifleman (m27 - 5.56)", "", {["2023_autorifle"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// MG (Light)
				_action = [ "menu_mk2_inf_LMG", "Light machinegun (mk46 - 5.56)", "", {["2023_lmg"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				//  MG (Heavy)
				_action = [ "menu_mk2_inf_HMG", "Heavy machinegun (mk48 - 7.62)", "", {["2023_hmg"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// LWMMG
				_action = [ "menu_mk2_inf_LWMMG", "LWMMG (.338)", "", {["2023_lwmmg"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Anti-Tank (MAAWS)
				_action = [ "menu_mk2_inf_maaws", "Anti-Tank (MAAWS)", "", {["2023_at_maaws"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Anti-Tank (Javelin)
				_action = [ "menu_mk2_inf_jav", "Anti-Tank (Javelin)", "", {["2023_at_javelin"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;


				// Recon ------------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_recon", "Recon", "\cgqc\textures\cgqc_ace_bino.paa", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Sniper m200
				_action = [ "menu_mk2_inf_snipe", "Sniper m200", "", {["2023_sniper"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Sniper m14 ebr
				_action = [ "menu_mk2_inf_snipe", "Sniper EBR", "", {["2023_sniper_ebr"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Spotter
				_action = [ "menu_mk2_inf_spotter", "Spotter", "", {["2023_spotter"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Drone Operator
				_action = [ "menu_mk2_inf_drone", "Drone Operator", "", {["2023_drone"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// JTAC
				_action = [ "menu_mk2_inf_jtac", "FAC/JTAC", "", {["2023_jtac"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;


				// Pilotes ------------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_pilots", "Griffon", "\cgqc\textures\cgqc_ace_heli.paa", {""}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Helicopter pilot
				_action = [ "menu_mk2_helipilot", "Helicopter pilot", "", {["2023_h_pilot"] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Helicopter crew
				_action = [ "menu_mk2_helicrew", "Helicopter crew", "", {["2023_h_crew"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;


				// Drivers ------------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_driver", "Centaure", "\cgqc\textures\icon_tank.paa", {}, {player getVariable 'cgqc_player_rank' > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Tank Driver
				_action = [ "menu_mk2_tank", "Tank driver", "", {["2023_t_driver"] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Tank Crew
				_action = [ "menu_mk2_crew", "Tank Crew", "", {["2023_t_crew"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;


				// Lead ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_lead", "Commandement", "\cgqc\textures\cgqc_ace_beret", {""}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team Leader
				_action = [ "menu_mk2_inf_TL", "Team Leader", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team Leader CQB
				//_action = [ "menu_mk2_inf_TLcqb", "Team Leader CQB", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Team Leader no GL
				//_action = [ "menu_mk2_inf_TLnoGL", "Team Leader no GL", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// SL
				_action = [ "menu_mk2_inf_sl", "Squad Leader", "", {["2023_sl"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_inf_xo", "Executive Officer/Sergent", "", {["2023_xo"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// HQ
				_action = [ "menu_mk2_inf_hq", "HQ (Static)", "", {["2023_hq"] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;

				/*
				// AR
				_action = [ "menu_mk2_inf_AR", "Auto-Rifleman", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Mortier léger
				_action = [ "menu_mk2_inf_mortar", "Mortier Léger", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;


				// Jet pilot
				//_action = [ "menu_mk2_inf_jet", "Jet pilot", "", {["2023_tl", 1, true] call CGQC_fnc_switchRole}, {player getVariable 'cgqc_player_rank' > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;

				*/





				// Mk1 Camo Switcher ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_camo", "Switch: Uniforme", "CGQC\textures\icon_camo", {""}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Base/Training uniform
				_action = [ "menu_mk2_camo_base", "Training - Vert", "", {["tan", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Desert uniform
				_action = [ "menu_mk2_camo_desert", "Desert", "", {["desert", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Multicam uniform
				_action = [ "menu_mk2_camo_multicam", "Multicam", "", {["mcam", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Woodland uniform
				_action = [ "menu_mk2_camo_woodland", "Cadpat", "", {["cadpat", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Black uniform
				_action = [ "menu_mk2_camo_black", "Black", "", {["black", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Winter uniform
				_action = [ "menu_mk2_camo_winter", "Winter", "", {["white", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Jumping uniform
				_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Diving uniform
				_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Alternative Primaries ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Categories
				_action = [ "menu_mk2_alt_cqb", "CQB 5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_carbine", "Carbine 5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_rifle", "Rifle 5.56", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_dmr", "DMR 7.62", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_sniper", "Sniper", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_mg", "MG", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_others", "Others", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Non-Lethal
				_action = [ "menu_mk2_alt_nonLethal", "Non-Lethal", "", {[] spawn CGQC_fnc_switchNonLethal}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// CQB
				_action = [ "menu_mk2_alt_mk18", "10in Mk18", "", {["mk18_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_mk18gl", "10in Mk18 GL", "", {["mk18_gl"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_416", "10in HK416", "", {["416_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_virtus", "11.5in Virtus", "", {["virtus_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_sr16", "11.5in SR16", "", {["sr16_dot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_ctar21", "15in CTAR-21", "", {["CTAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Carbines
				_action = [ "menu_mk2_alt_m4dot", "14in M4blkII ELCAN", "", {["m4_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m4lpvo", "14in M4blkII LPVO", "", {["m4_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m320", "14in M4blkII GL", "", {["m4_gl_m320"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_sr16dot", "14.5in SR16 ELCAN", "", {["sr16_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_sr16lpvo", "14.5in SR16 LPVO", "", {["sr16_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_416ELCAN", "14.5in HK416 ELCAN", "", {["sr16_elcan"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_416lpvo", "14.5in HK416 LPVO", "", {["sr16_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_ctar21", "18in CTAR-21 ", "", {["TAR21"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_ctar21gl", "18in GTAR-21 GL", "", {["TAR21GL"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Rifles
				_action = [ "menu_mk2_alt_m27", "16.5in M27 LPVO", "", {["m27_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_mk12", "18in Mk12 LPVO", "", {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m16lpvo", "20in M16a4 ShortDot", "", {["m16_shortdot"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// DMR 7.62
				_action = [ "menu_mk2_alt_m110k5", "14.5in M110k5", "", {["m110k5"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_socom", "16in SOCOM16", "", {["socom16"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m110", "20in M110", "", {["m110_leupold"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_417", "20in HK417", "", {["417"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_sig556", "20in SIG 556", "", {["sig556"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m14ebr", "22in M14EBR", "", {["m14ebr"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;

				//Sniper
				_action = [ "menu_mk2_alt_noreen", "20in Noreen .338", "", {["noreen"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_m200", "29in M200 .408", "", {["m200"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// MG
				_action = [ "menu_mk2_alt_m27", "AutoRifle - m27", "", {["m27"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_mk46", "LightMG - mk46", "", {["mk46"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_mk48", "HeavyMG - mk48", "", {["mk48"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_lwmmg", "LWMMG - .338", "", {["lwmmg"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Others
				_action = [ "menu_mk2_alt_p90", "P90 - 9mm", "", {["p90"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_alt_blck", "MCX - 300BLK", "", {["mcx_t2"] spawn CGQC_fnc_switchPrimary}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// Alternative Optics ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_optics", "Switch: Optics", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Categories
				_action = [ "menu_mk2_optics_night", "100% Night", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_day", "Day", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_special", "Special Purpose", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// 100% night compatible optics
				_action = [ "menu_mk2_optics_cmore", "RedDot - CMore Railway - 0x", "", {["optic_ACO_grn"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_eotech", "RedDot - Eotech - 0x", "", {["Tier1_Eotech553_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_t2", "RedDot - MicroT2 - 0x", "", {["Tier1_MicroT2_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;

				_action = [ "menu_mk2_optics_t2", "RCO - Leupold Mk4 - 0/2x", "", {["optic_Hamr"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_bravo", "RCO - Sig Bravo4 - 0/2x", "", {["optic_ERCO_blk_F"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_acog", "RCO - ACOG - 0/2x", "", {["rhsusf_acc_ACOG_RMR"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_elcan", "RCO - Elcan SpecterDR - 0/1-2x", "", {["Tier1_Elcan_156_C2_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_night"], _action ] call ace_interact_menu_fnc_addActionToObject;


				// Day optics
				_action = [ "menu_mk2_optics_eotech+", "RedELCAN - Eotech - 0/3x", "", {["Tier1_EXPS3_0_3xMag_Black_Up"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//LPVO
				_action = [ "menu_mk2_optics_gen2", "LPVO - GenII - 0/1-6x", "", {["Tier1_Razor_Gen2_16_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_shortdot", "LPVO - ShortDot - 0/1-8x", "", {["Tier1_Shortdot_Geissele_Docter_Black"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_gen3", "LPVO - GenIII - 0/1-10x", "", {["Tier1_Razor_Gen3_110_Geissele_Docter"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//Sniper
				_action = [ "menu_mk2_optics_shortdot", "Sniper - M8541A - 0/3-15x", "", {["rhsusf_acc_premier_mrds"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_gen3", "Sniper - Nightforce NXS - 0/5-22x", "", {["optic_lrps"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_121s", "Sniper - R-VPS - 4-20x ", "", {["121_USASOC_RVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_121L", "Sniper - P-VPS - 7-35x", "", {["121_USASOC_PVPS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_day"], _action ] call ace_interact_menu_fnc_addActionToObject;





				// Special optics
				_action = [ "menu_mk2_optics_skeet", "SkeetIR - 1-2x", "", {["SkeetIR_TWS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_anpas", "AN/PAS - 1-2x", "", {["rhsusf_acc_anpas13gv1"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_nvs", "NVS - 5x", "", {["optic_NVS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_nightf", "Nightforce+SkeetIR - 0/1-8x", "", {["NForce_Atcr_RMR_Top_SkeetIR_Down"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_nights", "NightStalker - 0/5-22x", "", {["optic_Nightstalker"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_tws", "TWS - 4-10x", "", {["optic_tws"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_Nightpro", "Nightstalker Pro - 0/4-31x", "", {["SN_NS"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_121ns", "R-PVS - 4-20x", "", {["121_USASOC_RVPS_ANPVS30"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;
				_action = [ "menu_mk2_optics_121nl", "P-PVS - 7-35x", "", {["121_USASOC_PVPS_ANPVS30"] spawn CGQC_fnc_switchOptics}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_optics", "menu_mk2_optics_special"], _action ] call ace_interact_menu_fnc_addActionToObject;

				// 2023 arsenal ---------------------------------------------------------------------------------------------------

				// Unlocked version
				_action = [
					"menu_mk2_unlocked",
					"Arsenal: Unlocked",
					"CGQC\textures\icon_arsenal",
					{[0] call CGQC_ldt_2023_arsenal},
					{!cgqc_mk2_arsenal_locked}
				] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

				// Soldier - 1
				_action = [ "menu_mk2_1", "Arsenal: Soldat", "CGQC\textures\icon_arsenal", {[1] call CGQC_ldt_2023_arsenal}, {(cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 1)} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Caporal - 2
				_action = [ "menu_mk2_2", "Arsenal: Caporal", "CGQC\textures\icon_arsenal", {[2] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 2} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// CaporalC - 3
				_action = [ "menu_mk2_3", "Arsenal: Caporal-Chef", "CGQC\textures\icon_arsenal", {[3] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 3} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Sergent - 4
				_action = [ "menu_mk2_4", "Arsenal: Sergent", "CGQC\textures\icon_arsenal", {[4] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 4} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Adjudent - 5
				_action = [ "menu_mk2_5", "Arsenal: Adjudent", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 5} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Sous-Lieutenant - 6
				_action = [ "menu_mk2_6", "Arsenal: Sous-Lieutenant", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 6} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Lieutenant - 7
				_action = [ "menu_mk2_7", "Arsenal: Lieutenant", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 7} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Capitaine - 8
				_action = [ "menu_mk2_8", "Arsenal: Capitaine", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 8} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Major - 9
				_action = [ "menu_mk2_9", "Arsenal: Major", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 9} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				//  Lieutenant-Colonel- 10
				_action = [ "menu_mk2_10", "Arsenal: Lieutenant-Colonel", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 10} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Colonel - 11
				_action = [ "menu_mk2_11", "Arsenal: Colonel", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_mk2_arsenal_locked && player getVariable 'cgqc_player_rank' == 11} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Complet -
				_action = [ "menu_mk2_5", "Arsenal: CGQC Complet", "CGQC\textures\icon_arsenal", {[0] call CGQC_ldt_2023_arsenal}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

			};
			// WW2 shit ===============================================================================================
			if (cgqc_player_hasIfa3) then {
				diag_log "[CGQC_FNC] loadMk3Menu - loading IFA3 stuff";
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_ifa3", "WW2", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasIfa3} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// ifa3 Arsenal Complet
				_action = [ "menu_ifa3_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\ifa3\load_ifa3.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_ifa3" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

			};
			// Scandinavia shit ===============================================================================================
			if (cgqc_player_hasNorthern) then {
				diag_log "[CGQC_FNC] loadMk3Menu - loading Scandinavia stuff";
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_scandinavia", "Northern Front", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasNorthern} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Scandinavia Arsenal Complet
				_action = [ "menu_scandinavia_complete", "Arsenal: Northern", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\northern\load_northern.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_scandinavia" ], _action ] call  ace_interact_menu_fnc_addActionToObject;

			};

			diag_log "[CGQC_FNC] loadMk3Menu - loading general stuff";
			// Items Rapides ========================================================================================================
			_action = [ "menu_items", "Items Rapides", "CGQC\textures\icon_items", {""}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Quick Heal
			_action = [ "menu_items9", "Quick heal", "", {["heal"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items10", "Refill Mags", "", {[] call CGQC_fnc_addMags; [] call CGQC_fnc_maxMags;}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			//Radios
			_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Individual radios
			_action = [ "menu_items1", "Get: 343", "", {["343"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items2", "Get: 152", "", {["152"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Get: 148", "", {["148"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Get: 117f", "", {["117"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Radios Vietnam
			_action = [ "menu_items52", "Radio: Short-Range", "", {["52"] call CGQC_fnc_getStuff}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items77", "Radio: Long-Range", "", {["77"] call CGQC_fnc_getStuff}, {!cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Earplugs
			_action = [ "menu_items3", "Earplugs", "", {["earplugs"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Bandages
			_action = [ "menu_items4", "Bandages x10", "", {["bandages"] call CGQC_fnc_getStuff}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Painkillers
			_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//IFAK
			_action = [ "menu_items_ifak", "Kit: Individual First-AId", "", {["ifak"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Bandolier
			_action = [ "menu_items_bandolier", "Bandolier: Ammo", "", {["bandolier"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Medikit
			_action = [ "menu_items_medkit", "Kit: Medic Supply", "", {["medkit"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Kidnapping Kit
			_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] call CGQC_fnc_getStuff}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Pistol mags
			_action = [ "menu_items11", "2x Secondary mags", "", {["mags_secondary"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Side keys
			_action = [ "menu_items12", "Get side vehicle key", "", {["key"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;


			if (cgqc_player_has2023) then {
				// Quick Items
				//m72a7
				_action = [ "menu_items6", "Jetable: m72a7 LAW", "", {["law"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//m136
				_action = [ "menu_items7", "Jetable: m136", "", {["m136"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			};

			// Skill switcher ========================================================================================================
			_action = [ "menu_skill", "Switch: Skills", "CGQC\textures\icon_skills", {""}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Medic
			_action = [ "skill_medic", "Medic", "", {["med", false] call CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Engineer
			_action = [ "skill_eng", "Engineer", "", {["eng", false] call CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Driver
			_action = [ "skill_driver", "Tank Driver", "", {["driver", false] call CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Pilot
			_action = [ "skill_pilot", "Heli Pilot", "", {["heli", false] call CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Sniper
			_action = ["skill_sniper", "Recon", "", {["recon", false] call CGQC_fnc_switchPerks},	{true}] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Heavy
			_action = ["skill_heavy", "Heavy loads", "", {["at", false] call CGQC_fnc_switchPerks},	{true}] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;

			// Radio setups
			_action = [ "menu_radios", "Switch: Radios", "CGQC\textures\radio.paa", {""}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_1", "Infantry - 343", "", {["inf"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_2", "2iC - 343+148", "", {["2ic"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_3", "TL - 343+152", "", {["tl"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_2", "Medic - 343+152", "", {["medic"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_4", "SL/HQ - 343+117+117", "", {["sl"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_5", "Recon - 343+152+117", "", {["recon"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//_action = [ "menu_radios_7", "LeCloutier - 343+152+152", "", {["clout"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
			//_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_6", "Zeus - 343+117+117", "", {["zeus_radios", 0] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

			// Zeus Arsenal ========================================================================================================
			_action = [ "menu_zeus", "Arsenal: Zeus", "CGQC\textures\icon_arsenal", {[player, player, true] call ace_arsenal_fnc_openBox;}, {cgqc_flag_isTraining || [player] call CGQC_fnc_checkZeus || !cgqc_mk2_arsenal_locked || player getVariable 'cgqc_player_rank' > 7} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		};
	};

	diag_log "[CGQC_FNC] loadMk3Menu - loading cargo stuff";
	// Supplies spawner --------------------------------------------------------------------------------------------------------------
	_action = [ "menu_supplies", "Logistics", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Ammo can
	_action = [ "menu_supplies_ammo", "Squad Ammo Box", "", {["ammo"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Explosives can
	_action = [ "menu_supplies_exp", "Explosives Box", "", {["exp"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  60mm mortar crate
	_action = [ "menu_supplies_60", "60mm mortar box", "", {["mort60"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  82mm mortar crate
	_action = [ "menu_supplies_82", "82mm mk6 mortar box", "", {["mort82"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Fuel can
	_action = [ "menu_supplies_fuel", "Fuel Can", "", {["fuel"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Vehicle ammo can
	_action = [ "menu_supplies_vic", "Vehicle Ammo Can", "", {["vic_ammo"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Spare wheel
	_action = [ "menu_supplies_wheel", "Spare wheel", "", {["wheel"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	//  Spare tracks
	_action = [ "menu_supplies_track", "Spare track", "", {["track"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;

	// Snapshots --------------------------------------------------------------------------------------------------------------
	_action = [ "menu_snapshots", "Snapshots", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

	_action = [ "menu_snapshot_save", "Save Player Snapshot", "", {[player, "save"] spawn CGQC_fnc_snapshot;}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots"], _action ] call  ace_interact_menu_fnc_addActionToObject;

	_action = [ "menu_snapshot_load", "Load Snapshot", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_snapshot_load_player", "Player Snapshot", "", {[player, "load"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_done", false];} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_snapshot_load_auto", "Auto Snapshot", "", {[player, "load", "single", "auto"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_auto_done", false];} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_snapshot_load_start", "Start Snapshot", "", {[player, "load", "single", "start"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_start_done", false];} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	_action = [ "menu_snapshot_load_zeus", "Zeus Snapshot", "", {[player, "load", "single", "zeus"] spawn CGQC_fnc_snapshot;}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_zeus_done", false];} ] call ace_interact_menu_fnc_createAction;
	_adding = [ _crate, 0, ["ACE_MainActions" , "menu_snapshots", "menu_snapshot_load"], _action ] call  ace_interact_menu_fnc_addActionToObject;
} else {
	diag_log "[CGQC_FNC] loadMk3Menu - NO INTERFACE - skipping";
};

diag_log "[CGQC_FNC] loadMk3Menu done";