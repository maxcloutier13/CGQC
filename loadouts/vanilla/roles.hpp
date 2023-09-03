case "vanilla_rifleman":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaRifleman;
	["inf"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla Rifleman";

};
case "vanilla_tl":{
	[player] call CGQC_fnc_loadoutPrep;
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaTL;
	["tl"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla TeamLeader";

};