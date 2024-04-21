// --- zeusUnit ----------------------------------------------------------
// Unit has been double clicked
params ["_unit"];
diag_log format ["[CGQC_FNC] zeusUnit %1 started", _unit];
if (!("CuratorObjectDoubleClicked" in (eventHandlers _unit))) then {
	_unit addEventHandler ["CuratorObjectDoubleClicked", {
		params ["_curator", "_entity"];
		hint "Unit double clicked!";
		if (cgqc_config_zeusRadios) then {
			controlledByPlayer = !isNull (driver _entity);
			if !(controlledByPlayer) then {
				hint "Not player. Adding radios";
				["zeus_radios", 0, _unit] spawn CGQC_fnc_perksZeus;
			} else {hint "is Player"};
		};
	}];
};

diag_log "[CGQC_FNC] zeusUnit done";