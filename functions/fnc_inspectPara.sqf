#include "\CGQC\script_component.hpp"
// --- inspectPara ----------------------------------------------------------
// Inspect target parachute loadout and reports problems
LOG("[inspectPara] started");

_inspect_target = cursorTarget;
_inspect_target_name = name inspect_target;
_inspect_txt = format ["------- Para Check: %1 ------- <br/>", _inspect_target_name];

// Parachute
_pack = backpack _inspect_target;
_paraFound = false;
_maskFound = false;
_altiFound = false;
if (_pack in ["B_Parachute", "rhs_d6_Parachute_backpack"]) then {
    _inspect_txt = _inspect_txt + "- Parachute: OK - <br/>";
    _paraFound = true;
};
if (_pack in ["ACE_NonSteerableParachute", "rhsusf_eject_Parachute_backpack"]) then {
    inspect_txt = _inspect_txt + "- Parachute: OK - <br/>" + "- Warning: Non-Steerable! - <br/>";
    _paraFound = true;
};

if (!_paraFound) then {
    _inspect_txt = _inspect_txt + "<t color='#b10000'>- Parachute: FAIL! - </t><br/>" + "- ERROR: NO PARACHUTE! - <br/>";
};

// Altimeter
inspect_target_items_assigned = assignedItems _inspect_target;
_map = {_x isEqualTo "ACE_Altimeter"} count inspect_target_items_assigned;
if (_map > 0) then {
    _inspect_txt = _inspect_txt + "- Altimeter: OK - <br/>";
    _altiFound = true;
} else {
    _inspect_txt = _inspect_txt + "- Altimeter: Mising - <br/>";
};

// Facemask
_goggles = goggles player in ["cgqc_goggles_mk1_para"];
if (_goggles) then {
    _inspect_txt = _inspect_txt + "- Jump Mask: OK - <br/>";
    _maskFound = true;
} else {
    _inspect_txt = _inspect_txt + "- Jump Mask: Mising - <br/>";
};
_inspect_txt = _inspect_txt + "-------------------- <br/>";
if (_paraFound) then {
    _inspect_txt = _inspect_txt + "<t color='#4169e1'>- Ready to jump! -</t><br/>";
} else {
    _inspect_txt = _inspect_txt + "<t color='#b10000'>- NOT READY!!! - </t><br/>";
};

if (_altiFound && _maskFound) then {
    _inspect_txt = _inspect_txt + "- Fully equipped - <br/>";
} else {
    _inspect_txt = _inspect_txt + "- Missing some optionals - <br/>";
};

// Show inspection message
[_inspect_txt] spawn {
	params ["_txt"];
	Hint parseText format ["%1", _txt];
	sleep 30;
	hintSilent "";
};

// Backpack on chest
LOG("[inspectPara] done");