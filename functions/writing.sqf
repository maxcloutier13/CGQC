this addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
  tgt_hi_5 = _this select 0 select 3;

  [] spawn {
    _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
    _spr setPosASL tgt_hi_2;
    sleep 2;
    deleteVehicle _spr;
  };
  _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
  _distance = vectorMagnitude _vectorToTarget;
  _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
  _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
  [[_title, 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1.2], [_textVel, 1.2], true] remoteExec ["CBA_fnc_notify", owner _shooter]
}];

this addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
  if (_damage > 0) then {
    _damage = round (_damage * 100) / 100
    _txt = format ["%1dmg to %2/ ", _damage, _selection];
    cgqc_damage_text pushBack _txt;
  };
}];



["ace_medical_woundReceived", {
    params ["_unit", "_allDamages", "_shooter", "_ammo"];
    cgqc_damage_text pushBack _unit;
    cgqc_damage_text pushBack _shooter;
    cgqc_damage_text pushBack _ammo;
    {
        _txt = format["Dmg:%1 to %2 - Total:%3<br/>", _x select 0, _x select 1, _x select 2];
        cgqc_damage_text pushBack _x;
    } forEach _allDamages;
}] call CBA_fnc_addEventHandler;

this addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
  tgt_hi_5 = _this select 0 select 3;

  [_shooter, _position, _velocity] spawn {
    params ["_shooter", "_position", "_velocity"];
    _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
    _spr setPosASL tgt_hi_5;
    sleep 0.5;
    _txt = "";
    {
        _txt = _txt + _x;
    } forEach cgqc_damage_text;
    cgqc_damage_text = [];
    _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
    _distance = vectorMagnitude _vectorToTarget;
    _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
    _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
    [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
    sleep 2;
    deleteVehicle _spr;
  };
}];

// handleDamage output
  ["damage_target_1/head/0/B Range:1 (Maj. Cloutier)/B_9x21_Ball/2/B Range:1 (Maj. Cloutier)/hithead/true/3"],
  ["damage_target_1//0/B Range:1 (Maj. Cloutier)/B_9x21_Ball/-1/B Range:1 (Maj. Cloutier)//true/0"],
  ["damage_target_1/spine2/0.1671/B Range:1 (Maj. Cloutier)/B_9x21_Ball/5/B Range:1 (Maj. Cloutier)/hitdiaphragm/true/1"],
  ["damage_target_1/body/0.000100876/B Range:1 (Maj. Cloutier)/B_9x21_Ball/11/B Range:1 (Maj. Cloutier)/incapacitated/true/1"],
  ["damage_target_1/head/2.50649/B Range:1 (Maj. Cloutier)/B_9x21_Ball/16/B Range:1 (Maj. Cloutier)/ace_hdbracket/true/2"]





["ace_medical_woundReceived", {
    params ["_unit", "_allDamages", "_shooter", "_ammo"];
    {
        _dmg = _x select 0;
        if (_dmg > 0.06) then {
            _dmg = _dmg * 10;
            _dmg = round _dmg;
            _tgt = _x select 1;
            _txt = format["Dmg:%1 to %2<br/>", _dmg, _tgt];
            cgqc_damage_text pushBack _txt;
        };
    } forEach _allDamages;
}] call CBA_fnc_addEventHandler;

this addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
  tgt_hi_5 = _this select 0 select 3;

  [_shooter, _position, _velocity] spawn {
    params ["_shooter", "_position", "_velocity"];
    _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
    _spr setPosASL tgt_hi_5;
    sleep 0.5;
    _txt = "";
    {
        _txt = _txt + _x;
    } forEach cgqc_damage_text;
    cgqc_damage_text = [];
    _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
    _distance = vectorMagnitude _vectorToTarget;
    _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
    _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
    [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
    sleep 2;
    deleteVehicle _spr;
  };
}];



////////////////////////////

cgqc_damage_text = [];

