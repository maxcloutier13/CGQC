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
			[west, _crate, format["Arsenal %1", cgqc_mk2_arsenal_ctr]] call BIS_fnc_addRespawnPosition;
			// Zeus lock toggle ===============================================================================================
			_action = [ "menu_zeus_lock", "Lock Arsenal", "", {hint 'Arsenal lock!'; cgqc_mk2_arsenal_locked = true; publicVariable "cgqc_mk2_arsenal_locked"}, {!cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_zeus_unlock", "Unlock Arsenal", "", {hint 'Arsenal unlocked!'; cgqc_mk2_arsenal_locked = false; publicVariable "cgqc_mk2_arsenal_locked"}, {cgqc_mk2_arsenal_locked && [player] call CGQC_fnc_checkZeus;} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;

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
					// Spawnmodule faction
					//cgqc_spawn_module setVariable ["VehicleFactions", "CGQC"];
					// 2023 ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_2023", "2023", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Mk1 Loadout switcher ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2", "Loadouts/Rôles MK2", "CGQC\textures\icon_loadouts", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// Spartan ------------------------------------------------------------------------------------------------------------
					// **********************************************************************************************************************
					_action = [ "menu_mk2_s1", "Spartan", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Infanterie ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_inf", "Infanterie", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman mk18 
					_action = [ "menu_mk2_inf_RFCQB", "Rifleman CQB mk18", "", {["rifle_cqb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman M4
					_action = [ "menu_mk2_inf_RF", "Rifleman Carbine M4blk2", "", {["rifle_carb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Rifleman M16
					_action = [ "menu_mk2_inf_RF_m16", "Rifleman Rifle M16a4", "", {["rifle_m16", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Grenadier 
					_action = [ "menu_mk2_inf_Grenadier", "Grenadier", "", {["rifle_grenade", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_inf"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Specialists ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_spec", "Spécialistes", "", {""}, {cgqc_player_rank > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Medic 
					_action = [ "menu_mk2_inf_medic", "Medic", "", {["med", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Engineer
					_action = [ "menu_mk2_inf_eng", "Engineer", "", {["eng", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// MG (Light) 
					_action = [ "menu_mk2_inf_LMG", "Light machinegun", "", {["lmg", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					//  MG (Heavy) 
					_action = [ "menu_mk2_inf_HMG", "Heavy machinegun", "", {["hmg", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Marksman 
					_action = [ "menu_mk2_inf_marks", "Marksman", "", {["mrksm", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Anti-Tank (MAAWS)
					_action = [ "menu_mk2_inf_maaws", "Anti-Tank (MAAWS)", "", {["at_maaws", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Anti-Tank (Javelin) 
					_action = [ "menu_mk2_inf_jav", "Anti-Tank (Javelin)", "", {["at_jav", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Mortier léger 
					_action = [ "menu_mk2_inf_mortar", "Mortier Léger", "", {["mortar", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_spec"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Lead ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_lead", "Commandement", "", {""}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader 
					_action = [ "menu_mk2_inf_TL", "Team Leader", "", {["tl_carb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Team Leader CQB
					_action = [ "menu_mk2_inf_TLcqb", "Team Leader CQB", "", {["tl_cqb", 1, false] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_s1", "menu_mk2_lead"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// Recon ------------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_recon", "Recon", "", {""}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
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
					_action = [ "menu_mk2_pilots", "Griffon", "", {""}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
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
					_action = [ "menu_mk2_driver", "Centaure", "", {}, {cgqc_player_rank > 1 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Tank Driver
					_action = [ "menu_mk2_tank", "Tank driver", "", {["tank_driver", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {cgqc_player_rank > 3 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// Tank Crew
					_action = [ "menu_mk2_crew", "Tank Crew", "", {["tank_crew", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023", "menu_mk2", "menu_mk2_driver"], _action ] call ace_interact_menu_fnc_addActionToObject;
					
					// High Command ------------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_highCommand", "High Command", "", {}, {cgqc_player_rank > 5 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2"], _action ] call ace_interact_menu_fnc_addActionToObject;
					// HQ 
					_action = [ "menu_mk2_inf_hq", "HQ", "", {["hq", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_highCommand"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					// HQ 
					_action = [ "menu_mk2_inf_sl", "Squad Leader", "", {["sl", 0, false, player] execVM "\CGQC_2022\loadouts\mk2_role_switch.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
					_adding = [ _crate, 0, ["ACE_MainActions", "menu_2023" , "menu_mk2", "menu_mk2_highCommand"], _action ] call  ace_interact_menu_fnc_addActionToObject;
					
					
					// Mk1 Camo Switcher ---------------------------------------------------------------------------------------------------------
					_action = [ "menu_mk2_camo", "Camo/Uniformes", "CGQC\textures\icon_camo", {""}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
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
					_action = [ "menu_mk2_5", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC_2022\functions\loadMk2.sqf"}, {cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
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
				_action = [ "menu_ifa3_complete", "Arsenal: Complet", "CGQC\textures\icon_arsenal", {[0] execVM "\CGQC\loadouts\unsung\load_unsung.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions", "menu_unsung" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
				
			};
			// Scandinavia shit ===============================================================================================
			if (cgqc_player_hasScandinavia) then {
				// Main Menu ---------------------------------------------------------------------------------------------------------
				_action = [ "menu_scandinavia", "ww2 Scandinavia", "CGQC\textures\icon_loadouts", {""}, {cgqc_player_hasScandinavia} ] call ace_interact_menu_fnc_createAction;
				_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
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
			
			// Zeus Arsenal ========================================================================================================
			_action = [ "menu_zeus", "Arsenal: Zeus", "CGQC\textures\icon_arsenal", {[] execVM "\CGQC\loadouts\mk3_zeusArsenal.sqf"}, {cgqc_flag_isTraining || [player] call CGQC_fnc_checkZeus || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
				

			// Items Rapides ========================================================================================================
			_action = [ "menu_items", "Items Rapides", "CGQC\textures\icon_items", {""}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" ], _action ] call ace_interact_menu_fnc_addActionToObject;
			// Quick Heal
			_action = [ "menu_items9", "Quick heal", "", {["heal"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			//Radios 
			_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items1", "Radio: 343", "", {["343"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items2", "Radio: 152", "", {["152"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Radio: 148", "", {["148"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_items3", "Radio: 117f", "", {["117"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
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
			_action = [ "menu_items4", "Bandages x10", "", {["bandages"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Painkillers
			_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Kidnapping Kit
			_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
			//Ammo
			_action = [ "menu_items10", "5x Primary mags", "", {["mags_primary"] execVM "\CGQC\loadouts\mk3_getStuff.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions" , "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
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
			_action = [ "menu_skill", "Skills", "CGQC\textures\icon_skills", {""}, {cgqc_player_rank > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
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

		//Training ==============================================================================================================
			_action = [ "menu_training", "Training", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    
			
			// Sniping ---------------------------------------------------------------------------------------------------------
			_action = [ "menu_training_sniping", "Sniping", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_sniping_on", "Sniping mode->ON", "", {execVM '\cgqc\functions\fnc_sniping_on.sqf'}, {!cgqc_sniping} ] call ace_interact_menu_fnc_createAction;     
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
			_action = [ "menu_sniping_off", "Sniping mode->OFF", "", {execVM '\cgqc\functions\fnc_sniping_off.sqf'}, {cgqc_sniping} ] call ace_interact_menu_fnc_createAction;     
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;   

			// Orienteering ---------------------------------------------------------------------------------------------------------
			_action = [ "menu_training_orient", "Orientation", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_training_orient_basic", "Basic Orientation->ON", "", {["basic_on"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {!cgqc_orienteering} ] call ace_interact_menu_fnc_createAction;     
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
			_action = [ "menu_training_orient_basic_off", "Basic Orientation->Off", "", {["basic_off"] execVM '\cgqc\functions\fnc_trainingOrient.sqf'}, {cgqc_orienteering} ] call ace_interact_menu_fnc_createAction;     
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
			// Options
			_action = [ "menu_training_orient_options", "Options", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_training_orient_options_patrols", "Add Patrols", "", {cgqc_orient_opt_patrols = true}, {!cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_training_orient_options_patrols_off", "Remove Patrols", "", {cgqc_orient_opt_patrols = true}, {cgqc_orient_opt_patrols} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_training_orient_options_hunters", "Add Hunters", "", {cgqc_orient_opt_hunters = true}, {!cgqc_orient_opt_hunters} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_training_orient_options_hunters_off", "Remove Hunters", "", {cgqc_orient_opt_hunters = true}, {cgqc_orient_opt_hunters} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_orient"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			
			// CQB ---------------------------------------------------------------------------------------------------------
			_action = [ "menu_training_cqb", "CQB", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_clear", "Stop CQB", "", {[0] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;    

			_action = [ "menu_house1_option", "Options", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			
			_action = [ "menu_house1_nbr", "Target number", "", {}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbr5", "+5", "", {[40] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrm5", "-5", "", {[41] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbr10", "+10", "", {[42] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrm10", "-10", "", {[43] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbr20", "+20", "", {[44] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrm20", "-20", "", {[45] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrRdm1", "Random Small: 10-20", "", {[46] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrRdm2", "Random Medium: 20-30", "", {[47] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nbrRdm3", "Random Large: 30-50", "", {[47] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_nbr"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			_action = [ "menu_house1_static", "Target movement", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nomove", "All static", "", {[50] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_m10", "10% move", "", {[51] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_m25", "25% move", "", {[52] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_m10", "50% move", "", {[53] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_m25", "75% move", "", {[54] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_mRandom", "Random", "", {[55] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_static"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			_action = [ "menu_house1_civ", "Civilian presence", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_civ_on", "On", "", {[60] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_civ_off", "Off", "", {[61] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_civ"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			_action = [ "menu_house1_gren", "Grenades on PAX", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_gren_on", "On", "", {[62] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_gren_off", "Off", "", {[63] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_gren"], _action ] call  ace_interact_menu_fnc_addActionToObject;

			_action = [ "menu_house1_timer", "Timer to release PAX", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timer0", "No release", "", {[70] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timer30", "+30secs", "", {[71] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timerm30", "-30secs", "", {[72] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timer30", "+60secs", "", {[73] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timerm30", "-60secs", "", {[74] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_timermRandom", "Random", "", {[75] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_option", "menu_house1_timer"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			
			_action = [ "menu_house1_start", "Start CQB", "", {}, {!cgqc_house1_on} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			
			// Pistols
			//_action = [ "menu_house1_easy", "Pistols: Won't shoot", "", {[1] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasRHS} ] call ace_interact_menu_fnc_createAction;       
			//_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_nrml", "Pistols: FIA", "", {[2] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// SMG
			_action = [ "menu_house1_med", "SMG: FIA", "", {[3] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_gendarme", "SMG: Gendarmerie", "", {[7] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Full Army
			_action = [ "menu_house1_hard", "Full: Wagner", "", {[4] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_csat", "Full: CSAT", "", {[5] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_viper", "Full: CSAT Viper", "", {[6] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_spetsnaz", "Full: Spetsnaz", "", {[8] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_ldf", "Full: LDF", "", {[9] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_looters", "Full: Looters", "", {[10] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_syndikat", "Full: Syndikat", "", {[11] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_aaf", "Full: AAF", "", {[12] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_vdv", "Full: VDV", "", {[13] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_dnsk", "Full: Donesk/Luhansk", "", {[14] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_hamas", "Full: Hamas", "", {[15] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_pmc", "Full: Ion PMC", "", {[16] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_isis", "Full: ISIS", "", {[17] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_house1_cartel", "Full: Cartel", "", {[18] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_isModern && cgqc_player_hasDrongoFactions} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Vietnam
			_action = [ "menu_house1_viet", "Full: Vietcongs", "", {[19] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// WW2
			_action = [ "menu_house1_ww2", "Full: Soviets", "", {[20] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasIfa3} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			// Scandinavia
			_action = [ "menu_house1_scand", "Full: Nazis", "", {[21] execVM '\cgqc\functions\fnc_cqbHouse.sqf'}, {cgqc_player_hasScandinavia} ] call ace_interact_menu_fnc_createAction;       
			_adding = [ _crate, 0, ["ACE_MainActions", "menu_training", "menu_training_cqb", "menu_house1_start"], _action ] call  ace_interact_menu_fnc_addActionToObject;




			
		};
	};
};