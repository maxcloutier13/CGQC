// --- bluforceTracker ----------------------------------------------------------
// Handle bluforce tracker sheeits
params ["_type", ["_showMsg", false], ["_player", player]];
diag_log format ["[CGQC_FNC] bluforceTracker %1 started", _type];

CGQC_int_bft_findInfo = {
	_color = player getVariable "CGQC_player_teamColor";
    _cgqc_player_bft_color = "ColorWhite";
    _role = cgqc_player_roleType;
	_cgqc_player_bft_name = groupId group player;
    _cgqc_player_bft_markerType = "b_inf";
	_info = [];
	switch (_color) do {
		case "RED": {_cgqc_player_bft_name = _cgqc_player_bft_name + "-1"; _cgqc_player_bft_color = "ColorEAST";};
		case "GREEN": {_cgqc_player_bft_name = _cgqc_player_bft_name + "-1";_cgqc_player_bft_color = "ColorEAST";};
		case "BLUE": {_cgqc_player_bft_name = _cgqc_player_bft_name + "-2";_cgqc_player_bft_color = "ColorWEST";};
		case "YELLOW": { _cgqc_player_bft_name = _cgqc_player_bft_name + "-2";_cgqc_player_bft_color = "ColorWEST";};
	};
    switch (_role) do {
        case "HQ": {_cgqc_player_bft_name = _cgqc_player_bft_name + "-HQ";_cgqc_player_bft_markerType = "b_hq";};
        case "Recon": {_cgqc_player_bft_markerType = "b_recon";};
        case "Medic": {_cgqc_player_bft_name = _cgqc_player_bft_name + "-Medic";_cgqc_player_bft_markerType = "b_med";};
        case "Armor": {_cgqc_player_bft_markerType = "b_armor";};
        case "Air": {_cgqc_player_bft_markerType = "c_air";};
    };
	_info = [_cgqc_player_bft_color, _cgqc_player_bft_name, _cgqc_player_bft_markerType];
	_info;
};

switch (_type) do {
    case "transmit": {
        if ('azm_bft_tx' in items _player) then {
            _code = 440;
            AZMBFT_isTransmitting = true;
            if (_showMsg) then {
                [["Blufor Tracking", 1.5, [0.161,0.502,0.725,1]], ["TX started"],[format["Code: %1",_code]]] call CBA_fnc_notify;
            };
            while {AZMBFT_isTransmitting} do {
                _find = [] call CGQC_int_bft_findInfo;
                _color = _find select 0;
                _text = _find select 1;
                _markerType = _find select 2;
                private _temp = [
                    player,
                    getPos player,
                    group player,
                    _text,
                    _code,
                    [_markerType,_color]
                ];
                AZMBFT_storage set [getPlayerUID player, _temp];
                publicVariable "AZMBFT_storage";
                sleep AZMBFT_updateInterval;
            };
        };
    };
    case "receive": {
        if ('azm_bft_rx' in items _player) then {
            AZMBFT_isReceiving = true;
            AZMBFT_receivingCode = 440;
            [["Blufor Tracking", 1.5, [0.161, 0.502, 0.725, 1]], ["RX started on 440"]] call CBA_fnc_notify;
            while { AZMBFT_isReceiving } do {
                {
                    diag_log "BFT - Starting the run";
                    private _markerName = format ["AZMBFT_marker_%1", _x];
                    if (!(_y isEqualType [])) then {
                        diag_log "BFT - Deleting marker";
                        deleteMarkerLocal _markerName;
                                        // ["DElete marker", _markerName] call CBA_fnc_debug;
                        AZMBFT_localMarkerList deleteAt _x;
                    } else {
                        diag_log "BFT - Updating marker";
                        _y params ["_player", "_pos", "_group", "_text", "_code", "_markerData"];
                        if (AZMBFT_receivingCode isEqualTo _code) then {
                            diag_log "BFT - Receive check passed";
                            if ((getMarkercolor _markerName) isEqualTo "") then {
                                diag_log "BFT - Something changed: Reloading marker";
                                // ["create marker", _markerName] call CBA_fnc_debug;
                                private _marker = createMarkerLocal [_markerName, _pos];
                                _marker setMarkerColorLocal _markerData#1;
                                _marker setMarkerTypeLocal _markerData#0;
                                _marker setMarkerTextLocal _text;
                                AZMBFT_localMarkerList set [_x, _marker];
                            };
                            diag_log "BFT - Moving marker";
                            _markerName setMarkerPosLocal _pos;
                        };
                    };
                } forEach AZMBFT_storage;
                diag_log "BFT - Done. Sleeping";
                sleep AZMBFT_updateInterval;
                if (cgqc_bft_forceUpdate) then {
                    {deleteMarkerLocal _y;} forEach AZMBFT_localMarkerList;
                    cgqc_bft_forceUpdate = false;
                };

            };
        };
    };
};

diag_log "[CGQC_FNC] bluforceTracker done";