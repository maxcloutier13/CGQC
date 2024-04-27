#include "\CGQC\script_component.hpp"
// --- markClear ----------------------------------------------------------
// Mark clear buildings
params [["_type", "mark"]];
LOG_1("[CGQC_FNC] addPerks %1 started", _type);

switch (_type) do {
    case "last":{
        _count = count cgqc_player_clearMarkers;
        _pos = _count - 1;
        _marker = cgqc_player_clearMarkers select _pos;
        deleteMarker _marker;
        cgqc_player_clearMarkers deleteAt _pos;
        [["Deleted last marker", 1.5], true] call CBA_fnc_notify;
    };
    case "mark": {
        _playerTeam = player getVariable "CGQC_player_teamColor";
        _color = "ColorBlack";
        switch (_playerTeam) do {
            case "RED": { _color = "ColorEAST";};
            case "GREEN": {_color = "ColorGUER";};
            case "BLUE": {_color = "ColorWEST";};
            case "YELLOW": {_color = "ColorUNKNOWN";};
            case "MAIN": {_color = "ColorWhite";};
        };
        _count = count cgqc_player_clearMarkers;
        _no = _count + 1;
        _name = format ["clearMrk_%1_%2", getPlayerID player, _no];
        _marker = createMarker [_name, player, 1];
        _name setMarkerType "hd_dot";
        _name setMarkerColor _color;
        _name setMarkerText "";
        cgqc_player_clearMarkers pushBack _marker;
        [["Building Clear", 1.5], true] call CBA_fnc_notify;
    };
    case "clear": {
        {deleteMarker _x;} forEach cgqc_player_clearMarkers;
        cgqc_player_clearMarkers = [];
        [["Clear Markers", 1.5], ["All deleted"], true] call CBA_fnc_notify;
    };
};

_color = player getVariable "CGQC_player_teamColor";

LOG("[CGQC_FNC] addPerks started");
