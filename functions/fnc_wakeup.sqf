#include "\CGQC\script_component.hpp"
// --- wakeup ----------------------------------------------------------
// Waking up the player
//  [_player, _patient, 'Carbonate'] call CGQC_fnc_treatment;
params[["_type", "normal"]];
LOG_1("[wakeup] %1 started", _type);

// Toggle UI
["show"] spawn CGQC_fnc_toggleUI;
// set volume back
_vol = player getVariable "cgqc_player_wakeup_volume";
[_vol] call acre_api_fnc_setGlobalVolume;
// Turning radios back on
_radioIdList = call acre_api_fnc_getCurrentRadioList;
{
    _radioId = _x;
    [_radioId,0.8] call acre_sys_radio_fnc_setRadioVolume;
} forEach _radioIdList;

switch (_type) do {
    case "respawn": {
        [["Resetting sounds/UI...", 1.5], false] call CBA_fnc_notify;
    };
    case "normal": {
        [["Waking up...", 1.5], false] call CBA_fnc_notify;
    };
    case "pain": {
        [] spawn {
            LOG("[wakeup] Pain mode activated");
            ["ace_medical_WakeUp", player] call CBA_fnc_localEvent;
            if !(player getVariable ["ACE_isUnconscious", false]) then {
                _choices = ["Ouf... This fucking hurts."];
                _txt = format ["<t size='2'>%1</t>", selectRandom _choices];
                cutText ["","PLAIN DOWN", 1, false, true];
                cutText [_txt,"PLAIN DOWN", 1, false, true];
                sleep 10;
                //Check if passed out anyway
                if (player getVariable ["ACE_isUnconscious", false]) exitWith {};
                LOG("[wakeup] Still Up");
                _perceived = [] call CGQC_fnc_perceivedPain;
                if (_perceived > 0.4) then {
                    LOG_1("[wakeup] - Passing out from %1 pain", _perceived);
                    _txt = "Oh shit... I'm gonna black out...";
                    [ _txt, 0, 1.15, 2, 0.8] spawn BIS_fnc_dynamicText;
                    sleep 3;
                    // Pass out again!
                    [player, true] call ace_medical_fnc_setUnconscious;
                    LOG("[wakeup] - Passed out");
                };
            } else {
                LOG("[wakeup] - Didn't wake up for some reason");
            };

        };
    };
};

LOG("[wakeup] done");






