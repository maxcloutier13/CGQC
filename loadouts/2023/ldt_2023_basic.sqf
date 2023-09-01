 // --- 2023_basic ----------------------------------------------------------
// Basic 2023 loadout
params [["_target", player]];
diag_log format ["[CGQC_FNC] ldt_2023_basic %1 started", _target];


// === Clothing ==========================================================================================================
_hats = [ "cgqc_helmet_mk1"];
_goggles = ["G_max_can_gog"];
_vests = ["cgqc_vest_mk1_tan"];
_uniforms = ["cgqc_uniform_mk1"];
_rucks = ["cgqc_pack_mk1_magic"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_handgun = ["cgqc_gun_glock19_wood", "Tier1_20Rnd_9x19_JHP", "Tier1_DBALPL", "Tier1_SIG_Romeo1"];
[_handgun] call CGQC_fnc_getCustomHandgun;

// === Uniform Items ====================================================================================================

// === Vest Items ====================================================================================================
_target addItemToVest "ACE_M84";
_target addItemToVest "ACE_M84";
_target addItemToVest "ACE_M84";
_target addItemToVest "SmokeShell";
_target addItemToVest "SmokeShell";
_target addItemToVest "SmokeShell";
_target addItemToVest "rhs_mag_m67";
_target addItemToVest "rhs_mag_m67";

// === Backpack Items ====================================================================================================
_target addItemToBackpack "ACE_EntrenchingTool";
_target addItemToBackpack "ACE_Canteen";

diag_log "[CGQC_FNC] ldt_2023_basic done";