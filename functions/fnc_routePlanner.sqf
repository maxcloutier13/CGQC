#include "\CGQC\script_component.hpp"
// --- routePlanner ----------------------------------------------------------
// Semi automated route planning

cgqc_player_route_on = false;
cgqc_player_route = [];

cgqc_route_clickEvent = addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	if (_shift && !_alt) then {
		if (cgqc_player_route_on) then {
			cgqc_player_route_on = false;
			[["Route Planner OFF", 1.5], false] call CBA_fnc_notify;
		} else {
			cgqc_player_route_on = true;
            _newRoute = [];
			_routeStartPos = _pos;
			_count = count cgqc_player_route;
			_name = format ["_USER_DEFINED_routeMrk_%1_%2", getPlayerID player, _count];
			_marker = createMarker [_name, _routeStartPos, 1, player];
			_name setMarkerType "hd_dot";
			_name setMarkerColor "ColorBlack";
			            // _name setMarkerAlpha 0;
			_name setMarkerText "IRP";
            _newRoute pushBack _marker;
			cgqc_player_route pushBack _newRoute;
			[["Route Planner On", 1.5], ["Click on next point"], true] call CBA_fnc_notify;
		};
	};
	if (_alt && !_shift) then {
		if (cgqc_player_route_on) then {
            if (cgqc_player_route isNotEqualTo []) then {
                _route = cgqc_player_route select ((count cgqc_player_route) - 1);
                _count = count _route;
                _routeId = (count cgqc_player_route) - 1;
                _name = format ["_USER_DEFINED_routeMrk_%1_%2_%3", getPlayerID player, _routeId, _count];
                _lastMarkerId = count _route - 1;
                route_lastMarkerPos = getMarkerPos (_route select _lastMarkerId);
                _distance = floor (_pos distance route_lastMarkerPos);
                _azimuth = floor (route_lastMarkerPos getDir _pos);
                if (_azimuth < 0) then {
                    _azimuth = _azimuth + 360;
                };
                _marker = createMarker [_name, _pos, 1, player];
                _name setMarkerType "hd_dot";
                _name setMarkerColor "ColorBlack";
                _name setMarkerSize [0.5, 0.5];
                _name setMarkerText format["%1 - %2° %3m", _count, _azimuth, _distance];
                _route pushBack _marker;
                //_map = (findDisplay 12 displayCtrl 51);
                //route_pos = _pos;
                //_map drawLine [route_pos, route_lastMarkerPos, [0.3, 0.3, 0.3, 1]];
                cgqc_route_run = false;
                [["Route Planner", 1.5], ["Click on target point"], true] call CBA_fnc_notify;
            };
		};
	};
}];

_map = (findDisplay 12 displayCtrl 51);
_map ctrlAddEventHandler ["Draw", {
	 _previous = "";
    {
        _route = _x;
        if (count _route > 1) then {
            _id = 0;
            {
                _txt = markerText _x;
                if (_txt isNotEqualTo "") then {
                    if (markerText _x isNotEqualTo "IRP") then {
                        _this#0 drawLine [getMarkerPos _x, getMarkerPos _previous, [0, 0, 0, 1]];
                    };
                    _previous = _x;
                } else {
                    _trash = _route deleteAt _id;
                };
                _id = _id + 1;
            } forEach _route;
        };
    } forEach cgqc_player_route;
}];

private _displays = uiNameSpace getVariable ["igui_displays", []];
{
	private _ctrl = (_x displayCtrl 101);

	if (!isNull _ctrl && ctrlType _ctrl == 101) then {
		_ctrl ctrlAddEventHandler ["Draw", {
            _previous = "";
            {
                _route = _x;
                if (count _route > 1) then {
                    _id = 0;
                    {
                        _txt = markerText _x;
                        if (_txt isNotEqualTo "") then {
                            if (markerText _x isNotEqualTo "IRP") then {
                                _this#0 drawLine [getMarkerPos _x, getMarkerPos _previous, [0, 0, 0, 1]];
                            };
                            _previous = _x;
                        } else {
                            _trash = _route deleteAt _id;
                        };
                        _id = _id + 1;
                    } forEach _route;
                };
            } forEach cgqc_player_route;
		}];
	};
} forEach _displays;

LOG("[routePlanner] - Done");

