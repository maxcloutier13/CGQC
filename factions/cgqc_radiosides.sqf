
_radios = call acre_api_fnc_getCurrentRadioList;
_radio_1 = _radios select 0;
_radio_2 = _radios select 1;
_success = [_radio_1, "RIGHT" ] call acre_api_fnc_setRadioSpatial;
_success = [_radio_2, "LEFT" ] call acre_api_fnc_setRadioSpatial;