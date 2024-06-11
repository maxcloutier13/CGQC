#include "\CGQC\script_component.hpp"
// --- arma ----------------------------------------------------------
// Functions to deal with debug/mulligans
params [["_type", "heal"]];
LOG_1(" arma %1 started", _type);

_txtApplied = "";
switch (_type) do {
	case "deaf": {
		ace_hearing_deafnessDV = 0;
		_txtApplied = "Fix Deafness";
	};
	case "heal": {
		["heal"] call CGQC_fnc_getStuff;
		_txtApplied = "Heal";
	};
	case "rejoin": {
		[] call grad_persistence_fn_loadPlayer;
		_txtApplied = "Reload Player";
	};
	case "tp_corpse": {
		corpse_pos = _target getVariable "corpse_position";
		if (isNil "_pos") then {
			player setPosASL corpse_pos;
			hint "TP'd to corpse";
			_txtApplied = "TP to Corpse";
		}else {
			hint "No corpse found";
		};

	};
	case "tp_leader": {
		hint "Respawning to group Leader position";
		_groupLeader = leader group _target;
		_spawnPos = (getPosASL _groupLeader);
		_target setPosASL _spawnPos;
		_txtApplied = "TP to Leader";
	};
};

_txt = format [" just used magic functions to %1", _txtApplied];
[-1, {player globalChat _txt}] call CBA_fnc_globalExecute;

WARNING_2("!!!!!!!!! arma %1 used:%2", player , _txtApplied);

LOG(" arma done");