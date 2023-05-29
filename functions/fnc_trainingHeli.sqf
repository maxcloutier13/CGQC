// --- trainingMortar ----------------------------------------------------------
// Manual mortar training 

_type = _this select 0;

switch (_type) do
{
	case "easy":	{
		cgqc_training_mortar_difficulty = 0;
		cgqc_training_mortar_min = 250;
		cgqc_training_mortar_max = 800;
		["start"] execVM "mortar.sqf";
	};
	case "normal":	{
		cgqc_training_mortar_difficulty = 1;
		cgqc_training_mortar_min = 500;
		cgqc_training_mortar_max = 1500;
		["start"] execVM "mortar.sqf";
	};
	case "hard":	{
		cgqc_training_mortar_difficulty = 2;
		cgqc_training_mortar_min = 250;
		cgqc_training_mortar_max = 3100;
		["start"] execVM "mortar.sqf";
	};
	case "items_basic": {
		_items = (items player);
		if !("ACE_MapTools" in _items) then {player addItem "ACE_MapTools";};
		if !("acex_intelitems_notepad" in _items) then {player addItem "acex_intelitems_notepad";};
		if !("ACE_artilleryTable" in _items) then {player addItem "ACE_artilleryTable";};
	};
	case "items_advanced": {
		["items_basic"] execVM "mortar.sqf";
		// Add cellphone and shits
	};
	case "start":	{
		cgqc_training_mortar = true;
		cgqc_training_mortar_target = "";

		// Spawnk mk6 mortar  
		_safepos = (getPosATL player) findEmptyPosition [1,25, "B_G_Mortar_01_F"];
		cgqc_training_mortar_mortar = "B_G_Mortar_01_F" createVehicle _safepos;
		// Attach the event handler to the mortar vehicle
		cgqc_training_mortar_mortar addEventHandler ["Fired", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_mags", "_projectile", "_gunner"];
			hint "Projectile Fired!";
			_projectile addEventHandler ["Explode", {
				params ["_projectile", "_pos", "_velocity"];
				hint "Projectile exploded!";
				// Get the position of the shell
				_distance = _pos distance cgqc_training_mortar_target;
				if (_distance < 25) then {
					hint format ["Direct hit! Shell fell %1 meters away.", _distance];
				};
				if (_distance > 25 && _distance < 50) then {
					hint format ["Decent shot. Shell fell %1 meters away.", _distance];
				};
				if (_distance > 50 && _distance < 100) then {
					hint format ["Almost... Shell fell %1 meters away.", _distance];
				};
				if (_distance > 100) then {
					hint format ["Meh! Shell fell %1 meters away.", _distance];
				};
			}];
		}];

		//Find good target location
		y_targetArea = [ player, cgqc_training_mortar_min, cgqc_training_mortar_max, 5, 0, 30, 0] call BIS_fnc_findSafePos;
		_safepos = y_targetArea findEmptyPosition [1,100, "C_Van_01_fuel_F"];
		cgqc_training_mortar_target = "C_Van_01_fuel_F" createVehicle _safepos;

		if (cgqc_training_mortar_difficulty < 1) then {
			//Player marker 
			y_markerPlayer = createMarker ["cgqc_mortar_player", player];
			"cgqc_mortar_player" setMarkerType "mil_circle"; 
			"cgqc_mortar_player" setMarkerText "Player";
			"cgqc_mortar_player" setMarkerColor "ColorBlue";
			hint "Easy Mode; Target and player marked on map";
		};
		if (cgqc_training_mortar_difficulty <= 1) then {
			// Target marker
			y_markerTarget = createMarker ["cgqc_mortar_target", position cgqc_training_mortar_target];
			"cgqc_mortar_target" setMarkerType "mil_objective"; 
			"cgqc_mortar_target" setMarkerText "Target";
			"cgqc_mortar_target" setMarkerColor "ColorRed";
			["items_advanced"] execVM "mortar.sqf";
		};
		if (cgqc_training_mortar_difficulty == 2) then {
			["items_basic"] execVM "mortar.sqf";
		};
		
		[] spawn {
			// Detect destruction
			while {cgqc_training_mortar} do {
				if (!alive cgqc_training_mortar_target) then {
					hint "Good job Viper! Target Destroyed";
				};
				sleep 5;
			};
		};
		
	};
	case "stop":	{
		cgqc_training_mortar = false;
		["clear"] execVM "mortar.sqf";
	};
	case "clear": {
		// Delete markers
		if !(isNil "y_markerPlayer") then {deleteMarker "cgqc_mortar_player";};	
		if !(isNil "y_markerTarget") then {deleteMarker "cgqc_mortar_target";};	 
		//Delete all things
		if !(isNil "cgqc_training_mortar_mortar") then {deleteVehicle cgqc_training_mortar_mortar;};
		if !(isNil "cgqc_training_mortar_target") then {deleteVehicle cgqc_training_mortar_target;}; 
	};
	default
	{
		hint "Mortar problem";
	};
};