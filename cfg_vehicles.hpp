class Air;
class Car;
class Tank;
class B_T_Truck_01_box_F;

// Class overrides for spares/Acre settings
class Car_F : Car{
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Dash Upper"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", {"cargo", 0}, "external"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
        class Rack_2: Rack_1 {
            displayName = "Dash Lower"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
    class EventHandlers
    {
         init = "[_this select 0, 'car'] execVM '\cgqc\functions\fnc_addSpares.sqf'";
    };
};

class Helicopter : Air
{
    class ViewPilot;
    class Turrets;
    class HitPoints {
        class HitGlass1;
        class HitGlass2;
        class HitGlass3;
        class HitGlass4;
        class HitGlass5;
        class HitGlass6;
        class HitHull;
        class HitEngine;
        class HitAvionics;
    };
    class EventHandlers {
        init = "[_this select 0, 'air'] execVM '\cgqc\functions\fnc_addSpares.sqf';";
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Dash Upper"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "gunner", "copilot", "external"}; // Attack helicopters have "gunner" copilots usually
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };

        class Rack_2: Rack_1 {
            displayName = "Dash Lower"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
};

// APC Acre settings--------------------------------------------------------------------------
class Wheeled_APC_F: Car_F {
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Dash Upper"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
        class Rack_2 {
            displayName = "Dash Lower"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
     };
};

class Tank_F: Tank {
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Dash Upper"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
        class Rack_2 {
            displayName = "Dash Lower"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
    };
    class EventHandlers
    {
         init = "[_this select 0, 'tank'] execVM '\cgqc\functions\fnc_addSpares.sqf'";
    };
};

class cgqc_vic_construction : B_T_Truck_01_box_F
{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    displayName = "HEMTT de Construction - Outpost (2)";
    crew = "CGQC_Soldat_Base";
	textureList[] = {"Olive",1};
		hiddenSelectionsTextures[] = {
			"\a3\soft_f_Exp\truck_01\data\truck_01_ext_01_olive_co.paa",
			"\a3\soft_f_Exp\truck_01\data\truck_01_ext_02_olive_co.paa",
			"\A3\Soft_F_Exp\Truck_01\Data\truck_01_ammo_olive_CO.paa",
			"\CGQC\vehicles\cgqc_vic_construction_container.paa"
		};
	class EventHandlers
    {
    	init = "[_this] execVM '\cgqc\vehicles\loadout_construction.sqf';[_this select 0, 'car'] execVM '\cgqc\functions\fnc_addSpares.sqf'"; 
    };
    //#include "vehicles\cgqc_vic_loadout_construction.sqf"
};

// CQB Laptop--------------------------------------------------------------------------
class Land_Laptop_03_base_F;
class cqgc_item_cgcLaptop: Land_Laptop_03_base_F
	{
		author = "silent1";
		class SimpleObject
		{
			eden = 1;
			animate[] = {};
			hide[] = {};
			verticalOffset = 0.167;
			verticalOffsetWorld = 0;
			init = "[this, '', []] call bis_fnc_initVehicle";
		};
		editorPreview = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_Laptop_03_black_F.jpg";
		_generalMacro = "cqgc_item_cgcLaptop";
		scope = 2;
		scopeCurator = 2;
		displayName = "CGQC Laptop CQB";
		hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\Laptop_03_black_CO.paa"};
        class EventHandlers
        {
            init = "_this execVM '\cgqc\functions\fnc_cqbHouse_menu.sqf'"; 
        };
    };