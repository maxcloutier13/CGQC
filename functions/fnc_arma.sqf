// --- arma ----------------------------------------------------------
// Functions to deal with debug/mulligans
params ["_type", ["_target", player]];
diag_log format ["[CGQC_FNC] arma %1:%2 started", _type, _target];

switch (_type) do {
	case "rejoin": {
		[] call grad_persistence_fn_loadPlayer;
	};
	case "respawnOnCorpse": {
		corpse_pos = _target getVariable "corpse_position";
		if (isNil "_pos") then {
			player setPos corpse_pos;
			hint "TP'd to corpse";
		}else {
			hint "No corpse found";
		};

	};
	case "heal": {["heal"] call CGQC_fnc_getStuff};
	case "teleport": {
		_groupLeader = leader group _target;
		_target setPos (position _groupLeader);
	};
	default { };
};
y_target = _target;

y_txt = format [" just used magic functions to %1", _type];
[-1, {y_target globalChat y_txt}] call CBA_fnc_globalExecute;

diag_log format ["!!!![CGQC_FNC]!!!!! arma %1 used:%2",_target , _type];

diag_log "[CGQC_FNC] arma done";