// --- setLeadership ----------------------------------------------------------
// Sets the leadership level of the player
params ["_type"];

diag_log format ["[CGQC_FNC] setLeadership %1 started", _type];
cgqc_player_isSL = false;
cgqc_player_isTL = false;
cgqc_player_is2IC = false;

switch (_type) do {
	case "SL":{
		cgqc_player_isSL = true;
	};
	case "TL":{
		cgqc_player_isTL = true;
	};
	case "2iC":{
		cgqc_player_is2IC = true;
	};
};

diag_log "[CGQC_FNC] setLeadership done";
