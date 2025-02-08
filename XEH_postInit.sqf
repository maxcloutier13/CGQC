#include "\CGQC\script_component.hpp"
// --- postInit ----------------------------------------------------------
// Start everything before everything
LOG("[CGQC_PostInit] === Started =====================================");
[] spawn {
	if (isServer) then {
		addMissionEventHandler ['HandleDisconnect', {
			_unit = _this select 0;
			[_unit] call GRAD_slingHelmet_fnc_removeSlungHelmet;
		}];
	};
};
LOG("[CGQC_PostInit] === Done =====================================");