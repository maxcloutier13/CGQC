#include "script_component.hpp"
// --- postInit ----------------------------------------------------------
// Start everything before everything
LOG("[CGQC_PostInit] === Started =====================================");
[] spawn {
	if (!isServer) then {
		// Start with a silent black screen.
		0 fadeSound 0;
		titleCut ["", "BLACK FADED", 999];
	} else {
		addMissionEventHandler ['HandleDisconnect', {
			_unit = _this select 0;
			[_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
		}];
	};
};
LOG("[CGQC_PostInit] === Done =====================================");