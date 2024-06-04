#include "\CGQC\script_component.hpp"
// --- snapshot ----------------------------------------------------------
// Saves/update a snapshot of the target
params [["_target", player], ["_type", "save"], ["_scope", "single"], ["_snapshotType", "player"]];
LOG_4("[Snapshot] %1/%2/%3/%4 started", _target, _type, _scope, _snapshotType);

cgqc_snapshot_version = 1;

// Variants
// player - missionProfil local save
// auto - save when getting out of arsenal
// start - mission group save at mission start
// zeus - mission group save
_snapshot_slot = "";
_snapshotDone = false;
_snapshot_slot_version = "";
switch (_snapshotType) do {
    case "player": {
        _snapshot_slot = "cgqc_player_snapshot";
        _snapshotDone = "cgqc_player_snapshot_done";
        _snapshot_slot_version = "cgqc_player_snapshot_version";
    };
    case "auto": {
        _snapshot_slot = "cgqc_player_snapshot_auto";
        _snapshotDone = "cgqc_player_snapshot_auto_done";
        _snapshot_slot_version = "cgqc_player_snapshot_auto_version";
    };
    case "start": {
        _snapshot_slot = "cgqc_player_snapshot_start";
        _snapshotDone = "cgqc_player_snapshot_start_done";
        _snapshot_slot_version = "cgqc_player_snapshot_start_version";
    };
    case "zeus": {
        _snapshot_slot = "cgqc_player_snapshot_zeus";
        _snapshotDone = "cgqc_player_snapshot_zeus_done";
        _snapshot_slot_version = "cgqc_player_snapshot_zeus_version";
    };
};

