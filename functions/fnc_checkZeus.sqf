#include "script_component.hpp"
// Fonction: Find zeus
// Check if player is zeus
_unit = param [0, objNull, [objNull]];
// Check that Zeus has been assigned to unit
if (isNull (getAssignedCuratorLogic _unit)) then {
	false;
}else{
	true;
};