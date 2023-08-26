// --- perkSwitch ----------------------------------------------------------
// Switch perks

_type = _this select 0;

// Set all traits to default
player setUnitTrait ["Medic", false];
player setUnitTrait ["engineer", false];
player setUnitTrait ["explosiveSpecialist", false];

// Remove ghillie up and other perks
cgqc_perks_basic = true;
cgqc_perks_recon = false;
cgqc_perks_pilot = false;
cgqc_perks_driver = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;
cgqc_perks_doctor = false;

// Every CplC is a medic
/* 
if (cgqc_player_rank > 2) then 
{
	player setUnitTrait ["Medic", true];
	cgqc_perks_medic = true;
};*/

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
		hintc "mk3_switch_perks.sqf fail";
	};
};