#include "\CGQC\script_component.hpp"
// --- ldt_2023_s_at ----------------------------------------------------------
// Rifleman 2023 loadout
params [["_target", player], ["_variant", "maaws"], ["_gunVariant", "rco"]];
LOG(" ldt_2023_s_at started");
// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_lr"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_carryall"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_basic","cgqc_item_rangefinder","JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
[_gunVariant] spawn CGQC_fnc_switchPrimary;

// Remove entrenching tool
player removeItems "ACE_EntrenchingTool";

switch (_variant) do {
	case "maaws": {
		["cgqc_gun_mk1_MAAWS"] call CGQC_fnc_getCustomGun;
        player addSecondaryWeaponItem "MRAWS_HEAT_F";
		player addItemToBackpack "MRAWS_HEAT_F";
		player addItemToBackpack "MRAWS_HEAT_F";
	};
	case "javelin": {
		["cgqc_gun_mk1_Javelin"] call CGQC_fnc_getCustomGun;
        player addSecondaryWeaponItem "jav_AT_mas_can";
		player addItemToBackpack "jav_AT_mas_can";
		player addItemToBackpack "jav_AT_mas_can";
	};
	case "mortar_portable":{
		["avm224_W_M224_mortar_carry"] call CGQC_fnc_getCustomGun;
		player addItemToUniform "ACE_artilleryTable";
		player addItem "ACE_Kestrel4500";
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		player removeWeapon (binocular _target);
        player addWeapon "ACE_Vector";
		player addItemToVest "ACE_UAVBattery";
        player unlinkItem "ItemGPS";
        player linkItem "B_UavTerminal";
		for "_i" from 1 to 5 do {player addItemToBackpack "avm224_M_6Rnd_60mm_SMOKE_csw"};
		for "_i" from 1 to 5 do {player addItemToBackpack "avm224_M_6Rnd_60mm_HE_0_csw"};
		for "_i" from 1 to 15 do {player addItemToBackpack "avm224_M_6Rnd_60mm_HE_csw"};
	};
	case "mortar_operator":{
		player addItemToUniform "ACE_artilleryTable";
		player addItem "ACE_Kestrel4500";
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		player removeWeapon (binocular _target);
        player addWeapon "ACE_Vector";
		player addItemToVest "ACE_UAVBattery";
        player unlinkItem "ItemGPS";
        player linkItem "B_UavTerminal";

	};
	case "mortar_operator_crate":{
		player addItemToUniform "ACE_artilleryTable";
		player addItem "ACE_Kestrel4500";
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		player removeWeapon (binocular _target);
        player addWeapon "ACE_Vector";
		player addItemToVest "ACE_UAVBattery";
        player unlinkItem "ItemGPS";
        player linkItem "B_UavTerminal";
		_pos_free = getPosATL player findEmptyPosition [1,20,"cgqc_box_mk1_mortar_mk6"];
		_mortar_crate = "cgqc_box_mk1_mortar_mk6" createVehicle _pos_free;
	};
	case "mortar_mk6":{
		["ace_csw_staticMortarCarry"] call CGQC_fnc_getCustomGun;
		player addItemToUniform "ACE_artilleryTable";
		player addItem "ACE_Kestrel4500";
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		player removeWeapon (binocular _target);
        player addWeapon "ACE_Vector";
		player addItemToVest "ACE_UAVBattery";
        player unlinkItem "ItemGPS";
        player linkItem "B_UavTerminal";
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_1Rnd_82mm_Mo_HE"};
	};
	case "mortar_mk6_plate":{
		["ace_csw_carryMortarBaseplate"] call CGQC_fnc_getCustomGun;
		player addItemToUniform "ACE_artilleryTable";
		player addItem "ACE_Kestrel4500";
		["sps_black_hornet_01_Static_F"] call CGQC_fnc_getDrone;
		player removeWeapon (binocular _target);
        player addWeapon "ACE_Vector";
		player addItemToVest "ACE_UAVBattery";
        player unlinkItem "ItemGPS";
        player linkItem "B_UavTerminal";
		for "_i" from 1 to 5 do {player addItemToBackpack "ACE_1Rnd_82mm_Mo_HE"};
	};
};

// Load camo and equipment from var
[] call CGQC_ldt_camo;

LOG(" ldt_2023_s_at done");