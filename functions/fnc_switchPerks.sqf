// --- perkSwitch ----------------------------------------------------------
// Switch perks
params ["_type"];
diag_log format ["[CGQC_FNC] switchPerks %1 started", _type];

// Set all traits to default
[player] call CGQC_fnc_resetTraits;

switch (_type) do {
	case "zeus":{
	};
	case "hq":{
	};
	case "sl":{
	};
	case "tl":{
	};
	case "heli":{
		player setUnitTrait ["engineer", true];
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
		cgqc_perks_driver = true;
	};
	case "tank_crew":{
		player setUnitTrait ["engineer", true];
	};
	case "recon":{
		player setUnitTrait ["audibleCoef ", 0.9];
		player setUnitTrait ["camouflageCoef ", 0.9];
		player setUnitTrait ["UAVHacker", true];
		cgqc_perks_recon = true;
	};
	case "eng":{

		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
		player setUnitTrait ["loadCoef ", 0.9];
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
	default	{
		diag_log "[CGQC_ERROR] switchPerks fail";
	};
};

diag_log "[CGQC_FNC] switchPerks done";