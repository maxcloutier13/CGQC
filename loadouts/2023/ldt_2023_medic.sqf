 // --- ldt_2023_s_medic ----------------------------------------------------------
// Medic 2023 loadout
params [["_target", player], ["_variant", "medic"], ["_gunVariant", "carbine"]];
diag_log format ["[CGQC_FNC] ldt_2023_s_medic %1 started", _target];

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
	case "carbine": {["m4_dotplus"] spawn CGQC_fnc_switchPrimary;};
	case "lpvo": {["m4_lpvo"] spawn CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "medic": {
		player removeItems "ACE_EntrenchingTool";
		for "_i" from 1 to 50 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 20 do {player addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_adenosine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
		player addItemToBackpack "FSGm_ItemMedicBag";
		player addItemToBackpack "ACE_SpraypaintRed";
		player addItemToBackpack "ACE_personalAidKit";
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bodyBag"};
	};
	case "lifesaver": {
		for "_i" from 1 to 25 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 10 do {player addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 10 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_adenosine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_bodyBag"};
	};
};

diag_log "[CGQC_FNC] ldt_2023_s_medic done";