// --- nameRadios ----------------------------------------------------------
// Set radio channel names
params ["_type"];
diag_log format ["[CGQC_INIT] nameRadios started"];

switch (_type) do{
	case 0: {
		// 152 ===================================================================================
		["ACRE_PRC152", "Default", 1, "description", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 2, "description", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 2, "frequencyTX", 30.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 2, "frequencyTX", 30.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 3, "description", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 3, "frequencyTX", 30.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 3, "frequencyTX", 30.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 4, "description", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 4, "frequencyTX", 30.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 4, "frequencyTX", 30.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 5, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 5, "frequencyTX", 30.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 5, "frequencyTX", 30.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 6, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 6, "frequencyTX", 30.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 6, "frequencyTX", 30.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 7, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 7, "frequencyTX", 30.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 7, "frequencyTX", 30.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 8, "description", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 8, "frequencyTX", 30.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 8, "frequencyTX", 30.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 152 IND ===================================================================================
		["ACRE_PRC152", "Default2", 1, "description", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 1, "frequencyTX", 40.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 1, "frequencyTX", 40.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 2, "description", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 2, "frequencyTX", 40.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 2, "frequencyTX", 40.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 3, "description", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 3, "frequencyTX", 40.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 3, "frequencyTX", 40.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 4, "description", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 4, "frequencyTX", 40.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 4, "frequencyTX", 40.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 5, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 5, "frequencyTX", 40.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 5, "frequencyTX", 40.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 6, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 6, "frequencyTX", 40.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 6, "frequencyTX", 40.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 7, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 7, "frequencyTX", 40.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 7, "frequencyTX", 40.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 8, "description", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 8, "frequencyTX", 40.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 8, "frequencyTX", 40.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default2", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default2", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 152 OPFOR ===================================================================================
		["ACRE_PRC152", "Default3", 1, "description", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 1, "frequencyTX", 50.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 1, "frequencyTX", 50.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 2, "description", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 2, "frequencyTX", 50.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 2, "frequencyTX", 50.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 3, "description", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 3, "frequencyTX", 50.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 3, "frequencyTX", 50.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 4, "description", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 4, "frequencyTX", 50.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 4, "frequencyTX", 50.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 5, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 5, "frequencyTX", 50.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 5, "frequencyTX", 50.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 6, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 6, "frequencyTX", 50.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 6, "frequencyTX", 50.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 7, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 7, "frequencyTX", 50.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 7, "frequencyTX", 50.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 8, "description", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 8, "frequencyTX", 50.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 8, "frequencyTX", 50.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC152", "Default3", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default3", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 148
		["ACRE_PRC148", "Default", 1, "description", ("1-Listen:" + cgqc_config_ch1)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "default", 1, "frequencyTX", 59.30000] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 2, "description", ("2-" + cgqc_config_ch1)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 3, "description", ("3-" + cgqc_config_ch2)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 4, "description", ("4-" + cgqc_config_ch3)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 5, "description", ("5-" + cgqc_config_ch4)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 6, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 7, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 8, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 117f - Blufor ===============================================================================
		["ACRE_PRC117f", "Default", 1, "name", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 1, "frequencyTX", 30.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 2, "name", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 2, "frequencyTX", 30.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 2, "frequencyTX", 30.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 3, "name", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 3, "frequencyTX", 30.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 3, "frequencyTX", 30.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 4, "name", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 4, "frequencyTX", 30.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 4, "frequencyTX", 30.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 5, "name", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 5, "frequencyTX", 30.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 5, "frequencyTX", 30.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 6, "name", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 6, "frequencyTX", 30.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 6, "frequencyTX", 30.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 7, "name", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 7, "frequencyTX", 30.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 7, "frequencyTX", 30.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 8, "name", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 8, "frequencyTX", 30.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 8, "frequencyTX", 30.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default", 9, "name", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 117f - IND ===============================================================================
		["ACRE_PRC117f", "Default2", 1, "name", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 1, "frequencyTX", 40.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 1, "frequencyTX", 40.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 2, "name", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 2, "frequencyTX", 40.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 2, "frequencyTX", 40.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 3, "name", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 3, "frequencyTX", 40.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 3, "frequencyTX", 40.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 4, "name", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 4, "frequencyTX", 40.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 4, "frequencyTX", 40.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 5, "name", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 5, "frequencyTX", 40.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 5, "frequencyTX", 40.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 6, "name", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 6, "frequencyTX", 40.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 6, "frequencyTX", 40.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 7, "name", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 7, "frequencyTX", 40.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 7, "frequencyTX", 40.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 8, "name", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 8, "frequencyTX", 40.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 8, "frequencyTX", 40.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default2", 9, "name", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default2", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;

		// 117f - OPFOR ===============================================================================
		["ACRE_PRC117f", "Default3", 1, "name", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 1, "frequencyTX", 50.1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 1, "frequencyTX", 50.1] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 2, "name", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 2, "frequencyTX", 50.2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 2, "frequencyTX", 50.2] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 3, "name", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 3, "frequencyTX", 50.3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 3, "frequencyTX", 50.3] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 4, "name", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 4, "frequencyTX", 50.4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 4, "frequencyTX", 50.4] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 5, "name", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 5, "frequencyTX", 50.5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 5, "frequencyTX", 50.5] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 6, "name", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 6, "frequencyTX", 50.6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 6, "frequencyTX", 50.6] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 7, "name", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 7, "frequencyTX", 50.7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 7, "frequencyTX", 50.7] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 8, "name", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 8, "frequencyTX", 50.8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 8, "frequencyTX", 50.8] call acre_api_fnc_setPresetChannelField;

		["ACRE_PRC117f", "Default3", 9, "name", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default3", 9, "frequencyTX", 299] call acre_api_fnc_setPresetChannelField;
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
diag_log format ["[CGQC_INIT] nameRadios done"];