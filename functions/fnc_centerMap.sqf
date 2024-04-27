#include "\CGQC\script_component.hpp"
// --- centerMap ----------------------------------------------------------
// Center the map if needed when opening
params [["_type", "center"]]
LOG("centerMap started");

switch (_type) do {
    case "initial": {
        LOG("centerMap - Initial setting changed");
        _map = (findDisplay 12 displayCtrl 51);
		cgqc_map_centerOldPosition = [_map ctrlMapScreenToWorld [0.5, 0.5], ctrlMapScale _map];
        switch (cgqc_flag_mapCenterSetting) do {
            case 0: {
                LOG("centerMap - Initial: set to default");
                cgqc_map_centerOnplayer = false;
                cgqc_map_centerOnLast = false;
            };
            case 1: {
                LOG("centerMap - Initial: set to LAST");
                gqc_map_centerOnplayer = false;
                cgqc_map_centerOnLast = true;
                };
            case 2: {
                LOG("centerMap - Initial: set to PLAYER");
                gqc_map_centerOnplayer = true;
                cgqc_map_centerOnLast = false;
            };
        };
    };
    case "center": {
        _map = (findDisplay 12 displayCtrl 51);
        if (cgqc_map_centerOnplayer) then {
            LOG("centerMap - Center on player");
            _itemsToCheck = ['ItemGPS', 'ItemAndroid', 'ACE_microDAGR', 'B_UavTerminal', 'O_UavTerminal', 'I_UavTerminal', 'C_UavTerminal', 'I_E_UavTerminal'];
            _hasGPS = false;
            {
                if (_x in items player) exitWith {
                    _hasGPS = true;
                };
            } forEach _itemsToCheck;
            if (_hasGPS) then {
                LOG("centerMap - Player has some kind of GPS");
                [["Map centered on player", 1.5], true] call CBA_fnc_notify;
                _zoom = ctrlMapScale _map;
                ctrlMapAnimClear _map;
                _map ctrlMapAnimAdd [0.001, _zoom, getPosVisual (vehicle player)];
                ctrlMapAnimCommit _map;
            } else {
                LOG("centerMap - Player has no GPS");
                [['No GPS! Cant center on player', 1.5], true] call CBA_fnc_notify
            };

        };
        if (cgqc_map_centerOnLast) then {
            LOG("centerMap - Center on Last position");
            _pos = cgqc_map_centerOldPosition select 0;
            _zoom =  cgqc_map_centerOldPosition select 1;
            ctrlMapAnimClear _map;
            _map ctrlMapAnimAdd [0.001, _zoom, _pos];
            ctrlMapAnimCommit _map;
        };
    };
};

LOG("centerMap done");