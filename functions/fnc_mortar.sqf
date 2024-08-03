#include "\CGQC\script_component.hpp"
// --- mortar ----------------------------------------------------------
// Handles custom mortar stuff
params ["_event"];
_mortar = _event select 0;
LOG_1("[mortar] %1/%2 started", _event, _mortar);
_dropMode = _mortar getVariable ["CGQC_mortar_dropFireMode", false];
if (_dropMode) then {
    //Drop on. Fire the mortar
    _gunner = gunner _mortar;
    if (isNull _gunner) then {
        LOG("[mortar] No gunner, spawning one");
        // Spawn a fake gunner for firing purposes?
        _group = createGroup east;
        _unit = _group createUnit ["CGQC_Soldat_Base", [0, 0, 100], [], 0, "CAN_COLLIDE"];
        _unit moveInTurret [_mortar, [0]];
        _unit setUnloadInCombat [false, false];
        _unit disableAI "PATH";
        _unit hideObjectGlobal true;
    };
    LOG("[mortar] Firing mortar");
    (gunner _mortar) forceWeaponFire [weaponState _mortar select 1, weaponState _mortar select 2];
    if !(isNull _unit) then {
        LOG("[mortar] Fake gunner deleted");
        deleteVehicle _unit;
    };
};
LOG("[mortar] done");