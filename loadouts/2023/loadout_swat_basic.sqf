// --- swat_basic ----------------------------------------------------------
// Basic

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1_f_black"];
_goggles = ["G_Balaclava_TI_blk_F"];
_vests = ["cgqc_vest_mk1_black"];
_uniforms = ["cgqc_uniform_mk1_black"];
_rucks = ["cgqc_pack_mk1_assault_black"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Handgun   ====================================================================================================
_gun = ["cgqc_gun_glock19_wood", "Tier1_20Rnd_9x19_JHP", "tier1_dbalpl", "tier1_sig_romeo1"];
[_gun] call CGQC_fnc_getCustomHandgun;

// === Linked items ==================================================================================================================
["modern", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Binos
player addWeapon "cgqc_item_rangefinder";

// === Vest ================================================================================================================
// Throwables
for "_i" from 1 to 2 do {player addItemToVest "DIGI_M7A3"};
for "_i" from 1 to 2 do {player addItemToVest "ACE_M84"};
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell"};

// === Uniform ================================================================================================================
// Handgun mags
for "_i" from 1 to 2 do {
    [player, "uniform", cgqc_config_sidearm_mag, false] call CGQC_fnc_addItemWithOverflow;
};
// More secondary mags to vest
for "_i" from 1 to 2 do {player addItemToVest cgqc_config_sidearm_mag};
// === Essentials 
player addItemToUniform "ACE_EarPlugs"; 
player addItemToUniform "ACE_RangeCard";
player addItemToUniform "WBK_HeadLampItem";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ItemAndroid";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "acex_intelitems_notepad";
// === Meds
player addItemToUniform "cgqc_items_ifak";

// === Backpack ================================================================================================================
// === Essentials 
player addItemToBackpack "ACE_Canteen";
player addItemToBackpack "ACE_microDAGR";
player addItemToBackpack "ACE_EntrenchingTool";
// === Grenades 
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_M84";};
for "_i" from 1 to 4 do {player addItemToBackpack "DIGI_M7A3";};
for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};