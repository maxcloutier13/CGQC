// --- changeAperture ----------------------------------------------------------
// Change everyone's aperture
params [["_target", "all"], ["_aperture", [-1]], ["_type", "reset"]];
diag_log format ["[CGQC_FNC] changeAperture %1/%2", _target, _aperture];

_allTargets = [];
switch (_target) do {
	case "all": {_allTargets = allPlayers - entities "HeadlessClient_F";};
	case "player": {_allTargets = [player]};
};
switch (_type) do {
	case "reset": {_aperture = [-1]};
	case "night": {_aperture = [3 ,4 , 5, 1];};
	case "dark": {_aperture = [15,20,25, 0.5]; }
};

{
	[_aperture] remoteExec ["setApertureNew",_x,false];
} forEach _allTargets;

diag_log "[CGQC_FNC] changeAperture done";