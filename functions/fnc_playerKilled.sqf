// --- playerKilled ----------------------------------------------------------
// Code in the event a player gets dead
params ["_unit", "_killer"];
diag_log "[CGQC_EVENT] playerKilled started";

_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
_unit setVariable["Saved_Face", face _unit];
_unit setVariable["Saved_Slinged", [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet];
// Save radio ptt priorities
y_mpttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment;
_unit setVariable["Radio_Settings", y_mpttRadioList];
sleep 0.2;
//hint format ["Woops! tu t'es fait pèté par: %1", _killer]; 

diag_log "[CGQC_EVENT] playerKilled done";