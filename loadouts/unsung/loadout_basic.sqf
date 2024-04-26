#include "\CGQC\script_component.hpp"
// --- loadout_basic ----------------------------------------------------------
// Basic loadout for Unsung

// Prep for switch
[player] call CGQC_fnc_loadoutPrep;

// === Random Hat ==========================================================================================================
_hats = [
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
_goggles = [""];
_vests = ["uns_sas_web_3"];
_uniforms = ["UNS_SOG_BDU_OP"];
_rucks = ["cgqc_pack_mk1_magic"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Secondary weapon  ====================================================================================================
player addWeapon "uns_m1911";
player addHandgunItem "uns_m1911mag";

// === Items ==================================================================================================================
["noGPS"] call CGQC_fnc_getLinkedItems;
// === Binos
player addWeapon "uns_binocular_army";

// === Uniform ================================================================================================================
player addItemToUniform "ACRE_SEM52SL"; // === Essentials
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "ACE_CableTie";
player addItemToUniform "murshun_cigs_cigpack";
player addItemToUniform "murshun_cigs_lighter";
player addItemToUniform "acex_intelitems_notepad";
player addItemToUniform "grad_paceCountBeads_functions_paceCountBeads";
player addItemToUniform "cgqc_items_ifak";

// === Vest ================================================================================================================
for "_i" from 1 to 4 do {player addItemToVest "uns_m1911mag";};

// === Backpack ================================================================================================================
player addItemToBackpack "ACE_EntrenchingTool";
// Grenades
for "_i" from 1 to 4 do {player addItemToVest "uns_v40gren";};
for "_i" from 1 to 4 do {player addItemToVest "uns_m67gren";};
for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};