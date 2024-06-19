// Sniping school composition
cgqc_position_sniping =
[
	["GRAD_slingHelmet_WeaponHolder",[-0.373047,0.34375,1.00144],135.234,1,0,[1.79862,-1.33379],"","",true,false],
	["cgqc_whiteboard_windk",[1.32104,2.34204,-0.00223637],359.996,1,0,[-0.327456,0.000390078],"","",true,false],
	["ShootingMat_01_Olive_F",[-0.290283,5.9812,0],0,1,0,[0,0],"","",true,false],
	["ACE_Item_SpottingScope",[0.310303,7.07495,0],0,1,0,[0,0],"","",true,false]
];

// Sniping ---------------------------------------------------------------------------------------------------------
_action = [ "menu_sniping", "Sniping", "\CGQC\textures\icon_sniping", {}, {!cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_on", "Sniping-> On", "", {[1] spawn CGQC_fnc_trainingSniping}, {!cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_comp", "Spawn Snipning Info", "", {[2] spawn CGQC_fnc_trainingSniping}, {!cgqc_training_sniping_comp_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_sniping"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_comp", "Delete Snipning Info", "", {[3] spawn CGQC_fnc_trainingSniping}, {cgqc_training_sniping_comp_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;


cgqc_action_sniping = [ "menu_sniping_on", "Sniping", "\CGQC\textures\icon_sniping", {}, {cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], cgqc_action_sniping ] call  ace_interact_menu_fnc_addActionToObject;

// Targets ====================================================================================
_action = [ "menu_sniping_targets", "Spawn Target", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_sniping_targets", "A-Zone", "", {["metalTarget_Stand_AZone", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Hostage", "", {["Hostage_Target", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Black", "", {["metalTarget_Stand_Black", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Precision", "", {["TargetStatic_ACR", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Wind", "", {["Wind_Target", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Popup", "", {["TargetP_Inf2_Acc2_F", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Soldiers and vehicles
_action = [ "menu_sniping_targets", "** Soldat", "", {["O_G_Soldier_F", false, cgqc_sniping_movingTarget, cgqc_sniping_distanceMode] spawn CGQC_fnc_createSoldier}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "** Tank", "", {["tank", false, false, cgqc_sniping_distanceMode] spawn CGQC_fnc_createTarget}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;


// Option: mobiles
_action = [ "menu_sniping_targets", "Mobile: turn on", "", {""}, {!cgqc_sniping_movingTarget} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "Mobile: turn off", "", {""}, {cgqc_sniping_movingTarget} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Options: Distance
_action = [ "menu_sniping_distance", "Distance mode", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "On cursor (Default)", "", {cgqc_sniping_distanceMode = 0}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "25/50/100m+", "", {cgqc_sniping_distanceMode = 1}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_sniping_targets", "100m", "", {cgqc_sniping_distanceMode = 100}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "200m", "", {cgqc_sniping_distanceMode = 200}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "300m", "", {cgqc_sniping_distanceMode = 300}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "400m", "", {cgqc_sniping_distanceMode = 400}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "500m", "", {cgqc_sniping_distanceMode = 500}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "600m", "", {cgqc_sniping_distanceMode = 600}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "700m", "", {cgqc_sniping_distanceMode = 700}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "800m", "", {cgqc_sniping_distanceMode = 800}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "900m", "", {cgqc_sniping_distanceMode = 900}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1000m", "", {cgqc_sniping_distanceMode = 1000}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1100m", "", {cgqc_sniping_distanceMode = 1100}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1200m", "", {cgqc_sniping_distanceMode = 1200}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1300m", "", {cgqc_sniping_distanceMode = 1300}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1400m", "", {cgqc_sniping_distanceMode = 1400}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1500m", "", {cgqc_sniping_distanceMode = 1500}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_targets", "1600m", "", {cgqc_sniping_distanceMode = 1600}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_targets", "menu_sniping_distance"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Random Targets ====================================================================================
_action = [ "menu_sniping_random", "Random Targets around you", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_sniping_random", "Short Range 15-300m", "", {["TargetP_Inf2_Acc2_F", 100, false, 15, 300] spawn CGQC_fnc_generateTargets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_random"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_random", "Medium Range 300-800m", "", {["TargetP_Inf2_Acc2_F", 250, false, 300, 800] spawn CGQC_fnc_generateTargets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_random"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_random", "Long Range 600-2000m", "", {["TargetP_Inf2_Acc2_F", 500, false, 600, 2000] spawn CGQC_fnc_generateTargets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on", "menu_sniping_random"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Options ====================================================================================
_action = [ "menu_sniping_reset", "Reset Stats", "", {["reset"] spawn CGQC_fnc_sniping}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_remove", "Remove targets", "", {["remove"] spawn CGQC_fnc_sniping}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_impact", "See Impact", "", {["impact"] spawn CGQC_fnc_sniping}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_impact", "Bullet Tracing", "", {["tracing"] spawn CGQC_fnc_sniping}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_impact", "Bullet Cam", "", {["bulletCam"] spawn CGQC_fnc_sniping}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_sniping_off", "Sniping-> Off", "", {[0] spawn CGQC_fnc_trainingSniping}, {cgqc_training_sniping} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_sniping_on"], _action ] call  ace_interact_menu_fnc_addActionToObject;
