#include "\CGQC\script_component.hpp"
// --- dropStuff ----------------------------------------------------------
// Handles the dropping of stuff
params ["_item", "_dropAction", "_target", ["_swap", false]];
LOG_2("[dropStuff] %1/%2 started", _item, _dropAction);

CGQC_int_createHolder = {
    _playerPosASL = getPosASL player;
    // Calculate offset in front of the player (adjust as needed)
    _offset = [1, 0, 0]; // Offset in meters in the direction player is facing
    // Calculate position in front of the player at the same altitude
    _unitPos = _playerPosASL vectorAdd (_offset vectorMultiply (diag_tickTime - diag_tickTime + 1));
	_closestHolder = _unitPos nearestObject "GroundWeaponHolder_Scripted";
	_holder = objNull;

	// If there is no close enough holders, create one
	if (_unitPos distance _closestHolder < 2) then {
		_holder = _closestHolder;
        hint "There's another backpack really close.."
	} else {
		_holder = createVehicle ["GroundWeaponHolder_Scripted", [0,0,100], [], 0, "CAN_COLLIDE"];
		_holder setPosASL _unitPos;
	};

	// Exit if the holder doesn't exist or is alreay named
	if ((typeOf _holder != "GroundWeaponHolder_Scripted") || (!isNil{_holder getVariable "cgqc_name_object"})) exitWith {};

	// Name the holder object
	_name = name player;
	_side = side player;
	_holder setVariable ["cgqc_name_object",_name, true];
	_holder setVariable ["cgqc_object_side",_side, true];
	[_holder, true, [0,0.9,1], 0] call ace_dragging_fnc_setCarryable;

    // Return the holder
    _holder;
};

