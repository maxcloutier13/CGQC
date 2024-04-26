#include "\CGQC\script_component.hpp"
// --- centerMap ----------------------------------------------------------
// Center the map if needed when opening
params [["_type", "center"]]
LOG("centerMap started");

switch (_type) do {
    case "initial": {
        switch (cgqc_flag_mapCenterSetting) do {
            case 0: {
                cgqc_map_centerOnplayer = false;
                cgqc_map_centerOnLast = false;
            };
            case 1: {
                gqc_map_centerOnplayer = false;
                cgqc_map_centerOnLast = true;
                };
            case 2: {
                gqc_map_centerOnplayer = true;
                cgqc_map_centerOnLast = false;
            };
        };

    };
    case "center": {
        _map = (findDisplay 12 displayCtrl 51);
        if (cgqc_map_centerOnplayer) then {
            if ('ItemGPS' in (assigneditems player)) then {
                [["Map centered on player", 1.5], true] call CBA_fnc_notify;
                _zoom = ctrlMapScale _map;
                ctrlMapAnimClear _map;
                _map ctrlMapAnimAdd [0.5, _zoom, getPosVisual (vehicle player)];
                ctrlMapAnimCommit _map;
            } else {
                [['No GPS! Cant center on player', 1.5], true] call CBA_fnc_notify
            };

        };
        if (cgqc_map_centerOnLast) then {
            _pos = cgqc_map_centerOldPosition select 0;
            _zoom =  cgqc_map_centerOldPosition select 1;
            ctrlMapAnimClear _map;
            _map ctrlMapAnimAdd [0.001, _zoom, _pos];
            ctrlMapAnimCommit _map;
        };
    };
};

LOG("centerMap done");