#include "\CGQC\script_component.hpp"
// --- isDaytime ----------------------------------------------------------
// Check if daytime
LOG("[isDaytime] started");

_sun = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _sun select 0;
_sunset = _sun select 1;
_hour = date select 3;

if (_hour > _sunrise && _hour + 1 < _sunset) then {
    // The current time is after sunrise and at least 1 hour before sunset
    //hint "Daytime. Nvgs in pack";
    LOG("It is Daytime");
	cgqc_mission_daytime = true;
} else {
    // The current time does not meet the conditions
    //hint "Night coming. Keep nvgs";
     LOG("It is Nighttime");
	cgqc_mission_daytime = false;
};
LOG("[isDaytime] done");