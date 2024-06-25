#include "\CGQC\script_component.hpp"
// --- pmct_basic ----------------------------------------------------------
// Basic PMCT loadout
params [["_target", player]];
LOG("[pmct_basic] started");

// === Clothing ==========================================================================================================
_hats = [ "PO_H_SSh68Helmet_Partizan_2"];
_goggles = ["G_Bandanna_blk"];
_vests = ["LOP_V_CarrierLite_TAN"];
_uniforms = ["U_mas_can_B_CombatUniform_T_aor2"];
_rucks = ["B_AssaultPack_cbr"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
LOG("[pmct_basic] callin gloadLoadout");
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_handgun = ["rhs_weap_pya", "rhs_mag_9x19_7n31_17"];
[_handgun, 2, false] call CGQC_fnc_getCustomHandgun;

// === Basic linked items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";

// === Uniform Items ====================================================================================================
_target addItemToUniform "cgqc_items_ifak";
_target addItemToUniform "ACRE_PRC343";
_target addItemToUniform "ItemAndroid";
_target addItemToUniform "ACE_Cellphone";
_target addItemToUniform "ACE_EarPlugs";
_target addItemToUniform "ACE_CableTie";
_target addItemToUniform "ACE_CableTie";

// === Vest Items ====================================================================================================
_target addItemToVest "SmokeShell";
_target addItemToVest "SmokeShell";
_target addItemToVest "rhs_mag_rgd5";
_target addItemToVest "rhs_mag_rgd5";

// === Backpack Items ====================================================================================================
_target addItemToBackpack "ACE_EntrenchingTool";
_target addItemToBackpack "ACE_Canteen";

LOG("[pmct_basic] done");