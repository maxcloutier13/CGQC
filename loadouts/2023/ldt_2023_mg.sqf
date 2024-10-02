#include "\CGQC\script_component.hpp"
// --- ldt_2023_s_mg ----------------------------------------------------------
// MG 2023 loadout
params [["_target", player], ["_variant", ""], ["_gunVariant", "mk46"]];
LOG_3("[ldt_2023_s_mg] %1/%2/%3 started", _target, _variant, _gunVariant);
// Basic setup
[] call CGQC_ldt_2023_basic;
_nvg = "JAS_GPNVG18_blk";
switch (cgqc_customLoadout) do {
	case "afg": {
		LOG("[ldt_2023_s_mg] AFG Mode");
		_nvg = "JAS_GPNVG18_tan";
		_gunVariant = "afg"
	};
};

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_lr"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_kitbag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder", _nvg] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_variant) do {
	case "lmg": {
		LOG("[ldt_2023_s_mg] LMG");
		switch (_gunVariant) do {
			case "mk46": {["mk46"] call CGQC_fnc_switchPrimary;};
			case "afg": {["mk46_desert"] call CGQC_fnc_switchPrimary;};
		};
	};
	case "hmg": {
		LOG("[ldt_2023_s_mg] HMG");
		switch (_gunVariant) do {
			case "mk48": {["mk48"] call CGQC_fnc_switchPrimary;};
			case "afg": {["mk48_desert"] call CGQC_fnc_switchPrimary;};
		};
	};
	default {
		switch (_gunVariant) do {
			case "m27": {["m27"] call CGQC_fnc_switchPrimary;};
			case "lwmmg": {["lwmmg"] call CGQC_fnc_switchPrimary;};
		};
	};
};

// Load camo and equipment from var
[] call CGQC_ldt_camo;

LOG(" ldt_2023_s_mg done");