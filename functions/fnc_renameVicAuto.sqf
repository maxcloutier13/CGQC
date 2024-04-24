// --- renameVicAuto ----------------------------------------------------------
// Rename the vehicle
params ["_target"];
diag_log format ["[CGQC_FNC] renameVicAuto started"];
    _suffix = "";
    _color = player getVariable ["CGQC_player_teamColor", "MAIN"];
    switch (_color) do {
        case "RED": {_suffix = "1"};
        case "GREEN": {_suffix = "1"};
        case "BLUE": {_suffix = "2"};
        case "YELLOW": {_suffix = "2"};
        case "MAIN": {_suffix = "HQ"}
    };
    _name = format ["Vic.%1", _suffix];
    _target setVariable ["CGQC_name_vic", _name, true];
    _id = floor random 10000000;
    _target setVariable ["cgqc_name_vic_id", _id];
    _target setVariable ["show_marker", true, true];
    _txt = format ["Renamed: %1", _name];
    [[_txt, 1.5, [0.161,0.502,0.725,1]]] call CBA_fnc_notify;
    ["transmit_vic", false, _target] spawn CGQC_fnc_bluforceTracker;

diag_log  "[CGQC_FNC] renameVicAuto done";