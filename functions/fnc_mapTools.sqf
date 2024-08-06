#include "\CGQC\script_component.hpp"
// --- mapTools ----------------------------------------------------------
// Quick tool for map stuff
params["_type"];
LOG("[mapTools] started");

cgqc_int_createMarkerDone = {
    removeMissionEventHandler ["MapSingleClick", cgqc_maptools_clickEvent];
    cgqc_maptools_running = false;
};

cgqc_int_createMarker = {
    params[
        "_counterVariable",
        "_type",
        "_markerText",
        "_markerType",
        "_markerColor",
        ["_includeNbr", true],
        ["_includeName", false],
        ["_single", true],
        ["_names", ""]
    ];
    LOG_5(
        "[mapTools] - CreateMarker: %1/%2/%3/%4/%5",
        _counterVariable,
        _type,
        _markerText,
        _markerType,
        _markerColor
    );
    // Escape if already running
    if (cgqc_maptools_running) exitWith {};
    // Make variables accessible
    cgqc_maptools_running = true;
    cgqc_location_counterVariable = _counterVariable;
    cgqc_location_type = _type;
    cgqc_location_markerText = _markerText;
    cgqc_location_markerType = _markerType;
    cgqc_location_markerColor = _markerColor;
    cgqc_location_includeNbr = _includeNbr;
    cgqc_location_name = _includeName;
    cgqc_location_single = _single;
    cgqc_location_markerNames = _names;
    cgqc_maptools_clickEvent = addMissionEventHandler ["MapSingleClick", {
        params ["_units", "_pos", "_alt", "_shift"];
        if (_shift && !_alt) then {
            // Shift: End the route
            [] spawn cgqc_int_createMarkerDone;
            [["Maptool OFF", 1.5], true] call CBA_fnc_notify;
        } else {
            _objCount = missionNamespace getVariable cgqc_location_counterVariable;
            _objCount = _objCount + 1;
            _name = format ["_USER_DEFINED_toolMrk_%1_%2_%3", getPlayerID player, cgqc_location_type, _objCount];
            _marker = createMarker [_name, _pos, 1, player];
            _name setMarkerTypeLocal cgqc_location_markerType;
            _name setMarkerColorLocal cgqc_location_markerColor;
            if (cgqc_location_includeNbr) then {
                _name setMarkerText format["%1%2", cgqc_location_markerText, _objCount];
            } else {
                if (cgqc_location_name) then {
                    _index = _objCount % (count cgqc_location_markerNames);
                    _code = cgqc_location_markerNames select (_index - 1);
                    _name setMarkerText format["%1%2", cgqc_location_markerText, _code];
                } else {
                    _name setMarkerText format["%1", cgqc_location_markerText];
                };
            };
            missionNamespace setVariable [cgqc_location_counterVariable, _objCount, true];
            _txt = format ["%1 marked", cgqc_location_type];
            [["Map Tool", 1.5], [_txt], true] call CBA_fnc_notify;
            if (cgqc_location_single) then {
                [] spawn cgqc_int_createMarkerDone;
            };
        };
    }];
};

