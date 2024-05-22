#include "\CGQC\script_component.hpp"
// --- loadout_infantry ----------------------------------------------------------
// Vietnam Infantry loadouts
params ["_type"];
LOG_1("[loadout_infantry] %1 started", _type);

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
_vests = [""];
_uniforms = [""];
_rucks = [""];

switch (_type) do {
    case "unsung_car15": {
        _vests = ["UNS_M1956_S3"];
        _uniforms = ["UNS_SOG_BDU_OP"];
        _rucks = ["UNS_Alice_1"];
        ["nam_car15"] spawn CGQC_fnc_switchPrimary;
    };
    case "unsung_m14": {
    };
    case "unsung_rpd": {
    };
    case "unsung_m40": {
    };
    case "unsung_sab": {
    };
};

_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

LOG_1("[loadout_infantry] %1 done", _type);