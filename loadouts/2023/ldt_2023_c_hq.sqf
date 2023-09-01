 // --- ldt_2023_c_hq ----------------------------------------------------------
// HQ 2023 loadout
params [["_target", player]];
diag_log format ["[CGQC_FNC] ldt_2023_c_hq %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = [""];
_goggles = [""];
_vests = [""];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_radiobag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_command","cgqc_item_laserdesignator","JAS_GPNVG18_Full_blk_TI"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
["m4_lpvo"] call CGQC_fnc_switchPrimary;

// === Vest Items ====================================================================================================
for "_i" from 1 to 5 do {player addItemToVest "1Rnd_HE_Grenade_shell"};

// === Backpack Items ====================================================================================================
// === Drones ================================
player addItemToBackpack "Rev_darter_item";
// === Comms =================================
player addItemToBackpack "ACRE_VHF30108SPIKE";

diag_log "[CGQC_FNC] ldt_2023_c_hq done";