// --- removeRadios ----------------------------------------------------------
// Remove all radios from target

params ["_target", "_type"];

switch (_type) do {
	case "all": { 
		// Remove all radios
		while {count (call acre_api_fnc_getCurrentRadioList) > 1} do {
			_radios = call acre_api_fnc_getCurrentRadioList; 
			{
				_result = [_target, _x] call CBA_fnc_removeItem
			}forEach _radios; 
		}; 
	};
	default { hint "removeRadios error"};
};