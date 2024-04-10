// --- setLeadership ----------------------------------------------------------
// Sets the leadership level of the player
params ["_type", ["_targetType", "player"]];

diag_log format ["[CGQC_FNC] setLeadership %1 started", _type];
_target = player;
if (_targetType isEqualTo "target") then {
	_target = cursorTarget;
};

_targetID = owner _target;
[_target] remoteExec ['CGQC_int_resetLeadership', _targetID];

switch (_type) do {
	case "SL":{
		[_target] remoteExec ['CGQC_int_setSL', _targetID];
	};
	case "TL":{
		[_target] remoteExec ['CGQC_int_setTL', _targetID];
	};
	case "2IC":{
		[_target] remoteExec ['CGQC_int_set2IC', _targetID];
	};
};

diag_log "[CGQC_FNC] setLeadership done";

// Internal functions
CGQC_int_resetLeadership = {
	params ["_target"];
	cgqc_player_isSL = false;
	cgqc_player_isTL = false;
	cgqc_player_is2IC = false;
};
CGQC_int_setSL = {
	params ["_target"];
	cgqc_player_isSL = true;
};
CGQC_int_setTL = {
	params ["_target"];
	cgqc_player_isTL = true;
	hint "Designated TeamLeader";
};
CGQC_int_set2IC = {
	params ["_target"];
	cgqc_player_is2IC = true;
	hint "Designated 2iC";
	_target addItem "ACRE_PRC148";
};