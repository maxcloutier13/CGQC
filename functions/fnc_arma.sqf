#include "\CGQC\script_component.hpp"
// --- arma ----------------------------------------------------------
// Functions to deal with debug/mulligans
params [["_type", "heal"]];
LOG_2(" arma %1:%2 started", _type, _target);

switch (_type) do {
	case "heal": {["heal"] call CGQC_fnc_getStuff};
	case "rejoin": {
		[] call grad_persistence_fn_loadPlayer;
	};
	case "tp_corpse": {
		corpse_pos = _target getVariable "corpse_position";
		if (isNil "_pos") then {
			player setPosASL corpse_pos;
			hint "TP'd to corpse";
		}else {
			hint "No corpse found";
		};

	};
	case "tp_leader": {
		hint "Respawning to group Leader position";
		_groupLeader = leader group _target;
		_spawnPos = (getPosASL _groupLeader);
		_target setPosASL _spawnPos;
	};
	default { };
};
y_target = _target;

y_txt = format [" just used magic functions to %1", _type];
[-1, {y_target globalChat y_txt}] call CBA_fnc_globalExecute;

WARNING_2("!!!!!!!!! arma %1 used:%2",_target , _type);

LOG(" arma done");