["ace_medical_woundReceived", {
    params ["_unit", "_allDamages", "_shooter", "_ammo"];
    {
        _dmg = _x select 0;
        if (_dmg > 0.06) then {
            _dmg = _dmg * 10;
            _dmg = round _dmg;
            _tgt = _x select 1;
            _txt = format["Dmg:%1 to %2<br/>", _dmg, _tgt];
            cgqc_damage_text pushBack _txt;
        };
    } forEach _allDamages;
}] call CBA_fnc_addEventHandler;

this addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    hint "Target dead";
    _stuff = getUnitLoadout _unit;
    _class = typeOf _unit;
    _pos = getPos _unit;
    _dir = getDir _unit;
    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "PATH";
    _newUnit disableAI "AUTOCOMBAT";
    _group setBehaviour "SAFE";
    deleteVehicle _unit;
    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity] spawn {
            params ["_target", "_shooter", "_position", "_velocity"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txt = "";
            {
                _txt = _txt + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];
    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        hint "Target dead";
        _stuff = getUnitLoadout _unit;
        _class = typeOf _unit;
        _pos = getPos _unit;
        _dir = getDir _unit;
        _group = createGroup east;
        _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
        _newUnit setDir _dir;
        removeAllItems _newUnit;
        removeAllAssignedItems _newUnit;
        removeAllWeapons _newUnit;
        removeAllContainers _newUnit;
        removeGoggles _newUnit;
        removeHeadgear _newUnit;
        _newUnit setUnitLoadout _stuff;
        _newUnit disableAI "PATH";
        _newUnit disableAI "AUTOCOMBAT";
        _group setBehaviour "SAFE";
        deleteVehicle _unit;
    }];
}];

