// --- perkSwitch ----------------------------------------------------------
// Switch perks
params ["_type", ["_clearFirst", true]];
diag_log format ["[CGQC_FNC] switchPerks %1 started", _type];


if (_clearFirst) then {
	// Set all traits to default
	[player] call CGQC_fnc_resetTraits;
	["reset"]call CGQC_fnc_setLeadership;
};

switch (_type) do {
	case "zeus":{
	};
	case "hq":{
		["HQ"]call CGQC_fnc_setLeadership;
	};
	case "sl":{
		["SL"]call CGQC_fnc_setLeadership;
	};
	case "tl":{
		["TL"]call CGQC_fnc_setLeadership;
	};
	case "heli":{
		player setUnitTrait ["engineer", true];
		// ------ Heli pilot --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_heli_getCrew", "Spawn Crew", "CGQC\textures\cgqc_ace_heli.paa", {["getCrew"] spawn CGQC_fnc_perksPilot}, {
			cgqc_perks_pilot &&
			!cgqc_perks_pilot_hasCrew &&
			(vehicle player isKindOf "Helicopter")
		} ] call ace_interact_menu_fnc_createAction;
		// Get Crew
		cgqc_action_getCrew = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_heli_delCrew", "Delete Crew", "", {["delCrew"] spawn CGQC_fnc_perksPilot}, {cgqc_perks_pilot && cgqc_perks_pilot_hasCrew} ] call ace_interact_menu_fnc_createAction;
		// Delete crew
		cgqc_action_delCrew = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_getCrew, cgqc_action_delCrew];
		cgqc_perks_pilot = true;
	};
	case "heli_crew":{
		player setUnitTrait ["engineer", true];
	};
	case "jet":{
		player setUnitTrait ["engineer", true];
	};
	case "driver":{
		player setUnitTrait ["engineer", true];
		// ------ Tank driver --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_driver_getDriver", "Spawn Driver", "", {["getDriver"] spawn CGQC_fnc_perksPilot}, {
			cgqc_perks_driver &&
			!cgqc_perks_driver_hasDriver &&
			(vehicle player isKindOf "LandVehicle")
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_getDriver = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_driver_delDriver", "Delete Driver", "", {["delDriver"] spawn CGQC_fnc_perksPilot}, {cgqc_perks_driver && cgqc_perks_driver_hasDriver} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_delDriver = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_getDriver, cgqc_action_delDriver];
		cgqc_perks_driver = true;
	};
	case "tank_crew":{
		player setUnitTrait ["engineer", true];
	};
	case "recon":{
		player setUnitTrait ["audibleCoef ", 0.9];
		player setUnitTrait ["camouflageCoef ", 0.9];
		player setUnitTrait ["UAVHacker", true];
		player setUnitTrait ["loadCoef ", 0.9];
		// ------ Ghillie up --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_ghillie", " Ghillie up", "cgqc\textures\cgqc_ace_ghillie", {}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		//All types
		_action = [ "cgqc_perk_ghillie_arid", "Arid", "", {_ct = ["arid"] spawn CGQC_fnc_perksRecon}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_arid = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_sarid", "Semi-Arid", "", {_ct = ["sarid"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_sarid = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_lush", "Lush", "", {_ct = ["lush"] spawn CGQC_fnc_perksRecon}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_lush = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_jungle", "Jungle", "", {_ct = ["jungle"] spawn CGQC_fnc_perksRecon}, {!cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_jungle = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		// Uniform
		_action = [ "cgqc_perk_ghillie_uniform", "Ghillie-> Uniforme", "", {_ct = ["uniform"] spawn CGQC_fnc_perksRecon}, {cgqc_perks_ghillie_isOn} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_uniform = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		// ------ Cut Grass --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_cutgrass", "Coupe l'herbe", "CGQC\textures\cgqc_ace_grass", {_ct = ["cut_grass"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_cutGrass = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		// Compile all actions to list
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_ghillie, cgqc_action_ghillie_arid, cgqc_action_ghillie_sarid, cgqc_action_ghillie_lush, cgqc_action_ghillie_jungle, cgqc_action_ghillie_uniform, cgqc_action_cutGrass];
		cgqc_perks_recon = true;
	};
	case "eng":{

		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
		player setUnitTrait ["loadCoef ", 0.9];
		// ------ Fortify --------------------------------------------------------------------------------------
		if (cgqc_config_fortify) then {
			fortify_list = format [
				"[
				['%1', 0],
				['%2', 0],
				['%3', 0],
				['%4', 0],
				['%5', 0],
				['%6', 0],
				['%7', 0],
				['%8', 0],
				['%9', 0],
				['%10', 0]
				]",
				cgqc_config_fortify_1,
				cgqc_config_fortify_2,
				cgqc_config_fortify_3,
				cgqc_config_fortify_4,
				cgqc_config_fortify_5,
				cgqc_config_fortify_6,
				cgqc_config_fortify_7,
				cgqc_config_fortify_8,
				cgqc_config_fortify_9,
				cgqc_config_fortify_10
			];
			cgqc_config_fortify_list = parseSimpleArray fortify_list;
			[west, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
			[east, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
			[resistance, 0, cgqc_config_fortify_list] call ace_fortify_fnc_registerObjects;
		};
		cgqc_perks_eng = true;
	};
	case "med":{
		player setUnitTrait ["Medic", true];
		player setUnitTrait ["loadCoef ", 0.9];
		cgqc_perks_medic = true;
	};
	case "at":{
		player setUnitTrait ["loadCoef ", 0.9];
	};
	case "mg":{
		player setUnitTrait ["loadCoef ", 0.9];
	};
	case "mortar":{
		player setUnitTrait ["loadCoef ", 0.8];
	};
	case "inf":{
	};
	case "zeus":{
	};
	case "max":{
		// Camo Faces ---------------------------------------------------------------------------------------------------------------
		_action = [ "menu_self_camo", " Camo Faces", "", {""}, {cgqc_player_max} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_0", " Remove Camo", "", {["face_0"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_1", " Camo 01", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_2", " Camo 02", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_3", " Camo 03", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_4", " Camo 04", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_5", " Camo 05", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_6", " Camo 06", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_7", " Camo 07", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_8", " Camo 08", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_9", " Camo 09", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_10", " Camo 10", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_11", " Camo 11", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_12", " Camo 12", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_13", " Camo 13", "", {["face_1"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_14", " Camo 14", "", {["face_2"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_15", " Camo 15", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		_action = [ "menu_self_camo_16", " Camo 16", "", {["face_3"] spawn CGQC_fnc_perksRecon}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_camo"], _action ] call  ace_interact_menu_fnc_addActionToObject;

		// Shooting range
		_action = [ "menu_self_range", "Shooting Range WIP", "", {
			["spawn_range", true] spawn CGQC_fnc_perksBasic
			}, {!cgqc_state_started || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
	};
	default	{
		diag_log "[CGQC_ERROR] switchPerks fail";
	};
};

diag_log "[CGQC_FNC] switchPerks done";