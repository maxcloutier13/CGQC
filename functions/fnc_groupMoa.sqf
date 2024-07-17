#include "\CGQC\script_component.hpp"
// --- groupMoa ----------------------------------------------------------
// Finds the size in moa of the shot group
params ["_dist", "_groupSize", "_target"];
LOG_3("[groupMoa] Dist:%1/Size:%2/Target:%3 started", _dist, _groupSize, _target);

_dist = player distance _target;
_groupInch = _groupSize * 39.3701;
_shootDistYards = _dist * 1.09361;
_moaAtDist = _shootDistYards / 100 * 1.047;
_moa = _groupInch / _moaAtDist;
_moa = round (_moa * 10) / 10;

LOG_1("[groupMoa] done - %1 MOA", _moa);

_moa;