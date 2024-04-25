#include "script_component.hpp"
// --- getCustomHelmet ----------------------------------------------------------
// Get player custom helmet if exists
params ["_helmet"];
diag_log format ["[CGQC_FNC] getCustomHelmet %1 started", _helmet];

removeHeadgear player;
_customHelmet = _helmet + "_" + cgqc_custom_playername;
//hint format ["Custom Helmet:%1", _customHelmet];sleep 5;
player addHeadgear _customHelmet;
_checkHelmet = headgear player;
//hint format ["Check Helmet:%1", _checkHelmet];sleep 5;
if (_checkHelmet == "") then {
    player addHeadgear _helmet;
} else {
    hint format ["Custom Helmet :%1", _customHelmet];
};

diag_log "[CGQC_FNC] getCustomHelmet done";