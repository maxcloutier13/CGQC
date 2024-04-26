#include "\CGQC\script_component.hpp"
// --- perksGoggles ----------------------------------------------------------
// Change face stuff
params ["_type"];
LOG(" perksGoggles  started");
//_type = _this select 0;
player addGoggles _type;
hint "Goggles switched";
LOG(" perksGoggles  done");