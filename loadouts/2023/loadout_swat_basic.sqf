// --- swat_basic ----------------------------------------------------------
// Basic

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
_hat = selectRandom ["cgqc_helmet_mk1_f_black"];
player addHeadgear _hat;
// === Goggles 
player addGoggles "G_Balaclava_TI_blk_F";
// === Vest 
player addVest "cgqc_vest_mk1_black";
// === Uniform 
player forceAddUniform "cgqc_uniform_mk1_black";
// === Backpack 
player addBackpack "cgqc_pack_mk1_assault_black";


// === Handgun   ====================================================================================================
if (cgqc_config_sidearm) then {
    // === Custom Sidearm
    player addWeapon cgqc_config_sidearm_pistol;
    player addHandgunItem cgqc_config_sidearm_mag;
    if (cgqc_config_sidearm_acc != "") then {
        player addHandgunItem cgqc_config_sidearm_acc;
    };
    if (cgqc_config_sidearm_suppress != "") then {
        player addHandgunItem cgqc_config_sidearm_suppress;
    };
    if (cgqc_config_sidearm_optic != "") then {
        player addHandgunItem cgqc_config_sidearm_optic;
    };
}else{
    // === Standard secondary weapon
    player addWeapon "cgqc_gun_glock19_wood";
    player addHandgunItem "Tier1_20Rnd_9x19_JHP";
    player addHandgunItem "tier1_dbalpl";
    player addHandgunItem "Tier1_TiRant9S"; //Silencer on pistol
    player addHandgunItem "tier1_sig_romeo1"; //Dot on pistol
};

// === Items ==================================================================================================================
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
// === NVG's 
[] call CGQC_fnc_isDaytime;
if (cgqc_mission_daytime) then {
    player addItemToBackpack "JAS_GPNVG18_blk";
}else{
    //Night mission 
    player linkItem "JAS_GPNVG18_blk";
};
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
    if (player canAdd [cgqc_config_sidearm_mag, 1]) then {
        player addItemToUniform cgqc_config_sidearm_mag;
    } else{
        player addItem cgqc_config_sidearm_mag;
    };
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
_items_pack = backpackItems player;
{player removeItemFromBackpack _x} forEach _items_pack; //Flush possible magic items from backpack
// === Essentials 
player addItemToBackpack "ACE_Canteen";
player addItemToBackpack "ACE_microDAGR";
player addItemToBackpack "ACE_EntrenchingTool";
// === Grenades 
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_M84";};
for "_i" from 1 to 4 do {player addItemToBackpack "DIGI_M7A3";};
for "_i" from 1 to 4 do {player addItemToBackpack "tsp_popperCharge_auto_mag"};