switch (_type) do {
    case 0: { // Mortar
        LOG("[mapTools] - Mortar Tool Starting");
        cgqc_mortar_clickEvent = addMissionEventHandler ["MapSingleClick", {
            params ["_units", "_pos", "_alt", "_shift"];
            if (_shift && !_alt) then {
                // Shift: End the route
                removeMissionEventHandler ["MapSingleClick", cgqc_mortar_clickEvent];
                [["Mortar Tool OFF", 1.5], false] call CBA_fnc_notify;
            } else {
                _targets = missionNamespace getVariable "cgqc_maptools_mortar";
                _targets = _targets + 1;
                _playerpos = getPos player;
                _name = format ["_USER_DEFINED_routeMrk_%1_%2", getPlayerID player, _targets];
                _distance = floor (_pos distance _playerpos);
                _azimuth = _playerpos getDir _pos;
                if (_azimuth < 0) then {_azimuth = _azimuth + 360;};
                _azimuth = floor (_azimuth * 17.7777778);
                _marker = createMarker [_name, _pos, 1, player];
                _name setMarkerType "waypoint";
                _name setMarkerColor "ColorBlack";
                //_name setMarkerSize [0.5, 0.5];
                _name setMarkerText format["T.%1 - %2mils @ %3m", _targets, _azimuth, _distance];
                missionNamespace setVariable ["cgqc_maptools_mortar", _targets, true];
                [["Mortar Tool", 1.5], ["Target marked"], true] call CBA_fnc_notify;
               };
        }];
        LOG("[mapTools] - Mortar Tool  Done");
    };
    case 1: { //Route Planner
         LOG("[mapTools] - RoutePlanner Starting");
        cgqc_player_route = [];
        cgqc_player_route_lastTxt = "";
        cgqc_player_route_markerType = "mil_dot";
        [["Route Planner", 1.5], ["Click on Starting Point"], true] call CBA_fnc_notify;
        cgqc_route_clickEvent = addMissionEventHandler ["MapSingleClick", {
            params ["_units", "_pos", "_alt", "_shift"];
            if (_shift && !_alt) then {
                // Shift: End the route
                removeMissionEventHandler ["MapSingleClick", cgqc_route_clickEvent];
                _lastMarkerId = count cgqc_player_route - 1;
                _lastMarker = cgqc_player_route select _lastMarkerId;
                _findMark = cgqc_player_route_lastTxt find "-";
                if (_findMark != -1) then {
                    _remainingText = cgqc_player_route_lastTxt select [_findMark + 1];
                    _newTxt = "ORP -" + _remainingText;
                    _lastMarker setMarkerText _newTxt;
                    _lastMarker setMarkerType "mil_end";
                };
                [["Route Planner OFF", 1.5], false] call CBA_fnc_notify;
            } else {
                // Insert a new point on the route
                _count = count cgqc_player_route;
                cgqc_player_route_id = cgqc_player_route_id + 1;
                _name = format ["_USER_DEFINED_routeMrk_%1_%2_%3", getPlayerID player, cgqc_player_route_id, _count];
                _marker = createMarker [_name, _pos, 1, player];
                _name setMarkerColorLocal "ColorBlack";
                if (_count isEqualTo 0) then {
                    cgqc_player_route_lastTxt = "IRP";
                    cgqc_player_route_markerType = "mil_start";
                } else {
                    _lastMarkerId = count cgqc_player_route - 1;
                    _route_lastMarkerPos = getMarkerPos (cgqc_player_route select _lastMarkerId);
                    _distance = floor (_pos distance _route_lastMarkerPos);
                    _azimuth = floor (_route_lastMarkerPos getDir _pos);
                    if (_azimuth < 0) then {
                        _azimuth = _azimuth + 360;
                    };
                    cgqc_player_route_lastTxt = format["WP.%1 - %2m @ %3°", _count, _distance, _azimuth];
                    cgqc_player_route_markerType = "loc_move";
                };
                _name setMarkerTypeLocal cgqc_player_route_markerType;
                _name setMarkerText cgqc_player_route_lastTxt;
                cgqc_player_route pushBack _marker;
                [["Route Planner", 1.5], ["Click on next point"], ["Shift+Click to stop"], true] call CBA_fnc_notify;
            };
        }];
        LOG("[mapTools] - RoutePlanner Done");
    };
    case 10: { //HQ
        ["cgqc_maptools_hq", "HQ", "HQ", "mil_flag", "colorBLUFOR", false, false, true] call cgqc_int_createMarker;
    };
    case 11: { //Objective
        ["cgqc_maptools_obj", "Objective", "Obj.", "mil_objective", "colorOPFOR", false, true, false, cgqc_location_currentNames select 0] call cgqc_int_createMarker;
    };
    case 12: { //IRP
        ["cgqc_maptools_irp", "Initial RallyPoint", "IRP", "mil_start", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 121: { //Waypoint
        ["cgqc_maptools_wp", "WayPoint", "WP.", "loc_move", "colorBLACK", true, false, false] call cgqc_int_createMarker;
    };
    case 13: { //RP
        ["cgqc_maptools_rp", "RallyPoint", "RP.", "mil_join", "colorBLACK", true, false, false] call cgqc_int_createMarker;
    };
    case 14: { //ORP
        ["cgqc_maptools_orp", "Objective RallyPoint", "ORP", "mil_end", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 15: { //NEAR
        ["cgqc_maptools_near", "Near Rallypoint", "Near", "mil_start", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 16: { //FAR
        ["cgqc_maptools_far", "Far RallyPoint", "Far", "mil_end", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 17: { //CSP
        ["cgqc_maptools_csp", "Convoy StartPoint", "CSP", "mil_start", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 18: { //CRP
        ["cgqc_maptools_crp", "Convoy RallyPoint", "CRP.", "loc_move", "colorBLACK", true, false, false] call cgqc_int_createMarker;
    };
    case 19: { //Dis
        ["cgqc_maptools_dis", "Dismount Point", "Dis", "mil_end", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 20: { //LZ
        ["cgqc_maptools_lz", "Landing Zone", "LZ.", "mil_pickup", "colorIndependent", false, true, false, cgqc_location_currentNames select 1] call cgqc_int_createMarker;
    };
    case 201: { //OP
        ["cgqc_maptools_op", "Observation Point", "OP.", "loc_binoculars", "colorBLACK", true, false, false] call cgqc_int_createMarker;
    };
    case 202: { //PL
        ["cgqc_maptools_pl", "Phase Line", "PL.", "mil_box", "colorBLACK", false, true, false, cgqc_location_currentNames select 2] call cgqc_int_createMarker;
    };
    case 2021: { //Limit of advance
        ["cgqc_maptools_loa", "Limit of Advance", "LOA", "mil_dot", "colorBLACK", false, false, true] call cgqc_int_createMarker;
    };
    case 203: { //SbF
        ["cgqc_maptools_sbf", "Support by Fire", "SBF", "mil_ambush", "colorBLACK", false, false, false] call cgqc_int_createMarker;
    };
    case 204: { //AP
        ["cgqc_maptools_ap", "Assault Position", "AP", "loc_Attack", "colorBLACK", false, false, false] call cgqc_int_createMarker;
    };
    case 21: { //Route
        ["cgqc_maptools_rte", "Route", "Rte.", "mil_box", "ColorOrange", false, true, false, cgqc_location_currentNames select 3] call cgqc_int_createMarker;
    };
    case 22: { //Supply point
        ["cgqc_maptools_sply", "Supplies", "Supplies", "loc_rearm", "colorBLUFOR", false, false, true] call cgqc_int_createMarker;
    };
    case 23: { //City
        ["cgqc_maptools_cty", "City", "", "mil_triangle", "colorBLACK", false, true, false, cgqc_location_currentCities] call cgqc_int_createMarker;
    };
    case 24: { //House
        ["cgqc_maptools_house", "House", "", "mil_dot", "colorBLACK", true, false, false] call cgqc_int_createMarker;
    };
    case 30: { // PAX
        ["cgqc_maptools_inf", "Infantry", "PAX", "o_inf", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 301: { // Unknown
        ["cgqc_maptools_unk", "Unknown", "Unknown", "o_unknown", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 302: { // Static
        ["cgqc_maptools_stat", "Static", "Static", "o_art", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 3021: { // Unarmed
        ["cgqc_maptools_vic", "Unarmed Vehicle", "Vic", "o_maint", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 303: { // IFV
        ["cgqc_maptools_ifv", "IFV", "IFV", "o_mech_inf", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 304: { // Tank
        ["cgqc_maptools_tank", "Tank", "Tank", "o_armor", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 305: { // Heli
        ["cgqc_maptools_hel", "Helicopter", "Heli", "o_air", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 306: { // Plane
        ["cgqc_maptools_pln", "Plane", "Plane", "o_plane", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 307: { // Bunker
        ["cgqc_maptools_bkr", "Bunker", "Bunker", "o_installation", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 3071: { // Bunker
        ["cgqc_maptools_roadblk", "Roadblock", "Roadblock", "o_support", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
    case 308: { // HQ
        ["cgqc_maptools_base", "Ennemy HQ", "HQ", "o_hq", "colorOPFOR", false, false, false] call cgqc_int_createMarker;
    };
};

LOG("[mapTools] - Done");
