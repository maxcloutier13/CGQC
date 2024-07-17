#include "\CGQC\script_component.hpp"
// --- ldt_2023_i_rifleman ----------------------------------------------------------
// Rifleman 2023 loadout
params [["_target", player], ["_variant", "rifleman"], ["_gunVariant", "carbine"]];
LOG(" ldt_2023_i_rifleman started");
// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_assault"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "cqb": {["mk18_dot"] spawn CGQC_fnc_switchPrimary;};
	case "carbine": {["m4_elcan"] spawn CGQC_fnc_switchPrimary;};
	case "rifle": {["m16_shortdot"] spawn CGQC_fnc_switchPrimary;};
	case "grenade": {["m4_elcan"] spawn CGQC_fnc_switchPrimary;};
	case "417": {["417"] spawn CGQC_fnc_switchPrimary;};
	case "mk12": {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "grenadier": {
		_handgun = ["rhs_weap_M320", "1Rnd_HE_Grenade_shell"];
		[_handgun, 2, false] call CGQC_fnc_getCustomHandgun;
		for "_i" from 1 to 5 do {_target addItemToVest "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 10 do {_target addItemToBackpack "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 2 do {_target addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
		[] call CGQC_fnc_isDaytime;
		if !(cgqc_mission_daytime) then {
			LOG("[Grenadier] Night-time. Get flares");
			[["Night. get some flares", 1], false] call CBA_fnc_notify;
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_white"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "UGL_FlareRed_F"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_ir"};
		} else {
			LOG("[Grenadier] Daytime. Skip flares");
			[["Daytime. Skip flares", 1], false] call CBA_fnc_notify;
		};
	};
	case "rifleman": {
		player addWeapon "rhs_weap_m72a7"; // Launcher
		player addItemToBackpack "ACE_wirecutter";
		for "_i" from 1 to 2 do {player addItemToBackpack "rhs_mag_m67"}; // More grenades
		for "_i" from 1 to 2 do {player addItemToBackpack "tsp_flashbang_cts"}; // More grenades
		for "_i" from 1 to 2 do {player addItemToBackpack "MiniGrenade"}; // More grenades
	};
	case "sharpshooter": {
		player addItemToBackpack "ACE_Tripod";
		//player addItem "ACE_ATragMX";
		//player addItem "ACE_Kestrel4500";
	};
	case "lifesaver": {
		["backpack", "cgqc_pack_mk1_kitbag"] call CGQC_fnc_switchStuff;
		for "_i" from 1 to 20 do {player addItemToBackpack "ACE_fieldDressing";};
		for "_i" from 1 to 10 do {player addItemToBackpack "FF_Painkiller";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_splint";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_500";};
	};
	case "engineer": {
		["backpack", "cgqc_pack_mk1_kitbag"] call CGQC_fnc_switchStuff;
		player addItemToBackpack "ToolKit";
		player addItemToBackpack "ACE_Fortify";
		// Common items
		player addItemToBackpack "ACE_DefusalKit";
		player addItemToBackpack "ACE_M26_Clacker";
		for "_i" from 1 to 2 do { player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag"};
	};
};

LOG(" ldt_2023_i_rifleman done");