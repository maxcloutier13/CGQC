//--- Combat
#define IDC_COMBAT 1323004

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Maj. Cloutier, v1.063, #Focowi)
////////////////////////////////////////////////////////
class RscCGQCCombat {
	idd = 1323004;
	//onLoad = "[] call cgqc_fnc_training_landnav_reset;";
	//onUnload = "[] call CGQC_fnc_landnav_start;";

    class controlsBackground {
		class cgqc_gui_combat_background: RscFrame {
            idc = 1800;
            x = 3.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 33 * GUI_GRID_CENTER_W;
            h = 22 * GUI_GRID_CENTER_H;
        };
	};

    class Controls {
        class btn_combat_ok: RscButtonMenuOK
        {
            x = 25.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 20 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 3 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "Start combat session with current options";
			onButtonClick = "[] call CGQC_fnc_combat;closeDialog IDC_COMBAT;";
        };
        class btn_combat_cancel: RscButtonMenuCancel
        {
            x = 29 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 20 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 3.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
        };
        // Combos
        class cbo_combat_zone: RscCombo        {
            idc = 2100;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 5.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "Combat Zone to Activate";
            class Items			{
				class random				{
					text = "Random";
					default = 1;
				};
                class mout	{
					text = "MOUT Facility";
					data = combat_mout;
				};
                class golf	{
					text = "Objective Golf";
					data = combat_golf;
				};
            };
        };
        class cbo_combat_house: RscCombo        {
            idc = 2105;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 7.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "Number of targets per house";
            class Items {
                class random {
                    text = "Random";
                    default = 1;
                    value = 0;
                };
                class low {
                    text = "Low (1-3)";
                    value = 1;
                };
                class med {
                    text = "Medium (3-6)";
                    value = 2;
                };
                class hi {
                    text = "High (7-10)";
                    value = 3;
                };
                class hard {
                    text = "Hard (10-15)";
                    value = 4;
                };
            };
        };
        class cbo_combat_occupied: RscCombo        {
            idc = 2104;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 9.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "% of occupied houses";
            class Items {
                class random {
                    text = "Random";
                    default = 1;
                    value = 0;
                };
                class five {
                    text = "5%";
                    value = 5;
                };
                class ten {
                    text = "10%";
                    value = 10;
                };
                class twenty {
                    text = "20%";
                    value = 5;
                };
                class thirty {
                    text = "30%";
                    value = 10;
                };
                class fourthy {
                    text = "40%";
                    value = 40;
                };
                class fifty {
                    text = "50%";
                    value = 50;
                };
                class sixty {
                    text = "60%";
                    value = 60;
                };
                class seventy {
                    text = "70%";
                    value = 70;
                };
                class eighty {
                    text = "80%";
                    value = 80;
                };
                class ninety {
                    text = "90%";
                    value = 90;
                };
                class hundred {
                    text = "100%";
                    value = 100;
                };
            };
        };
        class cbo_combat_release: RscCombo        {
            idc = 2101;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 13.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "Interval at which statics turn into mobiles";
            class Items {
                class random {
                    text = "Random";
                    default = 1;
                    value = 0;
                };
                class thirty {
                    text = "30 secs";
                    value = 30;
                };
                class sixty {
                    text = "60 secs";
                    value = 60;
                };
                class onethirty {
                    text = "90 secs";
                    value = 90;
                };
                class oneeighty {
                    text = "180 secs";
                    value = 180;
                };
                class threesix {
                    text = "360 secs";
                    value = 360;
                };
            };
        };
        class cbo_combat_type: RscCombo        {
            idc = 2102;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 15.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "Enemy type";
            class Items			{
                class fia	{
					text = "FIA - Pistols";
					value = 2;
				};
                class fia_smg	{
					text = "FIA - SMGs";
					value = 3;
				};
                class full_spets	{
					text = "Spetsnaz - Full";
					value = 8;
				};
                class full_hamas	{
					text = "Hamas - Full";
					value = 15;
				};
                class full_cartel	{
					text = "Cartel - Full";
					value = 18;
				};
            };
        };

        class cbo_combat_mobiles: RscCombo        {
            idc = 2103;
            x = 14.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 11.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 19.5 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            tooltip = "% of initial mobiles";
            class Items {
                class random {
                    text = "Random";
                    default = 1;
                    value = 0;
                };
                class five {
                    text = "5%";
                    value = 5;
                };
                class ten {
                    text = "10%";
                    value = 10;
                };
                class twenty {
                    text = "20%";
                    value = 5;
                };
                class thirty {
                    text = "30%";
                    value = 10;
                };
                class fourthy {
                    text = "40%";
                    value = 40;
                };
                class fifty {
                    text = "50%";
                    value = 50;
                };
                class sixty {
                    text = "60%";
                    value = 60;
                };
                class seventy {
                    text = "70%";
                    value = 70;
                };
                class eighty {
                    text = "80%";
                    value = 80;
                };
                class ninety {
                    text = "90%";
                    value = 90;
                };
                class hundred {
                    text = "100%";
                    value = 100;
                };
            };
        };


        class check_combat_civ: RscCheckbox        {
            idc = 2800;
            x = 14 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 2.5 * GUI_GRID_CENTER_W;
            h = 2.5 * GUI_GRID_CENTER_H;
            checked = 0;
        };
        class check_combat_nades: RscCheckbox        {
            idc = 2801;
            x = 28.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 2.5 * GUI_GRID_CENTER_W;
            h = 2.5 * GUI_GRID_CENTER_H;
            checked = 0;
        };


        // Text and such

        class RscText_1000: RscText
        {
            idc = 1000;
            text = "Combat Training"; //--- ToDo: Localize;
            x = 8.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = -0.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 22.5 * GUI_GRID_CENTER_W;
            h = 4.5 * GUI_GRID_CENTER_H;
            sizeEx = 5 * GUI_GRID_CENTER_H;
        };

        class RscText_1001: RscText
        {
            idc = 1001;
            text = "Zone: "; //--- ToDo: Localize;
            x = 10.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 4 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };

        class RscText_1002: RscText
        {
            idc = 1002;
            text = "Targets/House:"; //--- ToDo: Localize;
            x = 5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 7 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 10.5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };
        class RscText_1003: RscText
        {
            idc = 1003;
            text = "% mobiles:"; //--- ToDo: Localize;
            x = 7.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 7.5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };
        class RscText_1004: RscText
        {
            idc = 1004;
            text = "Release timer:"; //--- ToDo: Localize;
            x = 5.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 13 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 10.5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };

        class RscText_1005: RscText
        {
            idc = 1005;
            text = "Type:"; //--- ToDo: Localize;
            x = 10.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 15 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 10.5 * GUI_GRID_CENTER_W;
            h = 2 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };

        class RscText_1006: RscText
        {
            idc = 1006;
            text = "Civilian Presence:"; //--- ToDo: Localize;
            x = 4 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 10.5 * GUI_GRID_CENTER_W;
            h = 2.5 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };
        class RscText_1007: RscText
        {
            idc = 1007;
            text = "Grenades on Pax:"; //--- ToDo: Localize;
            x = 18.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 17 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 10.5 * GUI_GRID_CENTER_W;
            h = 2.5 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };

        class RscText_1008: RscText
        {
            idc = 1008;
            text = "% occupied:"; //--- ToDo: Localize;
            x = 7 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
            y = 9.5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
            w = 11 * GUI_GRID_CENTER_W;
            h = 1.5 * GUI_GRID_CENTER_H;
            sizeEx = 2 * GUI_GRID_CENTER_H;
        };
    };
};