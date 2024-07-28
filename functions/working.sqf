tsp_fnc_breach_lock = {  //-- Lock random doors in radius
 params [["_pos", [0,0,0]], ["_radius", 999999], ["_houseChance", tsp_cba_breach_lock_house], ["_doorChance", tsp_cba_breach_lock_door], ["_lock", 1]];
 {  //-- For all buildings in radius  || (_x in tsp_cba_breach_lock_blacklist)
  if (random 1 >= _houseChance || _x getVariable ["breach_blacklist", false] || ((typeOf _x) in tsp_cba_breach_lock_blacklist)) then {continue};  //--  Skip
  for "_i" from 0 to (count (configfile >> "CfgVehicles" >> typeOf _x >> "UserActions")) do {if (random 1 <= _doorChance) then {_x setVariable [format ["bis_disabled_Door_%1", _i], _lock, true]}};
 } forEach (nearestTerrainObjects [_pos, ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "VIEW-TOWER", "LIGHTHOUSE", "FUELSTATION", "HOSPITAL", "TOURISM"], _radius]);
};



[getPos player, 100, 100, 50, 1] call tsp_fnc_breach_lock;






this addEventHandler ["HitPart", {
    params ["_event"];

    _shooter = _event select 1;
    _pos = _event select 3;

    _mkr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    _rgb = [0,0,0,1];
    _lastDigit = (count tgt_ary_2) % 10;
    _caseIndex = (_lastDigit % 5) + 1;
    switch (_caseIndex) do {
        case 1: {_rgb = [255,0,0,1]};
        case 2: {_rgb = [255,255,0,1]};
        case 3: {_rgb = [0,255,0,1]};
        case 4: {_rgb = [0,0,255,1]};
        case 5: {_rgb = [255,255,255,1]};
    };

    _texture = _rgb call BIS_fnc_colorRGBAtoTexture;
    [_mkr, [0, _texture]] remoteExec ["setObjectTexture", 0];
    _mkr setObjectScale 0.2;
    _mkr setPosASL _pos;

    tgt_ary_2 = tgt_ary_2+[_mkr];
    tgt_hi_2 = _this select 0 select 3;
    _spr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    [_spr, [0, _texture]] remoteExec ["setObjectTexture", 0];
    _spr setPosASL tgt_hi_2;
    _spr setObjectScale 0.2;
    [_spr] spawn {
        params ["_spr"];
        sleep 2;
        deleteVehicle _spr;
    };
    if (local _shooter) then {
        [_this select 0, tgt_ary_2] spawn CGQC_fnc_onHitRange;
    };
}];

this addEventHandler ["HitPart", {
    tgt_hi_1 = _this select 0 select 3;
    _shooter = _event select 1;
    [] spawn {
        _spr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
        _spr setPosASL tgt_hi_1;
        _spr setObjectScale 0.5;
        sleep 3;
        deleteVehicle _spr;
    };
    if (local _shooter) then {
        [_this select 0] spawn CGQC_fnc_onHitRange;
    };
}];