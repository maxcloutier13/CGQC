#include "\CGQC\script_component.hpp"
// --- swatOthers ----------------------------------------------------------
// Other roles that do not use the base swat setup
params [["_target", player], ["_variant", "paramedic"], ["_gunVariant", "none"]];
LOG_1("[swatOthers] %1 started", _variant);

switch (_variant) do {
    case "rcmp": {
        _hats = ["H_Cap_police", "AM_PatrolHat"];
        _goggles = ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Red", "G_Aviator"];
        _vests = ["MrCats_JPCVest_Police_3_normal", "MrCats_JPCVest_Police_2_normal", "MrCats_JPCVest_Police_normal"];
        _uniforms = ["police_uni1"];
        _rucks = ["AM_PoliceBelt"];
        _loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
        [_loadout] call CGQC_fnc_loadLoadout;
        _gun = ["Tier1_P320", "hlc_15Rnd_9x19_JHP_P226", "hlc_acc_TLR1"];
        [_gun] call CGQC_fnc_getCustomHandgun;
	};
    case "fto": {
        _hats = ["cgqc_beanie_black"];
        _goggles = ["G_Aviator"];
        _vests = ["V_mas_can_belt_carrier_LR_swat"];
        _uniforms = ["fto_uni"];
        _rucks = ["cgqc_pack_mk1_magic_zeus"];
        _loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
        [_loadout] call CGQC_fnc_loadLoadout;
        _gun = ["Tier1_P320", "hlc_15Rnd_9x19_JHP_P226", "hlc_acc_TLR1"];
        [_gun] call CGQC_fnc_getCustomHandgun;
        _target addItemToUniform "ACRE_PRC152";

        _target addItemToVest "ACE_M84";
        _target addItemToVest "ACE_M84";
        _target addItemToVest "ACE_M84";
        _target addItemToVest "ACE_M84";
        _target addItemToUniform "ACE_Flashlight_KSF1";
        for "_i" from 1 to 6 do {player addItemToUniform "ACE_CableTie"};
        // === Vest ================================================================================================================
        for "_i" from 1 to 4 do {player addItemToVest "ACE_M84"};
        for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_m7a3_cs"};
        for "_i" from 1 to 2 do {player addItemToVest "SmokeShell"};
        _target addItemToBackpack "cgqc_vest_swat_officer";
        _target addItemToBackpack "cgqc_uniform_swat_cqb";
        _target addItemToBackpack "G_mas_can_gasmask";
        _target addItemToBackpack "cgqc_helmet_mk1_f_black";
	};
    case "emt": {
        _hats = ["c_paramedic_1"];
        _goggles = [""];
        _vests = ["cgqc_vest_swat_ems"];
        _uniforms = ["U_pa_paramedicUniform_1"];
        _rucks = ["cgqc_pack_mk1_magic"];
        _loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
        [_loadout] call CGQC_fnc_loadLoadout;
       _target addItemToBackpack "cgqc_items_medkit";
    };
};

// Common Items
_target linkItem "ItemWatch";
_target linkItem "ItemMap";
_target linkItem "ItemCompass";
_target linkItem "ItemGPS";
_target addItemToUniform "cgqc_items_ifak";
_target addItemToUniform "acex_intelitems_notepad";
_target addItemToUniform "WBK_HeadLampItem";
_target addItemToUniform "ACRE_PRC152";
_target addItemToUniform "ItemMicroDAGR";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToVest "ACE_HandFlare_Green";
_target addItemToVest "ACE_HandFlare_Green";
_target addItemToVest "ACE_HandFlare_Green";