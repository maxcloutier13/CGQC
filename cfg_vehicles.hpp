// --- cfgVehicles ----------------------------------------------------------
// Vehicles definition. Yeah I know. 

class B_W_MBT_01_TUSK_F;
class cgqc_vic_tank_merkava : B_W_MBT_01_TUSK_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_mbt";
    displayName = "Merkava (3+6)";
    crew = "CGQC_Soldat_Base";
};
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
class Land_MapBoard_01_Wall_F;

class cgqc_wallboard_air: Land_MapBoard_01_Wall_F
{
    _generalMacro = "cgqc_wallboard_air";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Wallboard - Aérien";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_aerien.paa"};
};
class cgqc_wallboard_koth: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_koth";
    displayName = "Wallboard - KOTH";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_koth.paa"};
};
class cgqc_wallboard_classroom: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_classroom";
    displayName = "Wallboard - Classroom";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_classroom.paa"};
};
class cgqc_wallboard_med_equip: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_med_equip";
    displayName = "Wallboard - Medical Equipment";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_med_equip.paa"};
};
class cgqc_wallboard_medfirstaid: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_medfirstaid";
    displayName = "Wallboard - First Aid";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_med_firstaid.paa"};
};
class cgqc_wallboard_parachute: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_parachute";
    displayName = "Wallboard - Parachute";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_parachute.paa"};
};
class cgqc_wallboard_windk: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_windk";
    displayName = "Wallboard - Wind";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_windk.paa"};
};
class cgqc_wallboard_radios: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_radios";
    displayName = "Wallboard - Radios";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_radios.paa"};
};
class cgqc_wallboard_maps: cgqc_wallboard_air {
    _generalMacro = "cgqc_wallboard_maps";
    displayName = "Wallboard - Map Switching";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_maps.paa"};
};

class cgqc_whiteboard_air : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_air";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Aérien";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_aerien.paa"};
};

class cgqc_whiteboard_koth : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_koth";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - KOTH";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_koth.paa"};
};

class cgqc_whiteboard_med_equip : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_med_equip";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Medical Equipment";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_med_equip.paa"};
};
class cgqc_whiteboard_medfirstaid : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_medfirstaid";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Medical Firstaid";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_med_firstaid.paa"};
};
class cgqc_whiteboard_parachute : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_parachute";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Parachute";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_parachute.paa"};
};
class cgqc_whiteboard_windk : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_windk";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - WindKnots";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_windk.paa"};
};
class cgqc_whiteboard_radios : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_radios";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Radios";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_radios.paa"};
};
class cgqc_whiteboard_maps : Land_MapBoard_F
{
    _generalMacro = "cgqc_whiteboard_maps";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Whiteboard - Maps";
    hiddenSelectionsTextures[] = {"\CGQC\textures\whiteboard\whiteboard_maps.paa"};
};

class Land_BriefingRoomDesk_01_F;
class cgqc_briefing_table : Land_BriefingRoomDesk_01_F
{
    _generalMacro = "cgqc_briefing_table";
    scope = 2;
    scopeCurator = 2;
    editorSubcategory = "EdSubcat_cgqc_logistics";
    displayName = "Briefing Table";
    hiddenSelectionsTextures[] = {"\cgqc\textures\screen\screen_logo.paa"};
    class EventHandlers
    {
       // init = "[_this] execVM '\CGQC\functions\fnc_tableSetup.sqf'";
    };
};


