// --- removeAll ----------------------------------------------------------
// Remove and reset everything on player loadout
diag_log "[CGQC_FNC] removeAll";

[] spawn {
    // Remove everything
    removeAllItems player;
    removeAllAssignedItems player;
    removeAllWeapons player;
    removeAllContainers player;
    removeGoggles player;
    removeHeadgear player;
    removeVest player;
    removeUniform player;
    removeBackpack player;
    // Slung helmet
    [player] call GRAD_slingHelmet_fnc_removeSlungHelmet;
    // Remove backpack on chest
    _chestPack = [player] call bocr_main_fnc_chestpack;
    waitUntil {!isNil "_chestPack"};
    if (_chestPack isNotEqualTo "") then {
        [player] call bocr_main_fnc_removeChestpack;
    };
    // Remove secondary weapon
    if (!(isNil {player getVariable "WBK_SecondWeapon"})) exitWith {
        player spawn WBK_CreateSwitchBetweenWeapons;
        sleep 0.1;
        player removeWeapon primaryWeapon player;
    };
};

diag_log "[CGQC_FNC] removeAll finished";