this addEventHandler ["HitPart", {
  (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
  tgt_hi_5 = _this select 0 select 3;

  [_target, _shooter, _position, _velocity] spawn {
    params ["_target", "_shooter", "_position", "_velocity"];
    _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
    _spr setPosASL tgt_hi_5;
    sleep 0.5;
    _target call ACE_medical_treatment_fnc_fullHealLocal;
    _txt = "";
    {
        _txt = _txt + _x;
    } forEach cgqc_damage_text;
    cgqc_damage_text = [];
    _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
    _distance = vectorMagnitude _vectorToTarget;
    _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
    _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
    [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
    sleep 2;
    deleteVehicle _spr;
  };
}];



//////////////////////////

cgqc_damage_spawn_unit = {
    params ["_pos", "_dir"];

    _stuff = getUnitLoadout damage_dummy;
    _class = typeOf damage_dummy;

    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    _newUnit setVehicleVarName format ["damage_%1", random 1000];
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "PATH";
    _newUnit disableAI "AUTOCOMBAT";
    _group setBehaviour "SAFE";

    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity] spawn {
            params ["_target", "_shooter", "_position", "_velocity"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txt = "";
            {
                _txt = _txt + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];

    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        cgqc_damage_text pushBack "Fatal Damage<br/>";
        [getPos _unit, getDir _unit] call cgqc_damage_spawn_unit;
        deleteVehicle _unit;
    }];
};

///////////////////////////////////////
// In laptop
_action = [ "menu_create", "Create Targets", "", {
    {
        [getPos _x, getDir _x] call cgqc_damage_spawn_unit;
    } forEach cgqc_damage_positions;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_delete", "Delete Targets", "", {
    {
        deleteVehicle _x;
    } forEach cgqc_damage_units;
    cgqc_damage_units = [];
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;



// Init of dummy
cgqc_damage_text = [];
cgqc_damage_units = [];
cgqc_damage_positions = [damage_pos_1, damage_pos_2, damage_pos_3, damage_pos_4, damage_pos_5];

cgqc_damage_spawn_unit = {
    params ["_pos", "_dir"];

    _stuff = getUnitLoadout damage_dummy;
    _class = typeOf damage_dummy;

    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    _newUnit setVehicleVarName format ["damage_%1", random 1000];
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "PATH";
    _newUnit disableAI "AUTOCOMBAT";
    _group setBehaviour "SAFE";
    cgqc_damage_units pushBack _newUnit;
    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity] spawn {
            params ["_target", "_shooter", "_position", "_velocity"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txt = "";
            {
                _txt = _txt + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];

    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        cgqc_damage_text pushBack "Fatal Damage<br/>";
        [getPos _unit, getDir _unit] call cgqc_damage_spawn_unit;
        deleteVehicle _unit;
    }];
};

["ace_medical_woundReceived", {
        params ["_unit", "_allDamages", "_shooter", "_ammo"];
        if ("damage" in (vehicleVarName _unit)) then {
            {
                _dmg = _x select 0;
                if (_dmg > 0.06) then {
                    _dmg = _dmg * 10;
                    _dmg = round _dmg;
                    _tgt = _x select 1;
                    _txt = format["Dmg:%1 to %2<br/>", _dmg, _tgt];
                    cgqc_damage_text pushBack _txt;
                };
            } forEach _allDamages;
        };
    }] call CBA_fnc_addEventHandler;


/////


cgqc_damage_text = [];
cgqc_damage_units = [];
cgqc_damage_positions = [damage_pos_1, damage_pos_2, damage_pos_3, damage_pos_4, damage_pos_5];

cgqc_damage_spawn_unit = {
    params ["_pos", "_dir"];

    _stuff = getUnitLoadout damage_dummy;
    _class = "rhs_vdv_rifleman";

    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    _newUnit setVehicleVarName format ["damage_%1", random 1000];
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "AIMINGERROR";
    _newUnit disableAI "AUTOCOMBAT";
    _newUnit disableAI "AUTOTARGET";
    _newUnit disableAI "FSM";
    _newUnit disableAI "MOVE";
    _newUnit disableAI "PATH";
    _newUnit disableAI "SUPPRESSION";
    _newUnit disableAI "TARGET";
    _newUnit setunitpos "UP";
    _group setBehaviour "SAFE";
    cgqc_damage_units pushBack _newUnit;
    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity] spawn {
            params ["_target", "_shooter", "_position", "_velocity"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txt = "";
            {
                _txt = _txt + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt], true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];

    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        cgqc_damage_text pushBack "Fatal Damage<br/>";
        [getPos _unit, getDir _unit] call cgqc_damage_spawn_unit;
        deleteVehicle _unit;
    }];
};

["ace_medical_woundReceived", {
        params ["_unit", "_allDamages", "_shooter", "_ammo"];
        if ("damage" in (vehicleVarName _unit)) then {
            {
                _dmg = _x select 0;
                if (_dmg > 0.06) then {
                    _dmg = _dmg * 10;
                    _dmg = round _dmg;
                    _tgt = _x select 1;
                    _txt = format["Dmg:%1 to %2<br/>", _dmg, _tgt];
                    cgqc_damage_text pushBack _txt;
                };
            } forEach _allDamages;
        };
    }] call CBA_fnc_addEventHandler;

