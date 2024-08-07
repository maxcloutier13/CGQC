#include "\CGQC\script_component.hpp"
// --- bluforceTracker ----------------------------------------------------------
// Handle bluforce tracker sheeits
params ["_type", ["_showMsg", false], ["_target", player]];
LOG_1("[bluforceTracker] %1 started", _type);

CGQC_int_bft_findInfo = {
	_color = player getVariable ["CGQC_player_teamColor", "MAIN"];
    _cgqc_player_bft_color = "ColorWhite";
    _role = player getVariable ["cgqc_player_roleType", "b_inf"];
	_cgqc_player_bft_name = groupId group player;
    _cgqc_player_bft_markerType = "b_inf";
	_info = [];
	switch (_color) do {
		case "RED": {_cgqc_player_bft_name = _cgqc_player_bft_name + ".1"; _cgqc_player_bft_color = "ColorEAST";};
		case "GREEN": {_cgqc_player_bft_name = _cgqc_player_bft_name + ".1";_cgqc_player_bft_color = "ColorGUER";};
		case "BLUE": {_cgqc_player_bft_name = _cgqc_player_bft_name + ".2";_cgqc_player_bft_color = "ColorWEST";};
		case "YELLOW": { _cgqc_player_bft_name = _cgqc_player_bft_name + ".2";_cgqc_player_bft_color = "ColorUNKNOWN";};
        case "MAIN": { _cgqc_player_bft_name = _cgqc_player_bft_name + ".0";};
        //_cgqc_player_bft_color = "ColorGrey";
	};
    switch (_role) do {
        case "HQ": {_cgqc_player_bft_markerType = "b_hq";};
        case "Recon": {_cgqc_player_bft_markerType = "b_recon";};
        case "Medic": {_cgqc_player_bft_name = ".M";_cgqc_player_bft_markerType = "b_med";};
        case "Armor": {_cgqc_player_bft_markerType = "b_armor";};
        case "Air": {_cgqc_player_bft_markerType = "c_air";};
    };
    if (cgqc_flag_isTraining) then {
        _cgqc_player_bft_name = name player;
    };
	_info = [_cgqc_player_bft_color, _cgqc_player_bft_name, _cgqc_player_bft_markerType];
	_info;
};

switch (_type) do {
    case "transmit_vic":{
        _target getVariable ["show_marker", true];
        while {alive _target && _target getVariable ["show_marker", false]} do {
            _text = _target getVariable "CGQC_name_vic";
            _id = _target getVariable "cgqc_name_vic_id";
            _markerColor = "ColorWHITE";
            switch (true) do {
               // case ("0" in _text): {_markerColor = "ColorGrey";};
                case ("1" in _text): {_markerColor = "ColorEAST";};
                case ("2" in _text): {_markerColor = "ColorWEST";};
                case ("3" in _text): {_markerColor = "ColorYELLOW";};
            };
            _markerType = "b_mech_inf";
            //_markerType = "iconCar";
            //_markerType = "loc_car";
            _code = 440;
            private _temp = [
                _target,
                getPos _target,
                group _target,
                _text,
                _code,
                [_markerType,_markerColor]
            ];
            AZMBFT_storage set [_id, _temp];
            publicVariable "AZMBFT_storage";
            sleep AZMBFT_updateInterval;
        };
    };
    case "transmit": {
        if ('azm_bft_tx' in items _target) then {
            _code = 440;
            AZMBFT_isTransmitting = true;
            if (_showMsg) then {
                [["Blufor Tracking", 1.5, [0.161,0.502,0.725,1]], ["TX started", 1.5, [0.161, 0.502, 0.725, 1]],[format["Code: %1",_code]]] call CBA_fnc_notify;
            };
            while {AZMBFT_isTransmitting} do {
                _vicShowingAlready = vehicle player getVariable ["show_marker", false];
                if !(_vicShowingAlready) then {
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
                }else{
                    AZMBFT_storage deleteAt getPlayerUID player;
                    cgqc_bft_forceUpdate = true;
                    publicVariable "cgqc_bft_forceUpdate";
                };
                sleep AZMBFT_updateInterval;
            };
        };
    };
    case "receive": {
        if ('azm_bft_rx' in items _target) then {
            AZMBFT_isReceiving = true;
            AZMBFT_receivingCode = 440;
            [["Blufor Tracking", 1.5, [0.161, 0.502, 0.725, 1]], ["RX started on 440"]] call CBA_fnc_notify;
            while { AZMBFT_isReceiving } do {
                {
                    //LOG ("BFT - Starting the run");
                    private _markerName = format ["AZMBFT_marker_%1", _x];
                    _goAhead = true;
                    /*
                    if (getPlayerUID player in _markerName) then { // Player marker. Skip it.
                        //if !(visibleMap) then {
                        _goAhead = false;
                        //};
                    };*/
                    if (_goAhead) then {
                        if (!(_y isEqualType [])) then {
                            //LOG "BFT - Deleting marker";
                            deleteMarkerLocal _markerName;
                            // ["DElete marker", _markerName] call CBA_fnc_debug;
                            AZMBFT_localMarkerList deleteAt _x;
                        } else {
                            //LOG ("BFT - Updating marker");
                            _y params ["_target", "_pos", "_group", "_text", "_code", "_markerData", "_inVic"];
                            if (AZMBFT_receivingCode isEqualTo _code) then {
                                //LOG ("BFT - Receive check passed");
                                if ((getMarkercolor _markerName) isEqualTo "") then {
                                    // Adjust name to  setttings
                                    if !(cgqc_flag_isTraining) then {
                                        switch (cgqc_bft_initials) do {
                                            case 1: {
                                                _textPrefix = _text select [0,1];
                                                _textSuffix = _text select [count _text - 1];
                                                _text = format ["%1%2", _textPrefix, _textSuffix];
                                            }; // Short
                                            case 2: {_text = ""; }; // No name
                                        };
                                    };
                                    // Adjust name to  setttings
                                    //LOG ("BFT - Something changed: Reloading marker");
                                    // ["create marker", _markerName] call CBA_fnc_debug;
                                    private _marker = createMarkerLocal [_markerName, _pos, 1, player];
                                    _marker setMarkerColorLocal _markerData#1;
                                    _marker setMarkerTypeLocal _markerData#0;
                                    _marker setMarkerTextLocal _text;
                                    _size = 1 * cgqc_bft_scale;
                                    _marker setMarkerSize [_size, _size];
                                    AZMBFT_localMarkerList set [_x, _marker];
                                };
                                //LOG ("BFT - Moving marker");
                                _markerName setMarkerPosLocal _pos;
                            };
                        };
                    } else{
                        deleteMarkerLocal _markerName;
                        AZMBFT_localMarkerList deleteAt _x;
                    };
                } forEach AZMBFT_storage;

                sleep AZMBFT_updateInterval;
                if (cgqc_bft_forceUpdate) then {
                    LOG ("[BFT] - Forcing Update");
                    {deleteMarkerLocal _y;} forEach AZMBFT_localMarkerList;
                    cgqc_bft_forceUpdate = false;
                };
            };
        };
    };
};

LOG_1("[bluforceTracker] %1 done", _type);