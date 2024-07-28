#include "\CGQC\script_component.hpp"
// --- postInitServer ----------------------------------------------------------
// Start everything server-side

LOG("[CGQC_PostInitServer] === Started =====================================");

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	// Save unit stuff in the snapshot
	// [_unit, "save"] spawn CGQC_fnc_snapshot;
	false;// Prevents from turning into AI
}];

// Custom eventHandler on all units
["CAManBase", "init",
	{
		(_this # 0) addMPEventHandler ["MPKilled", {
			params ["_killed", "_killer", "_instigator", "_useEffects"];
			cgqc_kill_killed = _killed;
			cgqc_kill_killer = _killer;
			cgqc_kill_instigator = _instigator;
			cgqc_kill_useEffects = _useEffects;
			cgqc_int_putIncontainer = {
				params ["_containers", "_item", "_amount"];
				_count = count _containers;
				for "_i" from 0 to _count do {
					_container = _containers select _i;
					if !(isNil "_container") exitWith {
					LOG_3("CGQC_Killed] - Adding %1 %2 to %3", _amount, _item, _container);
					_container addItemCargoGlobal [_item, _amount];
				};
			};
		};
		cgqc_int_addRandomItems = {
			params ["_items", "_chance", "_max", "_containers"];
			_items = _items splitString ", ";
			{
				_item = trim _x;
				_roll = floor random 100;
				if (_roll < _chance) then {
					// Win! Adding item
					LOG_1("Adding %1", _x);
					_amount = floor random (_max + 1);
					if (_amount isEqualTo 0) then {
						_amount = 1
					};
					[_containers, _item, _amount] call cgqc_int_putIncontainer;
				};
			} forEach _items;
		};
		if (isServer) then {
			LOG("[CGQC_Killed] On server ");
			if !(isPlayer _killed) then {
				LOG("[CGQC_Killed] === AI unit just died ");
				// Avoid ACE bug where event is called twice
				if (_killed getVariable ["cgqc_wasKilled",0] == 1) exitWith {};
				_killed setVariable ["cgqc_wasKilled",1];

				// Some more ACE workarounds
				if ((isNull _killer) || {_killer == _killed}) then {
					_killer = _killed getVariable ["ace_medical_lastDamageSource", objNull];
				};

				// Killed by vehicle?
				if ((!isNull _killer) && {!(_killer isKindof "CAManBase")}) then {
					_killer = effectiveCommander _killer;
				};

				// Check if civilian
				_side = side (group _killed);
				LOG_1("[CGQC_Killed] Dead Unit side: %1", _side);
				if (isPlayer _killer) then {
					if (_side isEqualTo civilian) then {
						LOG("[CGQC_Killed]: Civilian Casualty!");
						cgqc_stats_civilianCasualties = cgqc_stats_civilianCasualties + 1;
						cgqc_stats_civilianKillers pushBackUnique (name _killer);
						publicVariable "cgqc_stats_civilianCasualties";
						publicVariable "cgqc_stats_civilianKillers";
						_txt = " ... killed a civilian!";
						//[_killer, _txt] remoteExec ["globalChat",0];
						LOG_2("[CGQC_Killed]: Casualties - %1 killed a civilian", name _killer);
					} else {
						_sideKiller = side (group _killer);
						_sideKilled = side (group _killed);
						LOG_2("[CGQC_Killed]: SideKiller:%1/SideKilled:%2", _sideKiller, _sideKilled);
						if ((_sideKiller getFriend _sideKilled) > 0.6) then {
							LOG("[CGQC_Killed]: Friendly Casualty!");
							if !([_killer] call CGQC_fnc_checkZeus) then {
								cgqc_stats_friendlyCasualties = cgqc_stats_friendlyCasualties + 1;
								cgqc_stats_friendlyKillers pushBackUnique (name _killer);
								publicVariable "cgqc_stats_friendlyCasualties";
								publicVariable "cgqc_stats_friendlyKillers";
								_txt = " ... killed a friendly!";
								//[_killer, _txt] remoteExec ["globalChat",0];
								LOG_2("[CGQC_Killed]: Casualties - %1 killed a friendly", name _killer);
							};
						} else {
							//Enemy down
							cgqc_stats_enemyCasualties = cgqc_stats_enemyCasualties + 1;
							publicVariable "cgqc_stats_enemyCasualties";
						};
					};
				};
				if (cgqc_lootingRestriction_on) then {
					LOG("[CGQC_Killed] Loot restriction is ON ");
					// Keep track of items
					_handgun = handgunWeapon _killed;
					_handgun_mag = handgunMagazine _killed select 0;
					_gun = primaryWeapon _killed;
					_gun_mag = primaryWeaponMagazine _killed select 0;
					_launcher = secondaryWeapon _killed;
					_launcher_mag = secondaryWeaponMagazine _killed select 0;
					_uniform = uniformContainer _killed;
					_vest = vestContainer _killed;
					_pack = backpackContainer _killed;
					_uniform_throwables = magazineCargo _uniform select {
						_x call BIS_fnc_isThrowable
					};
					_vest_throwables = magazineCargo _vest select {
						_x call BIS_fnc_isThrowable
					};
					_pack_throwables = magazineCargo _pack select {
						_x call BIS_fnc_isThrowable
					};
					_throwables = _uniform_throwables + _vest_throwables + _pack_throwables;
					// Remove everything from corpse
					removeAllItems _killed;
					removeAllWeapons _killed;

					if (!cgqc_looting_assigned) then {
						LOG("[CGQC_Killed] - Removing assigned items");
						removeAllAssignedItems _killed;
					};
					if (cgqc_looting_throwable) then {
						LOG("[CGQC_Killed] - Giving throwables");
						{
							_vest addItemCargoGlobal [_x, 1];
							LOG_1("[CGQC_Killed] - Throwables: Giving %1", _x);
						} forEach y_throwables;
					};
					if (cgqc_looting_handgun || _handgun isNotEqualTo "") then {
						LOG("[CGQC_Killed] - Giving handgun and ammo");
						_handgun_magCount = floor random cgqc_looting_handgun_amnt;
						_killed addWeapon _handgun;
						_killed addHandgunItem _handgun_mag;
						[[_vest, _pack, _uniform], _handgun_mag, _handgun_magCount] call cgqc_int_putIncontainer;
					};
					if (cgqc_looting_gun || _gun isNotEqualTo "") then {
						LOG("[CGQC_Killed] - Giving gun and ammo");
						_gun_magCount = floor random cgqc_looting_gun_amnt;
						_killed addWeapon _gun;
						_killed addPrimaryWeaponItem _gun_mag;
						[[_vest, _pack, _uniform], _gun_mag, _gun_magCount] call cgqc_int_putIncontainer;
					};
					if (cgqc_looting_launcher || _launcher isNotEqualTo "") then {
						LOG("[CGQC_Killed] - Giving Launcher and ammo");
						_launcher_magCount = floor random cgqc_looting_launcher_amnt;
						_killed addWeapon _launcher;
						_killed addPrimaryWeaponItem _launcher_mag;
						[[_pack, _vest, _uniform], _launcher_mag, _launcher_magCount] call cgqc_int_putIncontainer;
					};
					if (cgqc_looting_common) then {
						LOG("[CGQC_Killed] - Giving common items");
						[cgqc_looting_common_items, cgqc_looting_common_chance, cgqc_looting_common_max, [_uniform, _vest, _pack]] call cgqc_int_addRandomItems;
					};
					if (cgqc_looting_normal) then {
						LOG("[CGQC_Killed] - Giving normal items");
						[cgqc_looting_normal_items, cgqc_looting_normal_chance, cgqc_looting_normal_max, [_uniform, _vest, _pack]] call cgqc_int_addRandomItems;
					};
					if (cgqc_looting_rare) then {
						LOG("[CGQC_Killed] - Giving rare items");
						[cgqc_looting_rare_items, cgqc_looting_rare_chance, cgqc_looting_rare_max, [_uniform, _vest, _pack]] call cgqc_int_addRandomItems;
					};
				};
			} else {
				//params ["_killed", "_killer", "_instigator", "_useEffects"];
				LOG("[CGQC_Killed]: Player got killed!");
				_killText = "";
				_distance = _killed distance2D _killer;
				_victimId = owner _killed;
				_weapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayname");
				LOG_2("[CGQC_Killed]: Killed: %1 - Killer : %2",_killed ,_killer);
				if (isPlayer _killer) then {
					_killerName = name _killer;
					LOG("[CGQC_Killed]: Killed by a player!");
					// Teamkill baybay
					if (name _killed isEqualTo _killername) then {
						LOG("[CGQC_Killed]: SelfKill? Damn.");
						_killText = "You... killed yourself?";
					} else {
						LOG("[CGQC_Killed]: TEAMKILL!!!");
						_killText = format["You got TeamKilled by %1 from %2m with a %3", _killerName, floor _distance, _weapon];
						cgqc_stats_teamCasualties = cgqc_stats_teamCasualties + 1;
						cgqc_stats_teamKillers pushBackUnique (name _killer);
						publicVariable "cgqc_stats_teamCasualties";
						publicVariable "cgqc_stats_teamKillers";
						_txt = " ... killed a teammate!";
						LOG_2("[CGQC_Killed]: Casualties - %1 killed a teammate", name _killer);
						//[_killer, _txt] remoteExec ["globalChat",0];
					};
				} else {
					LOG("[CGQC_Killed]: Killed by an AI!");
					_killerName = format ["%1(%2)", name _killer, getText(configFile>>"CfgVehicles">>typeOf (vehicle _killer) >>"DisplayName")];
					_killText = format["You got killed by %1 from %2 m with a %3", _killerName, floor _distance, _weapon];
				};
				[_killText] remoteExec ["hint", _victimId];
			};
		};
	}];
}, true, [], true] call CBA_fnc_addClassEventHandler;

// Gamephase start
if (cgqc_flag_isTraining) then {
	LOG("[CGQC_PostInitServer] - Starting training phase");
	["training"] call CGQC_fnc_gamestate;
} else {
	if (cgqc_player_hasAnti) then {
		LOG("[CGQC_PostInitServer] - Starting mission phase");
		["mission"] call CGQC_fnc_gamestate;
	} else {
		LOG("[CGQC_PostInitServer] - Starting staging phase");
		["staging"] call CGQC_fnc_gamestate;
	};
};

cgqc_start_postInitServer_done = true;

LOG("[CGQC_PostInitServer] === postInitServer started =====================================");