_action = [ "menu_create", "Create Targets", "", {
    {
        [getPos _x, getDir _x] call cgqc_damage_spawn_unit;
    } forEach cgqc_damage_positions;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_delete", "Delete Targets", "", {
    {
        deleteVehicle _x;
    } forEach cgqc_damage_units;
    cgqc_damage_units = [];
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;


/////////////////////////


if !(cgqc_penetration_trigger) then {
   _eventHandle = player addEventHandler ["fired", {
        [] spawn {
            sleep 0.5;
            _breached = count cgqc_penetration_breached - 1;
            _title = format ["%1 walls breached<br/>", _breached];
            _txt = "";
            {
                _textVel = format["%1 m/s", _x select 1];
                _tgt = _x select 0;
                _no = toLower (_tgt select[5, 6]);
                _txt = _txt + format["%1 - %2<br/>", _no, _textVel];
            } forEach cgqc_penetration_breached;
            _currentGun = currentWeapon player;
            _currentMag =  currentMagazine player;
            _currentAmmo = getText(configFile >> "CfgMagazines" >> _currentMag >> "ammo");
            _gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
            _txtInfo = format ["%1/%2/%3", _gunName, _currentMag, _currentAmmo];

            [[_title, 1.5, [0.161,0.502,0.725,1]], [_txt, 1], [_txtInfo, 1], true] call CBA_fnc_notify;
            cgqc_penetration_breached = [];
        };
    }];
    player setVariable ["cgqc_penetration_event", _eventHandle];
    cgqc_penetration_trigger = true;
};


/////////////////

<br/>
_currentGun = currentWeapon player;
_currentMag =  currentMagazine player;
_gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
_txtInfo = format ["%1/%2", _gunName, _currentMag];





/////////////////////



cgqc_damage_text = [];
cgqc_damage_units = [];
cgqc_damage_positions = [damage_pos_1, damage_pos_2, damage_pos_3, damage_pos_4, damage_pos_5];

cgqc_damage_spawn_unit = {
    params ["_pos", "_dir"];

    _stuff = getUnitLoadout damage_dummy;
    _class = "rhs_vdv_rifleman";

    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    _newUnit setVehicleVarName format ["damage_%1", random 1000];
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "AIMINGERROR";
    _newUnit disableAI "AUTOCOMBAT";
    _newUnit disableAI "AUTOTARGET";
    _newUnit disableAI "FSM";
    _newUnit disableAI "MOVE";
    _newUnit disableAI "PATH";
    _newUnit disableAI "SUPPRESSION";
    _newUnit disableAI "TARGET";
    _newUnit setunitpos "UP";
    _group setBehaviour "SAFE";
    cgqc_damage_units pushBack _newUnit;
    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity, _ammo] spawn {
            params ["_target", "_shooter", "_position", "_velocity", "_ammo"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txt = "";
            {
                _txt = _txt + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _currentGun = currentWeapon player;
            _currentMag =  currentMagazine player;
            _gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
            _txtInfo = format ["<br/>%1/%2", _gunName, _currentMag];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Distance: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Velocité: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]], [_textDist, 1], [_textVel, 1], [_txt, 1], [_txtInfo, 1], true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];

    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        cgqc_damage_text pushBack "Fatal Damage<br/>";
        if (local _unit) then {
            [getPos _unit, getDir _unit] call cgqc_damage_spawn_unit;
            deleteVehicle _unit;
        };
    }];
};

["ace_medical_woundReceived", {
        params ["_unit", "_allDamages", "_shooter", "_ammo"];
        if ("damage" in (vehicleVarName _unit)) then {
            {
                _dmg = _x select 0;
                if (_dmg > 0.06) then {
                    _dmg = _dmg * 10;
                    _dmg = round _dmg;
                    _tgt = _x select 1;
                    _txt = format["Dmg:%1 to %2<br/>", _dmg, _tgt];
                    cgqc_damage_text pushBack _txt;
                };
            } forEach _allDamages;
        };
    }] call CBA_fnc_addEventHandler;

