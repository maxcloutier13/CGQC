_type = _this select 0;

switch (_type)
do
{
	case "radio_sides":
	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_success = [_radio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_success = [_radio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		};
		hint "Radios 1/2-Gauche/Droite";
	};
	case "radio_sides_2":
	{
		_radios = call acre_api_fnc_getCurrentRadioList;
		_radio_count = count _radios;
		if (_radio_count > 0) then {
			_radio_1 = _radios select 0;
			_success = [_radio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
		};
		if (_radio_count > 1) then {
			_radio_2 = _radios select 1;
			_success = [_radio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;
		};
		hint "Radios 1/2-Droite/Gauche";
	};
	case "patch":
	{
		//Set the patch 
		[ player, player_patch ] call BIS_fnc_setUnitInsignia;
		hint "Patch restored";
	};
	default
	{
		hint "woops";
	};
};

	