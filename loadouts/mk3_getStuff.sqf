_item = _this select 0;

switch (_item)
do
{
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
	case "heal": {player call ACE_medical_treatment_fnc_fullHealLocal;hint "Patched up";};
	case "mags_primary": {
		_primary_mag = (primaryWeaponMagazine player) select 0;
		for "_i" from 1 to 5 do { 
			player addItem _primary_mag;
		};
		hint "5x Primary mags";
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
		hint "mk3_getStuff error";
		sleep 3;
	};
};





	