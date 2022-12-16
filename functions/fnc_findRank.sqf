// --- findRank ----------------------------------------------------------
// Match name with ranks

// Find rank prefix
_prefix = cgqc_player_name select[0, 4];
_player_rank = 1;
_player_rank_name = "Soldat";
//hintc format["Prefix: %1", _prefix];

switch (_prefix) do {
	case "Sdt.":{
		player setRank "PRIVATE";
		_player_rank = 1;
		_player_rank_name = "Soldat";
	};
	case "Cpl.":{
		player setRank "CORPORAL";
		_player_rank = 2;
		_player_rank_name = "Caporal";
	};
	case "CplC":{
		player setRank "CORPORAL";
		_player_rank = 3;
		_player_rank_name = "Caporal Chef";
	};
	case "Sgt.":{
		player setRank "SERGEANT";
		_player_rank = 4;
		_player_rank_name = "Sergent";
	};
	case "Adju":{
		player setRank "SERGEANT";
		_player_rank = 5;
		_player_rank_name = "Adjudent";
	};
	case "SLt.":{
		player setRank "LIEUTENANT";
		_player_rank = 6;
		_player_rank_name = "Sous-Lieutenant";
	};
	case "Lt. ":{
		player setRank "LIEUTENANT";
		_player_rank = 7;
		_player_rank_name = "Lieutenant";
	};
	case "Capt":{
		player setRank "CAPTAIN";
		_player_rank = 8;
		_player_rank_name = "Capitaine";
	};
	case "Maj.":{
		player setRank "MAJOR";
		_player_rank = 9;
		_player_rank_name = "Major";
	};
	case "LCol":{
		player setRank "COLONEL";
		_player_rank_name = "Lieutenant Colonel";
		_player_rank = 10;
	};
	case "Col.":{
		player setRank "COLONEL";
		_player_rank = 11;
		_player_rank_name = "Colonel";
	};
	default
	{
		cgqc_player_known = false;
		// Set as soldier
		player setRank "PRIVATE";
		_player_rank = 1;
		_text = ("<br/>" + "<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >Discord: CGQC.CA</t>");
		[ _text, 0, 0, 5, 2 ] spawn BIS_fnc_dynamicText;
	};
};
// Set the variable
cgqc_player_rank_found = true;
cgqc_player_rank = _player_rank;
cgqc_player_rank_name = _player_rank_name;