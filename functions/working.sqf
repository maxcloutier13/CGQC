
this addEventHandler ["HitPart", {
    params ["_event"];

    _shooter = _event select 1;
    _pos = _event select 3;

    _mkr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    _rgb = [0,0,0,1];
    _lastDigit = (count tgt_ary_1) % 10;
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

    tgt_ary_1 = tgt_ary_1+[_mkr];
    tgt_hi_1 = _this select 0 select 3;
    _spr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
    [_spr, [0, _texture]] remoteExec ["setObjectTexture", 0];
    _spr setPosASL tgt_hi_1;
    [_spr] spawn {
        params ["_spr"];
        sleep 2;
        deleteVehicle _spr;
    };
    if (local _shooter) then {
        [_this select 0, tgt_ary_1] spawn CGQC_fnc_onHitRange;
    };
}];