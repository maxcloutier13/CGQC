// --- switchRole ----------------------------------------------------------
// Switch roles. Haha yeah. 
params ["_type", ["_section", 1], ["_showTransition", true]];

[_type, _section, _showTransition] spawn {
    params ["_type", ["_section", 1], ["_showTransition", true]];
    
    diag_log format ["[CGQC_FNC] switchRole %1/%2/%3 started", _type, _section,_showTransition];

    cgqc_roleSwitch_done = false;
    cgqc_mk3_switching_vest = false;
    cgqc_mk3_switching_backpack = false;

    //disableUserInput true;
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

    switch (_type) do {
        // Vanilla
        #include "\cgqc\loadouts\vanilla\roles.hpp"
        #include "\cgqc\loadouts\unsung\roles.hpp"
        #include "\cgqc\loadouts\2023\roles.hpp"
        default	{
            diag_log "[CGQC_ERROR] switchRole fail";
        };
    };

    diag_log "[CGQC_FNC] switchRole - checking if run transition";
    // Start transition
    if (!cgqc_intro_running && _showTransition) then {
        diag_log "[CGQC_FNC] switchRole - running transition";
        ["role", true] call CGQC_fnc_showTransition;
    };

    //Set patch back
    diag_log "[CGQC_FNC] switchRole - set patch back";
    player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
    [ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

    // Lower gun 
    diag_log "[CGQC_FNC] switchRole - lower gun";
    _holster = [] spawn CGQC_fnc_holsterWeapons;

    cgqc_roleSwitch_done = true;
    diag_log "[CGQC_FNC] switchRole done";
};