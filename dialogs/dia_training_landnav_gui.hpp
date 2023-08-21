//--- Landnav
#define IDC_LANDNAV 1323001
#define IDC_LANDNAV_cbo_objective	4350
#define IDC_LANDNAV_cbo_difficulty	4351
#define IDC_LANDNAV_cbo_min	4352
#define IDC_LANDNAV_cbo_max	4353
#define IDC_LANDNAV_cbo_patrols	4354
#define IDC_LANDNAV_cbo_hunters	4355

class RscCGQCLandnav {
	idd = 1323001;
	//onLoad = "[] call cgqc_fnc_training_landnav_reset;";
	//onUnload = "[] call cgqc_fnc_training_landnav_start;";
	
	class controlsBackground {
		class frm_background: RscFrame {
			idc = 1800;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
	};
	class Controls {
		class btn_ok: RscButtonMenuOK {
			text = "Start"; //--- ToDo: Localize;
			onButtonClick = "[] call CGQC_fnc_training_landnav_start;closeDialog IDC_LANDNAV;";
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Start training session with current options"; //--- ToDo: Localize;
		};
		class cbo_objective: RscCombo_cgqc {
			idc = 4350;
			text = "Type of Objective"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.9167 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random {
					text = "Random";
					default = 0;
					value = 0;
					data = "random";
				};
				class city {
					text = "City";
					default = 1;
					value = 1;
					data = "city";
				};
				class viewpoints {
					text = "Viewpoints";
					default = 0;
					value = 2;
					data = "viewpoints";
				};
			};
			onLBSelChanged = "cgqc_training_landnav_objective = (_this select 0) lbData (_this select 1);";
		};
		class cbo_min: RscCombo_cgqc {
			idc = 4352;
			text = "Minimum"; //--- ToDo: Localize;
			x = 24.92 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Minimum starting distance from objective"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random{
					text = "Random";
					default = 0;
					value = 0;
				};
				class dist_500{
					text = "500m";
					default = 0;
					value = 500;
				};
				class dist_1{
					text = "1km";
					default = 1;
					value = 1000;
				};
				class dist_2{
					text = "2km";
					default = 0;
					value = 2000;
				};
				class dist_3{
					text = "3km";
					default = 0;
					value = 3000;
				};
				class dist_4{
					text = "4km";
					default = 0;
					value = 4000;
				};
				class dist_5{
					text = "5km";
					default = 0;
					value = 5000;
				};
			};
			onLBSelChanged = "cgqc_training_landnav_min = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_max: RscCombo_cgqc {
			idc = 4353;
			text = "Maximum"; //--- ToDo: Localize;
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Maximum starting distance from objective"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					value = 0;
				};
				class dist_1
				{
					text = "1km";
					default = 0;
					value = 1000;
				};
				class dist_2
				{
					text = "2km";
					default = 1;
					value = 2000;
				};
				class dist_3
				{
					text = "3km";
					default = 0;
					value = 3000;
				};
				class dist_4
				{
					text = "4km";
					default = 0;
					value = 4000;
				};
				class dist_5
				{
					text = "5km";
					default = 0;
					value = 5000;
				};
				class dist_6
				{
					text = "6km";
					default = 0;
					value = 6000;
				};
				class dist_7
				{
					text = "7km";
					default = 0;
					value = 7000;
				};
				class dist_8
				{
					text = "8km";
					default = 0;
					value = 8000;
				};
				class dist_9
				{
					text = "9km";
					default = 0;
					value = 9000;
				};
				class dist_10
				{
					text = "10km";
					default = 0;
					value = 10000;
				};
				class dist_12
				{
					text = "12km";
					default = 0;
					value = 12000;
				};
				class dist_15
				{
					text = "15km";
					default = 0;
					value = 15000;
				};
				class dist_20
				{
					text = "20km";
					default = 0;
					value = 20000;
				};
			};
			onLBSelChanged = "cgqc_training_landnav_max = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_patrols: RscCombo_cgqc {
			idc = 4354;
			text = "Patrols"; //--- ToDo: Localize;
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Patrols around the objective"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					value = 100;
				};
				class patrol_0
				{
					text = "0 (Off)";
					default = 1;
					value = 0;
				};
				class patrol_1
				{
					text = "1";
					default = 0;
					value = 1;
				};
				class patrol_2
				{
					text = "2";
					default = 0;
					value = 2;
				};
				class patrol_3
				{
					text = "3";
					default = 0;
					value = 3;
				};
				class patrol_4
				{
					text = "4";
					default = 0;
					value = 4;
				};
				class patrol_5
				{
					text = "5";
					default = 0;
					value = 5;
				};
			};
			onLBSelChanged = "cgqc_training_landnav_patrols = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_hunters: RscCombo_cgqc{
			idc = 4355;
			text = "Hunter Teams"; //--- ToDo: Localize;
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Teams of trackers actively hunting the player"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					value = 0;
				};
				class hunter_0
				{
					text = "0 (Off)";
					default = 1;
					value = 0;
				};
				class hunter_1
				{
					text = "1";
					default = 0;
					value = 1;
				};
				class hunter_2
				{
					text = "2";
					default = 0;
					value = 2;
				};
				class hunter_3
				{
					text = "3";
					default = 0;
					value = 3;
				};
				class hunter_4
				{
					text = "4";
					default = 0;
					value = 4;
				};
				class hunter_5
				{
					text = "5";
					default = 0;
					value = 5;
				};
			};
			onLBSelChanged = "cgqc_training_landnav_hunters = (_this select 0) lbValue (_this select 1);";
		};

		class cbo_difficulty: RscCombo_cgqc {
			idc = 4351;
			text = "Difficulty"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.9167 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Affects the items available to you during the mission"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class easy
				{
					text = "Easy";
					default = 0;
					value = 0;
					data = "easy";
					tooltip = "Easy peasy. All basic items + GPS";
				};
				class normal
				{
					text = "Normal";
					default = 1;
					value = 1;
					data = "normal";
					tooltip = "Map + Compass + Binoculars";
				};
				class hard
				{
					text = "Hard";
					default = 0;
					value = 2;
					data = "hard";
					tooltip = "Map + Binoculars";
				};
				class harder
				{
					text = "Harder";
					default = 0;
					value = 3;
					data = "harder";
					tooltip = "Map Only";
				};
			};
			onLBSelChanged = "cgqc_training_landnav_difficulty = (_this select 0) lbValue (_this select 1);";
		};

		class btn_cancel: RscButtonMenuCancel
		{
			x = 24 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
		};
		class txt_title: RscText_cgqc
		{
			idc = 1001;
			text = "Land Navigation"; //--- ToDo: Localize;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			sizeEx = 4 * GUI_GRID_H;
		};
		
		class RscText_1000: RscText_cgqc
		{
			idc = 1000;
			text = "Type of Objective"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1003: RscText_cgqc
		{
			idc = 1003;
			text = "Starting distance from Objective"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 23.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1004: RscText_cgqc
		{
			idc = 1004;
			text = "Minimum"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1005: RscText_cgqc
		{
			idc = 1005;
			text = "Maximum"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};		
		class RscText_1002: RscText_cgqc
		{
			idc = 1002;
			text = "Difficulty"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1006: RscText_cgqc
		{
			idc = 1006;
			text = "Patrols"; //--- ToDo: Localize;
			x = 13.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Patrols around the Objective"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
		};
		
		class RscText_1007: RscText_cgqc
		{
			idc = 1007;
			text = "Hunter Teams"; //--- ToDo: Localize;
			x = 9 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
			tooltip = "Teams of trackers actively hunting the player"; //--- ToDo: Localize;
		};
	};
};