/*
	params [["_type", "init"]];
	LOG("[routePlanner] - Started");

	cgqc_int_deleteRoute = {
		LOG("[routePlanner] - Delete route");
		{
			deleteMarker _x;
		} forEach cgqc_player_route;
		cgqc_player_route = [];
		[["Route Planner", 1.5], ["All deleted"], false] call CBA_fnc_notify;
	};

	cgqc_int_clickNext = {
		params["_control", "_pos", "_shift", "_alt", "_ctrl"];
		[_control, _pos, _shift, _alt, _ctr] spawn {
			params["_control", "_pos", "_shift", "_alt", "_ctrl"];
			LOG("[routePlanner] - clickNext");
			removeMissionEventHandler ["MapSingleClick", cgqc_route_clickNext];
			_count = count cgqc_player_route;
			_no = _count + 1;
			_name = format ["_USER_DEFINED_routeMrk_%1_%2", getPlayerID player, _no];
			_lastMarkerId = count cgqc_player_route - 1;
			route_lastMarkerPos = getMarkerPos (cgqc_player_route select _lastMarkerId);
			_distance = floor (_pos distance route_lastMarkerPos);
			_azimuth = floor (route_lastMarkerPos getDir _pos);
			if (_azimuth < 0) then {
				_azimuth = _azimuth + 360;
			};
			LOG_4("[routePlanner] - Last:Id%1/Pos%2/Dist%3/Azimuth/%4", _lastMarkerId, route_lastMarkerPos, _distance, _azimuth);
			_marker = createMarker [_name, _pos, 1, player];
			_name setMarkerType "hd_dot";
			_name setMarkerColor "ColorBlack";
			_name setMarkerSize [0.5, 0.5];
			_name setMarkerText format["%1 - %2m@%3°", _no, _distance, _azimuth];
			cgqc_player_route pushBack _marker;
			_map = (findDisplay 12 displayCtrl 51);
			route_pos = _pos;
			_map drawLine [route_pos, route_lastMarkerPos, [0.3, 0.3, 0.3, 1]];
			cgqc_route_run = false;
			sleep 0.5;
			[["Route Planner", 1.5], ["Click on target point"], false] call CBA_fnc_notify;
			cgqc_route_clickNext = addMissionEventHandler ["MapSingleClick", cgqc_int_clickNext];
		};
	};

// Define the event handler function for MapSingleClick
	cgqc_int_createRoute = {
		params["_control", "_pos", "_shift", "_alt", "_ctrl"];
		LOG("[routePlanner] - createRoute");
		removeMissionEventHandler ["MapSingleClick", cgqc_route_clickEvent];
		cgqc_route_run = true;
		[_control, _pos, _shift, _alt, _ctr] spawn {
			params["_control", "_pos", "_shift", "_alt", "_ctrl"];
		         // Remove the MapSingleClick event handler
		        // set the first point
			_routeStartPos = _pos;
			_count = count cgqc_player_route;
			_no = _count + 1;
			_name = format ["_USER_DEFINED_routeMrk_%1_%2", getPlayerID player, _no];
			_marker = createMarker [_name, _routeStartPos, 1, player];
			_name setMarkerType "hd_dot";
			_name setMarkerColor "ColorBlack";
		       // _name setMarkerAlpha 0;
			_name setMarkerText "IRP";
			cgqc_player_route pushBack _marker;
			sleep 0.5;
			[["Route Planner", 1.5], ["Click on target point"], false] call CBA_fnc_notify;
			cgqc_route_clickNext = addMissionEventHandler ["MapSingleClick", cgqc_int_clickNext];
		};

		if !(cgqc_player_route_on) then {
			cgqc_route_clickEvent = addMissionEventHandler ["MapSingleClick", cgqc_int_createRoute];
			[["Route Planner", 1.5], ["Click on start point"], false] call CBA_fnc_notify;
			cgqc_player_route_on = true;
		} else {
			removeMissionEventHandler ["MapSingleClick", cgqc_route_clickNext];
			[["Route Planner", 1.5], ["Route Completed"], false] call CBA_fnc_notify;
			cgqc_player_route_on = false;
		};

		LOG("[routePlanner] - Done");



		Old:

	 /*
		    [] spawn {
			while { cgqc_route_run } do {
				LOG("[routePlanner] - Loading pos");
				            _disp = (findDisplay 12);
				            _map = (_disp displayCtrl 51);
				            _mousPos = _map ctrlMapScreenToWorld getMousePosition;
				            _lastMarkerId = count cgqc_player_route - 1;
				            _lastMarkerPos = getMarkerPos (cgqc_player_route select _lastMarkerId);
				            _distance = _mousPos distance _lastMarkerPos;
				            _azimuth = _lastMarkerPos getDir _mousPos;
				            if (_azimuth < 0) then {
					_azimuth = _azimuth + 360;
				};
				            hint format ["%1m@%2°", _distance, _azimuth];
				            sleep 0.5;
			};
		};
	};
*/