cgqc_sniping_group_hitMarkers = [];
cgqc_sniping_group_hitPos = [];

cgqc_int_group_clear = {
    {
        deleteVehicle (_x select 0);
    } forEach cgqc_sniping_group_hitMarkers;
    cgqc_sniping_group_hitMarkers = [];
    cgqc_sniping_group_hitPos = [];
};

cgqc_player_fired = player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    cgqc_player_hit = _projectile addEventHandler ["HitPart", {
        params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType", "_instigator"];
        _mkr = [];
        //_mkr = "Land_PencilRed_F" createVehicle [0,0,0];
        //_mkr setDir (getDir player + 180);
        //_mkr enableSimulationGlobal false;
        //_mkr setPosASL (_pos);
        cgqc_sniping_group_hitPos pushBack [_pos];
        //cgqc_sniping_group_pencils pushBack [_mkr];

        _mkr = "Sign_Sphere10cm_F" createVehicle [0,0,0];
        cgqc_sniping_group_hitMarkers pushBack [_mkr];
        _rgb = [0,0,0,1];
        _lastDigit = (count cgqc_sniping_group_hitMarkers) % 10;
        _caseIndex = (_lastDigit % 5) + 1; // Map the last digit to a case index from 1 to 5
        switch (_caseIndex) do {
            case 1: {_rgb = [255,0,0,1]}; //Red
            case 2: {_rgb = [255,255,0,1]}; //Yellow
            case 3: {_rgb = [0,255,0,1]}; //Green
            case 4: {_rgb = [0,0,255,1]}; //Blue
            case 5: {_rgb = [255,255,255,1]}; //White
        };

        _texture = _rgb call BIS_fnc_colorRGBAtoTexture;
        _mkr setObjectTexture [0,_texture];
        _mkr setObjectScale 0.2;
        _mkr setPosASL _pos;

        _groupSize = [cgqc_sniping_group_hitPos] call CGQC_fnc_groupSize;
        _groupSizeCm = round ((_groupSize * 100) * 10) / 10;
        _dist = _instigator distance _hitEntity;
        _moa = [_dist, _groupSize, _hitEntity] call CGQC_fnc_groupMoa;
        _textShotNbr = format ["Shot %1", count cgqc_sniping_group_hitPos];
        _textGroupSize = format ["Group Size: %1cm/%2moa", _groupSizeCm, _moa];
        [
            [_textShotNbr, 1],
            [_textGroupSize, 1],
            true
        ] call CBA_fnc_notify;
        _projectile removeEventHandler ["HitPart", cgqc_player_hit];
        //[_this select 0, _groupSize, _moa] spawn CGQC_fnc_onHitRange;
    }];
}];