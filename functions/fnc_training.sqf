#include "\CGQC\script_component.hpp"
// --- training ----------------------------------------------------------
// Training shenanigans
params ["_type", "_option"];
LOG_2(" training %1/%2 started", _type, _option);

y_timeText = "";
_skip = _option;
_wind = 0;
_change_wind = false;
switch (_type) do {
	case "random_all": {
		["skip", 100] call CGQC_fnc_training;
		["random", 0] call CGQC_fnc_training;
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

	};
	case "sunrise":{
		_sun = date call BIS_fnc_sunriseSunsetTime;
		time_sunrise = _sun select 0;
		time_sunset = _sun select 1;
		time_year = date select 0;
		time_month = date select 1;
		time_day = date select 2;
		time_hour = date select 3;
		time_min= date select 4;
		switch (_option) do {
		case 0: {
			[0,{setDate [time_year, time_month, time_day, time_sunrise, 0]}] call CBA_fnc_globalExecute;
			time_text = "Aaah... sunrise...";
		};
		case 1: {
			[0,{setDate [time_year, time_month, time_day, time_sunset, 0]}] call CBA_fnc_globalExecute;
			_text = "Aaah... sunset...";
		};
		};
		titleText [time_text, "BLACK IN",7];
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

	};
	case "wind_med": {
		w_east = floor random [5,7.5,10];
		w_north = floor random [5,7.5,10];
		_change_wind = true;
		hint "Medium wind.";

	};
	case "wind_hi": {
		w_east = floor random [10,15,20];
		w_north = floor random [10,15,20];
		_change_wind = true;
		hint "High wind.";

	};
	case "wind_random": {
		w_east = floor (random [0,20,35]);
		w_north = floor (random [0,20,35]);
		_change_wind = true;
		hint "Random wind.";

	};
};
if(_change_wind) then {
	_e_side = selectRandom [-1,1];
	_n_side = selectRandom [-1,1];
	setWind [w_east * _e_side, w_north * _n_side, true];
	hint "Wind applied";
};
LOG(" training done");