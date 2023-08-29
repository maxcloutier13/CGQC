// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Vanilla

// === Remove all =======================================================================================================
removeAllItems player;
removeAllAssignedItems player;
removeAllWeapons player;
removeAllContainers player;
removeGoggles player;
// === Reset traits
player setUnitTrait ["Medic", false];
player setUnitTrait ["engineer", false];
player setUnitTrait ["explosiveSpecialist", false];

// === Clothing ==========================================================================================================
// === Random Hat 
_hat = selectRandom ["H_HelmetSpecB"];
player addHeadgear _hat;
// === Vest 
player addVest "V_PlateCarrier1_rgr";
// === Uniform 
player forceAddUniform "cgqc_uniform_mk1";
// === Backpack 
player addBackpack "B_AssaultPack_rgr";

// === Handgun   ====================================================================================================
player addWeapon "cgqc_gun_p99_wood";
player addHandgunItem "16Rnd_9x21_Mag";

// === Items ==================================================================================================================
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
// === NVG's 
[] call CGQC_fnc_isDaytime;
if (cgqc_mission_daytime) then {
    player addItemToBackpack "ACE_NVG_Gen4_Black";
}else{
    //Night mission 
    player linkItem "ACE_NVG_Gen4_Black";
};
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

//for "_i" from 1 to 5 do {player addItemToUniform "FF_Painkiller";}; 
//for "_i" from 1 to 10 do {player addItemToUniform "ACE_fieldDressing";};
//for "_i" from 1 to 1 do {player addItemToUniform "ACE_epinephrine";};
//for "_i" from 1 to 1 do {player addItemToUniform "ACE_morphine";};
//for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
//player addItemToUniform "ACE_splint";

// === Backpack ================================================================================================================
_items_pack = backpackItems player;
{player removeItemFromBackpack _x} forEach _items_pack; //Flush possible magic items from backpack
// === Essentials 
player addItemToBackpack "ACE_Canteen";
player addItemToBackpack "ACE_EntrenchingTool";
// === Grenades 
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
//for "_i" from 1 to 1 do {player addItemToBackpack "MS_Strobe_Mag_2"};
// === Meds
//for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
//for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";}; 