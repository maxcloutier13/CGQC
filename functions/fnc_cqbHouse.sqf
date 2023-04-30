_type = _this select 0;

switch (_type) do {
	case -1: {player call ACE_medical_treatment_fnc_fullHealLocal;hint "Patched up";};
	case -2: {
		_bandage = "ACE_fieldDressing";
		_painkiller = "FF_Painkiller";
		for "_i" from 1 to 10 do {player addItem _bandage;};
		for "_i" from 1 to 5 do {player addItem _painkiller;};
		hint "10x Bandages + 5 painkillers";
	};
	case -3: {
		_primary_mag = (primaryWeaponMagazine player) select 0;
		for "_i" from 1 to 10 do { 
			player addItem _primary_mag;
		};
		hint "10x Primary mags";
	};
	case -4: {
		_sec_mag = (secondaryWeaponMagazine player) select 0;
		for "_i" from 1 to 4 do { 
			player addItem _sec_mag;
		};
		hint "5x Secondary mags";
	};
	case -5: {
		_bang = "ACE_M84";
		for "_i" from 1 to 5 do { 
			player addItem _bang;
		};
		hint "5x Flashbangs";
	};
	case -6: {
		_bang = "ACE_CTS9";
		for "_i" from 1 to 5 do { 
			player addItem _bang;
		};
		hint "5x 9-bangs";
	};
	case 0: {cgqc_house1_on = false;publicVariable "cgqc_house1_on";hint "CQC Off";};
	case 1: {cqb_house1_hostile_class = ["rhsgref_tla_warlord"];};
	case 2: {cqb_house1_hostile_class = ["O_G_Soldier_TL_F", "O_G_Soldier_SL_F", "O_G_officer_F"];};
	case 3: {cqb_house1_hostile_class = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F"];};
	case 4: {cqb_house1_hostile_class = ["DSF_WAG_TeamLeader", "DSF_WAG_SquadLeader", "DSF_WAG_Rifleman_Lite", "DSF_WAG_Rifleman", "DSF_WAG_Repair", "DSF_WAG_Officer", "DSF_WAG_Marksman", "DSF_WAG_Explosives", "DSF_WAG_Engineer", "DSF_WAG_Medic", "DSF_WAG_AutomaticRifleman"];};
	case 5: {cqb_house1_hostile_class = ["O_Soldier_F", "O_Soldier_SL_F", "O_Soldier_TL_F"]};
	case 6: {cqb_house1_hostile_class = ["O_V_Soldier_TL_hex_F", "O_V_Soldier_hex_F"]};
	case 7: {cqb_house1_hostile_class = ["O_GEN_Soldier_F", "O_GEN_Commander_F"]};
	case 8: {cqb_house1_hostile_class = ["O_R_recon_TL_F", "O_R_recon_exp_F", "O_R_Patrol_Soldier_Medic"]};
	case 9: {cqb_house1_hostile_class = ["I_E_Soldier_F", "I_E_Soldier_lite_F", "I_E_Soldier_SL_F", "I_E_Officer_F", "I_E_Medic_F"]};
	case 10: {cqb_house1_hostile_class = ["I_L_Criminal_SG_F", "I_L_Criminal_SMG_F", "I_L_Looter_Rifle_F", "I_L_Looter_Pistol_F", "I_L_Looter_SG_F", "I_L_Looter_SMG_F"]};
	case 11: {cqb_house1_hostile_class = ["I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_4_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_1_F"]};
	case 12: {cqb_house1_hostile_class = ["I_Soldier_TL_F", "I_Soldier_SL_F", "I_Soldier_lite_F", "I_soldier_F", "I_officer_F", "I_Soldier_M_F", "I_support_Mort_F", "I_medic_F", "I_Soldier_A_F"]};
	case 13: {cqb_house1_hostile_class = ["rhs_vdv_sergeant", "rhs_vdv_rifleman", "rhs_vdv_officer_armored", "rhs_vdv_engineer", "rhs_vdv_arifleman_rpk", "rhs_vdv_rifleman_asval", "rhs_vdv_medic"]};
	case 14: {cqb_house1_hostile_class = ["DSF_LDPR_ATSoldier", "DSF_LDPR_TeamLeader", "DSF_LDPR_SquadLeader", "DSF_LDPR_Rifleman", "DSF_LDPR_Rifleman_Lite", "DSF_LDPR_Officer", "DSF_LDPR_Engineer", "DSF_LDPR_Medic", "DSF_LDPR_AutomaticRifleman"]};
	case 15: {cqb_house1_hostile_class = ["DSF_HAMAS_AutomaticRifleman","DSF_HAMAS_Medic", "DSF_HAMAS_Engineer", "DSF_HAMAS_Marksman", "DSF_HAMAS_Officer", "DSF_HAMAS_Repair", "DSF_HAMAS_Rifleman", "DSF_HAMAS_Rifleman_Lite", "DSF_HAMAS_SquadLeader", "DSF_HAMAS_TeamLeader"]};
	case 16: {cqb_house1_hostile_class = ["UK3CB_ION_O_Urban_SF_TL", "UK3CB_ION_O_Urban_SF_SPOT", "UK3CB_ION_O_Urban_SF_SL", "UK3CB_ION_O_Urban_SF_RIF_3", "UK3CB_ION_O_Urban_SF_RIF_4", "UK3CB_ION_O_Urban_SF_RIF_2", "UK3CB_ION_O_Urban_SF_ENG", "UK3CB_ION_O_Urban_SF_AR"]};
	case 17: {cqb_house1_hostile_class = ["DSF_ISIS_AutomaticRifleman", "DSF_ISIS_Medic", "DSF_ISIS_Engineer", "DSF_ISIS_HVT", "DSF_ISIS_MachineGunner", "DSF_ISIS_Marksman", "DSF_ISIS_Officer", "DSF_ISIS_Rifleman", "DSF_ISIS_Rifleman_Lite", "DSF_ISIS_SquadLeader", "DSF_ISIS_TeamLeader"]};
	case 18: {cqb_house1_hostile_class = ["DSF_CART_TeamLeader", "DSF_CART_SquadLeader", "DSF_CART_Sicario", "DSF_CART_Rifleman_SPAR", "DSF_CART_Rifleman_Lite", "DSF_CART_Rifleman", "DSF_CART_Marksman", "DSF_CART_Officer", "DSF_CART_FalconSMG", "DSF_CART_FalconRifle", "DSF_CART_Medic", "DSF_CART_BodyGuard"]};
	case 40: {cqb_house1_target_nbr = cqb_house1_target_nbr + 5; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 41: {cqb_house1_target_nbr = cqb_house1_target_nbr - 5; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 42: {cqb_house1_target_nbr = cqb_house1_target_nbr + 10; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 43: {cqb_house1_target_nbr = cqb_house1_target_nbr - 10; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 44: {cqb_house1_target_nbr = cqb_house1_target_nbr + 20; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 45: {cqb_house1_target_nbr = cqb_house1_target_nbr - 20; hint format["Targets:%1",cqb_house1_target_nbr];};

	case 46: {cqb_house1_target_nbr = selectRandom [10,12,15,17,19,20]; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 47: {cqb_house1_target_nbr = selectRandom [20,22,25,27,29,30]; hint format["Targets:%1",cqb_house1_target_nbr];};
	case 48: {cqb_house1_target_nbr = selectRandom [30,32,35,37,40,42,45,47,50]; hint format["Targets:%1",cqb_house1_target_nbr];};

	case 50: {cqb_house1_move = 0; hint "No movement";};//Movement
	case 51: {cqb_house1_move = 1; hint "10% move";};
	case 52: {cqb_house1_move = 2; hint "25% move";};
	case 53: {cqb_house1_move = 3; hint "50% move";};
	case 54: {cqb_house1_move = 4; hint "75% move";};
	case 55: {cqb_house1_move = 5; hint "Random move";};
	case 60: {cqb_house1_civ = true; hint "Civilian present";};//Civ presence
	case 61: {cqb_house1_civ = false; hint "No Civs";};
	case 62: {cqb_house1_nade = true; hint "Grenades: On";};
	case 63: {cqb_house1_nade = false; hint "Grenades: Off";};
	case 70: {cqb_house1_timer = 0; hint "No Release";};
	case 71: {cqb_house1_timer = cqb_house1_timer + 30; hint format["Time until release:%1secs",cqb_house1_timer];};
	case 72: {cqb_house1_timer = cqb_house1_timer - 30; hint format["Time until release:%1secs",cqb_house1_timer];};
	case 73: {cqb_house1_timer = cqb_house1_timer + 60; hint format["Time until release:%1secs",cqb_house1_timer];};
	case 74: {cqb_house1_timer = cqb_house1_timer - 60; hint format["Time until release:%1secs",cqb_house1_timer];};
	case 75: {cqb_house1_timer = 10; cqb_house1_timer_random = true; hint "Time until release:Random";};
	
	default {
		hint "cqb_house_1 error";
	};
};

if (_type < 40) then {
	{deleteVehicle _x;} forEach cqb_house1_list;
	{deleteVehicle _x;} forEach cqb_house1_list_civ;
	{deleteVehicle _x;} forEach allDead;
	{deleteVehicle _x;} forEach nearestObjects [getpos player, ["WeaponHolder", "GroundWeaponHolder"], 100];
	cqb_house1_list_static = [];
	cqb_house1_list_moving = [];
	cqb_house1_list_civ = [];
	cqb_house1_tgt_static = 0;
	cqb_house1_tgt_move = 0;
	cqb_house1_tgt_civ = 0;
	if (_type >0) then {
		_building = nearestBuilding player; // Replace player with the unit you want to search for buildings near
		//Close all doors
		for "_i" from 1 to 22 do { 
			[_building, _i, 0] call BIS_fnc_door;
		};
		_positions = [_building] call BIS_fnc_buildingPositions;
		// Create Group for unit & set behavior
		_unit_group = createGroup [east, true];
		_unit_group setBehaviour "SAFE";
		_civ_group = createGroup [civilian, true];
		cqb_house1_list = [];
		for "_i" from 1 to cqb_house1_target_nbr do { 
			// Pick random position
			_random_pos = selectRandom _positions;
			_positions = _positions - _random_pos;
			_spawn_class = selectRandom cqb_house1_hostile_class;
			_unit = _unit_group createUnit [_spawn_class, _random_pos, [], 0, "CAN_COLLIDE"];
			if (_type == 2) then {
				_unit removeWeapon (primaryWeapon _unit);
			};
			doStop _unit;
			_move = 0;
			if (cqb_house1_move == 5) then {
				cqb_house1_move = selectRandom [1,2,3,4];
			};
			switch (cqb_house1_move) do {
				case 0: {_move = 0};
				case 1: {_move = selectRandom [0,0,0,0,0,0,0,0,0,1];};
				case 2: {_move = selectRandom [0,0,0,1];};
				case 3: {_move = selectRandom [0,1];};
				case 4: {_move = selectRandom [0,1,1];};
				default {
					hint "cqb_house1_move error";
				};
			};
			// Sets unit as moving or not
			if (_move == 0) then {
				_unit disableAI "PATH";
				cqb_house1_tgt_static = cqb_house1_tgt_static + 1;
				cqb_house1_list_static pushBack _unit;
			}else{
				cqb_house1_tgt_move = cqb_house1_tgt_move + 1;
				cqb_house1_list_moving pushBack _unit;
			};
			if !(cqb_house1_nade) then {
				// Remove grenades
				_unit removeMagazines "HandGrenade";
				_unit removeMagazines "MiniGrenade";
				_unit removeMagazines "rhs_mag_m67";
			};
			// Killed EventHandler 
			_unit addEventHandler ["Killed", {
				params ["_unit", "_killer"];
				cqb_house1_list = cqb_house1_list - [_unit];
				cqb_house1_list_moving = cqb_house1_list_moving - [_unit];
				cqb_house1_list_static = cqb_house1_list_static - [_unit];
				_left = count cqb_house1_list;
				systemChat format ["%1 killed by %2. %3 left", typeOf _unit, name _killer, _left];
				//cqb_house1_list = cqb_house1_list - _unit;
				if (_left < 1) then {
					_text = parseText ("Building clear..." + "<br/>" + "Good job Viper!");
					[_text, 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
				};
			}];
			cqb_house1_list pushBack _unit;
			sleep 0.2;
		};
		if (cqb_house1_civ) then {
			_civ_nbr = selectRandom [1,2,3];
			for "_i" from 1 to _civ_nbr do {
				// Pick random position
				_random_pos = selectRandom _positions;
				_positions = _positions - _random_pos;
				_spawn_class = selectRandom cqb_house1_civ_class;
				_unit = _civ_group createUnit [_spawn_class, _random_pos, [], 0, "CAN_COLLIDE"];
				_unit disableAI "PATH";
				_unit setUnitPos "UP";
				cqb_house1_tgt_civ = cqb_house1_tgt_civ + 1;
				// Killed EventHandler 
				_unit addEventHandler ["Killed", {
					params ["_unit", "_killer"];
					cqb_house1_list_civ = cqb_house1_list_civ - [_unit];
					_txt = format["Civilian DOWN! killed by %1!!!!!!!!", name _killer];
					systemChat _txt;
				}];
				cqb_house1_list_civ pushBack _unit;
			};
		};
		_txt = parseText format["-- Ready to go --"  + "<br/>" + "Total Units: %1" + "<br/>" + "Moving: %2" + "<br/>" + "Static: %3" + "<br/>" + "Civ: %4", count cqb_house1_list,cqb_house1_tgt_move,cqb_house1_tgt_static,cqb_house1_tgt_civ]; 
		hint _txt;
		cgqc_house1_on = true;
		publicVariable "cgqc_house1_on";
		if (cqb_house1_timer > 0) then {
			while {cgqc_house1_on} do {
				if (cqb_house1_timer_random) then {
					//cqb_house1_timer = selectRandom [5,10,15,20,30];
					cqb_house1_timer = selectRandom [5,10,15,20,30,60,90,120,180,240,300,360];
				};
				sleep cqb_house1_timer;
				if (count cqb_house1_list_static > 0) then {
					_random_pax = selectRandom cqb_house1_list_static;
					cqb_house1_list_static = cqb_house1_list_static - [_random_pax];
					cqb_house1_list_moving pushBack _random_pax;
					_random_pax enableAI "PATH";
					systemChat format ["%1 started moving", typeOf _random_pax]; 
				};
			};
		};
		
	};
};