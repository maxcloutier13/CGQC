#include "\CGQC\script_component.hpp"
// --- envReport ----------------------------------------------------------
// Create environment report
LOG("[envReport] started");

CGQC_int_getSolarDeclination = {
    params [["_date",date]];
    // https://en.wikipedia.org/wiki/Position_of_the_Sun#Calculations
    -asin(0.39779*cos(0.98565*(((dateToNumber _date)*365)+10) + 1.914*sin(0.98565*(((dateToNumber _date)*365)-2))))
};

CGQC_int_getWeatherOffset = {
    params [["_date",date],["_degreesBelowHorizon",0],["_returnOnThisCall",false]];

    // this is an equation where we need to iterate (only a bit) to be accurate
    // https://en.wikipedia.org/wiki/Sunrise_equation

    _latitude = -getNumber (configFile >> "CfgWorlds" >> worldName >> "latitude");
    _solarDeclination = [_date] call CGQC_int_getSolarDeclination;

    _cosOfHourAngle =
        ((sin _degreesBelowHorizon) - (sin _latitude)*(sin _solarDeclination))
        / ((cos _latitude)*(cos _solarDeclination));

    // catch out-of-bounds errors on maps above/below arctic circle, like Thirsk
    if (_cosOfHourAngle >= 1) exitWith {
        "polar_dark"
    };
    if (_cosOfHourAngle <= -1) exitWith {
        "polar_light"
    };

    _hourAngle = acos(_cosOfHourAngle);
    _hourOffset = (_hourAngle / 360) * 24;
    // sunrise/sunset hours are given by:
    // 12 +- _hourOffset

    _offsets = [floor _hourOffset, (_hourOffset % 1) * 60];
    // 5.5hr -> [5hr,30m]

    if (_returnOnThisCall) exitWith {_offsets};

    _date params ["_year","_month","_day"];
    _offsets params ["_hour","_minute"];

    _return = [
        [_year,_month,_day,_hour,_minute],
        _degreesBelowHorizon,
        true
    ] call CGQC_int_getWeatherOffset;

    _return
};

CGQC_int_applyOffset = {
    params [["_date",date],"_offsetFromNoon","_dir"];

    _date params ["_year","_month","_day"];
    _offsetFromNoon params ["_hour","_minute"];
    _offsetHour = _dir * (_hour + (_minute / 60));
    _newHour = 12 + _offsetHour;

    _newHour
};

