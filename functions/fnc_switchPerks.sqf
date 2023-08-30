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
		cgqc_perks_recon = true;
	};
	case "eng":{
		cgqc_perks_eng = true;
		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
	};
	case "med":{
		cgqc_perks_medic = true;
		//cgqc_perks_doctor = true;
		player setUnitTrait ["Medic", true];
	};
	case "at":{
	};
	case "mg":{
	};
	case "mortar":{
	};
	case "inf":{
	};
	default	{
		diag_log "[CGQC_ERROR] switchPerks fail";
	};
};

diag_log "[CGQC_FNC] switchPerks done";