// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Scandinavia

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

// === Remote Hat ==========================================================================================================
_hat = selectRandom [
	"H_NORTH_FIN_M22_Fieldcap",
	"H_NORTH_FIN_M22_Fieldcap_2",
	"H_NORTH_FIN_M22_Fieldcap_3",
	"H_NORTH_FIN_M22_Fieldcap_4"
];
player addHeadgear _hat;

// === Secondary weapon  ====================================================================================================
player addWeapon "NORTH_l35";
player addHandgunItem "NORTH_8Rnd_l35_mag";

// === Items ==================================================================================================================
player linkItem "ItemMap";
player linkItem "NORTH_FIN_Compass";
player linkItem "NORTH_FIN_Watch";
// === Binos ==================================================================================================================
player addWeapon "NORTH_Binocular_Zeiss";

// === Uniform ================================================================================================================
player forceAddUniform "U_NORTH_FIN_M36_Summertunic_INF_Private";
// === Essentials 
player addItemToUniform "ACE_EarPlugs"; 
player addItemToUniform "ACE_MapTools";
player addItemToUniform "acex_intelitems_notepad";
for "_i" from 1 to 5 do {player addItemToUniform "FF_Painkiller";}; // === Meds
for "_i" from 1 to 15 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 1 do {player addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 1 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "ACE_splint";

// === Vest ================================================================================================================
player addVest "V_NORTH_FIN_Generic_5";
for "_i" from 1 to 4 do {player addItem "NORTH_8Rnd_l35_mag";};

// === Backpack ================================================================================================================
player addBackpack "NORTH_fin_MapBag";
_items_pack = backpackItems player;
{player removeItemFromBackpack _x} forEach _items_pack;
player addItemToBackpack "ACE_EntrenchingTool";
// Grenades 
for "_i" from 1 to 2 do {player addItem "NORTH_M43SmokeGrenade_mag";};
for "_i" from 1 to 2 do {player addItem "NORTH_M32Grenade_mag";};
sleep 0.5;