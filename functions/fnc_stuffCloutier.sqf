// --- stuffCloutier ----------------------------------------------------------
// It's a Cloutier thang

_type = _this select 0;

CGQC_fnc_yeetTarget = {
	_target = _this select 0; 
	_target setVelocity [0, 0, 200]; 
	sleep 10;
	hint "Tiens... un parachute ;o)";
	_backpack = backpack _target;
	_items = backpackItems _target;
	removeBackpack _target;
	_target addBackpack	"B_Parachute";
	waitUntil{isTouchingGround _target};
	sleep 1;
	removeBackpack _target;
	_target addBackpack _backpack;
	{
		_target addItemToBackpack _x;
	}forEach _items;
	hint "ton backpack is back";
};

CGQC_fnc_fuckOffTarget = {
	_target = _this select 0; 
	_target setVelocity [0, 0, 25];
	 _target setVelocity [100, 100, 100];
	sleep 10;
	hint "No chute for you! ;o)";
	removeBackpack _target;
};

switch (_type) do {
	case "delete": {
		{
			deleteVehicle _x
		} forEach allDead;
		hint "Dead deleted";
	};
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
		//player addItemToVest "murshun_cigs_cigpack";
		player addItemToVest "grad_paceCountBeads_functions_paceCountBeads";
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
	case "117":
	{
		player addItemToBackpack "ACRE_PRC117F";
		hint "Got: 117";
	};
	case "crate":
	{
		max_crate="cgqc_box_mk1_arsenal" createVehicle (position player);
		cgqc_cloutier_crate = true;
	};
	case "del_crate":
	{
		deleteVehicle max_crate;
		cgqc_cloutier_crate = false;
	};
	case "mh6":
	{
		// Spawn vic
		max_mh6 ="cgqc_heli_dickforce" createvehicle (position player);
		cgqc_cloutier_mh6 = true;
	};
	case "del_mh6":
	{
		// Delete heli
		deleteVehicle max_mh6;
		cgqc_cloutier_mh6 = false;
	};
	case "ah6":
	{
		// Spawn vic
		max_ah6 ="cgqc_heli_cloutier" createvehicle (position player);
		cgqc_cloutier_ah6 = true;
	};
	case "del_ah6":
	{
		// Delete heli
		deleteVehicle max_ah6;
		cgqc_cloutier_ah6 = false;
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
		cgqc_cloutier_chill = true;
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
		cgqc_cloutier_chill = false;
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
		_targetID = owner cursorTarget;
    	[cursorTarget] remoteExec ["CGQC_fnc_yeetTarget", _targetID];
	};
	case "fuckoff":
	{
		_targetID = owner cursorTarget;
    	[cursorTarget] remoteExec ["CGQC_fnc_fuckOffTarget", _targetID];
	};
	case "passout":
	{
		cursorTarget setUnconscious true;
	};
	case "wakeup":
	{
		cursorTarget setUnconscious false;
	};
	case "stop":
	{
		hintSilent "Stop";
		player switchMove "";
		cgqc_cloutier_dancing = false;
	};
	case "dance1":
	{
		hintSilent "Dance!";
		player switchMove "Acts_Dance_01";
		cgqc_cloutier_dancing = true;
	};
	case "dance2":
	{
		hintSilent "Dance!";
		player switchMove "Acts_Dance_02";
		cgqc_cloutier_dancing = true;
	};
	case "radiopack":
	{
		hintSilent "It's on!";
		[player] call klpq_musicRadio_fnc_addBackpackRadio;
	};
	case "zeus":
	{
		_checkIfValidCuratorSlot = {
			private _curatorList = _this;

			// Check that Zeus has been assigned to player
			if (isNull (getAssignedCuratorLogic player)) then {
				private _exitLoop = false;
				{
					// find an unassigned Zeus slot and assign it to the player
					if (isNull (getAssignedCuratorUnit _x)) then {
						[player, _x] remoteExecCall ["assignCurator", 2];
						sleep 2.0;
						// Check if a valid Zeus slot
						if (isNull (getAssignedCuratorLogic player)) then {
							// Broken Zeus slot, so clear and repeat
							_x remoteExecCall ["unassignCurator", 2];
							sleep 2.0;
						} else {
							hint format["Zeus assigned to curator %1", _x];
							_exitLoop = true;
						};
					};
					if (_exitLoop) exitWith {};
				} forEach _curatorList;
			};
		};

		// find all curators and reverse list so to lessen chance of admin Zeus conflicts
		private _curatorList = allCurators;
		reverse _curatorList;

		// Check that Zeus has been initially assigned to player
		_curatorList call _checkIfValidCuratorSlot;

		// Ensure Zeus keeps slot, despite admin logging
		while { true } do {
			// Check that Zeus has been assigned to player
			_curatorList call _checkIfValidCuratorSlot;

			sleep 10.0;
		};
	};

	default
	{
		hint "fnc_stuffCloutier fail";
	};
};