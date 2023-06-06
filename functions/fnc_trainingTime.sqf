// --- trainingTime ----------------------------------------------------------
// Sets time to current day but sunrise and with nice clear weather
//Only run once 
if (isNil "cgqc_randomTime") then {
	cgqc_randomTime = true;
	_year = missionStart select 0;
	_month = missionStart select 1;
	_day = missionStart select 2;
	setDate [_year, _month, _day, 12, 0];
	sleep 0.5;
	_sun = date call BIS_fnc_sunriseSunsetTime;
	_sunrise = _sun select 0;
	_sunset = _sun select 1;
	_hour = date select 3;
	_min= date select 4;
	setDate [_year, _month, _day, _sunrise, 0];
	// Nice weather
	[0,{ 0 setOvercast 0.4}] call CBA_fnc_globalExecute;
	[0,{ 0 setRain 0}] call CBA_fnc_globalExecute;
	[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;
};

