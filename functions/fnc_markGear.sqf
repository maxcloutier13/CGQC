// --- markGear ----------------------------------------------------------
// Rename dropped gear for easier ID 

_player = player;
_item = _this select 0;

// Check if already claimed 
if ((typeOf _item != "GroundWeaponHolder") || (!isNil{_item getVariable "CGQC_Name"})) exitWith {};

// Name the item
if ((count itemCargo _item > 0) || (count magazineCargo _item > 0) || (count weaponCargo _item > 0) || (count backpackCargo _item  > 0)) then {
	private _name = _player getVariable ["cgqc_player_name",""];
	private _side = side player;

	_item setVariable ["CGQC_Name",_name, true];
	_item setVariable ["CGQC_Side",_side, true];

	[_item, true, [0,0.9,1], 0] call ace_dragging_fnc_setCarryable;
};