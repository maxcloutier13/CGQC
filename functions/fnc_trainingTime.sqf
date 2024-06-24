#include "\CGQC\script_component.hpp"
// --- trainingTime ----------------------------------------------------------
// Sets time to current real-life date but sunrise and with nice clear weather

 cgqc_int_findTrainingTime = {
    params ["_decimalTime"];
    private _hours = floor _decimalTime;
    private _minutes = round (60 * (_decimalTime - _hours));

    // Format the hours and minutes to HH:MM
    private _hoursStr = format ["%1", _hours];
    private _minutesStr = format ["%1", _minutes];

    // Add leading zero if necessary
    if (_hours < 10) then {
        _hoursStr = format ["0%1", _hours];
    };
    if (_minutes < 10) then {
        _minutesStr = format ["0%1", _minutes];
    };

    // Return the formatted time
    [parseNumber _hoursStr, parseNumber _minutesStr]
};

//Only run once
if (isNil "cgqc_setInitialTime") then {
	// Set current day/month/year
	_year = systemTime select 0;
	_month = systemTime select 1;
	_day = systemTime select 2;
	setDate [_year, _month, _day, 12, 0];
	// Find sunrise time for current date
	_sun = date call BIS_fnc_sunriseSunsetTime;
	_sunrise = _sun select 0;
	//_sunset = _sun select 1;
	//_hour = date select 3;
	//_min= date select 4;
	_sunriseFormatted = [_sunrise] call cgqc_int_findTrainingTime ;
	setDate [_year, _month, _day, _sunriseFormatted select 0, _sunriseFormatted select 1];
	// Nice weather, some clouds
	[0,{ 0 setOvercast 0.4}] call CBA_fnc_globalExecute;
	[0,{ 0 setRain 0}] call CBA_fnc_globalExecute;
	[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;
	cgqc_setInitialTime = true;
};