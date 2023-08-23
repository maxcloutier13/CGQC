//--- Convoy
#define IDC_CONVOY 1323002
#define IDC_CONVOY_CBO_SPEED	3834
#define IDC_CONVOY_CBO_DISTANCE	3836
#define IDC_CONVOY_CBO_BEHAVIOR	3837
#define IDC_CONVOY_CBO_VIC1	3838
#define IDC_CONVOY_CBO_VIC2	3839
#define IDC_CONVOY_CBO_VIC3	3840
#define IDC_CONVOY_CBO_VIC4	3841
#define IDC_CONVOY_CBO_VIC5	3842
#define IDC_CONVOY_CBO_VIC6	3843
#define IDC_CONVOY_BTN_OK		4334
#define IDC_CONVOY_BTN_CANCEL	4434

class RscCGQCConvoy {
	idd = 1323002;
	//onLoad = "[] call cgqc_fnc_training_landnav_reset;";
	//onUnload = "[] call CGQC_fnc_landnav_start;";
	
	class controlsBackground {
		class frm_background: RscFrame
		{
			idc = 1800;
			x = 6.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 27.5 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};
	class Controls {
		class btn_ok: RscButtonMenuOK
		{
			text = "Start"; //--- ToDo: Localize;
			x = 29 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			tooltip = "Start training session with current options"; //--- ToDo: Localize;
			onButtonClick = "[] call CGQC_fnc_convoy_spawn;closeDialog IDC_CONVOY;";
		};

		class cbo_speed: RscCombo_cgqc
		{
			idc = 2100;
			text = "Speed of convoy"; //--- ToDo: Localize;
			x = 26.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Speed of Convoy"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					value = 0;
				};
				class speed_3
				{
					text = "30km/h";
					default = 0;
					value = 30;
				};
				class speed_4
				{
					text = "40km/h";
					default = 0;
					value = 40;
				};
				class speed_5
				{
					text = "50km/h";
					default = 1;
					value = 1;
				};
				class speed_6
				{
					text = "60km/h";
					default = 0;
					value = 2;
				};
				class speed_7
				{
					text = "70km/h";
					default = 0;
					value = 3;
				};
				class speed_8
				{
					text = "80km/h";
					default = 0;
					value = 4;
				};
				class speed_9
				{
					text = "90km/h";
					default = 0;
					value = 5;
				};
				class speed_0
				{
					text = "100km/h";
					default = 0;
					value = 5;
				};
			};
			onLBSelChanged = "cgqc_training_convoy_speed = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_distance: RscCombo_cgqc
		{
			idc = 2102;
			text = "Distance"; //--- ToDo: Localize;
			x = 26.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Distance between vehicles"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					value = 0;
				};
				class dist_5
				{
					text = "5m";
					default = 0;
					value = 30;
				};
				class dist_10
				{
					text = "10m";
					default = 0;
					value = 40;
				};
				class dist_15
				{
					text = "15m";
					default = 1;
					value = 1;
				};
				class dist_20
				{
					text = "20m";
					default = 0;
					value = 2;
				};
				class dist_25
				{
					text = "25m";
					default = 0;
					value = 3;
				};
			};
			onLBSelChanged = "cgqc_training_convoy_distance = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_behavior: RscCombo_cgqc
		{
			idc = 2103;
			text = "Behavior"; //--- ToDo: Localize;
			x = 20.5 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Behavior of convoy when contact is made"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 1;
					value = 0;
				};
				class stop
				{
					text = "Aware";
					default = 0;
					value = 1;
				};
				class go
				{
					text = "Push through";
					default = 0;
					value = 2;
				};
			};
			onLBSelChanged = "cgqc_training_convoy_behavior = (_this select 0) lbValue (_this select 1);";
		};
		class cbo_vic1: RscCombo_cgqc
		{
			idc = 3838;
			text = "Vic 1"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 1"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 1;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 0;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [0, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_vic2: RscCombo_cgqc
		{
			idc = 2105;
			text = "Vic 2"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 2"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 1;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 0;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [1, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_vic3: RscCombo_cgqc
		{
			idc = 2106;
			text = "Vic 3"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 3"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 1;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 0;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [2, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_vic4: RscCombo_cgqc
		{
			idc = 2107;
			text = "Vic 4"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 4"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 1;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 0;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [3, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_vic5: RscCombo_cgqc
		{
			idc = 2108;
			text = "Vic 5"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 5"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 1;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [4, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_vic6: RscCombo_cgqc
		{
			idc = 2109;
			text = "Vic 6"; //--- ToDo: Localize;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Vehicle type 6"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class random
				{
					text = "Random";
					default = 0;
					data = "random";
				};
				class nothing
				{
					text = "Nothing";
					default = 1;
					data = "nothing";
				};
				class tank
				{
					text = "Tank";
					default = 0;
					data = "cgqc_pax_opfor_vic_tank";
				};
				class apc
				{
					text = "APC";
					default = 0;
					data = "cgqc_pax_opfor_vic_apc";
				};
				class squad
				{
					text = "Transport (Squad)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_squad";
				};
				class team
				{
					text = "Transport (Team)";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_team";
				};
				class fuel
				{
					text = "Fuel Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_fuel";
				};
				class ammo
				{
					text = "Ammo Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_ammo";
				};
				class repair
				{
					text = "Repair Truck";
					default = 0;
					data = "cgqc_pax_opfor_vic_transport_repair";
				};
				class tech_mg
				{
					text = "Technical (MG)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_mg";
				};
				class tech_gl
				{
					text = "Technical (GL)";
					default = 0;
					data = "cgqc_pax_opfor_vic_technical_gl";
				};
			};
			onLBSelChanged = "cgqc_training_convoy_vics set [5, (_this select 0) lbData (_this select 1)];";
		};
		class cbo_debug: RscCombo_cgqc
		{
			idc = 2104;
			text = "Debug"; //--- ToDo: Localize;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Activate debug mode for troubleshooting"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
			class Items
			{
				class false
				{
					text = "false";
					default = 1;
					value = 0;
				};
				class true
				{
					text = "true";
					default = 0;
					value = 1;
				};
			};
			onLBSelChanged = "cgqc_training_convoy_debug = (_this select 0) lbValue (_this select 1);";
		};

		class RscText_1006: RscText_cgqc
		{
			idc = 1006;
			text = "Debug"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 23 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			tooltip = "Patrols around the Objective"; //--- ToDo: Localize;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1003: RscText_cgqc
		{
			idc = 1003;
			text = "Vic 2"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1007: RscText_cgqc
		{
			idc = 1007;
			text = "Vic 3"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 14 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1008: RscText_cgqc
		{
			idc = 1008;
			text = "Vic 4"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1009: RscText_cgqc
		{
			idc = 1009;
			text = "Vic 5"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1010: RscText_cgqc
		{
			idc = 1010;
			text = "Vic 6"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 20 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1000: RscText_cgqc
		{
			idc = 1000;
			text = "Convoy Speed"; //--- ToDo: Localize;
			x = 15.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 10 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1004: RscText_cgqc
		{
			idc = 1004;
			text = "Distance between vehicles"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 18.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1005: RscText_cgqc
		{
			idc = 1005;
			text = "Behavior"; //--- ToDo: Localize;
			x = 13 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
		};
		class RscText_1002: RscText_cgqc
		{
			idc = 1002;
			text = "Vic 1"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 4.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 2 * GUI_GRID_H;
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
			text = "Convoy Ambush"; //--- ToDo: Localize;
			x = 9.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 21.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
			sizeEx = 4 * GUI_GRID_H;
		};

	};
};


