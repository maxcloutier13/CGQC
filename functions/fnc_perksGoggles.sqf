// --- perksGoggles ----------------------------------------------------------
// Change face stuff
params ["_type"];
diag_log "[CGQC_FNC] perksGoggles  started";
//_type = _this select 0;
player addGoggles _type;
hint "Goggles switched";
diag_log "[CGQC_FNC] perksGoggles  done";