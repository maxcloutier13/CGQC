#include "\CGQC\script_component.hpp"
// --- pmct_basic ----------------------------------------------------------
// Basic PMCT loadout
params [["_target", player]];
LOG("[pmct_basic] started");

// === Clothing ==========================================================================================================
_hats = [ "PO_H_SSh68Helmet_Partizan_2"];
_goggles = ["G_Bandanna_blk"];
_vests = ["cgqc_vest_pmct_tan"];
_uniforms = ["cgqc_uniform_pmct_cadpat"];
_rucks = ["B_AssaultPack_cbr"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
LOG("[pmct_basic] callin gloadLoadout");
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
player addWeapon "rhs_weap_pya";
player addHandgunItem "rhs_mag_9x19_7n31_17";
player addItemToUniform "rhs_mag_9x19_7n31_17";
player addItemToUniform "rhs_mag_9x19_7n31_17";
player addItemToUniform "rhs_mag_9x19_7n31_17";

// === Basic linked items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
player addWeapon "Binocular";

// === Uniform Items ====================================================================================================
_target addItemToUniform "cgqc_items_ifak";
_target addItemToUniform "ACRE_PRC343";
_target addItemToUniform "ItemAndroid";
_target addItemToUniform "ACE_EarPlugs";
_target addItemToUniform "ACE_CableTie";
_target addItemToUniform "ACE_CableTie";

// === Vest Items ====================================================================================================
_target addItemToUniform "SmokeShell";
_target addItemToUniform "SmokeShell";
_target addItemToVest "rhs_mag_rgd5";
_target addItemToVest "rhs_mag_rgd5";

// === Backpack Items ====================================================================================================
_target addItemToBackpack "ACE_EntrenchingTool";
_target addItemToBackpack "ACE_Canteen";

LOG("[pmct_basic] done");