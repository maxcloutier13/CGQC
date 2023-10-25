// --- nameRadios ----------------------------------------------------------
// Set radio channel names
params ["_type"];
diag_log format ["[CGQC_INIT] nameRadios started"];

CGQC_fnc_getRandomFreq = {
	_freq = (random 100) + 100;
	_freq = round (_freq * 100) / 100;
	_freq
};

_name = "";
_chan = "";
_freq = 0;

switch (_type) do{
	case 0: {
		_radios = ["ACRE_PRC152", "ACRE_PRC117F"];

		{
			if (_x isEqualTo "ACRE_PRC117F") then {
				_name = "name";
			} else {
				_name = "description";
			};

			// Channel 13 for training purposes
			if (cgqc_flag_isTraining) then {
				diag_log format ["[CGQC_INIT] nameRadios - Ch13 = Ch1"];
				[_x, "Default2", 13, _name, "Ch1: Debug"] call acre_api_fnc_setPresetChannelField;
				[_x, "Default2", 13, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
				[_x, "Default2", 13, "frequencyRX", 30.1] call acre_api_fnc_setPresetChannelField;

				[_x, "Default3", 13, _name, "Ch1: Debug"] call acre_api_fnc_setPresetChannelField;
				[_x, "Default3", 13, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
				[_x, "Default3", 13, "frequencyRX", 30.1] call acre_api_fnc_setPresetChannelField;
			};

			// Common channels
			// Global channel
			[_x, "Default", 69, _name, "Party Line"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 69, "frequencyTX", 69.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 69, "frequencyRX", 69.1] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 69, _name, "Party Line"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 69, "frequencyTX", 69.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 69, "frequencyRX", 69.1] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 69, _name, "Party Line"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 69, "frequencyTX", 69.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 69, "frequencyRX", 69.1] call acre_api_fnc_setPresetChannelField;

			// Blue/Green
			[_x, "Default", 98, _name, "Blu/Ind"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 98, "frequencyTX", 200.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 98, "frequencyRX", 200.1] call acre_api_fnc_setPresetChannelField;
			// Blue/Red
			[_x, "Default", 99, _name, "Blu/Red"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 99, "frequencyTX", 201.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 99, "frequencyRX", 201.1] call acre_api_fnc_setPresetChannelField;
			// Green/Red
			[_x, "Default2", 98, _name, "Ind/Red"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 98, "frequencyTX", 202.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 98, "frequencyRX", 202.1] call acre_api_fnc_setPresetChannelField;
			// Green/Blue
			[_x, "Default2", 99, _name, "Ind/Blue"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 99, "frequencyTX", 200.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 99, "frequencyRX", 200.1] call acre_api_fnc_setPresetChannelField;
			// Red/Green
			[_x, "Default3", 98, _name, "Red/Ind"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 98, "frequencyTX", 202.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 98, "frequencyRX", 202.1] call acre_api_fnc_setPresetChannelField;
			// Red/Blue
			[_x, "Default3", 99, _name, "Red/Blu"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 99, "frequencyTX", 201.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 99, "frequencyRX", 201.1] call acre_api_fnc_setPresetChannelField;

			// West ===================================================================================
			diag_log format ["[CGQC_INIT] nameRadios - Naming: %1/Default", _x];
			[_x, "Default", 1, _name, cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 1, "frequencyRX", 30.1] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 2, _name, cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 2, "frequencyTX", 30.2] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 2, "frequencyRX", 30.2] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 3, _name, cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 3, "frequencyTX", 30.3] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 3, "frequencyRX", 30.3] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 4, _name, cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 4, "frequencyTX", 30.4] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 4, "frequencyRX", 30.4] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 5, _name, cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 5, "frequencyTX", 30.5] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 5, "frequencyRX", 30.5] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 6, _name, cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 6, "frequencyTX", 30.6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 6, "frequencyRX", 30.6] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 7, _name, cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 7, "frequencyTX", 30.7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 7, "frequencyRX", 30.7] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 8, _name, cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 8, "frequencyTX", 30.8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 8, "frequencyRX", 30.8] call acre_api_fnc_setPresetChannelField;

			[_x, "Default", 9, _name, cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
			[_x, "Default", 9, "frequencyRX", 299] call acre_api_fnc_setPresetChannelField;

			// 152 IND ===================================================================================
			diag_log format ["[CGQC_INIT] nameRadios - Naming: %1/Default2", _x];
			[_x, "Default2", 1, _name, "Bandit"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 1, "frequencyTX", 40.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 1, "frequencyRX", 40.1] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 2, _name, "Support"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 2, "frequencyTX", 40.2] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 2, "frequencyRX", 40.2] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 3, _name, "Flyboyz"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 3, "frequencyTX", 40.3] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 3, "frequencyRX", 40.3] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 4, _name, "Hardshells"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 4, "frequencyTX", 40.4] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 4, "frequencyRX", 40.4] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 5, _name, "Recon"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 5, "frequencyTX", 40.5] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 5, "frequencyRX", 40.5] call acre_api_fnc_setPresetChannelField;

			diag_log format ["[CGQC_INIT] nameRadios - Naming: %1/Default2 - Configs", _x];
			[_x, "Default2", 6, _name, cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 6, "frequencyTX", 40.6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 6, "frequencyRX", 40.6] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 7, _name, cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 7, "frequencyTX", 40.7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 7, "frequencyRX", 40.7] call acre_api_fnc_setPresetChannelField;

			[_x, "Default2", 8, _name, cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 8, "frequencyTX", 40.8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 8, "frequencyRX", 40.8] call acre_api_fnc_setPresetChannelField;

			diag_log format ["[CGQC_INIT] nameRadios - Naming: %1/Default2 - 9", _x];
			[_x, "Default2", 9, _name, cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
			[_x, "Default2", 9, "frequencyRX", 299] call acre_api_fnc_setPresetChannelField;

			// 152 OPFOR ===================================================================================
			diag_log format ["[CGQC_INIT] nameRadios - Naming: %1/Default3", _x];
			[_x, "Default3", 1, _name, "Viper"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 1, "frequencyTX", 50.1] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 1, "frequencyRX", 50.1] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 2, _name, "Support"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 2, "frequencyTX", 50.2] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 2, "frequencyRX", 50.2] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 3, _name, "Valkyrie"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 3, "frequencyTX", 50.3] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 3, "frequencyRX", 50.3] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 4, _name, "Scorpion"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 4, "frequencyTX", 50.4] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 4, "frequencyRX", 50.4] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 5, _name, "Squid"] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 5, "frequencyTX", 50.5] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 5, "frequencyRX", 50.5] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 6, _name, cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 6, "frequencyTX", 50.6] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 6, "frequencyRX", 50.6] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 7, _name, cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 7, "frequencyTX", 50.7] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 7, "frequencyRX", 50.7] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 8, _name, cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 8, "frequencyTX", 50.8] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 8, "frequencyRX", 50.8] call acre_api_fnc_setPresetChannelField;

			[_x, "Default3", 9, _name, cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
			[_x, "Default3", 9, "frequencyRX", 299] call acre_api_fnc_setPresetChannelField;

		} forEach _radios;

		diag_log "[CGQC_INIT] nameRadios - Naming: 148/Default";
		// 148
		["ACRE_PRC148", "Default", 1, "description", ("1-Listen:" + cgqc_config_ch1)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 1, "frequencyRX", 30.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "default", 1, "frequencyTX", 59.30000] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 2, "description", ("2-" + cgqc_config_ch1)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 1, "frequencyRX", 30.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 3, "description", ("3-" + cgqc_config_ch2)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 4, "description", ("4-" + cgqc_config_ch3)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 5, "description", ("5-" + cgqc_config_ch4)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 6, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 7, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 8, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

	};
	case 1: {
		["ACRE_PRC152", "Default", 1, "description", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 1, "name", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
	};
	case 2: {
		["ACRE_PRC152", "Default", 2, "description", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 2, "name", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
	};
	case 3: {
		["ACRE_PRC152", "Default", 3, "description", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 3, "name", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
	};
	case 4: {
		["ACRE_PRC152", "Default", 4, "description", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 4, "name", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
	};
	case 5: {
		["ACRE_PRC152", "Default", 5, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 5, "name", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
	};
	case 6: {
		["ACRE_PRC152", "Default", 6, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 6, "name", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
	};
	case 7: {
		["ACRE_PRC152", "Default", 7, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 7, "name", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
	};
};

cgqc_player_radio_names = true;
diag_log format ["[CGQC_INIT] nameRadios done"];