// --- addSpares ----------------------------------------------------------
// Add spare stuff in AceCargo of vehicles

_vic = _this select 0;
_type = _this select 1;

waitUntil {!isNil "cgqc_start_postInitClient_done"};
waitUntil {sleep 1; cgqc_start_postInitClient_done};

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