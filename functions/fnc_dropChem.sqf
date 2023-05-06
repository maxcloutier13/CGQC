// --- dropChem ----------------------------------------------------------
// Drop chemlight
_chem = _this select 0;
_count = _this select 1;
sleep 1;
player playMove "Acts_Pointing_Down";
sleep 2;
hint format ["Dropped chemlight %1 left", _count];
_chem createVehicle getPosATL player;
sleep 1;
player playMove "";
hintSilent "";