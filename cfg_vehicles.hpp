class Air;
class Car;
class Tank;
class B_T_Truck_01_box_F;
class B_G_Van_02_transport_F;
class Offroad_01_military_comms_base_F;
class I_C_Offroad_02_LMG_F;
class I_C_Offroad_02_unarmed_F;
class I_C_Offroad_02_AT_F;

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

// == Command vics ======================================================================================
class cgqc_vic_van_transport: B_G_Van_02_transport_F
{
    scope = 2;
    scopeCurator = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    _generalMacro = "cgqc_vic_van_transport";
    editorSubcategory = "EdSubcat_cgqc_cmd";
    displayName = "Van Transport (1+10)";
    crew = "CGQC_Soldat_Base";
    typicalCargo[] = {"CGQC_Soldat_Base"};
    hiddenSelectionsTextures[] = {
        "a3\soft_f_orange\van_02\data\van_body_fia_03_co.paa",
        "a3\soft_f_orange\van_02\data\van_wheel_transport_co.paa",
        "a3\soft_f_orange\van_02\data\van_glass_transport_ca.paa",
        "a3\soft_f_orange\van_02\data\van_body_fia_03_co.paa"};
   // textureList[] = {"FIA3",1,"FIA2",1,"FIA1",1};
};
class cgqc_vic_offroad_comms : Offroad_01_military_comms_base_F
{
    scope = 2;
    scopeCurator = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    _generalMacro = "cgqc_vic_van_transport";
    editorSubcategory = "EdSubcat_cgqc_cmd";
    displayName = "Offroad Comms (1+1)";
    crew = "CGQC_Soldat_Base";
    typicalCargo[] = {"CGQC_Soldat_Base"};
    class SimpleObject
    {
        eden = 1;
        animate[] = {{"damagehide",0},{"damagehidevez",0},{"damagehidehlaven",0},{"wheel_1_1_destruct",0},{"wheel_1_2_destruct",0},{"wheel_1_3_destruct",0},{"wheel_1_4_destruct",0},{"wheel_2_1_destruct",0},{"wheel_2_2_destruct",0},{"wheel_2_3_destruct",0},{"wheel_2_4_destruct",0},{"wheel_1_1_destruct_unhide",0},{"wheel_1_2_destruct_unhide",0},{"wheel_1_3_destruct_unhide",0},{"wheel_1_4_destruct_unhide",0},{"wheel_2_1_destruct_unhide",0},{"wheel_2_2_destruct_unhide",0},{"wheel_2_3_destruct_unhide",0},{"wheel_2_4_destruct_unhide",0},{"wheel_1_3_damage",0},{"wheel_1_4_damage",0},{"wheel_2_3_damage",0},{"wheel_2_4_damage",0},{"wheel_1_3_damper_damage_backanim",0},{"wheel_1_4_damper_damage_backanim",0},{"wheel_2_3_damper_damage_backanim",0},{"wheel_2_4_damper_damage_backanim",0},{"glass1_destruct",0},{"glass2_destruct",0},{"glass4_destruct",0},{"glass5_destruct",0},{"glass6_destruct",0},{"wheel_1_1",0},{"wheel_2_1",0},{"wheel_1_2",0},{"wheel_2_2",0},{"pedal_thrust",0},{"pedal_brake",0},{"wheel_1_1_damage",0},{"wheel_1_2_damage",0},{"wheel_2_1_damage",0},{"wheel_2_2_damage",0},{"wheel_1_1_damper_damage_backanim",0},{"wheel_1_2_damper_damage_backanim",0},{"wheel_2_1_damper_damage_backanim",0},{"wheel_2_2_damper_damage_backanim",0},{"wheel_1_1_damper",0},{"wheel_2_1_damper",0},{"wheel_1_2_damper",0},{"wheel_2_2_damper",0},{"hide_dashboard_door_l",0},{"hide_dashboard_door_r",0},{"hide_daylights",0},{"hide_reverselights",0},{"hide_rearlights",0},{"hide_rearlights_tailgate",0},{"gunnerlf",0},{"gunnerlf_pos",0},{"gunnerrf",0},{"gunnerrf_pos",0},{"damagehidegunner_rf",0},{"damagehidegunner_lf",0},{"drivingwheel",0},{"steering_1_1",0},{"steering_2_1",0},{"indicatorspeed",0},{"damagehidemph",0},{"fuel",1},{"damagehidefuel",0},{"indicatorrpm",0},{"damagehiderpm",0},{"prop_02",0},{"damagehidetemp",0},{"damagehidedoor1",0},{"damagehideglass2",0},{"damagehidepolice",0},{"damagehidebackpack_proxy",0},{"reverse_light",1},{"daylights",0},{"beacon1",63.47},{"beaconsstart",0},{"beaconsservicesstart",0},{"beacon2",63.47},{"beacon3",63.47},{"beacon4",63.47},{"beacon5",63.47},{"beacon6",63.47},{"beacons1",63.47},{"beacons2",63.47},{"beacons3",63.47},{"beacons4",63.47},{"antenna_1_1_gmeterx",0},{"antenna_1_1_gmeterx2",0},{"antenna_1_1_gmetery",0},{"antenna_1_1_gmeterz",0},{"antenna_1_1_horizondive",-0.02},{"antenna_1_1_horizonbank",0},{"antenna_1_1_damper0_x",0},{"antenna_1_1_damper0_y",0},{"antenna_1_2_gmeterx",0},{"antenna_1_2_gmeterx2",0},{"antenna_1_2_gmetery",0},{"antenna_1_2_gmeterz",0},{"antenna_1_2_horizondive",-0.02},{"antenna_1_2_horizonbank",0},{"antenna_1_2_damper_x",0},{"antenna_1_2_damper_y",0},{"antenna_1_3_gmeterx",0},{"antenna_1_3_gmeterx2",0},{"antenna_1_3_gmetery",0},{"antenna_1_3_gmeterz",0},{"antenna_1_3_horizondive",-0.02},{"antenna_1_3_horizonbank",0},{"antenna_1_3_damper_x",0},{"antenna_1_3_damper_y",0},{"antenna_1_4_gmeterx",0},{"antenna_1_4_gmeterx2",0},{"antenna_1_4_gmetery",0},{"antenna_1_4_gmeterz",0},{"antenna_1_4_horizondive",-0.02},{"antenna_1_4_horizonbank",0},{"antenna_1_4_damper_x",0},{"antenna_1_4_damper_y",0},{"antenna_2_1_gmeterx",0},{"antenna_2_1_gmeterx2",0},{"antenna_2_1_gmetery",0},{"antenna_2_1_gmeterz",0},{"antenna_2_1_horizondive",-0.02},{"antenna_2_1_horizonbank",0},{"antenna_2_1_damper_x",0},{"antenna_2_1_damper_y",0},{"antenna_2_2_gmeterx",0},{"antenna_2_2_gmeterx2",0},{"antenna_2_2_gmetery",0},{"antenna_2_2_gmeterz",0},{"antenna_2_2_horizondive",-0.02},{"antenna_2_2_horizonbank",0},{"antenna_2_2_damper_x",0},{"antenna_2_2_damper_y",0},{"antenna_2_3_gmeterx",0},{"antenna_2_3_gmeterx2",0},{"antenna_2_3_gmetery",0},{"antenna_2_3_gmeterz",0},{"antenna_2_3_horizondive",-0.02},{"antenna_2_3_horizonbank",0},{"antenna_2_3_damper_x",0},{"antenna_2_3_damper_y",0},{"antenna_2_4_gmeterx",0},{"antenna_2_4_gmeterx2",0},{"antenna_2_4_gmetery",0},{"antenna_2_4_gmeterz",0},{"antenna_2_4_horizondive",-0.02},{"antenna_2_4_horizonbank",0},{"antenna_2_4_damper_x",0},{"antenna_2_4_damper_y",0},{"hidecover",0},{"hideantennas2",0},{"beaconlighthide",0},{"opendoor3",0},{"opendoor3_tailgate",0},{"glass3_destruct",0},{"light_1_rot",63.47}};
        hide[] = {"clan","dashboard","zasleh","light_l","light_r","light_1_hide","light_spotlight","zadni svetlo","brzdove svetlo","podsvit pristroju","poskozeni"};
        verticalOffset = 1.614;
        verticalOffsetWorld = -0.103;
        postinit = "[this, '', []] call bis_fnc_initVehicle";
    };
    editorPreview = "\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\B_GEN_Offroad_01_comms_F.jpg";
    weapons[] = {"PoliceHorn"};
    textureList[] = {"Gendarmerie",1};
    hiddenSelectionsTextures[] = {
        "\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa",
        "\A3\Soft_F_Exp\Offroad_01\Data\Offroad_01_ext_gen_CO.paa",
        "\a3\Soft_F_Enoch\Offroad_01\Data\offroad_01_cover_gen_co.paa"};
    animationList[] = {"HideCover",0,"HideDoor3",0,"HideBumper1",1,"HideBumper2",0};
};

