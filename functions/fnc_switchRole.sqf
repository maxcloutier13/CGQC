#include "\CGQC\script_component.hpp"
// --- switchRole ----------------------------------------------------------
// Switch roles. Haha yeah.
params ["_type", ["_section", 1], ["_showTransition", true], ["_saveSnapshot", true]];
LOG_3("[switchRole] %1/%2/%3 started", _type, _section,_showTransition);

cgqc_roleSwitch_done = false;
// Delay until the server time has sync'd
waitUntil {CGQC_playerLoaded};


if (!cgqc_intro_running && cgqc_setting_show_transition && _showTransition) then {
// Fade to black
    cutText ["", "BLACK", 1e-6];
    titleText ["", "PLAIN"];
};
if !(_type isEqualTo "Unknown") then {
    // ===== Prep and transition ======================================================
    cgqc_player_role = "";

    // Check if player in chill mode
    if (cgqc_player_chill) then {
        LOG("[switchRole] - player at rest, setting ready before switching");
        ["ready", true] call CGQC_fnc_perksBasic;
    };

    if (_type isEqualTo "training") then {
        LOG("[switchRole] training");
        ['chill', false] spawn CGQC_fnc_perksBasic;
        ["training"] call CGQC_fnc_getRadioPresets;
        ["transmit"] spawn CGQC_fnc_bluforceTracker;
        cgqc_player_role = "Training";
    } else {
        LOG("[switchRole] Prepping player for switch");
        // Prep player for switch
        [player] call CGQC_fnc_loadoutPrep;
    };


    // Switch according to role
    // Vanilla
    LOG("[switchRole] Vanilla roles");
    switch (_type) do {
        #include "\cgqc\loadouts\vanilla\roles.hpp"
    };
    // 2023
    if (cgqc_player_has2023) then {
        LOG("[switchRole] 2023/pmct roles");
        switch (_type) do {
            #include "\cgqc\loadouts\2023\roles.hpp"
            #include "\cgqc\loadouts\pmct\roles.hpp"
        };
    };
    if (cgqc_player_hasSWAT) then {
        LOG("[switchRole] swat roles");
        switch (_type) do {
            #include "\cgqc\loadouts\swat\roles.hpp"
        };
    };
    // Unsung
    if (cgqc_player_hasUnsung) then {
        switch (_type) do {
            LOG("[switchRole] unsung roles");
            #include "\cgqc\loadouts\unsung\roles.hpp"
        };
    };


    LOG("[switchRole] Save role for further use");
    //Save role for further use
    player setVariable["cgqc_player_role", cgqc_player_role, true];
    player setVariable["cgqc_player_role_optic", cgqc_player_role_optic, true];

    // Add side keys to player
    ["side", player] call CGQC_fnc_getKey;

    //Set patch back
    LOG("[switchRole] - set patch back");
    [] call CGQC_fnc_setPatch;

        // Save a snapshot
    if (_saveSnapshot) then {
        LOG("[switchRole] Saving snapshot");

        [player, "save", "single", "auto"] spawn CGQC_fnc_snapshot;
    };

    // Lower gun
    LOG("[switchRole] - lower gun");
    [player] call ace_weaponselect_fnc_putWeaponAway;

    // Start receiving BFT
    ["receive"] spawn CGQC_fnc_bluforceTracker;
    // Start sending BFT if leader of group or refresh it if it's already running
    if (leader group player isEqualTo player || AZMBFT_isTransmitting) then {
        ["transmit"] spawn CGQC_fnc_bluforceTracker;
    };

    LOG("[switchRole] - checking if run transition");
    // Start transition
    if (!cgqc_intro_running && _showTransition) then {
        LOG("[switchRole] - running transition");
        ["role", true] spawn CGQC_fnc_showTransition;
    };

} else {
    LOG("[switchRole] - Role unknown - Skipping");
};
if (cgqc_config_cigs) then {
    _light = selectRandom ["cigs_matches", "cigs_lighter"];
    if !([player, _light] call ace_common_fnc_hasMagazine) then {player addItem _light;};
    _cigPack = selectRandom [
        "cigs_black_devil_cigpack",
        "cigs_craven_cigpack",
        "cigs_eckstein_cigpack",
        "cigs_lucky_strike_cigpack",
        "cigs_morley_cigpack",
        "cigs_baja_blast_cigpack",
        "cigs_crayons_crayonpack"
        ];
    if !([player, _cigPack] call ace_common_fnc_hasMagazine) then {player addItem _cigPack;};
};
cgqc_roleSwitch_done = true;
LOG("[switchRole] done");