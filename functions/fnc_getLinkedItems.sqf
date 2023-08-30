// --- getLinkedItems ----------------------------------------------------------
// Get basic linked items and NVG's
params ["_type", ["_nvg", ""]];
diag_log format ["[CGQC_FNC] getLinkedItems %1/%2 started", _type, _nvg];

switch (_type) do {
	case "modern": { 
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
	};
	case "noGPS": { 
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
	};
};

if (_nvg isNotEqualTo "") then {
	// === NVG's 
	[] call CGQC_fnc_isDaytime;
	if (cgqc_mission_daytime) then {
		player addItemToBackpack _nvg;
	}else{
		//Night mission 
		player linkItem _nvg;
	};
};

diag_log "[CGQC_FNC] getLinkedItems done";