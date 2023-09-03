// --- getStuff ----------------------------------------------------------
// Mk3 spawn some shits
params ["_type"];
diag_log format ["[CGQC_FNC] getStuff %1 started", _type];

switch (_type) do {
	case "crate":
	{
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk2_arsenal"];
		player_crate = "cgqc_box_mk2_arsenal" createVehicle _pos_free;
		cgqc_player_crate = true;

	};
	case "del_crate":
	{
		deleteVehicle player_crate;
		cgqc_player_crate = false;

	};
	case "bandolier": {
		player addItem "cgqc_bandolier_ammo";
		hintSilent "Bandolier ajouté";

	};
	case "ifak": {
		player addItem "cgqc_items_ifak";
		hintSilent "IFAK ajouté";

	};
	case "medkit": {
		player addItem "cgqc_items_medkit";
		hintSilent "Medkit ajouté";

	};
	case "343":	{
		player addItem "ACRE_PRC343";
		hintSilent "343 ajoutée";

	};
	case "152":	{
		player addItem "ACRE_PRC152";
		hintSilent "152 ajoutée";

	};
	case "148":	{
		player addItem "ACRE_PRC148";
		hintSilent "148 ajoutée";

	};
	case "117":	{
		player addItem "ACRE_PRC117F";
		hintSilent "117f ajoutée";

	};
	case "77":	{
		player addItem "ACRE_PRC77";
		hintSilent "77 ajoutée";

	};
	case "52":	{
		player addItem "ACRE_SEM52SL";
		hintSilent "52 ajoutée";

	};
	case "earplugs": {
		player addItem "ACE_EarPlugs";
		hintSilent "earplugs ajoutés";

	};
	case "bandages": {
		for "_i" from 1 to 10 do {
			player addItem "ACE_fieldDressing";
		};
		hintSilent "bandages ajoutés";

	};
	case "painkillers": {
		for "_i" from 1 to 5 do {
			player addItem "FF_Painkiller";
		};
		hintSilent "painkillers ajoutés";

	};
	case "law": {
		player addWeapon "rhs_weap_m72a7";
		hintSilent "m72a7 law ajouté";

	};
	case "m136": {
		player addWeapon "rhs_weap_M136";
		hintSilent "m136 ajouté";

	};
	case "fuel": {
		supplies_fuelcan = "cgqc_box_mk1_fuelcan" createVehicle (position player);
		hintSilent "Fuelcan!";
	};
	case "vic_ammo": {
		supplies_fuelcan = "cgqc_box_mk1_ammocan" createVehicle (position player);
		hintSilent "Vic ammo!";

	};
	case "ammo": {
		supplies_fuelcan = "cgqc_box_mk1_supplies" createVehicle (position player);
		hintSilent "Ammo!";

	};
	case "mort60": {
		supplies_fuelcan = "cgqc_box_mk1_mortar" createVehicle (position player);
		hintSilent "60mm mortar!";

	};
	case "mort82": {
		supplies_fuelcan = "cgqc_box_mk1_mortar_mk6" createVehicle (position player);
		hintSilent "82mm mk6 mortar!!";

	};
	case "track": {
		supplies_fuelcan = "ACE_Track" createVehicle (position player);
		hintSilent "Spare track!!";

	};
	case "wheel": {
		supplies_fuelcan = "ACE_Wheel" createVehicle (position player);
		hintSilent "Spare wheel!!";

	};
	case "kidnap":{
		player addItemToBackpack "G_Blindfold_01_black_F";
		player addItemToBackpack "cgqc_helmet_kidnapping";
		player addItemToBackpack "cgqc_vest_kidnapping";

	};
	case "heal": {
		player call ACE_medical_treatment_fnc_fullHealLocal;
		hint "Patched up";

	};
	case "mags_primary": {
		[] call CGQC_fnc_addMags;
		hint "Refilled Primary mags";

	};
	case "mags_secondary": {
		_sec_mags = handgunMagazine player;
		_sec_mag = _sec_mags select 0;
		for "_i" from 1 to 2 do {
			player addItem _sec_mag;
		};
		hint "2x Secondary mags";

	};
	case "medic": {
		player setUnitTrait ["Medic", true];
		hint "Tu es medic";

	};
	case "engineer": {
		player setUnitTrait ["engineer", true];
		hint "Tu es ingénieur";

	};
	case "eod": {
		player setUnitTrait ["explosiveSpecialist", false];
		hint "Tu es EOD";

	};
	case "recon":{
		cgqc_perks_recon = true;
		hint "Tu es Recon";

	};
	case "driver": {
		cgqc_perks_driver = true;
		player setUnitTrait ["engineer", true];
		hint "Tu es Driver";

	};
	case "pilot": {
		cgqc_perks_pilot = true;
		player setUnitTrait ["engineer", true];
		hint "Tu es Pilote";

	};
	default	{
		diag_log "[CGQC_ERROR] getStuff fail";
	};
};

diag_log "[CGQC_FNC] getStuff done";