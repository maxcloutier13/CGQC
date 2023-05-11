class Air;
class Car;
class Tank;
class B_T_Truck_01_box_F;

// Class overrides for spares/Acre settings
class Car_F : Car{
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack 1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", {"cargo", 0}, "external"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2: Rack_1 {
            displayName = "Rack 2"; // If you have multiple racks a text label helps identify the particular rack.
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
            displayName = "Rack 1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "gunner", "copilot", "external"}; // Attack helicopters have "gunner" copilots usually
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };

        class Rack_2: Rack_1 {
            displayName = "Rack 2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
};

// APC Acre settings--------------------------------------------------------------------------
class Wheeled_APC_F: Car_F {
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack 1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2 {
            displayName = "Rack 2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
     };
};
class Plane;
class Plane_Base_F: Plane {

};

class Tank_F: Tank {
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack 1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2 {
            displayName = "Rack 2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
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

// Objects ===================================================================================
// Helipad
class Land_HelipadSquare_F;
class cgqc_refuel_h : Land_HelipadSquare_F
{
    author = "silent1";
    //faction = "cgqc";
    //editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    _generalMacro = "cgqc_refuel_h";
    displayName = "CGQC Helipad - Standard";
    class EventHandlers
    {
        init = "[_this, 0] execVM '\cgqc\functions\fnc_refuel_setup.sqf'"; 
    };
};
class cgqc_refuel_h_short : Land_HelipadSquare_F
{
    author = "silent1";
    //faction = "cgqc";
    //editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    _generalMacro = "cgqc_refuel_h";
    displayName = "CGQC Helipad - Rapide";
    class EventHandlers
    {
        init = "[_this, 1] execVM '\cgqc\functions\fnc_refuel_setup.sqf'";  
    };
};
class cgqc_refuel_h_invis: cgqc_refuel_h
{
    displayName = "CGQC Helipad Invisible";
    model = "\A3\Structures_F\Mil\Helipads\HelipadEmpty_F.p3d";
};
class cgqc_refuel_h_short_invis: cgqc_refuel_h
{
    displayName = "CGQC Helipad Invisible - Rapide";
    model = "\A3\Structures_F\Mil\Helipads\HelipadEmpty_F.p3d";
};
// Whiteboards
class Land_MapBoard_F;
class cgqc_whiteboard_radios : Land_MapBoard_F
{
    _generalMacro = "MapBoard_altis_F";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Radios";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard_radio.paa"};
};
