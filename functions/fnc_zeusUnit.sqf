// --- zeusUnit ----------------------------------------------------------
// Unit has been double clicked

params ["_unit"];

if !(cgqc_zeus_event) then {
	cgqc_zeus_event = true;
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
