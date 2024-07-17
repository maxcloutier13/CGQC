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
        for "_i" from 1 to 6 do {player addItemToUniform "ACE_CableTie"};
        LOG("[swatRCMP] done");
	};
    case "fto": {
        _hats = ["cgqc_beanie_black"];
        _goggles = ["G_Aviator"];
        _vests = ["CDF_plateframe_sapi_light"];
        _uniforms = ["fto_uni"];
        _rucks = ["MrCat_TacticalBelt"];
        _loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
        [_loadout] call CGQC_fnc_loadLoadout;
        _gun = ["hlc_pistol_P226R_Combat",
                "Tier1_DBALPL",
                "hlc_15Rnd_9x19_SD_P226"];
        [_gun, 4, false] call CGQC_fnc_getCustomHandgun;
        _target addItemToUniform "ACRE_PRC152";
        for "_i" from 1 to 6 do {player addItemToUniform "ACE_CableTie"};
        // === Vest ================================================================================================================
        for "_i" from 1 to 4 do {player addItemToBackpack "tsp_flashbang_cts"};
        for "_i" from 1 to 2 do {player addItemToBackpack "rhs_mag_m7a3_cs"};
        for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell"};
        _target addItemToBackpack "cgqc_uniform_swat_cqb";
        _target addItemToBackpack "G_mas_can_gasmask";
        _target addItemToBackpack "cgqc_helmet_mk1_f_black";
        LOG("[swatFTO] done");
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
       LOG("[swatEMD] done");
    };
    case "eod": {
        _hats = ["EOD9_HELMET"];
        _goggles = [""];
        _vests = ["EOD_SUIT_vest"];
        _uniforms = ["EOD_Uniform"];
        _rucks = ["cgqc_pack_mk1_magic"];
        _loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
        [_loadout] call CGQC_fnc_loadLoadout;
        _target addItemToUniform "ACE_M26_Clacker";
        _target addItemToBackpack "ToolKit";
        _target addItemToBackpack "ACE_DefusalKit";
        for "_i" from 1 to 4 do {player addItemToBackpack "ace_marker_flags_red"};
        for "_i" from 1 to 4 do {player addItemToBackpack "ace_marker_flags_green"};
        for "_i" from 1 to 4 do {player addItemToBackpack "rhsusf_m112_mag"};
        _target addWeapon "ACE_VMH3";
		_target addItemToBackpack "ToolKit";
		_target addItemToBackpack "ACE_SpraypaintGreen";
		_target addItemToBackpack "ACE_SpraypaintRed";
        [player] call GRAD_slingHelmet_fnc_actionSling;
        // Default SWAT Hat
        ["hat", "Max_fbi_cap"] call CGQC_fnc_switchStuff;
        LOG("[swatEOD] done");
	};
};

// Common Items
_target linkItem "ItemWatch";
_target linkItem "ItemMap";
_target linkItem "ItemCompass";
_target linkItem "ItemGPS";
_target addItemToUniform "ACE_Flashlight_KSF1";
_target addItemToUniform "acex_intelitems_notepad";
_target addItemToUniform "WBK_HeadLampItem";
_target addItemToUniform "ACRE_PRC152";
_target addItemToUniform "ItemMicroDAGR";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToUniform "ACE_Chemlight_UltraHiOrange";
_target addItemToBackpack "ACE_HandFlare_Green";
_target addItemToBackpack "ACE_HandFlare_Green";
_target addItemToBackpack "ACE_HandFlare_Green";
for "_i" from 1 to 4 do {_target addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_target addItemToUniform "FF_Painkiller";};
_target addItemToUniform "ACE_morphine";
_target addItemToUniform "ACE_epinephrine";
_target addItemToUniform "ACE_splint";
_target addItemToUniform "ACE_tourniquet";
_target addItemToBackpack "ACE_tourniquet";
_target addItemToBackpack "ACE_salineIV_500";