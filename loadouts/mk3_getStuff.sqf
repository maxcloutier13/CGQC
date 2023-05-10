// --- mk3GetStuff ----------------------------------------------------------
// Mk3 spawn some shits

_item = _this select 0;
_skip = 0;
switch (_item) do {
	case "crate":
	{
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk2_arsenal"];
		player_crate = "cgqc_box_mk2_arsenal" createVehicle _pos_free;
		cgqc_player_crate = true;
		break;
	};
	case "del_crate":
	{
		deleteVehicle player_crate;
		cgqc_player_crate = false;
		break;
	};
	case "343":	{
		player addItem "ACRE_PRC343";
		hintSilent "343 ajoutée";
		break;
	};
	case "152":	{
		player addItem "ACRE_PRC152";
		hintSilent "152 ajoutée";
		break;
	};
	case "148":	{
		player addItem "ACRE_PRC148";
		hintSilent "148 ajoutée";
		break;
	};
	case "117":	{
		player addItem "ACRE_PRC117F";
		hintSilent "117f ajoutée";
		break;
	};
	case "77":	{
		player addItem "ACRE_PRC77";
		hintSilent "77 ajoutée";
		break;
	};
	case "52":	{
		player addItem "ACRE_SEM52SL";
		hintSilent "52 ajoutée";
		break;
	};
	case "earplugs": {
		player addItem "ACE_EarPlugs";
		hintSilent "earplugs ajoutés";
		break;
	};
	case "bandages": {
		for "_i" from 1 to 10 do {
			player addItem "ACE_fieldDressing";
		};
		hintSilent "bandages ajoutés";
		break;
	};
	case "painkillers": {
		for "_i" from 1 to 5 do {
			player addItem "FF_Painkiller";
		};
		hintSilent "painkillers ajoutés";
		break;
	};
	case "law": {
		player addWeapon "rhs_weap_m72a7";
		hintSilent "m72a7 law ajouté";
		break;
	};
	case "m136": {
		player addWeapon "rhs_weap_M136";
		hintSilent "m136 ajouté";
		break;
	};
	case "fuel": {
		supplies_fuelcan = "cgqc_box_mk1_fuelcan" createVehicle (position player);
		hintSilent "Fuelcan!";
	};
	case "vic_ammo": {
		supplies_fuelcan = "cgqc_box_mk1_ammocan" createVehicle (position player);
		hintSilent "Vic ammo!";
		break;
	};
	case "ammo": {
		supplies_fuelcan = "cgqc_box_mk1_supplies" createVehicle (position player);
		hintSilent "Ammo!";
		break;
	};
	case "mort60": {
		supplies_fuelcan = "cgqc_box_mk1_mortar" createVehicle (position player);
		hintSilent "60mm mortar!";
		break;
	};
	case "mort82": {
		supplies_fuelcan = "cgqc_box_mk1_mortar_mk6" createVehicle (position player);
		hintSilent "82mm mk6 mortar!!";
		break;
	};
	case "track": {
		supplies_fuelcan = "ACE_Track" createVehicle (position player);
		hintSilent "Spare track!!";
		break;
	};
	case "wheel": {
		supplies_fuelcan = "ACE_Wheel" createVehicle (position player);
		hintSilent "Spare wheel!!";
		break;
	};
	case "kidnap":{
		player addItemToBackpack "G_Blindfold_01_black_F";
		player addItemToBackpack "cgqc_helmet_kidnapping";
		player addItemToBackpack "cgqc_vest_kidnapping";
		break;
	};
	case "heal": {
		player call ACE_medical_treatment_fnc_fullHealLocal;
		hint "Patched up";
		break;
	};
	case "mags_primary": {
		_primary_mag = (primaryWeaponMagazine player) select 0;
		for "_i" from 1 to 5 do { 
			player addItem _primary_mag;
		};
		hint "5x Primary mags";
		break;
	};
	case "mags_secondary": {
		_sec_mags = handgunMagazine player;
		_sec_mag = _sec_mags select 0;
		for "_i" from 1 to 2 do { 
			player addItem _sec_mag;
		};
		hint "2x Secondary mags";
		break;
	};
	case "medic": {
		player setUnitTrait ["Medic", true];
		hint "Tu es medic";
		break;
	};
	case "engineer": {
		player setUnitTrait ["engineer", true];		
		hint "Tu es ingénieur";
		break;
	};
	case "eod": {
		player setUnitTrait ["explosiveSpecialist", false];
		hint "Tu es EOD";
		break;
	};
	case "recon":{
		cgqc_perks_recon = true;
		hint "Tu es Recon";
		break;
	};
	case "driver": {
		cgqc_perks_driver = true;
		player setUnitTrait ["engineer", true];	
		hint "Tu es Driver";
		break;
	};
	case "pilot": {
		cgqc_perks_pilot = true;
		player setUnitTrait ["engineer", true];	
		hint "Tu es Pilote";
		break;
	};
	default	{
		hint "mk3_getStuff error";
		sleep 3;
	};
};