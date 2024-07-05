#include "\CGQC\script_component.hpp"
// --- swatVariants ----------------------------------------------------------
// All Swat variants
params [["_target", player], ["_variant", "tl"], ["_gunVariant", "mp5sd"]];
LOG_1("[swatVariants] %1 started", _variant);

// Basic setup
[] call CGQC_ldt_swat_basic;

switch (_variant) do {
    case "assault": {
        ["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        for "_i" from 1 to 6 do {_target addItemToBackpack "ACE_M84";};
        for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_m7a3_cs"};
        for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};
        LOG("[swatAssaulter] done");
	};
    case "medic": {
        ["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        for "_i" from 1 to 20 do {_target addItemToBackpack "ACE_fieldDressing";};
        for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_epinephrine";};
        for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_morphine";};
        for "_i" from 1 to 5 do {_target addItemToBackpack "ACE_salineIV";};
        for "_i" from 1 to 6 do {_target addItemToBackpack "ACE_M84";};
        LOG("[swatMedic] done");
	};
    case "breacher": {
        ["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        _target addItemToBackpack "ACE_wirecutter";
        for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_m7a3_cs"};
        for "_i" from 1 to 10 do {_target addItemToVest "tsp_popperCharge_mag"};
        for "_i" from 1 to 10 do {_target addItemToVest "tsp_stickCharge_mag"};
        for "_i" from 1 to 5 do {_target addItemToVest "tsp_frameCharge_mag"};
        LOG("[swatBreacher] done");
	};
    case "eod": {
        ["2023_basic", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_kitbag_black"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACE_M26_Clacker";
        _target addItemToBackpack "ToolKit";
        _target addItemToBackpack "ACE_DefusalKit";
        for "_i" from 1 to 4 do {player addItemToBackpack "ace_marker_flags_red"};
        for "_i" from 1 to 4 do {player addItemToBackpack "ace_marker_flags_green"};
        [_target] call CGQC_fnc_removeHandgun;
        _target addWeapon "ACE_VMH3";
		_target addItemToBackpack "ToolKit";
		_target addItemToBackpack "ACE_SpraypaintGreen";
		_target addItemToBackpack "ACE_SpraypaintRed";
        LOG("[swatBreacher] done");
	};
    case "sniper": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["2023_command", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToUniform "ACE_RangeCard";
        _target addItemToUniform "ACE_Kestrel4500";
        _target addItemToUniform "ACE_ATragMX";
        _target addItemToBackpack "ACE_Tripod";
        _target addItemToBackpack "ACE_Vector";
        LOG("[swatAssaulter] done");
	};
    case "drone": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["backpack", "cgqc_pack_mk1_kitbag_black"] call CGQC_fnc_switchStuff;
        ["2023_command", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToBackpack "ACE_UAVBattery";
        _target addItemToBackpack "ACE_UAVBattery";
		_target addItemToBackpack "rev_darter_item";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
        LOG("[swatDrone] done");
	};
    case "tl": {
        ["2023_command", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_officer"] call CGQC_fnc_switchStuff;
        _target addItemToUniform "ACRE_PRC152";
        for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};
        for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_m7a3_cs"};
        LOG("[swatTL] done");
	};
    case "hq": {
        ["2023_command", "cgqc_item_rangefinder", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;
        ["vest", "cgqc_vest_swat_officer"] call CGQC_fnc_switchStuff;
        ["hat", "Max_swat_officer_cap"] call CGQC_fnc_switchStuff;
        removeGoggles player;
        _target addItemToUniform "ACRE_PRC152";
        _target addItemToUniform "ACRE_PRC152";
        for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};
        for "_i" from 1 to 4 do {player addItemToBackpack "rhs_mag_m7a3_cs"};
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
        LOG("[swatHQ] done");
	};
};

// === Primary ==========================================================================================================
[_gunVariant] spawn CGQC_fnc_switchPrimary;