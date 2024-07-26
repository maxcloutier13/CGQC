#include "\CGQC\script_component.hpp"
// --- swatVariants ----------------------------------------------------------
// All Swat variants
params [["_target", player], ["_variant", "tl"], ["_gunVariant", "mp5sd"], ["_mags", 4]];
LOG_1("[swatVariants] %1 started", _variant);

// Basic setup
[] call CGQC_ldt_swat_basic;
_hat = "cgqc_helmet_swatBlackCap";

switch (_variant) do {
    case "assault": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["2023_basic", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        for "_i" from 1 to 2 do {_target addItemToBackpack "tsp_flashbang_cts";};
        LOG("[swatAssaulter] done");
	};
    case "medic": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["hat", "cgqc_helmet_mk1_f_black_medic"] call CGQC_fnc_switchStuff;
        ["2023_basic", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        for "_i" from 1 to 10 do {_target addItemToBackpack "ACE_fieldDressing";};
        for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_epinephrine";};
        for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_morphine";};
        for "_i" from 1 to 10 do {_target addItemToBackpack "CGQC_Carbonate";};
        for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_salineIV";};
        for "_i" from 1 to 4 do {_target addItemToBackpack "ACE_salineIV_500";};
        for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_tourniquet";};
        LOG("[swatMedic] done");
	};
    case "breacher": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["2023_basic", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        _target addItemToBackpack "ACE_wirecutter";
        for "_i" from 1 to 10 do {_target addItemToVest "tsp_popperCharge_mag"};
        for "_i" from 1 to 10 do {_target addItemToVest "tsp_stickCharge_mag"};
        for "_i" from 1 to 5 do {_target addItemToVest "tsp_frameCharge_mag"};
        _mags = 8;
        LOG("[swatBreacher] done");
	};

    case "sniper": {
        ["vest", "cgqc_vest_swat_X"] call CGQC_fnc_switchStuff;
        ["2023_command", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        //_target addItemToUniform "ACRE_PRC152";
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
        ["2023_command", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        //_target addItemToUniform "ACRE_PRC152";
        _target addItemToBackpack "ACE_UAVBattery";
        _target addItemToBackpack "ACE_UAVBattery";
		_target addItemToBackpack "rev_darter_item";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
        LOG("[swatDrone] done");
	};
    case "tl": {
        ["vest", "cgqc_vest_swat_officer"] call CGQC_fnc_switchStuff;
        _hat = "cgqc_helmet_swatCap";
        ["2023_command", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        //_target addItemToUniform "ACRE_PRC152";
        LOG("[swatTL] done");
	};
    case "hq": {
        ["vest", "cgqc_vest_swat_officer"] call CGQC_fnc_switchStuff;
        _hat = "cgqc_helmet_swatOfficerCap";
        ["2023_command", "cgqc_item_rangefinder", "NVGoggles_mas_can_hv", true, true] call CGQC_fnc_getLinkedItems;
        //_target addItemToUniform "ACRE_PRC152";
        //_target addItemToUniform "ACRE_PRC152";
		_target addItemToBackpack "sps_black_hornet_01_Static_F";
        LOG("[swatHQ] done");
	};
};

_target removeItem "cgqc_items_ifak";
for "_i" from 1 to 4 do {_target addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_target addItemToUniform "FF_Painkiller";};
_target addItemToUniform "ACE_morphine";
_target addItemToUniform "ACE_epinephrine";
_target addItemToUniform "ACE_splint";
_target addItemToUniform "ACE_tourniquet";
_target addItemToBackpack "ACE_tourniquet";
_target addItemToBackpack "ACE_salineIV_500";

[player] call GRAD_slingHelmet_fnc_actionSling;
// Default SWAT Hat
["hat", _hat] call CGQC_fnc_switchStuff;
// === Primary ==========================================================================================================
[_gunVariant, _mags] spawn CGQC_fnc_switchPrimary;

LOG("[swat_variants] done");