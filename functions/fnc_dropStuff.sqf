#include "\CGQC\script_component.hpp"
// --- dropStuff ----------------------------------------------------------
// Handles the dropping of stuff
params ["_item", "_type", "_target"];
LOG_2(" dropStuff %1/%2 started", _item, _type);

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
switch (_type) do {
    case "stash":{
        LOG("DropStuff - Stash");
        _packName = typeOf unitBackpack player;
        _allMags = magazinesAmmoCargo backpackContainer player;
        _allItems = ItemCargo backpackContainer player;
        _pack = [_packName, _allMags, _allItems];
        _target setVariable ["cgqc_vic_stashedPack", _pack];
        cgqc_player_backpack_backup = _pack;
        removeBackpack player;
        cgqc_backpack_stashed = true;
        [["Pack is stashed", 1.5], true] call CBA_fnc_notify;
    };
    case "unstash":{
        LOG("DropStuff - Unstash");
        _var = _target getVariable "cgqc_vic_stashedPack";
        _pack = _var select 0;
        _allMags = _var select 1;
        _allItems = _var select 2;
        player addBackpack _pack;
        clearAllItemsFromBackpack player;
        sleep 0.5;
        {
            LOG_1("DropStuff - adding item %1", _x);
            player addItemToBackpack _x
        } forEach _allItems;
        {
            _mag = _x select 0;
            _amnt = _x select 1;
            LOG_2("DropStuff - adding mag %1:%2", _mag, _amnt);
            backpackContainer player addMagazineAmmoCargo [_mag, 1, _amnt];
        } forEach _allMags;
        sleep 0.5;
        _target setVariable ["cgqc_vic_stashedPack", nil];
        cgqc_player_backpack_backup = nil;
        cgqc_backpack_stashed = false;
        [["Grabbed your bag", 1.5], true] call CBA_fnc_notify;
    };
    case "toggle": {
        LOG("DropStuff - Toggle");
        if (cgqc_backpack_dropped) then {
            // Dropped: pick it up
            [player, 'backpack_pickup'] spawn CGQC_fnc_dropStuff;
        } else {
            // Not dropped: dropping
            [backpack player, 'backpack'] spawn CGQC_fnc_dropStuff;
        };
    };
    case "restore": {
        LOG("DropStuff - Restore backpack");
        if (!isNil "cgqc_player_backpack_backup") then {
            hint "Restoring backpack";
            cgqc_backpack_dropped = false;
            _pack = cgqc_player_backpack_backup select 0;
            _allMags = cgqc_player_backpack_backup select 1;
            _allItems = cgqc_player_backpack_backup select 2;
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
        LOG("DropStuff - Picking up pack");
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
                            LOG(" dropStuff - Backpack found. Grabbing");
                            hint "Pack found. Grabbing it";
                            //Grab the bag
                            player action ["AddBag", _holder, typeOf _x];
                            cgqc_player_backpack_backup = nil;
                            waitUntil {backpack player != ''};
                            if !(isNil "pack_marker") then {deleteMarkerLocal "cgqc_marker_backpack";};
                            cgqc_backpack_dropped = false;
                            sleep 1;
                            if !(isNil "cgqc_backpack_holder") then {
                               deleteVehicle cgqc_backpack_holder;
                            };
                            break;
                        } else {
                            LOG(" dropStuff - Not player's backpack");
                        };
                    } forEach _packs;
                }
            } forEach _nearbyObjects;

            if !(_found) then {
                hint "Your backpack is not close enough";
                LOG(" dropStuff - No player backpack found");
            };
        };
    };
    case "backpack": {
        LOG("DropStuff - Dropping pack");
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
        cgqc_player_backpack_backup = _pack;
        player action [_action, cgqc_backpack_holder, _packName];
        // Create personal marker for position
        pack_marker = createMarkerLocal ["cgqc_marker_backpack", player, 1];
        "cgqc_marker_backpack" setMarkerTypeLocal "loc_move";
        "cgqc_marker_backpack" setMarkerColorLocal "ColorRed";
        "cgqc_marker_backpack" setMarkerTextLocal " Pack";
        cgqc_backpack_dropped = true;
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

LOG("DropStuff finished");
