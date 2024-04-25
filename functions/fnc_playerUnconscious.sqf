#include "script_component.hpp"
// --- playerUnconscious ----------------------------------------------------------
// Handles when the player is down
params ["_unit", "_isUnconscious"];
diag_log "[CGQC_FNC] === playerUnconscious started =====================================";

if (cgqc_player_wakeup_active) then {
    if (_isUnconscious) then {
        // Lower voice levels
        _unit setVariable ["cgqc_player_wakeup_volume", [] call acre_api_fnc_getGlobalVolume];
        [0.2] call acre_api_fnc_setGlobalVolume;
        _max = cgqc_player_wakeup_max;
        _min = cgqc_player_wakeup_min;
        _mid = ((cgqc_player_wakeup_max - cgqc_player_wakeup_min) / 2) + cgqc_player_wakeup_min;
        _random = cgqc_player_wakeup_random;
        _attempt = 1;
        _awake = [_unit] call ace_common_fnc_isAwake;
        // While unconscious keep spinning
        while {!_awake} do {
            _time = _unit getVariable "cgqc_player_wakeup_time";
            _waitTime = floor (random [_min, _mid, _max]);
            _roll = random 1;
            _chance = _random / 100;
            hint format ["Down for %1s - Trying to wake up in %2s", _time, _waitTime];
            // Timer moving up
            _time = _time + _waitTime;
            _unit setVariable ["cgqc_player_wakeup_time", _time];
            // Notify
            diag_log format ["--> Player is down! TimeTotal:%1/Min:%2Max:%3/Wait:%4/Chance:%5/Attempt:%6", _time, _min, _max, _waitTime, _random, _attempt];
            sleep _waitTime;
            diag_log format ["--> Player rolls! Roll:%1/Chance:%2/Attempt:%3", _roll, _chance, _attempt];

            if (_roll <= _chance || _time > 300) then {
                _cardiacOutput = [_unit] call ace_medical_status_fnc_getCardiacOutput;
                // Only wake up if the heart is still beating
                if (_cardiacOutput > 0) then {
                    // Beating. You wake up!
                    hint format ["You are awake! Time:%1/Attempt:%2", _time, _attempt];
                    diag_log format ["%1 is awake! Time:%2/Attempt:%3", _unit, _time, _attempt];
                    [_unit, false] call ace_medical_fnc_setUnconscious;
                } else {
                    diag_log format ["%1 rolled to wake up, but is in cardiac arrest", _unit];
                };
            } else {
                // Fail! Stay down
                diag_log format ["You fail to wake up... %1 more percent chance next time", cgqc_player_wakeup_randomBoost];
                _random = _random + cgqc_player_wakeup_randomBoost;
            };
            _attempt = _attempt + 1;
            _awake = [_unit] call ace_common_fnc_isAwake;
        };
        // Unit is now awake. Close it up.
        _unit setVariable ["cgqc_player_wakeup_time", 0];
        // Set volume back
        _vol = _unit getVariable "cgqc_player_wakeup_volume";
        [_vol] call acre_api_fnc_setGlobalVolume;
    } else {
        // Player is not down anymore
        _unit setVariable ["cgqc_player_wakeup_time", 0];
        // Set volume back
        _vol = _unit getVariable "cgqc_player_wakeup_volume";
        [_vol] call acre_api_fnc_setGlobalVolume;
    };
};

diag_log "[CGQC_FNC] === playerUnconscious done =====================================";