#include "script_component.hpp"
// --- loadSupplyBox ----------------------------------------------------------
// Dynamic supply box
params ["_crate_array", "_type"];
_crate = _crate_array select 0;
diag_log format ["[CGQC_FNC] loadSupplyBox %1/%2 started", _crate, _type];

[_crate, _type] spawn {
	params ["_crate", "_type"];
	waitUntil {!isNil "cgqc_start_postInitClient_done"};
	waitUntil {cgqc_start_postInitClient_done};
	if (local _crate) then {

		clearItemCargoGlobal _crate;
		clearWeaponCargoGlobal  _crate;
		clearMagazineCargoGlobal  _crate;

		// Always some plugs
		_crate addItemCargoGlobal ["ACE_EarPlugs", 2];

		switch (_type) do {
			case "squad": {
				diag_log "[CGQC_FNC] loadSupplyBox - Squad box";
				if (cgqc_config_supply_ammo > 0) then {
					_crate addItemCargoGlobal ["cgqc_bandolier_ammo", cgqc_config_supply_ammo];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 bandoliers",cgqc_config_supply_ammo];
				};

				if (cgqc_config_supply_ifak > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_ifak", cgqc_config_supply_ifak];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 IFAK",cgqc_config_supply_ifak];
				};

				if (cgqc_config_supply_medkit > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_medkit", cgqc_config_supply_medkit];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 MEDKIT",cgqc_config_supply_medkit];
				};

				if (cgqc_config_supply_radios > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC343", cgqc_config_supply_radios];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 radios",cgqc_config_supply_radios];
				};
				if (cgqc_config_supply_radios_152 > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC152", cgqc_config_supply_radios_152];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 152s",cgqc_config_supply_radios_152];
				};
				if (cgqc_config_supply_batteries > 0) then {
					_crate addItemCargoGlobal ["Laserbatteries", cgqc_config_supply_batteries];
					_crate addItemCargoGlobal ["ACE_UAVBattery", cgqc_config_supply_batteries];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 Batteries",cgqc_config_supply_batteries];
				};
				if (cgqc_config_supply_launcher > 0) then {if (cgqc_player_hasRHS) then {
					_crate addItemCargoGlobal ["rhs_weap_m72a7", cgqc_config_supply_launcher]};
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 Jetables",cgqc_config_supply_launcher];
				};
				if (cgqc_config_supply_nlaw > 0) then {
					_crate addItemCargoGlobal ["launch_NLAW_F", cgqc_config_supply_nlaw];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 NLAW",cgqc_config_supply_nlaw];
				};

				// Rockets
				if (cgqc_player_has2023) then {
					if (cgqc_config_supply_maaws > 0) then {
					_crate addItemCargoGlobal ["MRAWS_HEAT_F", cgqc_config_supply_maaws];
					diag_log format ["[CGQC_FNC] loadSupplyBox %1 MAAWS ammo",cgqc_config_supply_maaws];
					};
					if (cgqc_config_supply_javelin > 0) then {
						_crate addItemCargoGlobal ["jav_AT_mas_can", cgqc_config_supply_javelin];
						diag_log format ["[CGQC_FNC] loadSupplyBox %1 Javelin ammo",cgqc_config_supply_javelin];
					};
				};

			};
			case "explosives": {
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
			};
			default { };
		};
	};
};
diag_log "[CGQC_FNC] loadSupplyBox done";