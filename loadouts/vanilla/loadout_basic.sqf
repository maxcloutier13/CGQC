// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Vanilla

// Prep for switch
[player] call CGQC_fnc_loadoutPrep;

// === Clothing ==========================================================================================================
// === Random Hat 
_hats = ["H_HelmetSpecB"];
_goggles = [""];
_vests = ["V_PlateCarrier1_rgr"];
_uniforms = ["cgqc_uniform_mk1"];
_rucks = ["B_AssaultPack_rgr"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
player addWeapon "cgqc_gun_p99_wood";
player addHandgunItem "16Rnd_9x21_Mag";

// === Items ==================================================================================================================
["modern", "ACE_NVG_Gen4_Black"] call CGQC_fnc_getLinkedItems;

// === Binos
player addWeapon "cgqc_item_rangefinder";

// === Vest ================================================================================================================
// Throwables
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade"};
for "_i" from 1 to 2 do {player addItemToVest "ACE_CTS9"};
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell"};

// === Uniform ================================================================================================================
// Handgun mags
for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag"};
// === Essentials 
player addItemToUniform "ACE_EarPlugs"; 
player addItemToUniform "ACE_RangeCard";
player addItemToUniform "WBK_HeadLampItem";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "acex_intelitems_notepad";
player addItemToUniform "grad_paceCountBeads_functions_paceCountBeads"; 
player addItemToUniform "tsp_lockpick";
player addItemToUniform "ACE_microDAGR";
// === Meds
player addItemToUniform "cgqc_items_ifak";


// === Backpack ================================================================================================================
// === Essentials 
player addItemToBackpack "ACE_Canteen";
player addItemToBackpack "ACE_EntrenchingTool";
// === Grenades 
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
