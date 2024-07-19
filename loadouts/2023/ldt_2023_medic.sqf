#include "\CGQC\script_component.hpp"
// --- ldt_2023_s_medic ----------------------------------------------------------
// Medic 2023 loadout
params [["_target", player], ["_variant", "medic"], ["_gunVariant", "carbine"]];
LOG(" ldt_2023_s_medic started");
// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1_medic"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_rf"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_carryall"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "carbine": {["m4_elcan"] spawn CGQC_fnc_switchPrimary;};
	case "lpvo": {["m4_lpvo"] spawn CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "medic": {
		player removeItems "ACE_EntrenchingTool";
		for "_i" from 1 to cgqc_config_medkit_bandages do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to cgqc_config_medkit_1000 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to cgqc_config_medkit_500 do {player addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to cgqc_config_medkit_painkill do {player addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to cgqc_config_medkit_morphine do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to cgqc_config_medkit_adenosine do {player addItemToBackpack "ACE_adenosine";};
		for "_i" from 1 to cgqc_config_medkit_epi do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to cgqc_config_medkit_splint do {player addItemToBackpack "ACE_splint";};
		for "_i" from 1 to cgqc_config_medkit_tourniquet do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to cgqc_config_medkit_ammonium do {_target addItemToBackpack "CGQC_Carbonate"};
		for "_i" from 1 to cgqc_config_medkit_medbag do {player addItemToBackpack "FSGm_ItemMedicBag";};
		for "_i" from 1 to cgqc_config_medkit_bodybag do {player addItemToBackpack "ACE_bodyBag"};
		for "_i" from 1 to cgqc_config_medkit_pak do {player addItemToBackpack "ACE_personalAidKit"};
		for "_i" from 1 to cgqc_config_medkit_smoke do {_target addItemToBackpack "SmokeShellPurple"};
		player addItemToBackpack "ACE_SpraypaintRed";
	};
	case "lifesaver": {
		for "_i" from 1 to 25 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 10 do {player addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bodyBag"};
	};
};

LOG(" ldt_2023_s_medic done");