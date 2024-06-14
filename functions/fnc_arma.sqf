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
		[["Fixed Deafness", 1.5], true] call CBA_fnc_notify;
	};
	case "heal": {
		["heal"] call CGQC_fnc_getStuff;
		_txtApplied = "Heal";
		[["Healed", 1.5], true] call CBA_fnc_notify;
	};
	case "rejoin": {
		[] call grad_persistence_fn_loadPlayer;
		_txtApplied = "Reload Player";
		[["Player reloaded", 1.5], true] call CBA_fnc_notify;
	};
	case "tp_corpse": {
		corpse_pos = _target getVariable "corpse_position";
		if (isNil "_pos") then {
			player setPosASL corpse_pos;
			hint "TP'd to corpse";
			_txtApplied = "TP to Corpse";
			[["TP'd to Corpse", 1.5], true] call CBA_fnc_notify;
		}else {
			hint "No corpse found";
			[["Fail: No corpse found", 1.5], true] call CBA_fnc_notify;
		};

	};
	case "tp_leader": {
		_groupLeader = leader group _target;
		_spawnPos = (getPosASL _groupLeader);
		_target setPosASL _spawnPos;
		_txtApplied = "TP to Leader";
		[["TP to Leader", 1.5], true] call CBA_fnc_notify;
	};
};

_txt = format [" just used magic functions to %1", _txtApplied];
[player, _txt] remoteExec ["globalChat",0];

WARNING_2("!!!!!!!!! arma %1 used:%2", player , _txtApplied);

LOG(" arma done");