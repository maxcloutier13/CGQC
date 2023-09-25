 // --- ldt_2023_recon ----------------------------------------------------------
// Recon 2023 loadout
params [["_target", player], ["_variant", "sniper"], ["_gunVariant", "m200"]];
diag_log format ["[CGQC_FNC] ldt_2023_recon %1 started", _target];

// Basic setup
[] call CGQC_ldt_2023_basic;

// === Clothing ==========================================================================================================
_hats = ["cgqc_helmet_mk1"];
_goggles = [""];
_vests = ["cgqc_vest_mk1_tan_lr"];
_uniforms = [""];
_rucks = ["cgqc_pack_mk1_kitbag"];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;

// === Linked items ==================================================================================================================
["2023_command", "ACE_Vector", "JAS_GPNVG18_blk"] call CGQC_fnc_getLinkedItems;

// === Primary ==========================================================================================================
switch (_gunVariant) do {
	case "m200": {["m200"] spawn CGQC_fnc_switchPrimary;};
	case "m14ebr": {["m14ebr"] spawn CGQC_fnc_switchPrimary;};
	case "mk12": {["mk12_lpvo"] spawn CGQC_fnc_switchPrimary;};
	case "lpvo": {["hk416_lpvo"] spawn CGQC_fnc_switchPrimary;};
};

switch (_variant) do {
	case "sniper": {
		_handgun = [
			"rhsusf_weap_MP7A2_folded",
			"rhsusf_mag_40Rnd_46x30_AP",
			"rhsusf_acc_rotex_mp7",
			"Tier1_MP7_NGAL_M300C_Black",
			"Tier1_MicroT2_Low_Black"
		];
		cgqc_config_sidearm_alternate = "rhsusf_mag_40Rnd_46x30_AP";
		[_handgun] call CGQC_fnc_getCustomHandgun;
		if (!cgqc_config_sidearm) then {
			player addItemToBackpack cgqc_config_sidearm_alternate;
			player addItemToBackpack cgqc_config_sidearm_alternate;
		};
		player addItem "ACE_M26_Clacker";
		player addItem "ACE_ATragMX";
		player addItem "ACE_Kestrel4500";
		player addItemToBackpack "ACE_Tripod";
		player addItemToBackpack "ACE_DefusalKit";
		player addItemToBackpack "rhsusf_mine_m14_mag";
		player removeItems "ACE_EntrenchingTool";
	};
	case "spotter": {
		player addItem "ACE_M26_Clacker";
		player addItem "ACE_ATragMX";
		player addItem "ACE_Kestrel4500";
		player addItemToBackpack "ACE_Tripod";
		player addItemToBackpack "rhsusf_mine_m14_mag";
	};
	case "drone": {
		player addItemToBackpack "ACE_UAVBattery";
		player addItemToBackpack "rev_darter_item";
	};
};

diag_log "[CGQC_FNC] ldt_2023_recon done";

