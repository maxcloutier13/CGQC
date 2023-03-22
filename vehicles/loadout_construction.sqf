// --- Loadout Construction () ----------------------------------------------------------
// Adds items to the construction truck's inventory
_truck = _this select 0;

// Bunker stuff
[_truck,"Land_BagBunker_Large_F",2] call grad_fortifications_fnc_addFort;
[_truck,"Land_PortableLight_double_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_ToiletBox_F",2] call grad_fortifications_fnc_addFort;
[_truck,"Land_WaterTank_F",2] call grad_fortifications_fnc_addFort;
[_truck,"Land_Cargo20_military_green_F",2] call grad_fortifications_fnc_addFort;
[_truck,"Land_Cargo_Patrol_V1_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_HBarrierBig_F",10] call grad_fortifications_fnc_addFort;
[_truck,"Land_HBarrier_5_F",10] call grad_fortifications_fnc_addFort;

// Random shit
[_truck,"Land_Pallets_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_PaperBox_closed_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_WaterBarrel_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_MetalBarrel_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_BarrelTrash_grey_F",5] call grad_fortifications_fnc_addFort;
[_truck,"Land_Pallets_stack_F",5] call grad_fortifications_fnc_addFort;