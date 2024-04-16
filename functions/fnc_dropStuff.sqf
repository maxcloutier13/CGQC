// --- dropStuff ----------------------------------------------------------
// Handles the dropping of stuff
params ["_item", "_type"];
diag_log format ["[CGQC_FNC] dropStuff %1/%2 started", _item, _type];

CGQC_int_createHolder = {
    _unitPos = player getRelPos [1, 0];
	_closestHolder = _unitPos nearestObject "GroundWeaponHolder_Scripted";
	_holder = objNull;

	// If there is no close enough holders, create one
	if (_unitPos distance _closestHolder < 2) then {
		_holder = _closestHolder;
        hint "There's another backpack really close.."
	} else {
		_holder = createVehicle ["GroundWeaponHolder_Scripted", [0,0,100], [], 0, "CAN_COLLIDE"];
		_holder setPos _unitPos;
	};

	// Exit if the holder doesn't exist or is alreay named
	if ((typeOf _holder != "GroundWeaponHolder_Scripted") || (!isNil{_holder getVariable "cgqc_object_name"})) exitWith {};

	// Name the holder object
	_name = name player;
	_side = side player;
	_holder setVariable ["cgqc_object_name",_name, true];
	_holder setVariable ["cgqc_object_side",_side, true];
	[_holder, true, [0,0.9,1], 0] call ace_dragging_fnc_setCarryable;

    // Return the holder
    _holder;
};


_drop = true;
_action = "";
switch (_type) do {
    case "restore": {
        if (!isNil "cgqc_player_backpack_backup") then {
            hint "Restoring backpack";
            player addBackpack cgqc_player_backpack_backup select 0;
            {
                player addItemToBackpack _x;
            } forEach cgqc_player_backpack_backup select 1;
        } else {
            hint "Come on man! You don't need this";
        };
    };
    case "backpack_pickup": {
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
                        if (_x getVariable "cgqc_object_name" isEqualTo name player) then {
                            disableUserInput true;
                            _found = true;
                            diag_log "[CGQC_FNC] dropStuff - Backpack found. Grabbing";
                            hint "Pack found. Grabbing it";
                            //Grab the bag
                            player action ["AddBag", _holder, typeOf _x];
                            deleteMarkerLocal "cgqc_player_backpack";
                            cgqc_backpack_dropped = false;
                            disableUserInput false;
                            sleep 1;
                            deleteVehicle cgqc_backpack_holder;
                            break;
                        } else {
                            diag_log "[CGQC_FNC] dropStuff - Not player's backpack";
                        };
                    } forEach _packs;
                }
            } forEach _nearbyObjects;

            if !(_found) then {
                hint "Your backpack is not close enough";
                diag_log "[CGQC_FNC] dropStuff - No player backpack found";
            };
        };
    };
    case "backpack": {
        disableUserInput true;
        _item = typeOf unitBackpack player;
        _action = "DropBag";
        cgqc_backpack_holder = [] call CGQC_int_createHolder;
        // Set backpack name
        (unitBackpack player) setVariable ["cgqc_object_name", name player, true];
        // Take a backup of the backpack, just in case
        cgqc_player_backpack_backup = [_item, backpackItems player];
        player action [_action, cgqc_backpack_holder, _item];
        // Create personal marker for position
        _name = name player;
        _txt = format ["%1's Backpack", _name];
        _marker = createMarkerLocal ["cgqc_player_backpack", player, 1];
        "cgqc_player_backpack" setMarkerTypeLocal "hd_end_noShadow";
        "cgqc_player_backpack" setMarkerColorLocal "ColorBlack";
        "cgqc_player_backpack" setMarkerTextLocal _txt;
        disableUserInput false;
        cgqc_backpack_dropped = true;
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

diag_log "[CGQC_FNC] dropStuff finished";

/*
//Drop gear function
STMF_ACE_DropGear = {
	params ["_unit", "_itemToDrop",["_action","dropWeapon"]];

	private _unitPos = _unit getRelPos [1, 0];
	private _closestHolder = _unitPos nearestObject "GroundWeaponHolder";
	private _holder = objNull;

	if (_unitPos distance _closestHolder < STMF_ACE_CloseHolderDist) then {
		_holder = _closestHolder;
	} else {
		_holder = createVehicle ["GroundWeaponHolder", [0,0,100], [], 0, "CAN_COLLIDE"];
		_holder setPos _unitPos;

		[1, [[_unit, _holder],{_this call STMF_MarkGear}]] call STMF_CallInSeconds
	};
	_unit action [_action, _holder, _itemToDrop];
};

*/

        /*
        // Find if item or magazine
        if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
            _groundItemHolder addMagazineCargo [_item, _amount]; // Add the magazine to the holder
        } else {
            // Item
            _groundItemHolder addItemCargoGlobal [_item, _amount]; // Add the magazine to the holder

        };


        // Rename the ground weapon holder
        _name = format ["%1's gear", cgqc_custom_playername];
        _groundItemHolder setVariable ["cgqc_object_name", _name, true];
        */