switch (_scope) do {
    case "single": {
        // Get snapshot, or create it if not found
        _found = true;
        _snapshot = MissionProfileNamespace getVariable _snapshot_slot;
        if (isNil "_snapshot") then {
            _snapshot = [];
            _found = false;
        };
        _name = name _target;
        //Set ready so it's not saved during repos
        ["ready", true] spawn CGQC_fnc_perksBasic;
        switch (_type) do {
            case "save": {
                //Info to save
                _time = format ["%1/%2/%3-%4:%5", systemTime select 0, systemTime select 1, systemTime select 2, systemTime select 3, systemTime select 4];
                //Team
                _team = groupId group _target;
                //Color
                _color = assignedTeam _target;
                //Role
                _role = _target getVariable ["cgqc_player_role", "Unknown"];
                // Equipment
                _helmet = headgear _target;
                _goggles = goggles _target;
                _assigned_items = assignedItems [_target, false, false];
                // Equipment array
                _entry_gear = [_helmet, _goggles, _assigned_items];
                // Weapons
                _binocular = binocular _target;
                _binocular_acc = binocularItems _target;
                _binocular_mag = binocularMagazine _target;
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
                _entry_binocular = [_binocular, _binocular_acc, _binocular_mag];
                _entry_weapons = [_entry_primary, _entry_handgun, _entry_launcher, _entry_binocular];
                // List of radios to exclude from item lists
                _exclude_radios = [] call acre_api_fnc_getAllRadios;
                // Loadout
                _uniform = uniform _target;
                _uniform_items = uniformItems _target - _exclude_radios;
                _vest = vest _target;
                _vest_items = vestItems _target - _exclude_radios;
                _pack = backpack _target;
                _pack_items = backpackItems _target - _exclude_radios;

                // Build the loadout entries with the info
                _entry_uniform = [_uniform, _uniform_items];
                _entry_vest = [_vest, _vest_items];
                _entry_pack = [_pack, _pack_items];
                _entry_radios = [_target] call CGQC_fnc_listRadios;

                // Additional stuff
                // Face
                _face = face _target;
                // Slinged weapon
                _slinged = [_target] call GRAD_slingHelmet_fnc_getSlungHelmet;

                _secondPrimary = "";
                _secondPrimaryAcc = [];
                // Second Primary
                if !((isNil {_target getVariable "WBK_SecondWeapon"})) then {
                    _secondPrimaryArray = (player getVariable "WBK_SecondWeapon") select 1;
                    _secondPrimary = _secondPrimaryArray select 0;
                    _item1 = _secondPrimaryArray select 1;
                    _item2 = _secondPrimaryArray select 2;
                    _item3 = _secondPrimaryArray select 3;
                    _item4 = _secondPrimaryArray select 6;
                    _mag1 = (_secondPrimaryArray select 4) select 0;
                    _secondPrimaryAcc = [_mag1, _item1, _item2, _item3, _item4];
                };
                _secondPrimaryArray = [_secondPrimary, _secondPrimaryAcc];

                // BackpackOnChest
                _chestPack = [_target] call bocr_main_fnc_chestpack;
                _chestPackLoadout = [];
                _chestPackVariable = [];
                if (_chestPack isNotEqualTo "") then {
                    _chestPackLoadout = [_target] call bocr_main_fnc_chestpackLoadout;
                    _chestPackVariable = [_target] call bocr_main_fnc_chestpackVariables;
                };

                _chestPackLoad = 0.5;
                _chestArray = [_chestPack, _chestPackLoadout, _chestPackVariable, _chestPackLoad];

                _additionals = [_face, _slinged, _secondPrimaryArray, _chestArray];
                // Snapshot entry
                _entry = [_name, _time, _team, _color, _role, _entry_uniform, _entry_vest, _entry_pack, _entry_gear, _entry_weapons, _entry_radios, _additionals];

                hint format ["%1 snapshot saved: %2", _snapshotType, _role];
                MissionProfileNamespace setVariable [_snapshot_slot, _entry];
                MissionProfileNamespace setVariable [_snapshot_slot_version, cgqc_snapshot_version];
                MissionProfileNamespace setVariable [_snapshotDone, true];
                saveMissionProfileNamespace;
            };
            case "load": {
                if (_found) then {
                    hint "Player snapshot found";
                    LOG(" snapshot found!");
                    // Check version
                    _checkVersion = MissionProfileNamespace getVariable [_snapshot_slot_version, 0];
                    if (_checkVersion < cgqc_snapshot_version) exitWith {
                        hint "Snapshot incompatible... skipping.";
                    };
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
                    _entry_binocular = _entry_weapons select 3;
                    _entry_radios = _snapshot select 10;
                    _additionals = _snapshot select 11;

                    // Uniforms
                    _uniform = _entry_uniform select 0;
                    _uniform_items = _entry_uniform select 1;
                    _vest = _entry_vest select 0;
                    _vest_items = _entry_vest select 1;
                    _pack = _entry_pack select 0;
                    _pack_items = _entry_pack select 1;

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
                    _binocular = _entry_binocular select 0;
                    _binocular_acc = _entry_binocular select 1;
                    _binocular_mag = _entry_binocular select 2;
                    _binocular_stuff = _binocular_acc + _binocular_mag;

                    // Additionals
                    _face = _additionals select 0;
                    // Slinged weapon
                    _slinged = _additionals select 1;
                    // Second Primary
                    _secondPrimaryArray =  _additionals select 2;
                    _chestArray = _additionals select 3;


                    // Rejoin to team
                    [_team, _color] spawn CGQC_fnc_joinGroup;
                    // Grab back the role if possible
                    [_role, 1, false, false]  spawn CGQC_fnc_switchRole;

                    // Remove everything
                    [] call CGQC_fnc_removeAll;
                    waitUntil {cgqc_removeAll_done};
                    sleep 0.1;
                    // Face/identity
                    _target setFace _face;
                    // Slinged helmet
                    [_target, _slinged] call GRAD_slingHelmet_fnc_addSlungHelmet;


                    // WBK Secondary weapon
                    /*
                    _secondPrimary = _secondPrimaryArray select 0;
                    if (_secondPrimary isNotEqualTo "") then {
                        _secondPrimaryAcc = _secondPrimaryArray select 1;
                        // Add primary
                        _target addWeapon _secondPrimary;
                        {
                            _target addPrimaryWeaponItem _x;
                        } forEach _secondPrimaryAcc;
                        if (!(isNil {_target getVariable "WBK_SecondWeapon"})) exitWith {_target spawn WBK_CreateSwitchBetweenWeapons;};
		                _target spawn WBK_CreateWeaponSecond;
                    };*/

                    // BackpackOnChest
                    _packChest = _chestArray select 0;
                    _packChestItems = _chestArray select 1;
                    _packChestVars = _chestArray select 2;
                    _packChestLoad = _chestArray select 3;

                    // Add selected uniform
                    _target addGoggles _goggles;
                    _target addHeadgear _helmet;
                    _target forceAddUniform _uniform;
                    _target addVest _vest;
                    clearItemCargo _target;
                    {_target addItemToUniform _x} forEach _uniform_items;
                    {_target addItemToVest _x} forEach _vest_items;
                    //Backpack on chest
                    if (_packChest isNotEqualTo "") then {
                        [_target, _packChest, _packChestItems, _packChestVars, _packChestLoad] call bocr_main_fnc_addChestpack;
                    };
                    if (_pack isNotEqualTo "") then {
                        removeBackpack _target;
                        waitUntil {backpack _target isEqualTo ""};
                        _target addBackpack _pack;
                        clearAllItemsFromBackpack _target;
                        {_target addItemToBackpack _x;} forEach _pack_items;
                    } else {
                        removeBackpack _target;
                        waitUntil {backpack _target isEqualTo ""};
                    };

                    // Radios
                    {
                        _type = _x select 0;
                        // Add radio
                        _target addItemToUniform _type;
                    } forEach _entry_radios;
                    _id = 0;
                    _radios = [] call acre_api_fnc_getCurrentRadioList;
                    {
                        _settings = _entry_radios select _id;
                        _chan = _settings select 1;
                        _side = _settings select 2;
                        _vol = _settings select 3;
                        _speaker = _settings select 4;
                        if !(isNil "_chan") then {
                            [_x, _chan] call acre_api_fnc_setRadioChannel;
                        };
                        if !(isNil "_side") then {
                            [_x, _side] call acre_api_fnc_setRadioSpatial;
                        };
                        if !(isNil "_vol") then {
                            [_x, _vol] call acre_api_fnc_setRadioVolume;
                        };
                        _id = _id + 1;
                    } forEach _radios;
                    // Set radios PTT
                    [_radios] call acre_api_fnc_setMultiPushToTalkAssignment;

                    // Assigned items
                    {
                        _target linkItem _x;
                    } forEach _assigned_items;

                    // Add primary
                    _target addWeapon _primary;
                    {
                        _target addPrimaryWeaponItem _x;
                    } forEach _primary_stuff;
                    // Add Handgun
                    _target addWeapon _handgun;
                    {
                        _target addHandgunItem _x;
                    } forEach _handgun_stuff;
                    // Add Launcher
                    _target addWeapon _launcher;
                    {
                        _target addSecondaryWeaponItem _x;
                    } forEach _launcher_stuff;
                    // Add binoculars
                    _target addWeapon _binocular;
                    {
                        _target addSecondaryWeaponItem _x;
                    } forEach _binocular_stuff;

                    _displayText = format["Snapshot Loaded! <br/> %1<br/>%2<br/>%3", _name, _time, _role];
                    ["ace_common_displayTextStructured", [_displayText, 3, player]] call CBA_fnc_localEvent;

                    LOG_3(" snapshot Loaded %1/%2/%3", _name, _time, _role);

                    // Reset team color au cas
                    [_color] call CGQC_fnc_setTeamColor;
                    // Set back patch
                    [] call CGQC_fnc_setPatch;

                    // Lower gun
                    [_target] call ace_weaponselect_fnc_putWeaponAway;

                } else {
                    hint "No player snapshot found";
                    LOG(" snapshot not found");
                };
            };
        };
     };
    case "all": {
        _players = [] call CGQC_int_allHumanPlayers;
        switch (_type) do {
            case "save": {
                {
                    _targetID = owner _x;
                    [_x, "save", "single", _snapshotType] remoteExec ['CGQC_fnc_snapshot', _targetID];
                } forEach _players;
            };
            case "load": {
                {
                    _targetID = owner _x;
                    [_x, "load", "single", _snapshotType] remoteExec ['CGQC_fnc_snapshot', _targetID];
                } forEach _players;
            };
        };
    };
};

LOG("[Snapshot] done");