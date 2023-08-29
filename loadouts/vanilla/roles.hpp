case "vanilla_rifleman":{ 
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaRifleman;
	["inf"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla Rifleman";
	break;
};
case "vanilla_tl":{ 
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaTL;
	["tl"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Vanilla TeamLeader";
	break;
};