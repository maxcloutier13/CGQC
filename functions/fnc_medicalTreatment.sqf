#include "\CGQC\script_component.hpp"
// --- medicalTreatment ----------------------------------------------------------
// Custom medical treatments and such
params ["_type"];
LOG("[medicalTreatment] started");

if !(cursorObject isKindOf "CAManBase") exitWith {
    LOG("[medicalTreatment] Non Human. Skipping");
};
cgqc_treat_type = _type;

[3, [], {
		// do stuff
		switch (cgqc_treat_type) do {
			case "pulse": {
				[player, cursorObject, "Head"] call ace_medical_treatment_fnc_checkPulse;
			};
			case "response": {
				[player, cursorObject] call diwako_ace_medical_main_fnc_checkResponse;
			};
		};
	}, {
		hint "Aborted!";
}, format ["Checking %1...", cgqc_treat_type]] call ace_common_fnc_progressBar;
LOG("[medicalTreatment] done");