_action = [ "menu_create", "Create Targets", "", {
    {
        [getPos _x, getDir _x] call cgqc_damage_spawn_unit;
    } forEach cgqc_damage_positions;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_delete", "Delete Targets", "", {
    {
        deleteVehicle _x;
    } forEach cgqc_damage_units;
    cgqc_damage_units = [];
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;


/////////////////////

cgqc_damage_units = [];
cgqc_damage_positions = [damage_pos_1, damage_pos_2, damage_pos_3, damage_pos_4, damage_pos_5];

cgqc_damage_spawn_unit = {
    params ["_pos", "_dir"];

    _stuff = getUnitLoadout damage_dummy;
    _class = "rhs_vdv_rifleman";

    _group = createGroup east;
    _newUnit = _group createUnit [_class, _pos, [], 0, "CAN_COLLIDE"];
    _newUnit setDir _dir;
    _newUnit setVehicleVarName format ["damage_%1", random 10000];
    removeAllItems _newUnit;
    removeAllAssignedItems _newUnit;
    removeAllWeapons _newUnit;
    removeAllContainers _newUnit;
    removeGoggles _newUnit;
    removeHeadgear _newUnit;
    _newUnit setUnitLoadout _stuff;
    _newUnit disableAI "AIMINGERROR";
    _newUnit disableAI "AUTOCOMBAT";
    _newUnit disableAI "AUTOTARGET";
    _newUnit disableAI "FSM";
    _newUnit disableAI "MOVE";
    _newUnit disableAI "PATH";
    _newUnit disableAI "SUPPRESSION";
    _newUnit disableAI "TARGET";
    _newUnit setunitpos "UP";
    _group setBehaviour "SAFE";
    cgqc_damage_units pushBack _newUnit;
    _newUnit addEventHandler ["HitPart", {
        (_this select 0) params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect", "_instigator"];
        tgt_hi_5 = _this select 0 select 3;

        [_target, _shooter, _position, _velocity, _ammo] spawn {
            params ["_target", "_shooter", "_position", "_velocity", "_ammo"];
            _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
            _spr setPosASL tgt_hi_5;
            sleep 0.5;
            _target call ACE_medical_treatment_fnc_fullHealLocal;
            _txtDamage = "";
            {
                _txtDamage = _txtDamage + _x;
            } forEach cgqc_damage_text;
            cgqc_damage_text = [];
            _currentGun = currentWeapon player;
            _currentMag =  currentMagazine player;
            _gunName = (getText (configFile >> 'CfgWeapons' >> _currentGun >> 'displayName'));
            _txtInfo = format ["<br/>%1/%2", _gunName, _currentMag];
            _vectorToTarget = (getPosASL _shooter) vectorDiff _position;
            _distance = vectorMagnitude _vectorToTarget;
            _textDist = format["Dist: %1m", floor (round(_distance * 10) / 10)];
            _textVel = format["Vel: %1m/s", floor (round(_velocity call BIS_fnc_magnitude))];
            _weight = getNumber(configFile >> "CfgAmmo" >> _ammo select 4 >> "ACE_bulletMass");
            _weightKg = _weight / 1000;
            _vel = _velocity call BIS_fnc_magnitude;
            _velSquare = _vel * _vel;
            _energy = floor (round(0.5 * _velSquare * _weightKg));
            _textEnergy = format["Engergy: %1joules", _energy];
            if (_vel <= 343) then {
                _textVel = format["%1 - Subsonic", _textVel];
            };
            [["Target hit", 1.5, [0.161, 0.502, 0.725, 1]],
                [_textDist, 1],
                [_textVel, 1],
                [_textEnergy, 1],
                [_txtDamage, 1],
                [_txtInfo, 1],
            true] remoteExec ["CBA_fnc_notify", owner _shooter];
            sleep 2;
            deleteVehicle _spr;
        };
    }];

    _newUnit addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer", "_instigator", "_useEffects"];
        cgqc_damage_text pushBack "Fatal Damage<br/>";
        if (local _unit) then {
            [getPos _unit, getDir _unit] call cgqc_damage_spawn_unit;
            deleteVehicle _unit;
        };
    }];
};

_action = [ "menu_create", "Create Targets", "", {
    {
        [getPos _x, getDir _x] call cgqc_damage_spawn_unit;
    } forEach cgqc_damage_positions;
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_delete", "Delete Targets", "", {
    {
        deleteVehicle _x;
    } forEach cgqc_damage_units;
    cgqc_damage_units = [];
}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ laptop_lane_5, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
