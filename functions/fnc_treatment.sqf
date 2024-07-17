#include "\CGQC\script_component.hpp"
// --- treatment ----------------------------------------------------------
// Custom Ace medical treatments
//  [_player, _patient, 'Carbonate'] call CGQC_fnc_treatment;
params["_medic", "_patient", "_medication"];
LOG_3("[treatment] %1/%2/%3 started", _medic, _patient, _medication);

switch (_medication) do {
    case "Carbonate": {
        // Remove med
        if ([_patient,'CGQC_Carbonate'] call ace_common_fnc_hasItem) then {
            _patient removeItem 'CGQC_Carbonate';
        } else {
            _medic removeItem 'CGQC_Carbonate';
        };
    };
};

// Apply effect
if (local _patient) then {
    ["cgqc_event_treatment", [_medic, _patient, _medication]] spawn CBA_fnc_localEvent;
} else {
    ["cgqc_event_treatment", [_medic, _patient, _medication], _patient] spawn CBA_fnc_targetEvent;
};

LOG("[treatment] done");