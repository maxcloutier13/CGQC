cgqc_fnc_spawnVic = {
	[] spawn {
		_pos = player getPos [15, getDir player];
		_vehicle = createVehicle ['Land_HelipadEmpty_F', _pos, [], 0, 'NONE'];
		_vehicle setVariable ['BIS_enableRandomization', false];
		['Open', [true, _vehicle]] call BIS_fnc_garage;
	};
};

cgqc_fnc_deleteVic = {
	//deleteVehicle cgqc_spawn_vic;
	//cgqc_spawn=false;
	_player = player;
	_cursorTarget = cursorTarget;
	_distance = _player distance _cursorTarget;
	_state = false;
	if (_distance <= 30) then {
		deleteVehicle _cursorTarget;
		hintSilent 'Vic deleted';
		_state = true;
	} else {
		hint 'You have to be < 30m from a vehicle to remove it.';
		{ sleep 5; hintSilent ''; } spawn BIS_fnc_spawn;
		_state = false;
	};
	_state
};

// Vehicle spawner ---------------------------------------------------------------------------------
_action = [ "menu_self_training_vic", "Vehicles", "CGQC\textures\cgqc_ace_vic", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;


_action = [ "menu_self_training_spawn", "Spawn Vehicle", "", {
	_spawn = [] call cgqc_fnc_spawnVic;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_vic"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_self_training_spawn_del", "Delete Vehicle", "", {
	[] call cgqc_fnc_deleteVic;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_vic"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Event when the garage is closed 
[missionNamespace, 'garageClosed', {
    _textures = getObjectTextures BIS_fnc_garage_center;
    deleteVehicle BIS_fnc_garage_center;
    _newvehicle = createVehicle [typeOf BIS_fnc_garage_center, (player getPos [17, getDir player]), [], 0, "NONE"];
	if(!isNil "cgqc_spawnvic_h") then {deleteVehicle cgqc_spawnvic_h}; 
	cgqc_spawnvic_h = "cgqc_refuel_h_short" createVehicle (getPos _newvehicle);
	_count = 0;
    {
        _newvehicle setObjectTextureGlobal [_count, _x];
        _count = _count + 1;
    } forEach _textures;

    if (unitIsUAV _newvehicle) then {
        createVehicleCrew _newvehicle;
    };
	// Open pylon editor? 
	[_newvehicle] call ace_pylons_fnc_showDialog;
}] call BIS_fnc_addScriptedEventHandler;