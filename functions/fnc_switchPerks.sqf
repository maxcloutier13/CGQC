#include "\CGQC\script_component.hpp"
// --- switchPerks ----------------------------------------------------------
// switch perks
// ["eng", true, true] spawn CGQC_fnc_switchPerks;
params ["_type", ["_clearFirst", true], ["_pause", false]];
LOG_2("[switchPerks] %1/Clear:%2 started", _type, _clearFirst);

if (_pause) then {
	sleep 1;
};

if (_clearFirst) then {
	// set all traits to default
	LOG("[switchPerks] Clear traits and perks");
	[player] call CGQC_fnc_resetTraits;
	["clear"] call CGQC_fnc_addPerksSpecial;
	["reset"]call CGQC_fnc_setLeadership;
};

switch (_type) do {

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
		["heli"] call CGQC_fnc_addPerksSpecial;
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
		["driver"] call CGQC_fnc_addPerksSpecial;
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
		player setUnitTrait ["camouflageCoef", 0.8];
		player setUnitTrait ["UAVHacker", true];
		player setUnitTrait ["loadCoef", 0.6];
		["recon"] call CGQC_fnc_addPerksSpecial;
		cgqc_perks_recon = true;
	};
	case "drone":{
		LOG("[switchPerks] Drone Op setup");
		player setUnitTrait ["UAVHacker", true];
		player setUnitTrait ["loadCoef", 0.9];
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
	case "eod":{
		LOG("[switchPerks] EOD setup");
		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
		player setUnitTrait ["loadCoef", 0.7];
		cgqc_perks_eod = true;
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
		player setUnitTrait ["loadCoef", 0.9];
		cgqc_perks_medic = true;
	};
	case "at":{
		LOG("[switchPerks] AT setup");
		player setUnitTrait ["loadCoef", 0.7];
	};
	case "mg":{
		LOG("[switchPerks] MG setup");
		player setUnitTrait ["loadCoef", 0.8];
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
		["zeus"] spawn CGQC_fnc_perksZeus;
		["zeus", false] spawn CGQC_fnc_addPerksSpecial;
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
	default	{
		LOG("[CGQC_ERROR] switchPerks fail");
	};
};

// Saving data
cgqc_player_trait_loadCoef = player getUnitTrait "loadCoef";
cgqc_player_trait_audibleCoef  = player getUnitTrait "audibleCoef";
cgqc_player_trait_camoCoef  = player getUnitTrait "camouflageCoef";

[] call CGQC_fnc_reloadTraits;

LOG("[switchPerks] done");