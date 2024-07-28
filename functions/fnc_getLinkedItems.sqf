#include "\CGQC\script_component.hpp"
// --- getLinkedItems ----------------------------------------------------------
// Get basic linked items, nvgs and such
params ["_type", ["_binocs", ""], ["_nvg", ""], ["_loadEssentials", true], ["_forceDay", false]];
LOG_4("[getLinkedItems] %1/%2/%3/%4 started", _type, _binocs, _nvg, _loadEssentials);

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
		LOG(" getLinkedItems 2023_basic loading");
	};
	case "2023_command": {
		_link = _linkedBaseUAV;
		_optionals = _light + _lockpicks + _phone + _dagr;
		LOG(" getLinkedItems 2023_command loading");
	};
	case "vanilla_basic": {
		_link = _linkedBaseGPS;
		_optionals = _light + _lockpicks + _dagr;
	};
	case "vanilla_command": {
		_link = _linkedBaseUAV;
		_optionals = _light + _lockpicks + _dagr;
	};
	case "unsung_basic": {
		_link = _linkedBase;
		_optionals = ["grad_paceCountBeads_functions_paceCountBeads"];
	};
	case "noGPS": {
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
	};
	case "noCompass": {
		player linkItem "ItemMap";
		player linkItem "ItemWatch";
	};
	case "noMap": {
		player linkItem "ItemWatch";
	};
};

// Essentials
if (_loadEssentials) then {
	LOG("[getLinkedItems] essentials loading");
	{player addItem _x;} forEach _essentials;
};

// Linked items
if (count _link > 0) then {
	LOG("[getLinkedItems] linkedItem loading");
	{player linkItem _x;} forEach _link;
};

// Optional goodies
if (count _optionals > 0) then {
	LOG("[getLinkedItems] optionals loading");
	{player addItem _x;} forEach _optionals;
};

// Binos
if (_binocs isNotEqualTo "") then {
	LOG("[getLinkedItems] binocs loading");
	player addWeapon _binocs;
	if ("designator" in _binocs) then {player addMagazine "Laserbatteries";};
};


// NVG'S -------------------------------------------------------------------------------------------------------
if (_nvg isNotEqualTo "") then {
	LOG("[getLinkedItems] nvgs loading");
	// === NVG's
	[] call CGQC_fnc_isDaytime;
	if (cgqc_mission_daytime || _forceDay) then {
		player addItemToUniform _nvg;
		LOG("[getLinkedItems] - Daytime. Nvg's in uniform");
		hint "Daytime. Nvg's in uniform";
	}else{
		//Night mission
		player linkItem _nvg;
		LOG("[getLinkedItems] - Night. Nvg's on helmet");
		hint "Night. Nvg's on helmet";
	};
};

LOG("[getLinkedItems] done");