// == Wranglers ======================================================================================
class cgqc_vic_wrangler : I_C_Offroad_02_unarmed_F
{
    scope = 2;
    scopeCurator = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    _generalMacro = "cgqc_vic_wrangler";
    editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    displayName = "Jeep Wrangler (1+3)";
    crew = "CGQC_Soldat_Base";
    typicalCargo[] = {"CGQC_Soldat_Base"};
    hiddenSelectionsTextures[] = {
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
    hiddenSelectionsMaterials[] = {"\a3\soft_f_exp\offroad_02\data\offroad_02_ext_2_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_ext_chrome.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_chrome.rvmat"};
    animationList[] = {"hideLeftDoor",0.7,"hideRightDoor",0.7,"hideRearDoor",0.4,"hideBullbar",0.3,"hideFenders",0.7,"hideHeadSupportFront",0.5,"hideHeadSupportRear",0.7,"hideRollcage",0.7,"hideSpareWheel",0.8,"hideSeatsRear",0};
};

class cgqc_vic_wrangler_lmg : I_C_Offroad_02_LMG_F
{
    scope = 2;
    scopeCurator = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    _generalMacro = "I_C_Offroad_02_LMG_F";
    editorSubcategory = "EdSubcat_cgqc_vic_armed";
    displayName = "Jeep Wrangler LMG (2+1)";
    crew = "CGQC_Soldat_Base";
    typicalCargo[] = {"CGQC_Soldat_Base"};
    hiddenSelectionsTextures[] = {
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
    hiddenSelectionsMaterials[] = {"\a3\soft_f_exp\offroad_02\data\offroad_02_ext_2_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_ext_chrome.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_chrome.rvmat"};
};

class cgqc_vic_wrangler_at : I_C_Offroad_02_AT_F
{
    scope = 2;
    scopeCurator = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    _generalMacro = "I_C_Offroad_02_LMG_F";
    editorSubcategory = "EdSubcat_cgqc_vic_armed";
    displayName = "Jeep Wrangler AT (2+1)";
    crew = "CGQC_Soldat_Base";
    typicalCargo[] = {"CGQC_Soldat_Base"};
    hiddenSelectionsTextures[] = {
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa",
        "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_int_olive_co.paa"};
    hiddenSelectionsMaterials[] = {"\a3\soft_f_exp\offroad_02\data\offroad_02_ext_2_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_ext_chrome.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_metal.rvmat","\a3\soft_f_exp\offroad_02\data\offroad_02_int_chrome.rvmat"};
};

// == Construction ======================================================================================
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
