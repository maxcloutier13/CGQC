#include "\CGQC\script_component.hpp"
// --- zeusUnit ----------------------------------------------------------
// Unit has been double clicked
params ["_unit"];
LOG_1(" zeusUnit %1 started", _unit);
if !("CuratorObjectDoubleClicked" in (eventHandlers _unit)) then {
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

LOG(" zeusUnit done");