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

	};
	case "midnight":{
		time_year = date select 0;
		time_month = date select 1;
		time_day = date select 2;
		time_hour = date select 3;
		[0,{setDate [time_year, time_month, time_day, 0, 0]}] call CBA_fnc_globalExecute;
		time_text = "Midnight Bliss";
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
	/*
	if (_windSpeed > 0.3) then { _windColor = [0.796, 1, 1, 1]; _beaufortNumber = 1; };
    if (_windSpeed > 1.5) then { _windColor = [0.596, 0.996, 0.796, 1]; _beaufortNumber = 2; };
    if (_windSpeed > 3.3) then { _windColor = [0.596, 0.996, 0.596, 1]; _beaufortNumber = 3; };
    if (_windSpeed > 5.4) then { _windColor = [0.6, 0.996, 0.4, 1]; _beaufortNumber = 4; };
    if (_windSpeed > 7.9) then { _windColor = [0.6, 0.996, 0.047, 1]; _beaufortNumber = 5; };
    if (_windSpeed > 10.7) then { _windColor = [0.8, 0.996, 0.059, 1]; _beaufortNumber = 6; };
    if (_windSpeed > 13.8) then { _windColor = [1, 0.996, 0.067, 1]; _beaufortNumber = 7; };
    if (_windSpeed > 17.1) then { _windColor = [1, 0.796, 0.051, 1]; _beaufortNumber = 8; };
    if (_windSpeed > 20.7) then { _windColor = [1, 0.596, 0.039, 1]; _beaufortNumber = 9; };
    if (_windSpeed > 24.4) then { _windColor = [1, 0.404, 0.031, 1]; _beaufortNumber = 10; };
    if (_windSpeed > 28.4) then { _windColor = [1, 0.22, 0.027, 1]; _beaufortNumber = 11; };
    if (_windSpeed > 32.6) then { _windColor = [1, 0.078, 0.027, 1]; _beaufortNumber = 12; };
	*/

	case "wind_low": {
		_change_wind = true;
		y_timeText = "Low wind.";
		ace_weather_next_wind_speed = floor random 5;
	};
	case "wind_med": {
		_change_wind = true;
		y_timeText = "Medium wind.";
		ace_weather_next_wind_speed = floor (random 4 + 5);
	};
	case "wind_hi": {
		_change_wind = true;
		y_timeText = "High wind.";
		ace_weather_next_wind_speed = floor (random 6 + 8);
	};
	case "wind_random": {
		_change_wind = true;
		y_timeText = "Random wind.";
		ace_weather_next_wind_speed = floor random 16;
	};
};
if(_change_wind) then {
	[] call ace_weather_fnc_updateWind;
	hint "Wind applied";
};

titleText [y_timeText, "BLACK IN",7];
LOG(" training done");