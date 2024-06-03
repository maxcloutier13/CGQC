#include "\CGQC\script_component.hpp"
// --- switchPerks ----------------------------------------------------------
// switch perks
params ["_type", ["_clearFirst", true], ["_pause", false]];
LOG_2("[switchPerks] %1/Clear:%2 started", _type, _clearFirst);

if (_pause) then {
	sleep 1;
};

if (_clearFirst) then {
	// set all traits to default
	LOG("[switchPerks] Clear traits and perks");
	[player] call CGQC_fnc_resetTraits;
	["reset"]call CGQC_fnc_setLeadership;
};

switch (_type) do {
	case "nam_recon":{
		LOG("[switchPerks] Nam Recon setup");
		player setUnitTrait ["audibleCoef", 0.5];
		player setUnitTrait ["camouflageCoef", 0.4];
		player setUnitTrait ["loadCoef", 0.8];
		cgqc_perks_recon = true;
	};
	case "nam_basic":{
		LOG("[switchPerks] Nam Basic setup");
		player setUnitTrait ["audibleCoef", 0.8];
		player setUnitTrait ["camouflageCoef", 0.8];
		player setUnitTrait ["loadCoef", 0.9];
	};
	case "hq":{
		LOG("[switchPerks] HQ setup");
		["HQ"]call CGQC_fnc_setLeadership;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
		player setUnitTrait ["loadCoef", 0.75];
	};
	case "sl":{
		LOG("[switchPerks] SL setup");
		["SL"]call CGQC_fnc_setLeadership;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
		player setUnitTrait ["loadCoef", 0.75];
	};
	case "tl":{
		LOG("[switchPerks] TL setup");
		["TL"]call CGQC_fnc_setLeadership;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
		player setUnitTrait ["loadCoef", 0.75];
	};
	case "heli":{
		LOG("[switchPerks] Heli setup");
		player setUnitTrait ["engineer", true];
		// ------ Heli pilot --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_heli_getCrew", "Spawn Crew", "CGQC\textures\cgqc_ace_heli.paa", {
			["getCrew"] spawn CGQC_fnc_perksPilot
		}, {
			cgqc_perks_pilot &&
			!cgqc_perks_pilot_hasCrew &&
			(vehicle player isKindOf "Helicopter")
		} ] call ace_interact_menu_fnc_createAction;
		// get crew
		cgqc_action_getCrew = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_heli_delCrew", "Delete Crew", "", {
			["delCrew"] spawn CGQC_fnc_perksPilot
		}, {
			cgqc_perks_pilot && cgqc_perks_pilot_hasCrew
		} ] call ace_interact_menu_fnc_createAction;
		// Delete crew
		cgqc_action_delCrew = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_getCrew, cgqc_action_delCrew];
		cgqc_perks_pilot = true;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
	};
	case "heli_crew":{
		LOG("[switchPerks] HeliCrew setup");
		player setUnitTrait ["engineer", true];
	};
	case "jet":{
		LOG("[switchPerks] Jet setup");
		player setUnitTrait ["engineer", true];
		["transmit"] spawn CGQC_fnc_bluforceTracker;
	};
	case "driver":{
		LOG("[switchPerks] Tank driver setup");
		player setUnitTrait ["engineer", true];
		// ------ Tank driver --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_driver_getDriver", "Spawn Driver", "", {
			["getDriver"] spawn CGQC_fnc_perksPilot
		}, {
			cgqc_perks_driver &&
			!cgqc_perks_driver_hasDriver &&
			(vehicle player isKindOf "LandVehicle")
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_getDriver = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_driver_delDriver", "Delete Driver", "", {
			["delDriver"] spawn CGQC_fnc_perksPilot
		}, {
			cgqc_perks_driver && cgqc_perks_driver_hasDriver
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_delDriver = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_getDriver, cgqc_action_delDriver];
		cgqc_perks_driver = true;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
	};
	case "tank_crew":{
		LOG("[switchPerks] TankCrew setup");
		player setUnitTrait ["engineer", true];
	};
	case "recon":{
		LOG("[switchPerks] Recon setup");
		player setUnitTrait ["audibleCoef", 0.9];
		player setUnitTrait ["camouflageCoef", 0.9];
		player setUnitTrait ["UAVHacker", true];
		player setUnitTrait ["loadCoef", 0.8];
		// ------ Ghillie up --------------------------------------------------------------------------------------
		_action = [ "cgqc_perk_ghillie", " Ghillie up", "cgqc\textures\cgqc_ace_ghillie", {}, {
			!cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
		// All types
		_action = [ "cgqc_perk_ghillie_arid", "Arid", "", {
			_ct = ["arid"] spawn CGQC_fnc_perksRecon
		}, {
			!cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_arid = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_sarid", "Semi-Arid", "", {
			_ct = ["sarid"] spawn CGQC_fnc_perksRecon
		}, {
			cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_sarid = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_lush", "Lush", "", {
			_ct = ["lush"] spawn CGQC_fnc_perksRecon
		}, {
			!cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_lush = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
		_action = [ "cgqc_perk_ghillie_jungle", "Jungle", "", {
			_ct = ["jungle"] spawn CGQC_fnc_perksRecon
		}, {
			!cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_jungle = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "cgqc_perk_ghillie"], _action ] call ace_interact_menu_fnc_addActionToObject;
		// uniform
		_action = [ "cgqc_perk_ghillie_uniform", "Ghillie-> Uniforme", "", {
			_ct = ["uniform"] spawn CGQC_fnc_perksRecon
		}, {
			cgqc_perks_ghillie_isOn
		} ] call ace_interact_menu_fnc_createAction;
		cgqc_action_ghillie_uniform = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
		// compile all actions to list
		cgqc_perks_action_list = cgqc_perks_action_list + [cgqc_action_ghillie, cgqc_action_ghillie_arid, cgqc_action_ghillie_sarid, cgqc_action_ghillie_lush, cgqc_action_ghillie_jungle, cgqc_action_ghillie_uniform];
		cgqc_perks_recon = true;
	};
	case "eng":{
		LOG("[switchPerks] Engineer setup");
		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
		player setUnitTrait ["loadCoef", 0.7];
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
		LOG("[switchPerks] Medic setup");
		player setUnitTrait ["Medic", true];
		player setUnitTrait ["loadCoef", 0.6];
		cgqc_perks_medic = true;
		["transmit"] spawn CGQC_fnc_bluforceTracker;
	};
	case "lifesaver":{
		LOG("[switchPerks] CombatLifesaver setup");
		player setUnitTrait ["Medic", true];
		player setUnitTrait ["loadCoef", 0.8];
		cgqc_perks_medic = true;
	};
	case "at":{
		LOG("[switchPerks] AT setup");
		player setUnitTrait ["loadCoef", 0.7];
	};
	case "mg":{
		LOG("[switchPerks] MG setup");
		player setUnitTrait ["loadCoef", 0.7];
	};
	case "mortar":{
		LOG("[switchPerks] Mortar setup");
		player setUnitTrait ["loadCoef", 0.6];
	};
	case "inf":{
		LOG("[switchPerks] Infantry setup");
	};
	case "zeus":{
		LOG("[switchPerks] Zeus setup");
	};
	case "max":{
		LOG("[switchPerks] Max setup");
		/*
		// Shooting range
			_action = [ "menu_self_range", "Shooting Range WIP", "", {
				["spawn_range", true] spawn CGQC_fnc_perksBasic
			}, {
				cgqc_flag_isTraining
			} ] call ace_interact_menu_fnc_createAction;
			_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
		*/
	};
	default	{
		LOG("[CGQC_ERROR] switchPerks fail");
	};
};

LOG("[switchPerks] done");