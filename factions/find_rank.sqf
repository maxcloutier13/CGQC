//Find rank
cgqc_player_name = name player;
cgqc_player_rank = 1;
_prefix = cgqc_player_name select[0, 4];

switch (_prefix)
do
{
	case "Sdt.":
	{
		player setRank "PRIVATE";
		cgqc_player_rank = 1;
		//hint "Soldat";
	};
	case "Cpl.":
	{
		player setRank "CORPORAL";
		cgqc_player_rank = 2;
		//hint "Caporal";
	};
	case "CplC":
	{
		player setRank "CORPORAL";
		cgqc_player_rank = 3;
		//hint "Caporal-Chef";
	};
	case "Sgt.":
	{
		player setRank "SERGEANT";
		cgqc_player_rank = 4;
		//hint "Sergeant";
	};
	case "Adju":
	{
		player setRank "SERGEANT";
		cgqc_player_rank = 5;
		//hint "Adjudent";
	};
	case "SLt.":
	{
		player setRank "LIEUTENANT";
		cgqc_player_rank = 6;
		//hint "Sous-Lieutenant";
	};
	case "Lt. ":
	{
		player setRank "LIEUTENANT";
		cgqc_player_rank = 7;
		//hint "Lieutenant";
	};
	case "Capt":
	{
		player setRank "CAPTAIN";
		cgqc_player_rank = 8;
		//hint "Capitaine";
	};
	case "Maj.":
	{
		player setRank "MAJOR";
		cgqc_player_rank = 9;
		//hint "Major";
	};
	case "LCol":
	{
		player setRank "COLONEL";
		cgqc_player_rank = 10;
		//hint "Lieutenant-Colonel";
	};
	case "Col.":
	{
		player setRank "COLONEL";
		cgqc_player_rank = 11;
		//hint "Colonel";
	};
	default
	{
		cgqc_player_known = false;
		player setRank "PRIVATE";
		_text = ("<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >discord.gg/RCyRKWVG</t>");
		[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
		sleep 6;
	};
};

// Set les patchs par défaut
if (cgqc_player_known) then {
	// default patch pour les joueurs qui en ont pas de custom
	player_patch = "cgqc_patch_logo";
} else {
	// Patch pour les outsiders
	player_patch ="cgqc_patch_outsider";
};
cgqc_player_rank_done = true;