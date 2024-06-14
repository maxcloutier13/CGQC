#include "\CGQC\script_component.hpp"
// --- toggleUI ----------------------------------------------------------
// Show/Hide the UI
params [["_type", "toggle"]];
LOG_1("[toggleUI] %1 started", _type);

cgqc_int_ui_hide = {
    // HIDE!
    LOG("[toggleUI] Hiding UI");
    showHUD [false,false,false,false,false,false,false,false,false];
    showVehCrew = 0;
    diwako_dui_main_toggled_off = true;
    ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    cgqc_hud_hidden = True;
};

cgqc_int_ui_show = {
    // Show!
    LOG("[toggleUI] Showing UI");
    showHUD [true,true,true,true,true,true,true,true,true];
    showVehCrew = 1;
    diwako_dui_main_toggled_off = false;
    ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    cgqc_hud_hidden = False;
};

switch (_type) do {
    case "hide": {
        [] spawn cgqc_int_ui_hide;
    };
    case "show": {
        [] spawn cgqc_int_ui_show;
    };
    default {
        if (!cgqc_hud_hidden) then {[] spawn cgqc_int_ui_hide;}
        else{[] spawn cgqc_int_ui_show;};
    };
};
LOG("[toggleUI] done");