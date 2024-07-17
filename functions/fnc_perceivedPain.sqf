#include "\CGQC\script_component.hpp"
// --- perceivedPain ----------------------------------------------------------
// Calculates currently perceived pain
params[["_target", player]];
LOG("[perceivedPain] started");

_pain = _target getVariable ["ace_medical_pain", 0];
_suppress = _target getVariable  ["ace_medical_painSuppress", 0];
_perceived = (0 max (_pain - _suppress) min 1);

LOG_1("[perceivedPain] %1 done", _perceived);

_perceived;