// --- training ----------------------------------------------------------
// Training shenanigans
_item = _this select 0;
train_option = _this select 1;
y_timeText = "";
_skip = train_option;
_wind = 0;
_change_wind = false;
switch (_item) do {
	case "random_all": {
		["skip", 100] execVM '\cgqc\functions\fnc_training.sqf';
		["random", 0] execVM '\cgqc\functions\fnc_training.sqf';
	};
	case "skip": {
		switch (_skip) do {
			case 1: {
				[0,{ skipTime 1}] call CBA_fnc_globalExecute;
				y_timeText = format ["Tu t'es reposé %1 heures", _skip];
			};
			case 3: {
				[0,{ skipTime 3}] call CBA_fnc_globalExecute;
				y_timeText = format ["Tu t'es reposé %1 heures", _skip];
			};
			case 6: {
				[0,{ skipTime 6}] call CBA_fnc_globalExecute;
				y_timeText = format ["Tu t'es reposé %1 heures", _skip];
			};
			case 12: {
				[0,{ skipTime 12}] call CBA_fnc_globalExecute;
				y_timeText = format ["Tu t'es reposé %1 heures", _skip];
			};
			case 100: {
				y_random_time = round(random 24 * 10) / 10;
				[0,{skipTime y_random_time}] call CBA_fnc_globalExecute;
				y_timeText = format ["Tu t'es reposé %1 heures", y_random_time];
			};
			default {
				hint "skiptime problem";
			};
		};
		titleText [y_timeText, "BLACK IN",7]; 
		break;
	};
	case "sunrise":{
		_sun = date call BIS_fnc_sunriseSunsetTime;
		_sunrise = _sun select 0;
		_sunset = _sun select 1;
		_year = date select 0;
		_month = date select 1;
		_day = date select 2;
		_hour = date select 3;
		_min= date select 4;
		switch (train_option) do {
			case 0: {
				[0,{setDate [_year, _month, _day, _sunrise, 0]}] call CBA_fnc_globalExecute;
				_text = "Aaah... sunrise...";
			};
			case 1: {
				[0,{setDate [_year, _month, _day, _sunset, 0]}] call CBA_fnc_globalExecute;
				_text = "Aaah... sunset...";
			};
		};
		titleText [_text, "BLACK IN",7]; 
		break;
	};
	case "nice":{
		[0,{ 0 setOvercast 0}] call CBA_fnc_globalExecute;
		[0,{ 0 setRain 0}] call CBA_fnc_globalExecute;
		[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;
		hint "Nice weather on the way";
	};
	case "rain":{
		[0,{ 0 setOvercast 1}] call CBA_fnc_globalExecute;
		[0,{ 0 setRain 1}] call CBA_fnc_globalExecute;
		[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;
		hint "Rain it is";
	};
	case "random":{
		y_over = round(random 1 * 10) / 10;
		y_rain = round(random 1 * 10) / 10;
		[0,{ 0 setOvercast y_over}] call CBA_fnc_globalExecute;
		[0,{ 0 setRain y_rain}] call CBA_fnc_globalExecute;
		[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;
		hint "Random weather";
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