#include "\CGQC\script_component.hpp"
// --- renameVicAuto ----------------------------------------------------------
// Rename the vehicle
params ["_target"];
LOG(" renameVicAuto started");
    _suffix = "";
    _name = "";
    _color = assignedteam player;
    switch (_color) do {
        case "RED": {_suffix = "1"};
        case "GREEN": {_suffix = "1"};
        case "BLUE": {_suffix = "2"};
        case "YELLOW": {_suffix = "2"};
        case "MAIN": {_suffix = "0"}
    };
    if (cgqc_bft_initials) then {
        _name = format ["V.%1", _suffix];
    } else {
        _name = format ["Vic.%1", _suffix];
    };

    _target setVariable ["CGQC_name_vic", _name, true];
    _id = floor random 10000000;
    _target setVariable ["cgqc_name_vic_id", _id];
    _target setVariable ["show_marker", true, true];
    _txt = format ["Renamed: %1", _name];
    [[_txt, 1.5, [0.161,0.502,0.725,1]]] call CBA_fnc_notify;
    ["transmit_vic", false, _target] spawn CGQC_fnc_bluforceTracker;

LOG(" renameVicAuto done");