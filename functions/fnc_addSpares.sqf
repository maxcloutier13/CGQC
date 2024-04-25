#include "\CGQC\script_component.hpp"
// --- addSpares ----------------------------------------------------------
// Add spare stuff in AceCargo of vehicles
params ["_vic", "_type"];
LOG_2(" addSpares %1/%2 called", _vic, _type);

if !(local _vic) exitWith {};

[_vic, _type] spawn {
	params ["_vic", "_type"];
	waitUntil {!isNil "cgqc_start_postInitClient_done"};
	waitUntil {sleep 1; cgqc_start_postInitClient_done};
	LOG_2(" addSpares %1/%2 started", _vic, _type);

	if (cgqc_config_spares) then
	{
		if (!isNil "_vic") then {
			if (toLower (typeOf _vic) find "cgqc" == 0) then {
				// Add CGQC fuelcan + ammo + supplies
				["cgqc_box_mk1_fuelcan", _vic, true] call ace_cargo_fnc_loadItem;
				["cgqc_box_mk1_ammocan", _vic, true] call ace_cargo_fnc_loadItem;
				["cgqc_box_mk1_supplies", _vic, true] call ace_cargo_fnc_loadItem;
			} else{
				// Add vanilla spare fuelcan + ammo
				["cgqc_box_vanilla_fuelcan", _vic, true] call ace_cargo_fnc_loadItem;
				["cgqc_box_vanilla_ammocan", _vic, true] call ace_cargo_fnc_loadItem;
			};
			switch (_type)
			do
			{
				case "car":
				{
					["ACE_Wheel", _vic, true] call ace_cargo_fnc_loadItem;
					["ACE_Wheel", _vic, true] call ace_cargo_fnc_loadItem;
					["ACE_Wheel", _vic, true] call ace_cargo_fnc_loadItem;
				};
				case "tank":
				{
					["ACE_Track", _vic, true] call ace_cargo_fnc_loadItem;
					["ACE_Track", _vic, true] call ace_cargo_fnc_loadItem;
				};
				default
				{
					_air = 1;
				};
			};
		};
	};
	LOG(" addSpares done");
};