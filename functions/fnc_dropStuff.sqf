// --- dropStuff ----------------------------------------------------------
// Drop player stuff
params ["_unit", "_itemToDrop",["_action","dropWeapon"]];
diag_log format ["[CGQC_FNC] dropStuff %1/%2/%3 started", _unit, _itemToDrop, _action];

_unitPos = _unit getRelPos [1, 0];
_closestHolder = _unitPos nearestObject "GroundWeaponHolder";
_holder = objNull;

if (_unitPos distance _closestHolder < 3) then {
	_holder = _closestHolder;
} else {
	_holder = createVehicle ["GroundWeaponHolder", [0,0,100], [], 0, "CAN_COLLIDE"];
	_holder setPos _unitPos;
};
_unit action [_action, _holder, _itemToDrop];
[_unit, _holder] call CGQC_fnc_markStuff;
diag_log "[CGQC_FNC] dropStuff done";