_drop = true;
_action = "";
switch (_dropAction) do {
    case "stash_all":{
        //Stash all available items
        LOG("[dropStuff] - Stash all");
        // guns
        if (primaryWeapon player isNotEqualTo "" || handgunWeapon player isNotEqualTo "") then {
            ['guns', 'stash_guns', _target] call CGQC_fnc_dropStuff;
        };
        // launcher
        if (secondaryWeapon player isNotEqualTo "" ) then {
            ['launcher', 'stash_launcher', _target] call CGQC_fnc_dropStuff;
        };
        // head
        if (goggles player isNotEqualTo "" || headgear player isNotEqualTo "") then {
            ['head', 'stash_head', _target] call CGQC_fnc_dropStuff;
        };
        // uniform
        if (uniform player isNotEqualTo "" ) then {
            ['uniform', 'stash_uniform', _target] call CGQC_fnc_dropStuff;
        };
        // vest
        if (vest player isNotEqualTo "" ) then {
            ['vest', 'stash_vest', _target] call CGQC_fnc_dropStuff;
        };
        // pack
        if (backpack player isNotEqualTo "" ) then {
            ['pack', 'stash_pack', _target] call CGQC_fnc_dropStuff;
        };
    };
    case "grab_all":{
        //Grab and switch all available items
        LOG("[dropStuff] - Grab all");
        // guns
        _guns = _target getVariable format ["cgqc_vic_stashedGuns_%1", name player];
        if !(isNil "_guns") then {
            if (primaryWeapon player isEqualTo "" && handgunWeapon player isEqualTo "") then {
               ['guns', 'unstash_guns', _target] call CGQC_fnc_dropStuff;
            } else {
                ['guns', 'unstash_guns', _target, true] call CGQC_fnc_dropStuff;
            };
        };
        // launcher
        _launcher = _target getVariable format ["cgqc_vic_stashedLauncher_%1", name player];
        if !(isNil "_launcher") then {
            if (secondaryWeapon player isEqualTo "") then {
               ['launcher', 'unstash_launcher', _target] call CGQC_fnc_dropStuff;
            } else {
                ['launcher', 'unstash_launcher', _target, true] call CGQC_fnc_dropStuff;
            };
        };
        // head
        _head = _target getVariable format ["cgqc_vic_stashedHead_%1", name player];
        if !(isNil "_head") then {
            if (goggles player isEqualTo "" && headgear player isEqualTo "") then {
               ['head', 'unstash_head', _target] call CGQC_fnc_dropStuff;
            } else {
                ['head', 'unstash_head', _target, true] call CGQC_fnc_dropStuff;
            };
        };
        // uniform
        _uniform = _target getVariable format ["cgqc_vic_stashedUniform_%1", name player];
        if !(isNil "_uniform") then {
            if (uniform player isEqualTo _uniform) then {
               ['uniform', 'unstash_uniform', _target] call CGQC_fnc_dropStuff;
            } else {
                ['uniform', 'unstash_uniform', _target, true] call CGQC_fnc_dropStuff;
            };
        };
        // vest
        _vest = _target getVariable format ["cgqc_vic_stashedVest_%1", name player];
        if !(isNil "_vest") then {
            if (vest player isEqualTo "") then {
               ['vest', 'unstash_vest', _target] call CGQC_fnc_dropStuff;
            } else {
                ['vest', 'unstash_vest', _target, true] call CGQC_fnc_dropStuff;
            };
        };
        // pack
        _pack = _target getVariable format ["cgqc_vic_stashedPack_%1", name player];
        if !(isNil "_pack") then {
            if (backpack player isEqualTo "") then {
                ['pack', 'unstash_pack', _target] call CGQC_fnc_dropStuff;
            } else {
                ['pack', 'unstash_pack', _target, true] call CGQC_fnc_dropStuff;
            };
        };
    };
    case "stash_guns":{
        LOG("[dropStuff] - Stash Guns");
        _primary_gun = primaryWeapon player;
        _primary_acc = primaryWeaponItems player;
        _primary_mag = primaryWeaponMagazine player;
        _handgun_gun = handgunWeapon player;
        _handgun_acc = handgunItems player;
        _handgun_mag = handgunMagazine player;
        _primary = [_primary_gun, _primary_acc, _primary_mag];
        _handgun = [_handgun_gun, _handgun_acc, _handgun_mag];
        _guns = [_primary, _handgun];
        _target setVariable [format ["cgqc_vic_stashedGuns_%1", name player], _guns];
        cgqc_stash_guns_backup = _guns;
        player removeWeapon _primary_gun;
        player removeWeapon _handgun_gun;
        [["Guns are stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_guns":{
        LOG("[dropStuff] - Unstash Guns");
        _var = _target getVariable format ["cgqc_vic_stashedGuns_%1", name player];

        // Save current guns before grabbing a the stashed one
        if (_swap || primaryWeapon player isNotEqualTo "" || handgunWeapon player isNotEqualTo "") then {
            ['guns', 'stash_guns', _target] call CGQC_fnc_dropStuff;
            [["Swapped your guns", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your guns", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_guns_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedGuns_%1", name player], nil];
        };

        _entry_primary = _var select 0;
        _entry_handgun = _var select 1;

        _primary = _entry_primary select 0;
        _primary_acc = _entry_primary select 1;
        _primary_mag = _entry_primary select 2;
        _primary_stuff = _primary_acc + _primary_mag;

        _handgun = _entry_handgun select 0;
        _handgun_acc = _entry_handgun select 1;
        _handgun_mag = _entry_handgun select 2;
        _handgun_stuff = _handgun_acc + _handgun_mag;

        if (_primary isNotEqualTo "") then {
            player removeWeapon (primaryWeapon player);
            player addWeapon _primary;
            {player addPrimaryWeaponItem _x;} forEach _primary_stuff;
        };
        if (_handgun isNotEqualTo "") then {
            // Add Handgun
            player removeWeapon (handgunWeapon player);
            player addWeapon _handgun;
            {player addHandgunItem _x;} forEach _handgun_stuff;
        };
    };
    case "stash_launcher":{
        LOG("[dropStuff] - Stash launcher");
        _launcher_gun = secondaryWeapon player;
        _launcher_acc = secondaryWeaponItems player;
        _launcher_mag = secondaryWeaponMagazine player;
        _launcher = [_launcher_gun, _launcher_acc, _launcher_mag];
        _target setVariable [format ["cgqc_vic_stashedLauncher_%1", name player], _launcher];
        cgqc_stash_launcher_backup = _launcher;
        player removeWeapon _launcher_gun;
        [["Launcher stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_launcher":{
        LOG("[dropStuff] - Unstash launcher");
        _var = _target getVariable format ["cgqc_vic_stashedLauncher_%1", name player];
        // Save current guns before grabbing a the stashed one
        if (_swap || secondaryWeapon player isNotEqualTo "") then {
            ['launcher', 'stash_launcher', _target] call CGQC_fnc_dropStuff;
            [["Swapped your launcher", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your launcher", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_launcher_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedLauncher_%1", name player], nil];
        };
        _launcher_gun = _var select 0;
        _launcher_acc = _var select 1;
        _launcher_mag = _var select 2;
        _launcher_stuff = _launcher_acc + _launcher_mag;

        if (_launcher_gun isNotEqualTo "") then {
            player removeWeapon (secondaryWeapon player);
            player addWeapon _launcher_gun;
            {player addPrimaryWeaponItem _x;} forEach _launcher_stuff;
        };
    };
    case "stash_head":{
        LOG("[dropStuff] - Stash Head");
        _hat = headgear player;
        _face = goggles player;
        _head = [_hat, _face];
        _target setVariable [format ["cgqc_vic_stashedHead_%1", name player], _head];
        cgqc_stash_head_backup = _head;
        removeGoggles player;
        removeHeadgear player;
        [["Head/face is stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_head":{
        LOG("[dropStuff] - Unstash Head");
        _var = _target getVariable format ["cgqc_vic_stashedHead_%1", name player];
        // Save current vest before grabbing a the stashed one
        if (_swap || goggles player isNotEqualTo "" || headgear player isNotEqualTo "") then {
            ['head', 'stash_head', _target] call CGQC_fnc_dropStuff;
            [["Swapped your head/face", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your head/face", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_head_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedHead_%1", name player], nil];
        };
        _hat = _var select 0;
        _goggles = _var select 1;
        if (_hat isNotEqualTo "") then {
            player addHeadgear _hat;
        };
        if (_goggles isNotEqualTo "") then {
            player addGoggles _goggles;
        };
    };
    case "stash_uniform":{
        LOG("[dropStuff] - Stash Uniform");
        _uniformName = uniform player;
        _target setVariable [format ["cgqc_vic_stashedUniform_%1", name player], _uniformName];
        cgqc_stash_uniform_backup = _uniformName;
        [["Uniform is stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_uniform":{
        LOG("[dropStuff] - Unstash uniform");
        _var = _target getVariable format ["cgqc_vic_stashedUniform_%1", name player];
        // Save current uniform before grabbing a the stashed one
        if (_swap || uniform player isNotEqualTo _var) then {
            ['uniform', 'stash_uniform', _target] call CGQC_fnc_dropStuff;
            [["Swapped your uniform", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your uniform", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_uniform_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedUniform_%1", name player], nil];
        };
        _uniform = _var;
        _allMags = magazinesAmmoCargo vestContainer player;
        _allItems = ItemCargo vestContainer player;
        player forceAddUniform _uniform;
        {
            LOG_1("[dropStuff] - adding item %1", _x);
            player addItemToUniform _x
        } forEach _allItems;
        {
            _mag = _x select 0;
            _amnt = _x select 1;
            LOG_2("[dropStuff] - adding mag %1:%2", _mag, _amnt);
            uniformContainer player addMagazineAmmoCargo [_mag, 1, _amnt];
        } forEach _allMags;
    };
    case "stash_vest":{
        LOG("[dropStuff] - Stash Vest");
        _vestName = vest player;
        _allMags = magazinesAmmoCargo vestContainer player;
        _allItems = ItemCargo vestContainer player;
        _vest = [_vestName, _allMags, _allItems];
        _target setVariable [format ["cgqc_vic_stashedVest_%1", name player], _vest];
        cgqc_stash_vest_backup = _vest;
        removeVest player;
        [["Vest is stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_vest":{
        LOG("[dropStuff] - Unstash Vest");
        _var = _target getVariable format ["cgqc_vic_stashedVest_%1", name player];
        // Save current vest before grabbing a the stashed one
        if (_swap || vest player isNotEqualTo "") then {
            ['vest', 'stash_vest', _target] call CGQC_fnc_dropStuff;
            [["Swapped your vest", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your vest", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_vest_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedVest_%1", name player], nil];
        };
        _vest = _var select 0;
        _allMags = _var select 1;
        _allItems = _var select 2;
        player addVest _vest;
        //clearAllItemsFromBackpack player;
        //sleep 0.5;
        {
            LOG_1("[dropStuff] - adding item %1", _x);
            player addItemToVest _x
        } forEach _allItems;
        {
            _mag = _x select 0;
            _amnt = _x select 1;
            LOG_2("[dropStuff] - adding mag %1:%2", _mag, _amnt);
            vestContainer player addMagazineAmmoCargo [_mag, 1, _amnt];
        } forEach _allMags;
    };
    case "stash_pack":{
        LOG("[dropStuff] - Stash Backpack");
        _packName = typeOf unitBackpack player;
        _allMags = magazinesAmmoCargo backpackContainer player;
        _allItems = ItemCargo backpackContainer player;
        _pack = [_packName, _allMags, _allItems];
        _target setVariable [format ["cgqc_vic_stashedPack_%1", name player], _pack];
        cgqc_stash_pack_backup = _pack;
        removeBackpack player;
        [["Pack is stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash_pack":{
        LOG("[dropStuff] - Unstash");
        _var = _target getVariable format ["cgqc_vic_stashedPack_%1", name player];
        // Save current vest before grabbing a the stashed one
        if (_swap || backpack player isNotEqualTo "") then {
            ['pack', 'stash_pack', _target] call CGQC_fnc_dropStuff;
            [["Swapped your pack", 1.5], true] call CBA_fnc_notify;
        } else {
            [["Grabbed your pack", 1.5], true] call CBA_fnc_notify;
            cgqc_stash_pack_backup = nil;
            _target setVariable [format ["cgqc_vic_stashedPack_%1", name player], nil];
        };
        _pack = _var select 0;
        _allMags = _var select 1;
        _allItems = _var select 2;
        player addBackpack _pack;
        clearAllItemsFromBackpack player;
        sleep 0.5;
        {
            LOG_1("[dropStuff] - adding item %1", _x);
            player addItemToBackpack _x
        } forEach _allItems;
        {
            _mag = _x select 0;
            _amnt = _x select 1;
            LOG_2("[dropStuff] - adding mag %1:%2", _mag, _amnt);
            backpackContainer player addMagazineAmmoCargo [_mag, 1, _amnt];
        } forEach _allMags;
    };
    case "toggle": {
        LOG("[dropStuff] - Toggle");
        if (cgqc_backpack_dropped) then {
            // Dropped: pick it up
            [player, 'backpack_pickup'] spawn CGQC_fnc_dropStuff;
        } else {
            // Not dropped: dropping
            [backpack player, 'backpack'] spawn CGQC_fnc_dropStuff;
        };
    };
    case "restore": {
        LOG("[dropStuff] - Restore backpack");
        if (!isNil "cgqc_stash_pack_backup") then {
            hint "Restoring backpack";
            cgqc_backpack_dropped = false;
            _pack = cgqc_stash_pack_backup select 0;
            _allMags = cgqc_stash_pack_backup select 1;
            _allItems = cgqc_stash_pack_backup select 2;
            player addBackpack _pack;
            clearAllItemsFromBackpack player;
            {
                _mag = _x select 0;
                _amnt = _x select 1;
                backpackContainer player addMagazineAmmoCargo [_mag, 1, _amnt];
            } forEach _allMags;
            {
                player addItemToBackpack _x
            } forEach _allItems;
            // Delete marker and holder
            if !(isNil "pack_marker") then {deleteMarkerLocal "cgqc_marker_backpack";};
            if !(isNil "cgqc_backpack_holder") then {deleteVehicle cgqc_backpack_holder;};
        } else {
            hint "Come on man! You don't need this";
        };
    };
    case "backpack_pickup": {
        LOG("[dropStuff] - Picking up pack");
        [] spawn {
            _drop = false;
            _found = false;
            _center = player; // Position of the player
            _radius = 5; // Search radius
            _objectType = "GroundWeaponHolder_Scripted"; // Type of object to search for
            // Get all objects of the specified type within the search radius
            _nearbyObjects = nearestObjects [_center, [_objectType], _radius];
            {
                _holder = _x;
                // Check if the object contains a backpack
                if (_holder isKindOf "WeaponHolder") then {
                    // Backpack found!
                    _packs = everyBackpack _holder;
                    {
                        if (_x getVariable "cgqc_name_object" isEqualTo name player) then {
                            _found = true;
                            LOG("[dropStuff] - Backpack found. Grabbing");
                            hint "Pack found. Grabbing it";
                            //Grab the pack
                            player action ["AddBag", _holder, typeOf _x];
                            cgqc_stash_pack_backup = nil;
                            waitUntil {backpack player != ''};
                            if !(isNil "pack_marker") then {deleteMarkerLocal "cgqc_marker_backpack";};
                            cgqc_backpack_dropped = false;
                            sleep 1;
                            if !(isNil "cgqc_backpack_holder") then {
                               deleteVehicle cgqc_backpack_holder;
                            };
                            break;
                        } else {
                            LOG("[dropStuff] - Not player's backpack");
                        };
                    } forEach _packs;
                }
            } forEach _nearbyObjects;

            if !(_found) then {
                hint "Your backpack is not close enough";
                LOG("[dropStuff] - No player backpack found");
            };
        };
    };
    case "backpack": {
        LOG("[dropStuff] - Dropping pack");
        _pack = unitBackpack player;
        _packName = typeOf _pack;
        _action = "DropBag";
        cgqc_backpack_holder = [] call CGQC_int_createHolder;
        // Add ace options to holder
        //_actionAce = [ "menu_pack", "Lock Backpack", "", {cgqc_backpack_holder setVariable ["cgqc_object_lock", true]}, {!(cgqc_backpack_holder getVariable ["cgqc_object_lock", false])} ] call ace_interact_menu_fnc_createAction;
		//_adding = [ cgqc_backpack_holder, 0, ["ACE_MainActions" ], _actionAce ] call  ace_interact_menu_fnc_addActionToObject;
        //_actionAce = [ "menu_packUnlock", "UnLock Backpack", "", {cgqc_backpack_holder setVariable ["cgqc_object_lock", false]}, {cgqc_backpack_holder getVariable ["cgqc_object_lock", false]} ] call ace_interact_menu_fnc_createAction;
		//_adding = [ cgqc_backpack_holder, 0, ["ACE_MainActions" ], _actionAce ] call  ace_interact_menu_fnc_addActionToObject;

        // Set backpack name
        _pack setVariable ["cgqc_name_object", name player, true];
        //cgqc_backpack_holder setVariable ["cgqc_name_object", name player, true];
        //cgqc_backpack_holder setVariable ["cgqc_object_lock", true, true];
       /* cgqc_backpack_holder addEventHandler ["ContainerOpened", {
            params ["_container", "_unit"];
            if (_container getVariable ["cgqc_object_lock", false]) then {
                _packName = _container getVariable "cgqc_name_object";
                // Pack is locked. Check if it's being opened by the owner
                if (name _unit isNotEqualTo _packName) exitWith {
                    [{
                        !isNull (findDisplay 602)
                    },
                    {
                        (findDisplay 602) closeDisplay 0;
                        if !(isNil "ace_common_fnc_displayTextStructured") then {
                            ["Backpack is locked"] call ace_common_fnc_displayTextStructured;
                        } else {
                            hint "Backpack is locked";
                        };
                    },
                    []] call CBA_fnc_waitUntilAndExecute;
                };
            };
        }];*/
        // Take a backup of the backpack, just in case
        _allMags = magazinesAmmoCargo backpackContainer player;
        _allItems = ItemCargo backpackContainer player;
        _pack = [_packName, _allMags, _allItems];
        cgqc_stash_pack_backup = _pack;
        player action [_action, cgqc_backpack_holder, _packName];
        // Create personal marker for position
        pack_marker = createMarkerLocal ["cgqc_marker_backpack", player, 1];
        "cgqc_marker_backpack" setMarkerTypeLocal "loc_move";
        "cgqc_marker_backpack" setMarkerColorLocal "ColorRed";
        "cgqc_marker_backpack" setMarkerTextLocal " Pack";
        cgqc_backpack_dropped = true;
        [["Backpack dropped", 1.5], false] call CBA_fnc_notify;
        if (cgqc_flag_backpackNotif) then {
            [] spawn {
                while {alive player && cgqc_backpack_dropped && !cgqc_backpack_dropped_notif} do {
                    // Check distance, if too far notify the player
                    if (player distance cgqc_backpack_holder > 100) then {
                        _text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Oublie pas ton backpack!</t><br/>";
                        [_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;
                        cgqc_backpack_dropped_notif = true;
                    };
                    sleep 30;
                };
            };
        };
    };
    case "mags": {
        _action = "DropMagazine";
        _holder = player;
    };
    case "items": {
        _action = "DropMagazine";
        _holder = player;
    };
};

LOG("[dropStuff] finished");
