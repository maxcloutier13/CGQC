// --- removeRadios ----------------------------------------------------------
// Remove all radios from target

params ["_target", "_type"];

<<<<<<< HEAD
switch (_type) do {
=======
switch (key) do {
>>>>>>> d3b55848ae9b75d675e6d75ac25b771fbf1b38dd
	case "all": { 
		// Remove all radios
		while {count (call acre_api_fnc_getCurrentRadioList) > 1} do {
			_radios = call acre_api_fnc_getCurrentRadioList; 
			{
				_result = [_target, _x] call CBA_fnc_removeItem
<<<<<<< HEAD
			}forEach _radios; 
		}; 
	};
	default { hint "removeRadios error"};
};
=======
			}forEach _radios;  
		}; 
	};
	default { hint "removeRadios error"};
};

>>>>>>> d3b55848ae9b75d675e6d75ac25b771fbf1b38dd
