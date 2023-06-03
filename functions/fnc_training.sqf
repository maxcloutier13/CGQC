// --- training ----------------------------------------------------------
// Training shenanigans
_item = _this select 0;
train_option = _this select 1;

_skip = train_option;
_wind = 0;
_change_wind = false;
switch (_item) do {
	case "skip": {
		switch (_skip) do {
			case 1: {
				[[{ skipTime 1; }], "BIS_fnc_call"] call BIS_fnc_MP;
			};
			case 3: {
				[[{ skipTime 3; }], "BIS_fnc_call"] call BIS_fnc_MP;
			};
			case 6: {
				[[{ skipTime 6; }], "BIS_fnc_call"] call BIS_fnc_MP;
			};
			case 12: {
				[[{ skipTime 12; }], "BIS_fnc_call"] call BIS_fnc_MP;
			};
			default {
				hint "skiptime problem";
			};
		};
		_text = format ["Tu t'es reposé %1 heures", _skip];
		titleText [_text, "BLACK IN",7]; 
		break;
	};
	case "wind_low": {
		w_east = floor random [0,2,4];
		w_north = floor random [0,2,4];
		_change_wind = true;
		hint "Low wind.";
		sleep 3;
		break;
	};
	case "wind_med": {
		w_east = floor random [5,7.5,10];
		w_north = floor random [5,7.5,10];
		_change_wind = true;
		hint "Medium wind.";
		sleep 3;
		break;
	};
	case "wind_hi": {
		w_east = floor random [10,15,20];
		w_north = floor random [10,15,20];
		_change_wind = true;
		hint "High wind.";
		sleep 3;
		break;
	};
	case "wind_random": {
		w_east = floor (random [0,20,35]);
		w_north = floor (random [0,20,35]);
		_change_wind = true;
		hint "Random wind.";
		sleep 3;
		break;
	};
};
if(_change_wind) then {
	_e_side = selectRandom [-1,1];
	_n_side = selectRandom [-1,1];
	setWind [w_east * _e_side, w_north * _n_side, true];
	hint "Wind applied";
	sleep 10;
	hintSilent "";
};