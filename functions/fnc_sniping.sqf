_type = _this select 0;

	switch (_type) do {
		case 0: {cgqc_sniping_on = true;execVM '\cgqc\functions\fnc_sniping_on.sqf';};//Sniping on
		case 1: {cgqc_sniping_on = false;execVM '\cgqc\functions\fnc_sniping_off.sqf';};//Sniping off
		default {
			hint "fnc_sniping error";
		};
	};