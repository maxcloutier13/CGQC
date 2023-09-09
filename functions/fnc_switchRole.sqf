// --- switchRole ----------------------------------------------------------
// Switch roles. Haha yeah.
params ["_type", ["_section", 1], ["_showTransition", true]];

[_type, _section, _showTransition] spawn {
    params ["_type", ["_section", 1], ["_showTransition", true]];

    diag_log format ["[CGQC_FNC] switchRole %1/%2/%3 started", _type, _section,_showTransition];

    cgqc_roleSwitch_done = false;
    // Delay until the server time has sync'd
	waitUntil {	time > 5};
	// for JIP, wait until the main screen loads
	waitUntil {	!isNull (findDisplay 46)};
    //
    if (cgqc_setting_show_transition && _showTransition) then {
    // Fade to black
        cutText ["", "BLACK FADED", 999];
        titleText ["", "PLAIN"];
    };

    // ===== Prep and transition ======================================================
    cgqc_player_role = "";

    // Check if player in chill mode
    if (cgqc_player_chill) then {
        diag_log "[CGQC_FNC] switchRole - player at rest, setting ready before switching";
        ["ready", true] call CGQC_fnc_perksBasic;
    };

    if (_type isEqualTo "training") then {
        diag_log "[CGQC_INIT] initTraining started";
        ['chill', false] spawn CGQC_fnc_perksBasic;
        ["training"] call CGQC_fnc_getRadioPresets;
        cgqc_player_role = "Training";
    } else {
        // Prep player for switch
        [player] call CGQC_fnc_loadoutPrep;
    };


    // Switch according to role
    // Vanilla
    switch (_type) do {
        #include "\cgqc\loadouts\vanilla\roles.hpp"
    };
    // 2023
    if (cgqc_player_has2023) then {
        switch (_type) do {
            #include "\cgqc\loadouts\2023\roles.hpp"
            #include "\cgqc\loadouts\swat\roles.hpp"
        };
    };
    // Unsung
    if (cgqc_player_hasUnsung) then {
        switch (_type) do {
            #include "\cgqc\loadouts\unsung\roles.hpp"
        };
    };

    // Cloutier thangs
    if (cgqc_player_max) then {
        if !([player, "murshun_cigs_lighter"] call ace_common_fnc_hasItem) then {player addItem "murshun_cigs_lighter";};
        if !([player, "murshun_cigs_cigpack"] call ace_common_fnc_hasItem) then {player addItem "murshun_cigs_cigpack";};
        if !([player, "immersion_cigs_cigar0_nv"] call ace_common_fnc_hasItem) then {player addItem "immersion_cigs_cigar0_nv";};
        if !([player, "grad_paceCountBeads_functions_paceCountBeads"] call ace_common_fnc_hasItem) then {player addItem "grad_paceCountBeads_functions_paceCountBeads";};
        if !([player, "acex_intelitems_notepad"] call ace_common_fnc_hasMagazine) then {player addItem "acex_intelitems_notepad";};
    };

    diag_log "[CGQC_FNC] switchRole - checking if run transition";
    // Start transition
    if (!cgqc_intro_running && _showTransition) then {
        diag_log "[CGQC_FNC] switchRole - running transition";
        ["role", true] call CGQC_fnc_showTransition;
    };

    // Add side keys to player
    ["side", player] call CGQC_fnc_getKey;

    //Set patch back
    diag_log "[CGQC_FNC] switchRole - set patch back";
    player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
    [ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

    // Lower gun
    diag_log "[CGQC_FNC] switchRole - lower gun";
    [player] call ace_weaponselect_fnc_putWeaponAway;

    cgqc_roleSwitch_done = true;
    diag_log "[CGQC_FNC] switchRole done";
};