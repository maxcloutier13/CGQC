// --- perksGoggles ----------------------------------------------------------
// Change face stuff
params ["_type"];
//_type = _this select 0;
player addGoggles _type;
hint "Goggles switched";