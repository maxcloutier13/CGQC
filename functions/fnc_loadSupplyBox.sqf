#include "\CGQC\script_component.hpp"
// --- loadSupplyBox ----------------------------------------------------------
// Dynamic supply box
params ["_crate_array", "_type"];
_crate = _crate_array select 0;
LOG_2(" loadSupplyBox %1/%2 started", _crate, _type);

[_crate, _type] spawn {
	params ["_crate", "_type"];
	waitUntil {!isNil "cgqc_start_postInitClient_done"};
	waitUntil {cgqc_start_postInitClient_done};
	if (local _crate) then {

		clearItemCargoGlobal _crate;
		clearWeaponCargoGlobal  _crate;
		clearMagazineCargoGlobal  _crate;

		// Always some plugs
		_crate addItemCargoGlobal ["ACE_EarPlugs", 6];

		switch (_type) do {
			case "squad": {
				LOG(" loadSupplyBox - Squad box");
				if (cgqc_config_supply_squad_ammo > 0) then {
					_crate addItemCargoGlobal ["cgqc_bandolier_ammo", cgqc_config_supply_squad_ammo];
					LOG_1(" loadSupplyBox %1 bandoliers",cgqc_config_supply_squad_ammo);
				};

				if (cgqc_config_supply_squad_ifak > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_ifak", cgqc_config_supply_squad_ifak];
					LOG_1(" loadSupplyBox %1 IFAK",cgqc_config_supply_squad_ifak);
				};

				if (cgqc_config_supply_squad_medkit > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_medkit", cgqc_config_supply_squad_medkit];
					LOG_1(" loadSupplyBox %1 MEDKIT",cgqc_config_supply_squad_medkit);
				};

				if (cgqc_config_supply_squad_radios > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC343", cgqc_config_supply_squad_radios];
					LOG_1(" loadSupplyBox %1 radios",cgqc_config_supply_squad_radios);
				};
				if (cgqc_config_supply_squad_radios_152 > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC152", cgqc_config_supply_squad_radios_152];
					LOG_1(" loadSupplyBox %1 152s",cgqc_config_supply_squad_radios_152);
				};
				if (cgqc_config_supply_squad_batteries > 0) then {
					_crate addItemCargoGlobal ["Laserbatteries", cgqc_config_supply_squad_batteries];
					_crate addItemCargoGlobal ["ACE_UAVBattery", cgqc_config_supply_squad_batteries];
					LOG_1(" loadSupplyBox %1 Batteries",cgqc_config_supply_squad_batteries);
				};
				if (cgqc_config_supply_squad_launcher > 0) then {if (cgqc_player_hasRHS) then {
					_crate addItemCargoGlobal ["rhs_weap_m72a7", cgqc_config_supply_squad_launcher]};
					LOG_1(" loadSupplyBox %1 Jetables",cgqc_config_supply_squad_launcher);
				};
				if (cgqc_config_supply_squad_nlaw > 0) then {
					_crate addItemCargoGlobal ["launch_NLAW_F", cgqc_config_supply_squad_nlaw];
					LOG_1(" loadSupplyBox %1 NLAW",cgqc_config_supply_squad_nlaw);
				};

				// Rockets
				if (cgqc_player_has2023) then {
					if (cgqc_config_supply_squad_maaws > 0) then {
					_crate addItemCargoGlobal ["MRAWS_HEAT_F", cgqc_config_supply_squad_maaws];
					LOG_1(" loadSupplyBox %1 MAAWS ammo",cgqc_config_supply_squad_maaws);
					};
					if (cgqc_config_supply_squad_javelin > 0) then {
						_crate addItemCargoGlobal ["jav_AT_mas_can", cgqc_config_supply_squad_javelin];
						LOG_1(" loadSupplyBox %1 Javelin ammo",cgqc_config_supply_squad_javelin);
					};
				};
			};
			case "team": {
				LOG(" loadSupplyBox - Team box");
				if (cgqc_config_supply_team_ammo > 0) then {
					_crate addItemCargoGlobal ["cgqc_bandolier_ammo", cgqc_config_supply_team_ammo];
					LOG_1(" loadSupplyBox %1 bandoliers",cgqc_config_supply_team_ammo);
				};

				if (cgqc_config_supply_team_ifak > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_ifak", cgqc_config_supply_team_ifak];
					LOG_1(" loadSupplyBox %1 IFAK",cgqc_config_supply_team_ifak);
				};

				if (cgqc_config_supply_team_medkit > 0) then {
					_crate addItemCargoGlobal ["cgqc_items_medkit", cgqc_config_supply_team_medkit];
					LOG_1(" loadSupplyBox %1 MEDKIT",cgqc_config_supply_team_medkit);
				};

				if (cgqc_config_supply_team_radios > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC343", cgqc_config_supply_team_radios];
					LOG_1(" loadSupplyBox %1 radios",cgqc_config_supply_team_radios);
				};
				if (cgqc_config_supply_team_radios_152 > 0) then {
					_crate addItemCargoGlobal ["ACRE_PRC152", cgqc_config_supply_team_radios_152];
					LOG_1(" loadSupplyBox %1 152s",cgqc_config_supply_team_radios_152);
				};
				if (cgqc_config_supply_team_batteries > 0) then {
					_crate addItemCargoGlobal ["Laserbatteries", cgqc_config_supply_team_batteries];
					_crate addItemCargoGlobal ["ACE_UAVBattery", cgqc_config_supply_team_batteries];
					LOG_1(" loadSupplyBox %1 Batteries",cgqc_config_supply_team_batteries);
				};
				if (cgqc_config_supply_team_launcher > 0) then {if (cgqc_player_hasRHS) then {
					_crate addItemCargoGlobal ["rhs_weap_m72a7", cgqc_config_supply_team_launcher]};
					LOG_1(" loadSupplyBox %1 Jetables",cgqc_config_supply_team_launcher);
				};
				if (cgqc_config_supply_team_nlaw > 0) then {
					_crate addItemCargoGlobal ["launch_NLAW_F", cgqc_config_supply_team_nlaw];
					LOG_1(" loadSupplyBox %1 NLAW",cgqc_config_supply_team_nlaw);
				};

				// Rockets
				if (cgqc_player_has2023) then {
					if (cgqc_config_supply_team_maaws > 0) then {
					_crate addItemCargoGlobal ["MRAWS_HEAT_F", cgqc_config_supply_team_maaws];
					LOG_1(" loadSupplyBox %1 MAAWS ammo",cgqc_config_supply_team_maaws);
					};
					if (cgqc_config_supply_team_javelin > 0) then {
						_crate addItemCargoGlobal ["jav_AT_mas_can", cgqc_config_supply_team_javelin];
						LOG_1(" loadSupplyBox %1 Javelin ammo",cgqc_config_supply_team_javelin);
					};
				};
			};
			case "explosives": {
				if (cgqc_config_supply_explosives_charges > 0) then {
					_crate addItemCargoGlobal ["ACE_M26_Clacker", 2];
					if (cgqc_player_hasRHS) then {
						_crate addItemCargoGlobal ["rhsusf_m112x4_mag", cgqc_config_supply_explosives_charges];
						_crate addItemCargoGlobal ["rhsusf_m112_mag", cgqc_config_supply_explosives_charges];
					} else {
						_crate addItemCargoGlobal ["DemoCharge_Remote_Mag", cgqc_config_supply_explosives_charges];
					};
				};

				if (cgqc_config_supply_explosives_mine_large > 0) then {
					_crate addItemCargoGlobal ["ATMine_Range_Mag", cgqc_config_supply_explosives_mine_large];
				};

				if (cgqc_config_supply_explosives_mine_medium > 0) then {
					if (cgqc_player_hasRHS) then {_crate addItemCargoGlobal ["rhsusf_mine_m14_mag", cgqc_config_supply_explosives_mine_medium]};
					_crate addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", cgqc_config_supply_explosives_mine_medium];
					_crate addItemCargoGlobal ["SLAMDirectionalMine_Wire_Mag", cgqc_config_supply_explosives_mine_medium];
				};

				if (cgqc_config_supply_explosives_mine_small > 0) then {
					if (cgqc_player_hasRHS) then {_crate addItemCargoGlobal ["rhsusf_mine_m14_mag", cgqc_config_supply_explosives_mine_small]};
					_crate addItemCargoGlobal ["APERSBoundingMine_Range_Mag", cgqc_config_supply_explosives_mine_small];
				};
			};
			default { };
		};
	};
};
LOG(" loadSupplyBox done");