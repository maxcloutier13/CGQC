#include "script_component.hpp"
// --- renameVic ----------------------------------------------------------
// Rename the vehicle
params ["_target"];

CGQC_UI_saveName = {
    _display = findDisplay 1353153;
    _name =  ctrlText (_display displayCtrl 1400);
    closeDialog 0;
    _vic = cgqc_rename_vic;
    _vic setVariable ["cgqc_name_vic", _name, true];
    _id = floor random 10000000;
    _vic setVariable ["cgqc_name_vic_id", _id];
    _vic setVariable ["show_marker", true, true];
    _txt = format ["Renamed: %1", _name];
    [[_txt, 1.5, [0.161,0.502,0.725,1]]] call CBA_fnc_notify;
    ["transmit_vic", false, cgqc_rename_vic] spawn CGQC_fnc_bluforceTracker;
    diag_log format ["[CGQC_FNC] renameVic %1/%2", _vic, _name];
};

diag_log format ["[CGQC_FNC] renameVic started"];

disableSerialization;
createDialog "CGQC_ui_renameVic";

diag_log  "[CGQC_FNC] renameVic done";
