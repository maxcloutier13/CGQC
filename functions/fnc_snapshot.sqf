// --- snapshot ----------------------------------------------------------
// Saves/update a snapshot of the target
params [["_target", player], ["_type", "save"], ["_scope", "single"]];
diag_log format ["[CGQC_FNC] snapshot %1/%2 started", _target, _type];

switch (_scope) do {
    case "single": {
        // Get snapshot, or create it if not found
        _found = true;
        _snapshot = MissionProfileNamespace getVariable "cgqc_player_snapshot";
        if (isNil "_snapshot") then {
            _snapshot = [];
            _found = false;
        };

        _name = name _target;
        switch (_type) do {
            case "save": {
                //Info to save
                _time = format ["%1/%2/%3-%4:%5", systemTime select 0, systemTime select 1, systemTime select 2, systemTime select 3, systemTime select 4];
                //Team
                _team = groupId group _target;
                //Color
                _color = _target getVariable "CGQC_teamColor";
                //Role
                _role = _target getVariable "cgqc_player_role_type";
                // Equipment
                _helmet = headgear _target;
                _goggles = goggles _target;
                _assigned_items = assignedItems _target;
                // Equipment array
                _entry_gear = [_helmet, _goggles, _assigned_items];
                // Weapons
                _primary = primaryWeapon  _target;
                _primary_acc = primaryWeaponItems _target;
                _primary_mag = primaryWeaponMagazine _target;
                _handgun = handgunWeapon  _target;
                _handgun_acc = handgunItems _target;
                _handgun_mag = handgunMagazine _target;
                _launcher = secondaryWeapon  _target;
                _launcher_acc = secondaryWeaponItems _target;
                _launcher_mag = secondaryWeaponMagazine _target;
                // Weapons array
                _entry_primary = [_primary, _primary_acc, _primary_mag];
                _entry_handgun = [_handgun, _handgun_acc, _handgun_mag];
                _entry_launcher = [_launcher, _launcher_acc, _launcher_mag];
                _entry_weapons = [_entry_primary, _entry_handgun, _entry_launcher];
                // Loadout
                _uniform = uniform _target;
                _uniform_items = uniformItems _target;
                _uniform_mags = uniformMagazines _target;
                _entry_uniform = [_uniform, _uniform_items, _uniform_mags];
                _vest = vest _target;
                _vest_items = vestItems _target;
                _vest_mags = vestMagazines _target;
                _entry_vest = [_vest, _vest_items, _vest_mags];
                _pack = backpack _target;
                _pack_items = backpackItems _target;
                _pack_mags = backpackMagazines _target;
                _entry_pack = [_pack, _pack_items, _pack_mags];

                // Snapshot entry
                _entry = [_name, _time, _team, _color, _role, _entry_uniform, _entry_vest, _entry_pack, _entry_gear, _entry_weapons];

                hint "Player snapshot saved";
                MissionProfileNamespace setVariable ["cgqc_player_snapshot", _entry];
                saveMissionProfileNamespace;
            };
            case "load": {
                if (_found) then {
                    hint "Player snapshot found";
                    diag_log "[CGQC_FNC] snapshot found!";

                    // Load the snapshot
                    _name = _snapshot select 0;
                    _time = _snapshot select 1;
                    _team = _snapshot select 2;
                    _color = _snapshot select 3;
                    _role = _snapshot select 4;
                    // Equipment arrays
                    _entry_uniform = _snapshot select 5;
                    _entry_vest = _snapshot select 6;
                    _entry_pack = _snapshot select 7;
                    _entry_gear = _snapshot select 8;
                    _entry_weapons = _snapshot select 9;
                    _entry_primary = _entry_weapons select 0;
                    _entry_handgun = _entry_weapons select 1;
                    _entry_launcher =  _entry_weapons select 2;

                    // Uniforms
                    _uniform = _entry_uniform select 0;
                    _uniform_items = _entry_uniform select 1;
                    _uniform_mags = _entry_uniform select 2;
                    _vest = _entry_vest select 0;
                    _vest_items = _entry_vest select 1;
                    _vest_mags = _entry_vest select 2;
                    _pack = _entry_pack select 0;
                    _pack_items = _entry_pack select 1;
                    _pack_mags = _entry_pack select 2;

                    // Gear
                    _helmet = _entry_gear select 0;
                    _goggles = _entry_gear select 1;
                    _assigned_items = _entry_gear select 2;

                    // Weapons
                    _primary = _entry_primary select 0;
                    _primary_acc = _entry_primary select 1;
                    _primary_mag = _entry_primary select 2;
                    _primary_stuff = _primary_acc + _primary_mag;
                    _handgun = _entry_handgun select 0;
                    _handgun_acc = _entry_handgun select 1;
                    _handgun_mag = _entry_handgun select 2;
                    _handgun_stuff = _handgun_acc + _handgun_mag;
                    _launcher = _entry_launcher select 0;
                    _launcher_acc = _entry_launcher select 1;
                    _launcher_mag = _entry_launcher select 2;
                    _launcher_stuff = _launcher_acc + _launcher_mag;


                    // Rejoin to team
                    [_team, _color] call CGQC_fnc_joinGroup;
                    // Grab back the role if possible
                    [_role, 1, false, false]  call CGQC_fnc_switchRole;

                    sleep 1;

                    // Remove everything
                    removeAllItems _target;
                    removeAllAssignedItems _target;
                    removeAllWeapons _target;
                    removeAllContainers _target;
                    removeGoggles _target;
                    removeHeadgear _target;


                    // Add selected uniform
                    _target addHeadgear _helmet;
                    _target forceAddUniform _uniform;
                    _target addVest _vest;
                    _target addBackpack _pack;
                    _target addGoggles _goggles;

                    // Flush potential leftovers
                    clearAllItemsFromBackpack _target;

                    // load items in new uniform
                    {_target addItemToUniform _x} forEach _uniform_items;
                    {_target addItemToVest _x} forEach _vest_items;
                    {_target addItemToBackpack _x} forEach _pack_items;

                    // load mags in new uniform
                    {_target addItemToUniform _x} forEach _uniform_mags;
                    {_target addItemToVest _x} forEach _vest_mags;
                    {_target addItemToBackpack _x} forEach _pack_mags;

                    // Assigned items
                    {
                        _target assignItem _x;
                    } forEach _assigned_items;

                    // Add back guns
                    _target addWeapon _primary;
                    {
                        _target addPrimaryWeaponItem _x;
                    } forEach _primary_stuff;
                    _target addWeapon _handgun;
                    {
                        _target addHandgunItem _x;
                    } forEach _handgun_stuff;
                    _target addWeapon _launcher;
                    {
                        _target addSecondaryWeaponItem _x;
                    } forEach _launcher_stuff;

                    _displayText = format["Snapshot Loaded! <br/> %1<br/>%2<br/>%3", _name, _time, _role];
                    ["ace_common_displayTextStructured", [_displayText, 3, player]] call CBA_fnc_localEvent;

                    diag_log format ["[CGQC_FNC] snapshot Loaded %1/%2/%3", _name, _time, _role];

                    // Set back patch
                    _target setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
                    [ _target, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

                    // Lower gun
                    [_target] call ace_weaponselect_fnc_putWeaponAway;

                } else {
                    hint "No player snapshot found";
                    diag_log "[CGQC_FNC] snapshot not found";
                };
            };
        };
     };
    case "all": {
        _players = allPlayers - entities "HeadlessClient_F";
        switch (_type) do {
            case "save": {
                {
                    _targetID = owner _x;
                    [_x, "save"] remoteExec ['CGQC_fnc_snapshot', _targetID];
                } forEach _players;
            };
            case "load": {
                {
                    _targetID = owner _x;
                    [_x, "load"] remoteExec ['CGQC_fnc_snapshot', _targetID];
                } forEach _players;
            };
        };
    };
};

diag_log "[CGQC_FNC] snapshot done";