



player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (local _unit) then {
	    _unit setVariable["Saved_second", _unit getVariable "WBK_SecondWeapon" select 1];
	};
}];


player addMPEventHandler ["MPRespawn", {
 params ["_unit", "_corpse"];
    if (local _unit) then {
        [] spawn {
            _second = player getVariable["Saved_second",[]];
            if (count _second > 0) then {
                player spawn WBK_CreateWeaponSecond;
                sleep 1;
                player addWeapon (_second select 0);
                _second deleteAt 0;
                {
                    if (typeName _x isEqualTo ARRAY) then {
                        player addPrimaryWeaponItem _x select 0;
                    }else{
                        player addPrimaryWeaponItem _x;
                    };
                } forEach _second;
                 sleep 1;
                player spawn WBK_CreateSwitchBetweenWeapons;
            };
        };
    };
}];


sleep 2;
_unit = player;

[_unit] spawn {
params ["_unit"];
_second = player getVariable["Saved_second",[]];
   if (count _second > 0) then {
   _unit spawn WBK_CreateWeaponSecond;
	sleep 1;
	_unit addWeapon (_second select 0);
   _second deleteAt 0;
   {
	if (typeName _x isEqualTo "ARRAY") then {
	 _unit addPrimaryWeaponItem (_x select 0);
	}else{
	 _unit addPrimaryWeaponItem _x;
	};
   } forEach _second;
   sleep 1;
   _unit spawn WBK_CreateSwitchBetweenWeapons;
  };
};











player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_uav = getConnectedUAV player;
	if (_uav isNotEqualTo objNull) then {
		_type = typeOf _uav;
		deleteVehicle _uav;
		cgqc_player_uav = _type;
	};
}];


player addMPEventHandler ["MPRespawn", {
 params ["_unit", "_corpse"];
    if !(isNil "cgqc_player_uav") then {
        _uav = "";
        switch (cgqc_player_uav) do {
            case "sps_black_hornet_01_F": {_uav = "sps_black_hornet_01_Static_F";};
            case "Rev_darter_b": {_uav = "Rev_darter_item";};
            case "Rev_pelican_b": {_uav = "Rev_pelican_item";};
            case "Rev_demine_b": {_uav = "Rev_demine_item";};
        };
        if (_uav isNotEqualTo "") then {
            player addItemToBackpack _uav;
        };
	};
}];






player addEventHandler ["VisionModeChanged", {
	params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
	if !(alive player) exitWith {};
	if (_vehicle isEqualTo (getConnectedUAV player)) then {
		cgqc_player_uav = _vehicle;
	};
}];

player addMPEventHandler ["MPRespawn", {
    params ["_unit", "_corpse"];
    [] spawn {
        sleep 2;
        _uav = cgqc_player_uav;
        if (_uav isNotEqualTo objNull) then {
            deleteVehicleCrew _uav;
            createVehicleCrew _uav;
            _unit connectTerminalToUAV _uav;
        };
    };
}];