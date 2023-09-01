// --- getLinkedItems ----------------------------------------------------------
// Get basic linked items, nvgs and such
params ["_type", ["_binocs", ""], ["_nvg", ""], ["_loadEssentials", true]];
diag_log format ["[CGQC_FNC] getLinkedItems %1/%2 started", _type, _nvg];

_link = [];
_optionals = [];

// Linked stuff
_essentials = ["ACE_EarPlugs", "ACE_RangeCard", "ACE_CableTie", "ACE_CableTie", "cgqc_items_ifak", "acex_intelitems_notepad"];
_linkedBase = ["ItemWatch", "ItemMap", "ItemCompass", "ACE_MapTools"];
_linkedBaseGPS = _linkedBase + ["ItemGPS"];
_linkedBaseUAV = _linkedBase +  ["B_UavTerminal"];
// Fancy shmancy
_phone = ["ItemAndroid"];
_tablet = ["ItemcTab"];
_dagr = ["ACE_microDAGR"];
_lockpicks = ["tsp_lockpick"];
_light = ["WBK_HeadLampItem"];

// Sniper shit
_sniperKit = [];

switch (_type) do {
	case "2023_basic": {
		_link = _linkedBaseGPS;
		_optionals = _light + _lockpicks + _phone + _dagr;
		break;
	};
	case "2023_command": {
		_link = _linkedBaseUAV;
		_optionals = _light + _lockpicks + _tablet + _dagr;
		break;
	};
	case "vanilla_basic": {
		_link = _linkedBaseGPS;
		_optionals = _light + _lockpicks + _dagr;
		break;
	};
	case "vanilla_command": {
		_link = _linkedBaseUAV;
		_optionals = _light + _lockpicks + _dagr;
		break;
	};
	case "unsung_basic": {
		_link = _linkedBase;
		_optionals = ["grad_paceCountBeads_functions_paceCountBeads"];
		break;
	};
	case "noGPS": {
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		break;
	};
	case "noCompass": {
		player linkItem "ItemMap";
		player linkItem "ItemWatch";
		break;
	};
	case "noMap": {
		player linkItem "ItemWatch";
		break;
	};
};

// Essentials
if (_loadEssentials) then {
	{player addItem _x;} forEach _essentials;
};

// Linked items
{player linkItem _x;} forEach _link;
// Optional goodies
{player addItem _x;} forEach _optionals;

// Binos
player addWeapon _binocs;
if ("designator" in _binocs) then {player addMagazine "Laserbatteries";};

// NVG'S -------------------------------------------------------------------------------------------------------
if (_nvg isNotEqualTo "") then {
	// === NVG's
	[] call CGQC_fnc_isDaytime;
	if (cgqc_mission_daytime) then {
		player addItemToBackpack _nvg;
		hint "Daytime. Nvg's in backpack";
	}else{
		//Night mission
		player linkItem _nvg;
		hint "Night. Nvg's on helmet";
	};
};

diag_log "[CGQC_FNC] getLinkedItems done";