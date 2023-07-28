class XtdGearModels
{
	class CfgVehicles
	{};
	class CfgWeapons
	{
		// Berets ------------------------------------
		class CGQC_Berets 
		{
			options[] = {"Color"};
			label = "CGQC Berets";
			class Color
			{
				alwaysSelectable = 1;
				values[] = {"Black","Blue","Green", "Red","Gray","Yellow", "Orange"};
			};
		};
		// Beanie -------------------------------------
		class CGQC_Beanies
		{
			options[] = {"Color"};
			label = "CGQC Beanies";
			class Color
			{
				alwaysSelectable = 1;
				values[] = {"Black", "Coyote","Khaki", "Green", "Sage"};
			};
		};
		// Heli helmets -----------------------------
		class CGQC_Heli_Helmets 
		{
			options[] = {"Camo", "Type", "Type_c"};
			label = "CGQC Heli Helmet";
			class Camo
			{
				alwaysSelectable = 1;
				values[] = {"Blk", "OD", "Woodland"};
			};
            class Type
			{
				label = "Type";
				alwaysSelectable = 1;
				values[] = {"Pilot", "Crew"};
			};
			class Type_c
			{
				label = "Custom";
				alwaysSelectable = 1;
				values[] = {"None", "Cloutier", "Villeneuve", "Audi", "Turcotte", "Comeau"};
			};
		};
		// Uniforms -------------------------------
		class CGQC_Uniform
		{
			options[] = {"Camo"};
			label = "CGQC Uniform";
			class Camo
			{
				alwaysSelectable = 1;
				values[] = {"RGR", "TAN","MC","CADPAT","Blk","WHT"};
			};
		};
		// Vests -------------------------------
		class CGQC_ChestRig
		{
			options[] = {"Type", "Camo"};
			label = "CGQC Chest Rig";
			class Camo
			{
				alwaysSelectable = 1;
				values[] = {"TAN","MC","RGR","Blk","WHT"};
			};
            class Type
			{
				label = "Type";
				alwaysSelectable = 1;
				values[] = {"Rifleman","MG","Grenadier","Recce"};
			};
		};
		class CGQC_Pilotvest
		{
			options[] = {"Camo"};
			label = "CGQC Pilot Vest";
			class Camo
			{
				alwaysSelectable = 1;
				values[] = {"OD","Blk"};
			};
		};
	};
};
class XtdGearInfos
{
	class CfgVehicles
	{
		
	};

    class CfgWeapons
    {
		// Berets --------------------------------------------------------------------
		class cgqc_beret_vanilla
		{
            model = "CGQC_Berets";
			Color = "Black";
        };
		class cgqc_beret_blue
		{
            model = "CGQC_Berets";
			Color = "Blue";
        };
		class cgqc_beret_green
		{
            model = "CGQC_Berets";
			Color = "Green";
        };
		class cgqc_beret_red
		{
            model = "CGQC_Berets";
			Color = "Red";
        };
		class cgqc_beret_gray
		{
            model = "CGQC_Berets";
			Color = "Gray";
        };
		class cgqc_beret_yellow
		{
            model = "CGQC_Berets";
			Color = "Yellow";
        };
		class cgqc_beret_orange
		{
            model = "CGQC_Berets";
			Color = "Orange";
        };
		// Beanies -------------------------------------------------------------------
		class cgqc_beanie_black
		{
            model = "CGQC_Beanies";
			Color = "Black";
        };
		class cgqc_beanie_coyote
		{
            model = "CGQC_Beanies";
			Color = "Coyote";
        };
		class cgqc_beanie_khaki
		{
            model = "CGQC_Beanies";
			Color = "Khaki";
        };
		class cgqc_beanie_green
		{
            model = "CGQC_Beanies";
			Color = "Green";
        };
		class cgqc_beanie_sage
		{
            model = "CGQC_Beanies";
			Color = "Sage";
        };
		// Heli helmets -------------------------------------------------------------
		class cgqc_helmet_heli_black
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "None";
        };
		class cgqc_helmet_crew_black
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "None";
        };
		class cgqc_helmet_heli_green
		{
            model = "CGQC_Heli_Helmets";
			Camo = "OD";
			Type = "Pilot";
			Type_c = "None";
        };
		class cgqc_helmet_crew_green
		{
            model = "CGQC_Heli_Helmets";
			Camo = "OD";
			Type = "Crew";
			Type_c = "None";
        };
		class cgqc_helmet_heli_wood
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Woodland";
			Type = "Pilot";
			Type_c = "None";
        };
		class cgqc_helmet_crew_wood
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Woodland";
			Type = "Crew";
			Type_c = "None";
        };
		class cgqc_helmet_heli_black_cloutier
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "Cloutier";
        };
		class cgqc_helmet_crew_black_cloutier
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "Cloutier";
        };
		class cgqc_helmet_heli_black_villeneuve
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "Villeneuve";
        };
		class cgqc_helmet_crew_black_villeneuve
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "Villeneuve";
        };
		class cgqc_helmet_heli_black_audi
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "Audi";
        };
		class cgqc_helmet_crew_black_audi
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "Audi";
        };
		class cgqc_helmet_heli_black_turcotte
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "Turcotte";
        };
		class cgqc_helmet_crew_black_turcotte
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "Turcotte";
        };
		class cgqc_helmet_heli_black_comeau
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Pilot";
			Type_c = "Comeau";
        };
		class cgqc_helmet_crew_black_comeau
		{
            model = "CGQC_Heli_Helmets";
			Camo = "Blk";
			Type = "Crew";
			Type_c = "Comeau";
        };
		
		// Uniform ------------------------------------------------------------------
		class cgqc_uniform_mk1
		{
            model = "CGQC_Uniform";
			Camo = "RGR";
        };
    };
};
