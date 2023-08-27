// --- perksGoggles ----------------------------------------------------------
// Change face stuff
diag_log "[CGQC_FNC] perksGoggles  started";
params ["_type"];
//_type = _this select 0;
player addGoggles _type;
hint "Goggles switched";