// --- Loadout Construction () ----------------------------------------------------------
// Adds items to the construction truck's inventory
waitUntil {sleep 1;cgqc_postInitClient_done};
const_unit = _this select 0;
const_unit = const_unit select 0;

// Arsenal 
//[const_unit,"cgqc_box_mk2_arsenal",1] call grad_fortifications_fnc_addFort;

// Bunker stuff
[const_unit,"Land_BagBunker_Large_F",2] call grad_fortifications_fnc_addFort;
[const_unit,"Land_PortableLight_double_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_ToiletBox_F",2] call grad_fortifications_fnc_addFort;
[const_unit,"Land_WaterTank_F",2] call grad_fortifications_fnc_addFort;
[const_unit,"Land_Cargo20_military_green_F",2] call grad_fortifications_fnc_addFort;
[const_unit,"Land_Cargo_Patrol_V1_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_HBarrierBig_F",10] call grad_fortifications_fnc_addFort;
[const_unit,"Land_HBarrier_5_F",10] call grad_fortifications_fnc_addFort;

// Random shit
[const_unit,"Land_Pallets_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_PaperBox_closed_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_WaterBarrel_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_MetalBarrel_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_BarrelTrash_grey_F",5] call grad_fortifications_fnc_addFort;
[const_unit,"Land_Pallets_stack_F",5] call grad_fortifications_fnc_addFort;
