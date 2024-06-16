#include "\CGQC\script_component.hpp"
// --- Loadout Construction () ----------------------------------------------------------
// Adds items to the construction truck's inventory
params ["_unit_array"];
_const_unit = _unit_array select 0;

waitUntil {!isNil "cgqc_start_postInitClient_done"};
waitUntil {cgqc_start_postInitClient_done};
LOG_2("[loadoutConstructionVic] %1 started", _const_unit);
// Arsenal
//[_const_unit,"cgqc_box_mk2_arsenal",1] call grad_fortifications_fnc_addFort;

// Bunker stuff
if (!isNil "grad_fortifications_fnc_addFort") then {
	LOG("[loadoutConstructionVic] grad_fortifications_fnc_addFort is not nil. Inserting");
	[_const_unit,"Land_BagBunker_Large_F",2] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_PortableLight_double_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_ToiletBox_F",2] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_WaterTank_F",2] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_Cargo20_military_green_F",2] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_Cargo_Patrol_V1_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_HBarrierBig_F",10] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_HBarrier_5_F",10] call grad_fortifications_fnc_addFort;

	// Random shit
	[_const_unit,"Land_Pallets_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_PaperBox_closed_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_WaterBarrel_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_MetalBarrel_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_BarrelTrash_grey_F",5] call grad_fortifications_fnc_addFort;
	[_const_unit,"Land_Pallets_stack_F",5] call grad_fortifications_fnc_addFort;
} else {
	LOG("[loadoutConstructionVic] grad_fortifications_fnc_addFort is nil: Skipping");
};
LOG("[loadoutConstructionVic] done");


