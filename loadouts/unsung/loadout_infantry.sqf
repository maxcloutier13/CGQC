#include "\CGQC\script_component.hpp"
// --- loadout_infantry ----------------------------------------------------------
// Vietnam Infantry loadouts
params ["_type"];
LOG_1("[loadout_infantry] %1 started", _type);

["vest", "uns_sas_web_3"] call CGQC_fnc_switchStuff;
["backpack", "UNS_Alice_1"] call CGQC_fnc_switchStuff;

switch (_type) do {
    case "inf_car15": {["nam_car15"] spawn CGQC_fnc_switchPrimary;};
	case "inf_car15_short": {["nam_car15_short"] spawn CGQC_fnc_switchPrimary;};
	case "inf_ak": {["nam_ak"] spawn CGQC_fnc_switchPrimary;};
	case "inf_m2": {["nam_m2"] spawn CGQC_fnc_switchPrimary;};
	case "inf_m14": {["nam_m14"] spawn CGQC_fnc_switchPrimary;};
	case "inf_thom": {["nam_thompson"] spawn CGQC_fnc_switchPrimary;};
};

LOG_1("[loadout_infantry] %1 done", _type);