// --- cfgVehicles ----------------------------------------------------------
// Vehicles definition. Yeah I know. 

class B_T_Truck_01_box_F;
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
