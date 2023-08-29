// --- loadSupplyBox ----------------------------------------------------------
// Dynamic supply box 
params ["_crate_array"];
_crate = _crate_array select 0;
diag_log format ["[CGQC_FNC] loadSupplyBox %1 started", _crate];

[_crate] spawn {
	params ["_crate"];
	waitUntil {!isNil "cgqc_start_postInitClient_done"};
	waitUntil {cgqc_start_postInitClient_done};
	if (isServer) then {
		
		clearItemCargoGlobal _crate;
		clearWeaponCargoGlobal  _crate;
		clearMagazineCargoGlobal  _crate;

		// Always some plugs
		_crate addItemCargoGlobal ["ACE_EarPlugs", 2];

		if (cgqc_config_supply_ammo > 0) then {
			_crate addItemCargoGlobal ["cgqc_bandolier_ammo", cgqc_config_supply_ammo];
		};

		if (cgqc_config_supply_ifak > 0) then {
			_crate addItemCargoGlobal ["cgqc_items_ifak", cgqc_config_supply_ifak];
		};

		if (cgqc_config_supply_medkit > 0) then {
			_crate addItemCargoGlobal ["cgqc_items_medkit", cgqc_config_supply_medkit];
		};

		if (cgqc_config_supply_radios > 0) then {
			_crate addItemCargoGlobal ["ACRE_PRC152", cgqc_config_supply_radios];
			_crate addItemCargoGlobal ["ACRE_PRC343", cgqc_config_supply_radios];
		};

		if (cgqc_config_supply_batteries > 0) then {
			_crate addItemCargoGlobal ["Laserbatteries", cgqc_config_supply_batteries];
			_crate addItemCargoGlobal ["ACE_UAVBattery", cgqc_config_supply_batteries];
		};

		if (cgqc_config_supply_explosives > 0) then {
			_crate addItemCargoGlobal ["ACE_M26_Clacker", 2];
			if (cgqc_player_hasRHS) then {
				_crate addItemCargoGlobal ["rhsusf_m112x4_mag", cgqc_config_supply_explosives];
				_crate addItemCargoGlobal ["rhsusf_m112_mag", cgqc_config_supply_explosives];
			} else {
				_crate addItemCargoGlobal ["DemoCharge_Remote_Mag", cgqc_config_supply_explosives];
			};
		};

		if (cgqc_config_supply_mine_large > 0) then {
			_crate addItemCargoGlobal ["ATMine_Range_Mag", cgqc_config_supply_mine_large];
		};

		if (cgqc_config_supply_mine_medium > 0) then {
			if (cgqc_player_hasRHS) then {_crate addItemCargoGlobal ["rhsusf_mine_m14_mag", cgqc_config_supply_mine_medium]};
			_crate addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", cgqc_config_supply_mine_medium];
			_crate addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag", cgqc_config_supply_mine_medium];
		};

		if (cgqc_config_supply_mine_small > 0) then {
			if (cgqc_player_hasRHS) then {_crate addItemCargoGlobal ["rhsusf_mine_m14_mag", cgqc_config_supply_mine_small]};
			_crate addItemCargoGlobal ["APERSBoundingMine_Range_Mag", cgqc_config_supply_mine_small];
		};

		if (cgqc_config_supply_launcher > 0) then {
			if (cgqc_player_hasRHS) then {_crate addItemCargoGlobal ["rhs_weap_m72a7", cgqc_config_supply_launcher]};
		};

		if (cgqc_config_supply_nlaw > 0) then {
			_crate addItemCargoGlobal ["launch_NLAW_F", cgqc_config_supply_nlaw];
		};
	};
};
diag_log "[CGQC_FNC] loadSupplyBox done";