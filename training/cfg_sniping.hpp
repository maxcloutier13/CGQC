// Sniping school composition
cgqc_position_sniping =
[
	["GRAD_slingHelmet_WeaponHolder",[-0.373047,0.34375,1.00144],135.234,1,0,[1.79862,-1.33379],"","",true,false],
	["cgqc_whiteboard_windk",[1.32104,2.34204,-0.00223637],359.996,1,0,[-0.327456,0.000390078],"","",true,false],
	["ShootingMat_01_Olive_F",[-0.290283,5.9812,0],0,1,0,[0,0],"","",true,false],
	["ACE_Item_SpottingScope",[0.310303,7.07495,0],0,1,0,[0,0],"","",true,false]
];

// Sniping ---------------------------------------------------------------------------------------------------------
_action = [ "menu_sniping", "Sniping", "\CGQC\textures\icon_sniping", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_on", "Sniping-> On", "", {[1] spawn CGQC_fnc_trainingSniping}, {!cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_on", "Sniping-> Off", "", {[0] spawn CGQC_fnc_trainingSniping}, {cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_comp", "Spawn Snipning Info", "", {[2] spawn CGQC_fnc_trainingSniping}, {!cgqc_training_sniping_comp_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_comp", "Delete Snipning Info", "", {[3] spawn CGQC_fnc_trainingSniping}, {cgqc_training_sniping_comp_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;