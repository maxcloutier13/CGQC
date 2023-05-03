// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Unsung

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
    "UNS_M1_1V1N",
	"UNS_Headband_BK",
	"UNS_Headband_ED",
	"UNS_Headband_OD",
	"UNS_Headband_OD2",
	"UNS_Bandana_OD",
	"UNS_Bandana_OD2",
	"UNS_Bandana_OD3",
	"UNS_Boonie_OD",
	"UNS_sas_bandana_green",
	"UNS_sas_bandana_tiger",
	"UNS_sas_booniehat_green",
	"uns_sas_booniehat_tiger2",
	"UNS_sas_headband_erdl",
	"UNS_sas_headband_green",
	"UNS_sas_headband_scrim",
	"UNS_sas_headband_tiger",
	"uns_Simc_MC_hat_1",
	"uns_Simc_MC_hat_2",
	"uns_Simc_MC_erdl_1",
	"uns_Simc_MC_erdl_2",
	"uns_h_simc_Boon_green_1",
	"uns_h_simc_Boon_green_2",
	"uns_h_simc_Boon_green_3",
	"uns_h_simc_Boon_green_4",
	"uns_h_simc_Boon_green_5",
	"uns_h_simc_Boon_green_6",
	"uns_h_simc_Boon_green_7",
	"uns_h_simc_hat_trop_1",
	"uns_h_simc_hat_trop_2",
	"uns_h_simc_hat_trop_air",
	"uns_h_simc_hat_trop_cib",
	"uns_h_simc_hat_trop_cib_air",
	"uns_h_simc_hat_trop_cib_med",
	"uns_h_simc_hat_trop_med"
];
player addHeadgear _hat;

// === Secondary weapon  ====================================================================================================
player addWeapon "uns_m1911";
player addHandgunItem "uns_m1911mag";

// === Items ==================================================================================================================
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
// === Binos
player addWeapon "uns_binocular_army";

// === Uniform ================================================================================================================
player forceAddUniform "UNS_SOG_BDU_OP";
player addItemToUniform "ACRE_SEM52SL"; // === Essentials 
player addItemToUniform "ACE_EarPlugs"; 
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "murshun_cigs_cigpack";
player addItemToUniform "murshun_cigs_lighter";
player addItemToUniform "acex_intelitems_notepad";
player addItemToUniform "grad_paceCountBeads_functions_paceCountBeads"; 
for "_i" from 1 to 5 do {player addItemToUniform "FF_Painkiller";}; // === Meds
for "_i" from 1 to 5 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "ACE_splint";

// === Vest ================================================================================================================
player addVest "uns_sas_web_3";
for "_i" from 1 to 4 do {player addItemToVest "uns_m1911mag";};

// === Backpack ================================================================================================================
player addBackpack "cgqc_pack_mk1_magic";
_items_pack = backpackItems player;
{player removeItemFromBackpack _x} forEach _items_pack;
player addItemToBackpack "ACE_EntrenchingTool";
// Grenades 
for "_i" from 1 to 4 do {player addItemToVest "uns_v40gren";};
for "_i" from 1 to 4 do {player addItemToVest "uns_m67gren";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellBlue";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShellPurple";};
for "_i" from 1 to 5 do {player addItemToBackpack "FF_Painkiller";}; // === Meds
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";}; 
sleep 0.5;