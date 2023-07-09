// --- mk3_menu ----------------------------------------------------------
// Ace menu for mk3 sheeits

waitUntil {!isNil "cgqc_postInitClient_done"};
waitUntil {cgqc_postInitClient_done};
_crate = (_this select 0) select 0;
_type = _this select 1;

//cgqc_spawn_module = createGroup createUnit ["SpyderAddons_sup_vehiclespawn", getPosATL _crate, [], 0, "NONE"];
//cgqc_spawn_module synchronizeObjectsAdd [_crate];
// Optional: Set any additional module parameters
//cgqc_spawn_module setVariable ["SpawnPosition", nearestPosition [getPos _crate, [], 10];];
//cgqc_spawn_module setVariable ["SpawnHeight", 0];
//cgqc_spawn_module setVariable ["VehiclesWhitelist", "value"];
//cgqc_spawn_module setVariable ["VehiclesBlacklist", "value"];
//cgqc_spawn_module setVariable ["VehiclesTypeBlacklist", "value"];
//cgqc_spawn_module setVariable ["VehiclesTypeWhitelist", "value"];
//cgqc_spawn_module setVariable ["SpawnCode", "value"];
//cgqc_spawn_module setVariable ["SpawnCondition", "value"];


if (hasInterface) then { 
	switch (_type) do {
		// Command ========================================================================
		case "para":{ 
			// Jumping uniform 
			_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		case "dive":{ 
			// Diving uniform 
			_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		};
		default	{ // Normal mk3 Arsenal
			// Respawn point in front of Arsenal 
			cgqc_mk2_arsenal_ctr = cgqc_mk2_arsenal_ctr + 1;
			[west, getPosATL _crate, format["Arsenal West %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
			[east, getPosATL _crate, format["Arsenal East %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
			[independent, getPosATL _crate, format["Arsenal Independant %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;

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
			
			if !(cgqc_player_has2023) then {
				//waitUntil {sleep 1; cgqc_mk2_arsenal_init_done};
				if (!isNil "_crate") then {
					// Vanilla ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_vanilla", "Vanilla", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
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
					_action = [ "menu_inf_RFcarbine", "Rifleman Carbine 416", "", {["vanilla_rifleman", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					// Lead ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_loadout_lead", "Commandement", "", {""}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader 
					_action = [ "menu_loadout_inf_TL", "Team Leader", "", {["vanilla_tl", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_vanilla", "menu_loadouts", "menu_loadout_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				};	
			};
			// Vietnam arsenal if Unsung is pressent ===============================================================================================
			if (cgqc_player_hasUnsung) then {
				waitUntil {sleep 1; cgqc_unsung_arsenal_init_done};
				// Spawnmodule faction
				//cgqc_spawn_module setVariable ["VehicleFactions", "UNSUNG_W"];
				// Unsung ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_unsung", "Vietnam", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Unsung Arsenal Complet 
				_action = [ "menu_unsung_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\unsung\load_unsung.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Unsung Loadout switcher ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_unsung_loadouts", "Loadouts/Rôles", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Basic soldier 
				//_action = [ "menu_unsung_basic", "Basic Soldier", "", {["unsung_basic", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				//_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 1-0 - TL 
				_action = [ "menu_unsung_10", "1-0 -Team Leader", "", {["unsung_10", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 1-1 - Radio man
				_action = [ "menu_unsung_11", "1-1 -Radio guy", "", {["unsung_11", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 1-2 - Medic
				_action = [ "menu_unsung_12", "1-2 -Medic", "", {["unsung_12", 1, false] execVM "\CGQC\loadouts\mk3_roleSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung", "menu_unsung_loadouts"], _action ] call  ace_interact_menu_fnc_addActionToObject;		
			};
			// Mk2 Arsenal if 2023 mod is present  ===============================================================================================
			if (cgqc_player_has2023) then {
				waitUntil {sleep 1; cgqc_mk2_arsenal_init_done};
				if (!isNil "_crate") then {
					
					// 2023 ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_2023", "2023", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Mk1 Loadout switcher ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2", "Loadouts/Rôles MK3", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Spartan ------------------------------------------------------------------------------------------------------------
					// **********************************************************************************************************************
					//_action = [ "menu_mk2_s1", "Spartan", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Infanterie ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_inf", "Infanterie", "\cgqc\textures\cgqc_ace_rifle.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman mk18 
					_action = [ "menu_mk2_inf_RFCQB", "Rifleman CQB mk18", "", {["rifle_cqb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman M4
					_action = [ "menu_mk2_inf_RF", "Rifleman Carbine M4blk2", "", {["rifle_carb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman M16
					_action = [ "menu_mk2_inf_RF_m16", "Rifleman Rifle M16a4", "", {["rifle_m16", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Grenadier 
					_action = [ "menu_mk2_inf_Grenadier", "Grenadier", "", {["rifle_grenade", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					// Specialists ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_spec", "Spécialistes", "\cgqc\textures\cgqc_ace_specialists", {""}, {cgqc_player_rank > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Medic 
					_action = [ "menu_mk2_inf_medic", "Squad Medic", "", {["med", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Engineer
					_action = [ "menu_mk2_inf_eng", "Engineer", "", {["eng", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Saboteur
					_action = [ "menu_mk2_inf_saboteur", "Saboteur", "", {["saboteur", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// AR
					_action = [ "menu_mk2_inf_AR", "Auto-Rifleman", "", {["ar", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// MG (Light) 
					_action = [ "menu_mk2_inf_LMG", "Light machinegun", "", {["lmg", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					//  MG (Heavy) 
					_action = [ "menu_mk2_inf_HMG", "Heavy machinegun", "", {["hmg", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Marksman 
					_action = [ "menu_mk2_inf_marks", "Marksman", "", {["mrksm", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Anti-Tank (MAAWS)
					_action = [ "menu_mk2_inf_maaws", "Anti-Tank (MAAWS)", "", {["at_maaws", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Anti-Tank (Javelin) 
					_action = [ "menu_mk2_inf_jav", "Anti-Tank (Javelin)", "", {["at_jav", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Mortier léger 
					_action = [ "menu_mk2_inf_mortar", "Mortier Léger", "", {["mortar", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					// Recon ------------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_recon", "Recon", "\cgqc\textures\cgqc_ace_bino.paa", {""}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Sniper m200
					_action = [ "menu_mk2_inf_snipe", "Sniper m200", "", {["sniper", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Sniper m14 ebr
					_action = [ "menu_mk2_inf_snipe", "Sniper EBR", "", {["sniper_ebr", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Spotter
					_action = [ "menu_mk2_inf_spotter", "Spotter", "", {["spotter", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Drone Operator 
					_action = [ "menu_mk2_inf_drone", "Drone Operator", "", {["drone", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// JTAC
					_action = [ "menu_mk2_inf_jtac", "FAC/JTAC", "", {["jtac", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_recon"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Pilotes ------------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_pilots", "Griffon", "\cgqc\textures\cgqc_ace_heli.paa", {""}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Helicopter pilot 
					_action = [ "menu_mk2_inf_medic", "Helicopter pilot", "", {["heli_pilot", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Helicopter crew
					_action = [ "menu_mk2_helicrew", "Helicopter crew", "", {["heli_crew", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Jet pilot 
					//_action = [ "menu_mk2_inf_jet", "Jet pilot", "", {["jet_pilot", 0, false, _this] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 4 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					//_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_pilots"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Drivers ------------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_driver", "Centaure", "\cgqc\textures\icon_tank.paa", {}, {cgqc_player_rank > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Tank Driver
					_action = [ "menu_mk2_tank", "Tank driver", "", {["tank_driver", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Tank Crew
					_action = [ "menu_mk2_crew", "Tank Crew", "", {["tank_crew", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Lead ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_lead", "Commandement", "\cgqc\textures\cgqc_ace_beret", {""}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader 
					_action = [ "menu_mk2_inf_TL", "Team Leader", "", {["tl_carb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader CQB
					_action = [ "menu_mk2_inf_TLcqb", "Team Leader CQB", "", {["tl_cqb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader no GL
					_action = [ "menu_mk2_inf_TLnoGL", "Team Leader no GL", "", {["tl_no_gl", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					// SL
					_action = [ "menu_mk2_inf_sl", "Squad Leader", "", {["sl", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// HQ 
					_action = [ "menu_mk2_inf_hq", "HQ", "", {["hq", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					

					
					// Mk1 Camo Switcher ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_camo", "Switch: Camo", "CGQC\textures\icon_camo", {""}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Base/Training uniform 
					_action = [ "menu_mk2_camo_base", "Training - Vert", "", {["tan", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Desert uniform 
					_action = [ "menu_mk2_camo_desert", "Desert", "", {["desert", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Multicam uniform 
					_action = [ "menu_mk2_camo_multicam", "Multicam", "", {["mcam", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Woodland uniform 
					_action = [ "menu_mk2_camo_woodland", "Cadpat", "", {["cadpat", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Black uniform 
					_action = [ "menu_mk2_camo_black", "Black", "", {["black", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Winter uniform 
					_action = [ "menu_mk2_camo_winter", "Winter", "", {["white", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Jumping uniform 
					_action = [ "menu_mk2_camo_para_std", "Kit: Parachutiste", "\CGQC\textures\cgqc_ace_para", {["para", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Diving uniform 
					_action = [ "menu_mk2_camo_diver_std", "Kit: Plongeur", "\CGQC\textures\cgqc_ace_dive", {["diver", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				
					// Alternative Primaries ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_alt", "Switch: Primary", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa", {""}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
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
				
					// CQB
					_action = [ "menu_mk2_alt_mk18", "10in Mk18", "", {["mk18_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_mk18gl", "10in Mk18 GL", "", {["mk18_gl"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_416", "10in HK416", "", {["416_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_acr", "10.5in ACR-E", "", {["ACR_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_virtus", "11.5in Virtus", "", {["virtus_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_sr16", "11.5in SR16", "", {["sr16_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_g36v", "12.5in G36v", "", {["g36_dot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_ctar21", "15in CTAR-21", "", {["CTAR21"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_cqb"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Carbines
					_action = [ "menu_mk2_alt_m4dot", "14in M4blkII Dot+", "", {["m4_dotplus"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_m4lpvo", "14in M4blkII LPVO", "", {["m4_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_m320", "14in M4blkII GL", "", {["m4_gl_m320"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_GL"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_sr16dot", "14.5in SR16 Dot+", "", {["sr16_dotplus"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_sr16lpvo", "14.5in SR16 LPVO", "", {["sr16_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_acredot", "14.5in ACR-E Dot+", "", {["acre_dotplus"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_acrelpvo", "14.5in ACR-E LPVO", "", {["acre_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_acregl", "14.5in ACR-E GL", "", {["acre_gl"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_416dot+", "14.5in HK416 Dot+", "", {["sr16_dotplus"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_416lpvo", "14.5in HK416 LPVO", "", {["sr16_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_ctar21", "18in CTAR-21 ", "", {["TAR21"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_ctar21gl", "18in GTAR-21 GL", "", {["TAR21GL"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_carbine"], _action ] call ace_interact_menu_fnc_addActionToObject;

					// Rifles
					_action = [ "menu_mk2_alt_m27", "16.5in M27 LPVO", "", {["m27_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_mk12", "18in Mk12 LPVO", "", {["mk12_lpvo"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_m16lpvo", "20in M16a4 ShortDot", "", {["m16_shortdot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_acrelpvo", "20in ACR-E ShortDot", "", {["acre_shortdot"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_rifle"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// DMR 7.62
					_action = [ "menu_mk2_alt_socom", "16in SOCOM16", "", {["socom16"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_417", "20in HK417", "", {["417"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_sig556", "20in SIG 556", "", {["sig556"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_m14ebr", "22in M14EBR", "", {["m14ebr"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_dmr"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					//Sniper
					_action = [ "menu_mk2_alt_noreen", "20in Noreen .338", "", {["noreen"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_m200", "29in M200 .408", "", {["m200"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_sniper"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// MG
					_action = [ "menu_mk2_alt_m27", "AutoRifle - m27", "", {["m27"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_mk46", "LightMG - mk46", "", {["mk46"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_mk48", "HeavyMG - mk48", "", {["mk48"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_mg"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Others 
					_action = [ "menu_mk2_alt_p90", "P90 - 9mm", "", {["p90"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;
					_action = [ "menu_mk2_alt_blck", "MCX - 300BLK", "", {["mcx_t2"] execVM "\CGQC\loadouts\mk3_primarySwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2_alt", "menu_mk2_alt_others"], _action ] call ace_interact_menu_fnc_addActionToObject;

					// 2023 arsenal ---------------------------------------------------------------------------------------------------

					// Unlocked version 
					_action = [
						"menu_mk2_unlocked", 
						"Arsenal: Unlocked", 
						"CGQC\textures\icon_arsenal", 
						{[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, 
						{!cgqc_mk2_arsenal_locked} 
					] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					// Soldier - 1 
					_action = [ "menu_mk2_1", "Arsenal: Soldat", "CGQC\textures\icon_arsenal", {[1] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {(cgqc_mk2_arsenal_locked && cgqc_player_rank == 1)} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Caporal - 2 
					_action = [ "menu_mk2_2", "Arsenal: Caporal", "CGQC\textures\icon_arsenal", {[2] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 2} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// CaporalC - 3 
					_action = [ "menu_mk2_3", "Arsenal: Caporal-Chef", "CGQC\textures\icon_arsenal", {[3] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 3} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Sergent - 4 
					_action = [ "menu_mk2_4", "Arsenal: Sergent", "CGQC\textures\icon_arsenal", {[4] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 4} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Adjudent - 5 
					_action = [ "menu_mk2_5", "Arsenal: Adjudent", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 5} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Sous-Lieutenant - 6
					_action = [ "menu_mk2_6", "Arsenal: Sous-Lieutenant", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 6} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Lieutenant - 7
					_action = [ "menu_mk2_7", "Arsenal: Lieutenant", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 7} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Capitaine - 8 
					_action = [ "menu_mk2_8", "Arsenal: Capitaine", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 8} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Major - 9 
					_action = [ "menu_mk2_9", "Arsenal: Major", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 9} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					//  Lieutenant-Colonel- 10 
					_action = [ "menu_mk2_10", "Arsenal: Lieutenant-Colonel", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 10} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Colonel - 11
					_action = [ "menu_mk2_11", "Arsenal: Colonel", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_mk2_arsenal_locked && cgqc_player_rank == 11} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Complet -  
					_action = [ "menu_mk2_5", "Arsenal: CGQC Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				};
			};
			// WW2 shit ===============================================================================================
			if (cgqc_player_hasIfa3) then {
				waitUntil {sleep 1; cgqc_ifa3_arsenal_init_done};
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_ifa3", "WW2", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasIfa3} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// ifa3 Arsenal Complet 
				_action = [ "menu_ifa3_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\ifa3\load_ifa3.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_ifa3" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				
			};
			// Scandinavia shit ===============================================================================================
			if (cgqc_player_hasScandinavia) then {
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_scandinavia", "ww2 Scandinavia", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasScandinavia} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Scandinavia Arsenal Complet 
				_action = [ "menu_scandinavia_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\scandinavia\load_scandinavia.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_scandinavia" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				
			};

			// 23rd shit if 23rd mod is present===============================================================================================
			if (cgqc_player_has23rd) then {
				// 2023 ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_23RD", "23RD", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_23rd} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// 23rd toggle ----------------------------------------------------------------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_23", "23rd CTF Member?", "", {execVM "\CGQC_2022\functions\23rd.sqf"}, {cgqc_player_has23rd && !cgqc_player_23rd} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// 23rd Camos ----------------------------------------------------------------------------------------------------------------------------------------------------------------
				_action = [ "menu_mk2_23_camo", "23rd Uniforms", "", {}, {cgqc_player_has23rd && cgqc_player_23rd && !cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_23RD" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				// Mosschip
				_action = [ "menu_mk2_23_camo_moss", "Mosschip", "", {["23_moss", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_23RD" , "menu_mk2_23_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Multidicc
				_action = [ "menu_mk2_23_camo_multi", "Multidicc", "", {["23_multi", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_23RD" , "menu_mk2_23_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Frostmoss
				_action = [ "menu_mk2_23_camo_frost", "Frostmoss", "", {["23_frost", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_23RD" , "menu_mk2_23_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
				// Tardpat
				_action = [ "menu_mk2_23_camo_tard", "Tardpat", "", {["23_tard", false] execVM "\CGQC\loadouts\mk3_camoSwitch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_23RD" , "menu_mk2_23_camo"], _action ] call ace_interact_menu_fnc_addActionToObject;
			};
			
			// Items Rapides ========================================================================================================
			_action = [ "menu_items", "Items Rapides", "CGQC\textures\icon_items", {""}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Quick Heal
			_action = [ "menu_items9", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items10", "Refill Mags", "", {[] execVM "cgqc\functions\fnc_addMags.sqf"; [] call CGQC_fnc_maxMags;}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			
			//Radios 
			_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Individual radios 
			_action = [ "menu_items1", "Get: 343", "", {["343"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items2", "Get: 152", "", {["152"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Get: 148", "", {["148"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Get: 117f", "", {["117"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Radios Vietnam 
			_action = [ "menu_items52", "Radio: Short-Range", "", {["52"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items77", "Radio: Long-Range", "", {["77"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {!cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Earplugs
			_action = [ "menu_items3", "Earplugs", "", {["earplugs"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Bandages
			_action = [ "menu_items4", "Bandages x10", "", {["bandages"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Painkillers
			_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//IFAK
			_action = [ "menu_items_ifak", "Kit: Individual First-AId", "", {["ifak"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Medikit
			_action = [ "menu_items_medkit", "Kit: Medic Supply", "", {["medkit"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Kidnapping Kit
			_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Ammo
			//Medikit
			_action = [ "menu_items_bandolier", "Bandolier: Ammo", "", {["bandolier"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items11", "2x Secondary mags", "", {["mags_secondary"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;    

			if (cgqc_player_has2023) then {
				// Quick Items 
				//m72a7
				_action = [ "menu_items6", "Jetable: m72a7 LAW", "", {["law"] execVM "\CGQC_2022\loadouts\mk1_box_get_items.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
				//m136
				_action = [ "menu_items7", "Jetable: m136", "", {["m136"] execVM "\CGQC_2022\loadouts\mk1_box_get_items.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			};

			// Skill switcher ========================================================================================================
			_action = [ "menu_skill", "Switch: Skills", "CGQC\textures\icon_skills", {""}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Medic
			_action = [ "skill_medic", "Medic", "", {["medic"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Engineer
			_action = [ "skill_eng", "Ingénieur", "", {["engineer"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// EOD
			_action = [ "skill_eod", "EOD", "", {["eod"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Driver
			_action = [ "skill_driver", "Driver", "", {["driver"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Pilot
			_action = [ "skill_pilot", "Pilot", "", {["pilot"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;			
			// Sniper
			_action = [
				"skill_sniper", 
				"Sniper", 
				"", 
				{["recon"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"},
				{(cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining) && (isNil "cgqc_perk_ghillie") && cgqc_player_isModern} 
			] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ,"menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject; 

			// Radio setups
			_action = [ "menu_radios", "Switch: Radios", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_1", "Infantry - 343+148", "", {["inf"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject; 
			_action = [ "menu_radios_2", "Medic/2iC - 343+152", "", {["2ic"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject; 
			_action = [ "menu_radios_3", "TL - 343+152+117", "", {["tl"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_4", "SL - 117+117+117", "", {["sl"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_5", "Recon - 152+117+343", "", {["recon"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_7", "LeCloutier - 343+152+152", "", {["clout"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_radios_6", "Zeus - 343+117+117", "", {["zeus_radios", 0] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			

			// Zeus Arsenal ========================================================================================================
			_action = [ "menu_zeus", "Arsenal: Zeus", "CGQC\textures\icon_arsenal", {[] execVM "\CGQC\loadouts\mk3_zeusArsenal.sqf"}, {cgqc_flag_isTraining || [player] call CGQC_fnc_checkZeus || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			//Training ==============================================================================================================
			//_action = [ "menu_training", "Training Mode", "", {hint "Check ton Ace Self-Action";execVM "\cgqc\functions\fnc_trainingMenu.sqf"}, {!cgqc_training_mode} ] call ace_interact_menu_fnc_createAction;       
			//_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    	
		};
	};
};