#include "\CGQC\script_component.hpp"
// --- toggleUI ----------------------------------------------------------
// Show/Hide the UI
LOG(" toggleUI started");
    if (!cgqc_hud_hidden) then {
        // HIDE!
		showHUD [false,false,false,false,false,false,false,false,false];
		showVehCrew = 0;
        diwako_dui_main_toggled_off = true;
        [diwako_dui_main_hudToggled, [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
        cgqc_hud_hidden = True;
    }
    else
    {
        // Show!
		showHUD [true,true,true,true,true,true,true,true,true];
		showVehCrew = 1;
        diwako_dui_main_toggled_off = false;
        [diwako_dui_main_hudToggled, [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
        cgqc_hud_hidden = False;
    };
LOG(" toggleUI done");