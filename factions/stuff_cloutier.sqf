_type = _this select 0;

switch (_type)
do
{
	case "micro":
	{
		player addItemToBackpack "sps_black_hornet_01_Static_F";
		player linkItem "B_UavTerminal";
		hint "Got: microdrone";
	};
	case "darter":
	{
		player addItemToBackpack "Rev_darter_item";
		player linkItem "B_UavTerminal";
		hint "Got: darter";
	};
	case "cigs":
	{
		player addItemToVest "murshun_cigs_lighter";
		player addItemToVest "murshun_cigs_cigpack";
		player addItemToVest "immersion_cigs_cigar0_nv";
		hint "Got: cigs";
	};
	case "343":
	{
		player addItemToBackpack "ACRE_PRC343";
		hint "Got: 343";
	};
	case "152":
	{
		player addItemToBackpack "ACRE_PRC152";
		hint "Got: 152";
	};
	case "crate":
	{
		max_crate="cgqc_box_mk1_plus_plus_green" createVehicle (position player);
		// Add Delete Crate option
		_action = [ "max_delcrate", "Delete crate", "", {["del_crate"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions", "menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;
		// Remove add crate option
		_remove = [ player, 1, ["ACE_SelfActions", "menu_cloutier", "menu_spawn", "max_getcrate"]] call ace_interact_menu_fnc_removeActionFromObject;
	};
	case "del_crate":
	{
		deleteVehicle max_crate;
		// Bring back add crate
		_action = [ "max_getcrate", "Get crate", "", {["crate"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
		// Remove del crate option
		_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn", "max_delcrate"]] call ace_interact_menu_fnc_removeActionFromObject;
	};
	case "heli":
	{
		// Spawn vic
		max_vic ="cgqc_heli_dickforce" createvehicle (position player);
		// Add Delete heli
		_action = [ "max_delheli", "Delete heli", "", {["del_heli"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
		// Remove add heli option
		_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn", "max_getheli"]] call ace_interact_menu_fnc_removeActionFromObject;
	};
	case "del_heli":
	{
		// Delete heli
		deleteVehicle max_vic;
		// Get heli
		_action = [ "max_getheli", "Get heli", "", {["heli"] execVM "\cgqc\factions\stuff_cloutier.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
		_adding = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn"], _action ] call ace_interact_menu_fnc_addActionToObject;	
		// Remove delete heli option
		_remove = [ player, 1, ["ACE_SelfActions","menu_cloutier", "menu_spawn", "max_delheli"]] call ace_interact_menu_fnc_removeActionFromObject;
	};
	case "chill":
	{
		_new_hat = "UK3CB_H_Woolhat_BLK";
		_new_face = "G_Aviator";
		_new_vest = "V_SmershVest_01_radio_F";

		// Sling helmet
		[player] call GRAD_slingHelmet_fnc_actionSling;
		// Send facestuff to backpack
		face_old = goggles player;
		player addItemToBackpack face_old;
		// set hat
		player addHeadgear _new_hat;
		// set glasses 
		player addGoggles _new_face;
		// set vest
		vest_old = vest player;
		_items_vest = vestItems player;
		player addVest _new_vest;
		// get vest items back 
		{
			player addItemToVest _x
		} forEach _items_vest;
	};
	case "ready":
	{
		// Unsling helmet
		[player] call GRAD_slingHelmet_fnc_actionUnSling;
		// Get back facestuff to backpack
		player removeItemFromBackpack face_old;
		// set facestuff 
		player addGoggles face_old;
		// get old vest back
		_items_vest = vestItems player;
		player addVest vest_old;
		// get vest items back 
		{
			player addItemToVest _x
		} forEach _items_vest;
	};
	case "skills":
	{
		player setUnitTrait ["Medic", true];
		player setUnitTrait ["engineer", true];
		player setUnitTrait ["explosiveSpecialist", true];
	};
	case "arsenal":
	{
		['Open', true] call BIS_fnc_arsenal;
	};
	case "yeet":
	{
		_target = cursorTarget;
		_target setVelocity [0, 0, 100]; 
		sleep 2;
		removeBackpack _target;
		_target addBackpack	"B_Parachute";
	};
	default
	{
		hint "woops";
	};
};