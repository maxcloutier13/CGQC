// --- roleSwitch ----------------------------------------------------------
// Switch roles
waitUntil {!isNull (findDisplay 46)};
waitUntil {cgqc_postInitClient_done};
cgqc_roleSwitch_done = false;
cgqc_mk3_switching_vest = false;
cgqc_mk3_switching_backpack = false;

if (hasInterface) then {
    try {
        disableUserInput true;
        _type = _this select 0;
        _section = _this select 1;
        _auRepos = _this select 2;
        //hintc "mk2_role_switch wtf";sleep 0.5;

        if (cgqc_setting_show_transition) then {
        // Fade to black  
            cutText ["", "BLACK FADED", 999];
            titleText ["", "PLAIN"];
        };

        // ===== Prep and transition ======================================================
        cgqc_player_role = "";
       
        // Check if player in chill mode
        if (cgqc_player_chill) then {
            ["ready", true] call CGQC_fnc_perksBasic;
            waitUntil {!cgqc_player_chill};
        };

		switch (_type) do {
            // Command ========================================================================
            case "vanilla_rifleman":{ 
                [] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\vanilla\loadout_rifleman.sqf";
				cgqc_player_role = "Vanilla Rifleman";
                break;
            };
            case "vanilla_tl":{ 
                [] execVM "\CGQC\loadouts\vanilla\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\vanilla\loadout_tl.sqf";
				cgqc_player_role = "Vanilla TeamLeader";
                break;
            };
            case "unsung_basic":{ 
                [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
				cgqc_player_role = "Basic Soldier";
                break;
            };
			case "unsung_10":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_0.sqf";
				cgqc_player_role = "1-0 Team Leader";
                break;
            };
			case "unsung_11":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_1.sqf";
				cgqc_player_role = "1-1 Radio 2iC";
                break;
            };
			case "unsung_12":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_2.sqf";
				cgqc_player_role = "1-2 Medic";
                break;
            };
            case "swat_assaulter":{
                [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
                [] execVM "\CGQC\loadouts\2023\loadout_swat_assaulter.sqf";
				cgqc_player_role = "Swat - Assaulter";
                break;
            };
            case "swat_breacher":{
                [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
                [] execVM "\CGQC\loadouts\2023\loadout_swat_breacher.sqf";
				cgqc_player_role = "Swat - Breacher";
                break;
            };
            case "swat_sniper":{
                [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
                [] execVM "\CGQC\loadouts\2023\loadout_swat_sniper.sqf";
				cgqc_player_role = "Swat - Sniper";
                break;
            };
            case "swat_tl":{
                [] execVM "\CGQC\loadouts\2023\loadout_swat_basic.sqf";
                [] execVM "\CGQC\loadouts\2023\loadout_swat_tl.sqf";
				cgqc_player_role = "Swat - Team Leader";
                break;
            };

            default	{
                hintc "mk3_roleSwitch.sqf fail";
            };
        };
		// Start transition
        if (!cgqc_intro_running) then {
            ["role"] execVM "\CGQC\loadouts\mk3_transition.sqf";
        };

        //Set patch back
        player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
        [ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

        // Lower gun 
		sleep 1;
        player action ['SwitchWeapon', player, player, 250];
        cgqc_roleSwitch_done = true;
        disableUserInput false;
    } catch{ // In case of error: Return control to player
		disableUserInput false;
        cgqc_roleSwitch_done = true;
        hintc "Erreur: mk2_role_switch";
	};
};