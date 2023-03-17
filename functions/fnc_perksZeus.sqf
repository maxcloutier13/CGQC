// --- perksZeus ----------------------------------------------------------
// Perks for the gods

_type = _this select 0;

switch (_type) do {
	case "delete": {
		{
			deleteVehicle _x
		} forEach allDead;
		hint "Dead deleted";
	};
	case "343":
	{
		player addItemToBackpack "ACRE_PRC343";
		hint "Got: 343";
	};
	case "152":
	{
		player addItemToBackpack "ACRE_PRC152";
		hint "Got: 152";
	};
	case "117":
	{
		player addItemToBackpack "ACRE_PRC117F";
		hint "Got: 117";
	};
	case "crate":
	{
		zeus_crate="cgqc_box_mk2_arsenal" createVehicle (position player);
		cgqc_zeus_crate = true;
	};
	case "del_crate":
	{
		deleteVehicle zeus_crate;
		cgqc_zeus_crate = false;
	};
	case "cargo":
	{
		zeus_cargo="cgqc_box_mk2_cargo" createVehicle (position player);
		cgqc_zeus_cargo = true;
	};
	case "del_cargo":
	{
		deleteVehicle zeus_cargo;
		cgqc_zeus_cargo = false;
	};
	case "animation_on": {
		cgqc_mk2_animation_locked = true; 
		publicVariable "cgqc_mk2_animation_locked";
	};
	case "animation_off": {
		cgqc_mk2_animation_locked = false;
		publicVariable "cgqc_mk2_animation_locked";
	};
	case "animation_setting": {
		publicVariable "cgqc_mk2_animation_locked";
	};
	default
	{
		hint "fnc_perksZeus fucked up";
	};
};