// --- playerKilled ----------------------------------------------------------
// Code in the event a player gets dead

params ["_unit", "_killer"];
_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
//hint format ["Woops! tu t'es fait pèté par: %1", _killer];