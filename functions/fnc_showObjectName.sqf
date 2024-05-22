#include "\CGQC\script_component.hpp"
// --- showObjectName ----------------------------------------------------------
// Black fadout/in with some information in some cases

if (isGamePaused || !isGameFocused) exitWith {};

[] spawn {
	_target = cursorTarget;
    if (_target distance player < 15) then {
        //LOG("showObjectName - Object closer than 15m");
        if ((typeOf _target) isEqualTo "GroundWeaponHolder_Scripted") exitWith {
            // player backpack?
            _name = _target getVariable ["cgqc_name_object", "NONE"];
            if (_name isNotEqualTo "NONE") then {
                LOG("showObjectName - Got a name");
                // Bingo. Got a name
                _color = "ffffff";
                if (_name isEqualTo name player) then {
                    // Pack is yours
                    _color = "30c10b";
                    _name = "Your backpack";
                } else {
                    _color = "c90808";
                    _name = _name +"'s backpack";
                };
                _name = format ["<br/><br/><br/><br/><br/><t color = '#%1'>%2</t>", _color, _name];
                [_name, 0, 0, 1, 0] spawn BIS_fnc_dynamicText;
            };
        };

        if (_target isKindOf "AllVehicles" && _target distance player > 3) exitWith {
            _name = _target getVariable ["cgqc_name_vic", "NONE"];
            if (_name isNotEqualTo "NONE") then {
                LOG("showObjectName - Found named car");
                _color = "777676"; // gray
                                // Bingo. Got a name
                switch (true) do {
                    case ("1" in _name): {
                        _color = "c90808"
                    };// red
                    case ("2" in _name): {
                        _color = "080bc9"
                    };// blue
                    case ("3" in _name): {
                        _color = "c9d308"
                    };// yellow
                    case ("0" in _name): {
                        _color = "ffffff"
                    };// white
                    case ("HQ" in _name): {
                        _color = "ffffff"
                    };// white
                };
                _name = format ["<br/><br/><br/><br/><br/><t color = '#%1'>%2</t>", _color, _name];
                [_name, 0, 0, 1, 0] spawn BIS_fnc_dynamicText;
            };
        };
    };
};

// Hidden to avoid repetition in log
//LOG(" showObjectName done");