#include "\CGQC\script_component.hpp"
// --- addADS ----------------------------------------------------------
// Add active defenses to vehicle
params ["_type", "_vic_array"];
_vic = _vic_array select 0;
LOG_2(" addADS %1/%2 started", _type, _vic);

/* MAX Fix needed

if (isServer) then {
	waitUntil {sleep 1;cgqc_start_postInitClient_done};
	y_vic setVariable["dapsCanSmoke",1,TRUE];
	switch (_type) do {
		case "light": {
			y_vic spawn DAPS_fnc_APSTrophyLV;
		};
		case "medium": {
			y_vic spawn DAPS_fnc_APSTrophyMV;
		};
		case "heavy": {
			y_vic spawn DAPS_fnc_APSTrophyHV;
		};
		case "heavy+": {
			y_vic spawn DAPS_fnc_APSTrophyHVe;
		};
		default {
			hint "addADS error";
		};
	};
};

*/
LOG_2(" addADS %1/%2 done", _type, _vic);