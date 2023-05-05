
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
        cgqc_role = "";
       
        // Check if player in chill mode
        if (cgqc_player_chill) then {
            ["ready", true] call CGQC_fnc_perksBasic;
            waitUntil {!cgqc_player_chill};
        };

		switch (_type) do {
            // === Unsung ========================================================================
            case "unsung_basic":{ 
                [] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
				cgqc_role = "Basic Soldier";
            };
			case "unsung_10":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_0.sqf";
				cgqc_role = "1-0 Team Leader";
            };
			case "unsung_11":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_1.sqf";
				cgqc_role = "1-1 Radio 2iC";
            };
			case "unsung_12":{ 
				[] execVM "\CGQC\loadouts\unsung\loadout_basic.sqf";
                [] execVM "\CGQC\loadouts\unsung\loadout_1_2.sqf";
				cgqc_role = "1-2 Medic";
            };
            // === Scandinavia ========================================================================
            case "scandinavia_basic":{ 
                [] execVM "\CGQC\loadouts\scandinavia\loadout_basic.sqf";
				cgqc_role = "Basic Soldier";
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