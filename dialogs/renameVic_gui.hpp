class CGQC_ui_renameVic {
    idd = 1353153;
    name = "CGQC_ui_renameVic";
    onload = "uiNamespace setVariable ['CGQC_ui_renameVic',_this select 0];";
    class controlsBackground {
        class Background: RscPicture {
			x = CENTER_X - 40 * GRID_W;
			y = CENTER_Y - 15 * GRID_H;
			w = 80 * GRID_W;
			h = 27 * GRID_H;
			text = "#(argb,8,8,3)color(0.071,0.078,0.067,0.8)";
		};
		class Header: RscText {
			x = CENTER_X - 40 * GRID_W;
			y = CENTER_Y - 15 * GRID_H;
			w = 80 * GRID_W;
			h = 4 * GRID_H;
			colorBackground[] = {0.145,0.145,0.145,1};;
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.83)";
            text = "Rename Vehicle";
            //tooltip = "by Alezm <3";
		};
    };
    class controls {
		class code: RscEdit {
			x = CENTER_X - 38.5 * GRID_W;
			y = CENTER_Y - 9 * GRID_H;
			w = 77 * GRID_W;
			h = 7 * GRID_H;

			idc = 1400;
			colorBackground[] = {0,0,0,0.6};
            maxChars = 5;

            tooltip = "Set the vehicle name";

			onload = "(_this select 0) ctrlSetText 'Vic.'";
            onEditChanged = "uiNamespace setvariable ['CGQC_ui_renameVic',(_this select 1)];";
            //onKillFocus = "_this call AZMBFT_ui_validateCode;";
		};

		class start: RscButton {
			x = CENTER_X - 38.5 * GRID_W;
			y = CENTER_Y - 0 * GRID_H;
			w = 77 * GRID_W;
			h = 10 * GRID_H;

			idc = 1600;
			text = "Save Name";
			colorBackground[] = {0.145,0.145,0.145,1};
            onButtonClick = "[] spawn CGQC_UI_saveName;";
		};
    };
};
