#include "\CGQC\script_component.hpp"
// --- getDrone ----------------------------------------------------------
// Handles the drone restrictions
// [0, 1, 2, 3], ["No Drones", "+BlackHornet", "+BH and Darter", "Unrestricted"
params ["_type"];
LOG_1("[getDrone] %1 started", _type);

_proceed = false;
switch (_type) do {
    case "sps_black_hornet_01_Static_F": {
        if (cgqc_config_droneRestriction > 0) then {
            _proceed = true;
            LOG("[getDrone] Drone not restricted. Adding");
        };
    };
    case "Rev_darter": {
        if (cgqc_config_droneRestriction > 1) then {
            _proceed = true;
            LOG("[getDrone] Drone not restricted. Adding");
        };
    };
    default {
        LOG("[getDrone] Drone not restricted. Adding");
    };
};

if (_proceed) then {
    player addItemToBackpack _type;
    player addItemToBackpack "ACE_UAVBattery";
    LOG("[getDrone] Drone added");
} else {
    [["Drone is restricted", 1.5], false] call CBA_fnc_notify;
    LOG("[getDrone] Drone restricted");
};

LOG("[getDrone] done");