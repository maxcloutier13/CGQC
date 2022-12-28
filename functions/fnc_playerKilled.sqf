// --- playerKilled ----------------------------------------------------------
// Code in the event a player gets dead
params ["_unit", "_killer"];
_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
_unit setVariable["Saved_Face", face _unit];
cgqc_player_slinged_helmet = [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet;
sleep 0.2;
//hint format ["Woops! tu t'es fait pèté par: %1", _killer];