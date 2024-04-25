#include "\CGQC\script_component.hpp"
// --- checkZeus ----------------------------------------------------------
// Check if player is zeusparams [["_switch", true]];
params [["_unit", player];
LOG_1(" checkZeus %1 started", _unit);

// Check that Zeus has been assigned to unit
if (isNull (getAssignedCuratorLogic _unit)) then {
	false;
}else{
	true;
};