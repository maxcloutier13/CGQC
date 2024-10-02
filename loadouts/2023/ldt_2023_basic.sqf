#include "\CGQC\script_component.hpp"
// --- 2023_basic ----------------------------------------------------------
// Basic 2023 loadout
params [["_target", player]];
LOG(" ldt_2023_basic started");

// === Clothing ==========================================================================================================
_hats = [ "cgqc_helmet_mk1"];
_goggles = ["G_mas_can_gog"];
_vests = ["cgqc_vest_mk1_tan"];
_uniforms = ["cgqc_uniform_mk1"];
_rucks = ["cgqc_pack_mk1_magic"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_handgun = ["cgqc_gun_glock19_wood", "Tier1_20Rnd_9x19_JHP", "Tier1_DBALPL", "Tier1_SIG_Romeo1"];
[_handgun] call CGQC_fnc_getCustomHandgun;

// === Uniform Items ====================================================================================================
_target addItemToUniform "azm_bft_tx";
_target addItemToUniform "azm_bft_rx";
_target addItemToUniform "ACE_Canteen";
_target addItemToUniform "ACE_MapTools";
// === Vest Items ====================================================================================================
_target addItemToVest "tsp_flashbang_cts";
_target addItemToVest "tsp_flashbang_cts";
_target addItemToVest "tsp_flashbang_cts";
_target addItemToVest "SmokeShell";
_target addItemToVest "SmokeShell";
_target addItemToVest "SmokeShell";
_target addItemToVest "rhs_mag_m67";
_target addItemToVest "rhs_mag_m67";
_target addItemToVest "MiniGrenade";
_target addItemToVest "MiniGrenade";
_target addItemToVest "ACE_EntrenchingTool";



LOG(" ldt_2023_basic done");