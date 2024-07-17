// TSP Animate -------------------------------------------------------------------------------------------
["TSP Animate", "tsp_animate_tactical", "Tactical", {if ([playa, true] call tsp_fnc_animate_tactical_stop) exitWith {}; [playa, "ready", "laut"] call tsp_fnc_animate_tactical}, {}, [20, [true, false, false]]] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_tactical_scrollUp", "Tactical (Scroll Up)", {[playa, "scrollUp"] spawn tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_tactical_scrollDown", "Tactical (Scroll Down)", {[playa, "scrollDown"] spawn tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_tactical_cancel", "Tactical Cancel", {[playa] call tsp_fnc_animate_tactical_stop}, {}, [0xF0, [false, false, false]]] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_tactical_cancel_all", "Tactical Cancel (All)", {[playa, false] call tsp_fnc_animate_tactical_stop}, {}, [0xF1, [false, false, false]]] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_tactical_cancel_aim", "Tactical Cancel (Aim)", {[playa, true, true] call tsp_fnc_animate_tactical_stop}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_tactical_cancel_all_aim", "Tactical Cancel (Aim, All)", {[playa, false, true] call tsp_fnc_animate_tactical_stop}, {}, []] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_ready_auto", "Ready (Auto)", {[playa, "ready", "laut"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_ready_high", "Ready (High)", {[playa, "ready", "lhig"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_ready_low", "Ready (Low)", {[playa, "ready", "llow"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_compress_auto", "Compress (Auto)", {[playa, "compress", "laut"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_compress_high", "Compress (High)", {[playa, "compress", "lhig"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_compress_low", "Compress (Low)", {[playa, "compress", "llow"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_over", "Overhead Shooting", {[playa, "over", "lnon"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_cant", "Cant Weapon", {if (count ((configFile >> "CfgWeapons" >> primaryWeaponItems playa#2 >> "ItemInfo" >> "OpticsModes") call BIS_fnc_getCfgSubClasses) > 1 && cameraView == "GUNNER") exitWith {}; [playa, "cant", "lnon"] call tsp_fnc_animate_tactical}, {}, []] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_weapon_unsling", "Unsling Rifle", {if (primaryWeapon playa == '' && (currentWeapon playa == '' || currentWeapon playa == handgunWeapon playa) && count (playa getVariable ['tsp_slung',[]]) > 1 && stance playa in ['STAND','CROUCH']) then {[playa, false, false, true, true] spawn tsp_fnc_animate_weapon}}, {}, [2, [false, false, false]]] call CBA_fnc_addKeybind;

["TSP Animate", "tsp_animate_throw", "Throw Weapon", {if (tsp_cba_animate_throw) then {[playa, true] spawn tsp_fnc_animate_throw}}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_throw_quick", "Throw Weapon (Quick)", {if (tsp_cba_animate_throw) then {[playa, false, 5, 8] spawn tsp_fnc_animate_throw}}, {}, []] call CBA_fnc_addKeybind;
["TSP Animate", "tsp_animate_drop", "Drop Weapon", {if (tsp_cba_animate_throw) then {([playa, currentWeapon playa] call tsp_fnc_throw) setVelocityModelSpace [2,3,0]}}, {}, []] call CBA_fnc_addKeybind;


// TSP Melee -------------------------------------------------------------------------------------------
//-- CONTROLS
	[  //-- Toggle
		["TSP Core", "Melee"], "tsp_melee_meleeKeyHold", "Melee (Hold)",
		{if (tsp_cba_melee && playa call tsp_fnc_melee_can && [playa] call tsp_fnc_melee_weapon != "") then {[playa, "ready"] spawn tsp_fnc_melee_action}},
		{if (playa call tsp_fnc_melee_doing) then {[""] spawn tsp_fnc_scroll; playa setVariable ["tsp_gestureStop", true]}},
		[]
	] call CBA_fnc_addKeybind;

	[  //-- Toggle
		["TSP Core", "Melee"], "tsp_melee_meleeKeyToggle", "Melee (Toggle)",
		{
			if (playa call tsp_fnc_melee_doing) exitWith {[""] spawn tsp_fnc_scroll; playa setVariable ["tsp_gestureStop", true]};
			if (tsp_cba_melee && playa call tsp_fnc_melee_can && [playa] call tsp_fnc_melee_weapon != "") then {[playa, "ready"] spawn tsp_fnc_melee_action};
		}, {},
		[]
	] call CBA_fnc_addKeybind;

	[  //-- Double tap, toggle
		["TSP Core", "Melee"], "tsp_melee_meleeKeyDoubleTapToggle", "Melee (Double Tap, Toggle)",
		{
			if (playa call tsp_fnc_melee_doing) exitWith {[""] spawn tsp_fnc_scroll; playa setVariable ["tsp_gestureStop", true]};
			if (isNil "tsp_melee_firstTap") exitWith {[] spawn {tsp_melee_firstTap = true; sleep 0.3; tsp_melee_firstTap = nil}};  //-- Double tap
			if (tsp_cba_melee && playa call tsp_fnc_melee_can && [playa] call tsp_fnc_melee_weapon != "") then {[playa, "ready"] spawn tsp_fnc_melee_action};
		}, {},
		[]
	] call CBA_fnc_addKeybind;

	[["TSP Core", "Melee"], "tsp_melee_main", "Main", {if (playa call tsp_fnc_melee_doing) then {[playa, "main"] spawn tsp_fnc_melee_action}}, {}, []] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_alt", "Alternate", {if (playa call tsp_fnc_melee_doing) then {[playa, "alt"] spawn tsp_fnc_melee_action}}, {}, []] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_kick", "Kick", {if (playa call tsp_fnc_melee_doing) then {[playa, "kick"] spawn tsp_fnc_melee_action}}, {}, []] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_block", "Block", {if (playa call tsp_fnc_melee_doing) then {[playa, "block"] spawn tsp_fnc_melee_action}}, {if (playa call tsp_fnc_melee_doing) then {[playa, "ready"] spawn tsp_fnc_melee_action}}, []] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_special", "Special", {if (playa call tsp_fnc_melee_doing) then {[playa, "special"] spawn tsp_fnc_melee_action}}, {}, [0, [true, false, false]]] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_dodge_left", "Dodge (Left)", {if (playa call tsp_fnc_melee_doing) then {[playa, "dodge_left"] spawn tsp_fnc_melee_action}}, {}, []] call CBA_fnc_addKeybind;
	[["TSP Core", "Melee"], "tsp_melee_dodge_right", "Dodge (Right)", {if (playa call tsp_fnc_melee_doing) then {[playa, "dodge_right"] spawn tsp_fnc_melee_action}}, {}, []] call CBA_fnc_addKeybind;
