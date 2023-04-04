// --- nameRadios ----------------------------------------------------------
// Set radio channel names
_type = param [0, 1];

switch (_type) do{
	case 0: { 
		// 152
		["ACRE_PRC152", "Default", 1, "description", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 2, "description", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 3, "description", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 4, "description", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 5, "description", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 6, "description", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 7, "description", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 8, "description", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC152", "Default", 9, "description", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
		// 148
		["ACRE_PRC148", "Default", 1, "description", ("1-Listen:" + cgqc_config_ch4)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "default", 1, "frequencyTX", 59.30000] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 2, "description", ("2-" + cgqc_config_ch1)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 3, "description", ("3-" + cgqc_config_ch4)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 4, "description", ("4-" + cgqc_config_ch2)] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC148", "Default", 5, "description", ("5-" + cgqc_config_ch3)] call acre_api_fnc_setPresetChannelField;
		
		// 117f
		["ACRE_PRC117f", "Default", 1, "name", cgqc_config_ch1] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 2, "name", cgqc_config_ch2] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 3, "name", cgqc_config_ch3] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 4, "name", cgqc_config_ch4] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 5, "name", cgqc_config_ch5] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 6, "name", cgqc_config_ch6] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 7, "name", cgqc_config_ch7] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 8, "name", cgqc_config_ch8] call acre_api_fnc_setPresetChannelField;
		["ACRE_PRC117f", "Default", 9, "name", cgqc_config_ch9] call acre_api_fnc_setPresetChannelField;
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