CGQC_int_getSpecificTime = {
    params ["_offset", "_offDir"];
    _time = [date, _offset] call CGQC_int_getWeatherOffset;
    if (_time in ["polar_dark", "polar_light"]) exitWith {["polar", "polar"]};

    _calcHour = [date, _time, _offDir] call CGQC_int_applyOffset;
    _specificTime = [date#0, date#1, date#2, floor _calcHour, (_calcHour % 1) * 60];
    _hour = _specificTime#3;
    _minute = round (_specificTime#4);

    _outStr = "";
    _t_time = "";

    _diff = [_specificTime#0 - date#0, _specificTime#1 - date#1, _specificTime#2 - date#2,_specificTime#3 - date#3,round(_specificTime#4 - date#4)];

    if (_hour < 10) then {_hour = format["0%1", _hour]};
    if (_minute < 10) then {_minute = format["0%1", _minute]};

    if (_diff#3 > 0 || (_diff#3 == 0 && _diff#4 > 0)) then {
        _diff_hour = _diff#3;
        _diff_minute = _diff#4;
        if (_diff_minute < 0) then {
            _diff_hour = _diff_hour - 1;
            _diff_minute = 60 + _diff_minute;
        };
        if (_diff_minute <10) then {_diff_minute = format["0%1", _diff_minute]};
        _t_time = _t_time + format["<font color='#ffc600' size='10'>    %1h %2m</font>", _diff_hour, _diff_minute];
    };

    if (_t_time != "") then {
        _outStr = format["<font color='#ffc600'>%1:%2</font>", _hour, _minute];
    } else {
        _outStr = format["%1:%2", _hour, _minute];
    };

    [_outStr, _t_time]
};

_name = "Dawn and Dusk";
_lighting = "";

_astro_dawn = [-18, -1] call CGQC_int_getSpecificTime;
_naut_dawn = [-12, -1] call CGQC_int_getSpecificTime;
_civ_dawn = [-6, -1] call CGQC_int_getSpecificTime;
_sunrise = [0, -1] call CGQC_int_getSpecificTime;
_sunset = [0, 1] call CGQC_int_getSpecificTime;
_astro_dusk = [-18, 1] call CGQC_int_getSpecificTime;
_naut_dusk = [-12, 1] call CGQC_int_getSpecificTime;
_civ_dusk = [-6, 1] call CGQC_int_getSpecificTime;

// --- Wind speed  -----------------------------------
_airTemp = floor ace_weather_currentTemperature;
_airHumid = floor (ace_weather_currentHumidity * 100);

_fog = fog;
_fogForecast = fogForecast;
_overcast = overcast;
_overcastForecast = overcastForecast; //0 clearsky 1 = maximum

// --- Wind Direction  -----------------------------------
_windDir = windDir; // 0-365 // in degrees
_direction = "";
if (_windDir >= 337.5 || _windDir < 22.5) then {
    _direction = "North";
} else {
    if (_windDir >= 22.5 && _windDir < 67.5) then {
        _direction = "North-East";
    } else {
        if (_windDir >= 67.5 && _windDir < 112.5) then {
            _direction = "East";
        } else {
            if (_windDir >= 112.5 && _windDir < 157.5) then {
                _direction = "South-East";
            } else {
                if (_windDir >= 157.5 && _windDir < 202.5) then {
                    _direction = "South";
                } else {
                    if (_windDir >= 202.5 && _windDir < 247.5) then {
                        _direction = "South-West";
                    } else {
                        if (_windDir >= 247.5 && _windDir < 292.5) then {
                            _direction = "West";
                        } else {
                            if (_windDir >= 292.5 && _windDir < 337.5) then {
                                _direction = "North-West";
                            };
                        };
                    };
                };
            };
        };
    };
};

// --- Wind speed  -----------------------------------
// Position 50 feet overhead
_playerPos = getPosASL player;
_highPos = [_playerPos select 0, _playerPos select 1, (_playerPos select 2) + 15.24];
_windSpeed = [_highPos, true, true, true] call ACE_weather_fnc_calculateWindSpeed; // in m/s
_windSpeed = round (_windSpeed * 10) / 10;

// --- Moon  -----------------------------------
_moonItensity = moonIntensity;
_moonItensityStr = "absent";
if (_moonItensity > 0.25) then {_moonItensityStr = "low";};
if (_moonItensity > 0.50) then {_moonItensityStr = "moderate";};
if (_moonItensity > 0.75) then {_moonItensityStr = "bright";};

_phase = moonPhase date;
_moonPhaseStr = "New";
if (_phase == 0) then {
    _moonPhaseStr = "New";
} else {
    if (_phase > 0 && _phase < 0.25) then {
        _moonPhaseStr = "Waxing Crescent";
    } else {
        if (_phase == 0.25) then {
            _moonPhaseStr = "First Quarter";
        } else {
            if (_phase > 0.25 && _phase < 0.5) then {
                _moonPhaseStr = "Waxing Gibbous";
            } else {
                if (_phase == 0.5) then {
                    _moonPhaseStr = "Full";
                } else {
                    if (_phase > 0.5 && _phase < 0.75) then {
                        _moonPhaseStr = "Waning Gibbous";
                    } else {
                        if (_phase == 0.75) then {
                            _moonPhaseStr = "Last Quarter";
                        } else {
                            if (_phase > 0.75 && _phase < 1) then {
                                _moonPhaseStr = "Waning Crescent";
                            };
                        };
                    };
                };
            };
        };
    };
};

// --- Time Calcs -----------------------------------
if (_astro_dawn#0 != "polar") then {
    _lighting = _lighting + format["<br/>%1   |   Astronomical Dawn %2", _astro_dawn#0, _astro_dawn#1];
    _lighting = _lighting + format["<br/>%1   |   Nautical Dawn %2", _naut_dawn#0, _naut_dawn#1];
    _lighting = _lighting + format["<br/>%1   |   Civil Dawn %2", _civ_dawn#0, _civ_dawn#1];
};

if (_sunrise#0 == "polar") then {
    _lighting = _lighting + format["<br/> No sunrise due to polar conditions."];
} else {
    _lighting = _lighting + format["<br/>%1   |   Sunrise %2", _sunrise#0, _sunrise#1];
};

if (_sunrise#0 == "polar") then {
    _lighting = _lighting + format["<br/> No sunset due to polar conditions."];
} else {
    _lighting = _lighting + format["<br/>%1   |   Sunset %2", _sunset#0, _sunset#1];
};

if (_astro_dawn#0 != "polar") then {
    _lighting = _lighting + format["<br/>%1   |   Civil Dusk %2", _civ_dusk#0, _civ_dusk#1];
    _lighting = _lighting + format["<br/>%1   |   Nautical Dusk %2", _naut_dusk#0, _naut_dusk#1];
    _lighting = _lighting + format["<br/>%1   |   Astronomical Dusk %2", _astro_dusk#0, _astro_dusk#1];
};

// Refresh
//_lighting = _lighting + "<br/><br/><execute expression='call CGQC_fnc_envReport'>Refresh</execute>";

_lighting = _lighting + format["<br/><br/>Temperature: <font color='#ffc600'>%1°C</font>", floor _airTemp];
_lighting = _lighting + format["<br/>Humidity: <font color='#ffc600'>%1 percent</font>", _airHumid];
_lighting = _lighting + format["<br/>Wind is <font color='#ffc600'>%1%m/s</font> coming from the <font color='#ffc600'>%2</font>", _windSpeed, _direction];
_lighting = _lighting + format["<br/><br/>The moonphase is <font color='#ffc600'>%1</font> and the moonlight is <font color='#ffc600'>%2</font>", _moonPhaseStr, _moonItensityStr];


player createDiarySubject ["CGQC_EnvReport_Report", "Environment"];

if (missionNamespace getVariable ["CGQC_EnvReport_Created",false]) then {
    if !(missionNamespace getVariable ["CGQC_EnvReport_diaryRecord",0] isEqualType 0) then {
        _diaryRecord = CGQC_EnvReport_diaryRecord;
        player setDiaryRecordText [["CGQC_EnvReport_Report",_diaryRecord],[_name,_lighting]];
    };
} else {
    CGQC_EnvReport_diaryRecord = player createDiaryRecord ["CGQC_EnvReport_Report", [_name, _lighting]];
};

CGQC_EnvReport_Created = true;

LOG("[envReport] done");