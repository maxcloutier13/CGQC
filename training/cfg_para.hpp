// Jump target comp 
cgqc_position_jump =
[
	["PortableHelipadLight_01_blue_F",[0.461914,8.99194,-0.00117397],0,1,0,[0,0],"","",true,false], 
	["Land_JumpTarget_F",[0.282715,9.00098,0],0,1,0,[0,0],"","",true,false]
];

// Parachute ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_training_para", "Parachute", "\CGQC\textures\cgqc_ace_para", {}, {true} ] call ace_interact_menu_fnc_createAction;       
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Jumping uniform 
_action = [ "menu_self_training_para_kit", "Kit: Parachutiste", "", {["para", false] call CGQC_fnc_switchUniform}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Jumping target 
_action = [ "menu_self_training_para_target_on", "Jump Target: Turn On", "", {cgqc_training_jump_target = true}, {!cgqc_training_jump_target} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_target_off", "Jump Target: Turn Off", "", {cgqc_training_jump_target = false}, {cgqc_training_jump_target} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
// Jumps
_action = [ "menu_self_training_para_800", "Jump: 500m", "", {[800, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_1500", "Jump: 1 000m", "", {[1000, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 3 500m", "", {[3500, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 5 000m", "", {[5000, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   
_action = [ "menu_self_training_para_800", "Jump: 10 000m", "", {[10000, 0] execVM '\cgqc\functions\fnc_trainingPara.sqf'}, {true} ] call ace_interact_menu_fnc_createAction;     
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_self_training_para"], _action ] call  ace_interact_menu_fnc_addActionToObject;   