case "vanilla_rifleman":{
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaRifleman;
	["tl"] call CGQC_fnc_getRadioPresets;
	["inf"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "Rifleman";

};
case "vanilla_tl":{
	[] call CGQC_loadout_vanillaBasic;
	[] call CGQC_loadout_vanillaTL;
	["tl"] call CGQC_fnc_getRadioPresets;
	["tl"] spawn cgqc_fnc_switchPerks;
	cgqc_player_role = "TeamLeader";
};