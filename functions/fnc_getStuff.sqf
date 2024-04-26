#include "\CGQC\script_component.hpp"
// --- getStuff ----------------------------------------------------------
// Mk3 spawn some shits
params ["_type"];
LOG_2(" getStuff %1 started", _type);


_addItem = false;
_item = "";

switch (_type) do {
	case "strip_152": {
		_target = cursorTarget;
		_targetID = owner _target;
		[_target, "ACRE_PRC152"] remoteExec ["removeItems", _targetID];
		hint "Removed all 152's"
	};
	case "crate": {
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk2_arsenal"];
		player_crate = "cgqc_box_mk2_arsenal" createVehicle _pos_free;
		cgqc_player_crate = true;
	};
	case "del_crate": {
		deleteVehicle player_crate;
		cgqc_player_crate = false;
	};
	case "key": {["side", player] call CGQC_fnc_getKey;};
	case "bandolier": {_addItem = true;_item = "cgqc_bandolier_ammo"};
	case "ifak": {_addItem = true;_item = "cgqc_items_ifak"};
	case "medkit": {_addItem = true;_item = "cgqc_items_medkit"};
	case "343":	{_addItem = true;_item = "ACRE_PRC343"};
	case "152":	{_addItem = true;_item = "ACRE_PRC152"};
	case "148":	{_addItem = true;_item = "ACRE_PRC148"};
	case "117":	{_addItem = true;_item = "ACRE_PRC117F"};
	case "77": {_addItem = true;_item = "ACRE_PRC77"};
	case "52": {_addItem = true;_item = "ACRE_SEM52SL"};
	case "earplugs": {_addItem = true;_item = "ACE_EarPlugs"};
	case "bandages": {for "_i" from 1 to 10 do {player addItem "ACE_fieldDressing"}};
	case "painkillers": {for "_i" from 1 to 5 do {player addItem "FF_Painkiller";};};
	case "law": {player addWeapon "rhs_weap_m72a7";};
	case "m136": {player addWeapon "rhs_weap_M136";};
	case "fuel": {supplies_item = "cgqc_box_mk1_fuelcan" createVehicle (position player);};
	case "vic_ammo": {supplies_item = "cgqc_box_mk1_ammocan" createVehicle (position player);};
	case "ammo": {supplies_item = "cgqc_box_mk1_supplies" createVehicle (position player);};
	case "exp": {supplies_item = "cgqc_box_mk1_explosives" createVehicle (position player);};
	case "mort60": {supplies_item = "cgqc_box_mk1_mortar" createVehicle (position player);};
	case "mort82": {supplies_item = "cgqc_box_mk1_mortar_mk6" createVehicle (position player);};
	case "track": {supplies_item = "ACE_Track" createVehicle (position player);};
	case "wheel": {supplies_item = "ACE_Wheel" createVehicle (position player);};
	case "kidnap":{player addItemToBackpack "G_Blindfold_01_black_F"; player addItemToBackpack "cgqc_helmet_kidnapping"; player addItemToBackpack "cgqc_vest_kidnapping";};
	case "heal": {player call ACE_medical_treatment_fnc_fullHealLocal;hint "Patched up";};
	case "mags_primary": {[] call CGQC_fnc_addMags;};
	case "mags_secondary": {
		_sec_mags = handgunMagazine player;
		_sec_mag = _sec_mags select 0;
		for "_i" from 1 to 2 do {
			player addItem _sec_mag;
		};
		hint "2x Secondary mags";

	};
	default	{
		ERROR("[CGQC_ERROR] getStuff fail");
	};
};

// Add item if needed.
if (_addItem) then {
	_canAdd = player canAddItemToUniform _item || player canAddItemToVest _item || player canAddItemToBackpack _item;
	if (_canAdd) then {
		player addItem _item;
		hint format ["Item %1 added", _item];
	} else {
		hint "No room for that item";
	};
};

LOG(" getStuff done");