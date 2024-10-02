// --- cfgVehicles ----------------------------------------------------------
// Vehicles definition. Yeah I know.

class B_UGV_01_F;
class B_UGV_01_rcws_F;
class B_T_UGV_01_olive_F;
class B_T_UGV_01_rcws_olive_F;
class UAV : Plane
{
    class NewTurret;
    class ViewPilot;
    class ViewOptics;
    class AnimationSources;
    class Components;
};
// Drones - Override fuel capacity
class UAV_01_base_F : Helicopter_Base_F // Darter
{
    fuelCapacity = 400;
    class Turrets{
        class MainTurret;
    };
};
class UAV_06_base_F : Helicopter_Base_F // Pelican
{
    fuelCapacity = 1000;
};
class UAV_03_base_F : Helicopter_Base_F // Falcon
{
    fuelCapacity = 400;
};
class UAV_02_base_F : UAV // Yabhon
{
    fuelCapacity = 2000;
};
class UAV_05_Base_F : UAV // Sentinel
{
    fuelCapacity = 2000;
};


class cgqc_vic_stomper_tan : B_UGV_01_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "";
    displayName = "Stomper - Tan (1)";
    maximumLoad = 2000;
    armor = 50;
    enginePower = 80;
    maxSpeed = 50;
    terrainCoef = 1.2;
    turnCoef = 4;
    precision = 10;
    acceleration = 15;
    armorStructural = 4;
    damageResistance = 0.00719;
    canFloat = 0;
    enableGPS = 1;
    killFriendlyExpCoef = 0.1;
    fuelExplosionPower = 2;
    wheelDamageThreshold = 0.7;
    wheelDestroyThreshold = 0.99;
    wheelDamageRadiusCoef = 0.95;
    wheelDestroyRadiusCoef = 0.75;
    //hiddenSelectionsTextures[] = {"\A3\Drones_F\soft_f_gamma\UGV_01\data\UGV_01_ext_co.paa","\A3\Drones_F\soft_f_gamma\UGV_01\data\UGV_01_int_co.paa","\A3\Data_F\Vehicles\Turret_co.paa"};
    #include "\CGQC\vehicles\cgqc_vic_loadout_medium.cpp"
};
class cgqc_vic_stomper_tan_a : B_UGV_01_rcws_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
    displayName = "Stomper Armed - Tan (1)";
    maximumLoad = 2000;
    armor = 50;
    enginePower = 80;
    maxSpeed = 50;
    #include "\CGQC\vehicles\cgqc_vic_loadout_medium.cpp"
};

class cgqc_vic_stomper_green : B_T_UGV_01_olive_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
    displayName = "Stomper - green (1)";
    maximumLoad = 2000;
    armor = 50;
    enginePower = 80;
    maxSpeed = 50;
    #include "\CGQC\vehicles\cgqc_vic_loadout_medium.cpp"
};
class cgqc_vic_stomper_green_a : B_T_UGV_01_rcws_olive_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
    displayName = "Stomper Armed - green (1)";
    maximumLoad = 2000;
    armor = 50;
    enginePower = 80;
    maxSpeed = 50;
    #include "\CGQC\vehicles\cgqc_vic_loadout_medium.cpp"
};

// Drones CGQC versions
class B_UAV_01_F : UAV_01_base_F{
    class Turrets : Turrets
    {
        class MainTurret : MainTurret
        {
            class OpticsIn;
        };
    };
    class sounds;
};
class cgqc_drone_darter : B_UAV_01_F
{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
    displayName = "CGQC - HQ Darter";
    camouflage = 0.01;
	audible = 0.05;
    maxSpeed = 250;
    fuelCapacity = 2000;
    liftForceCoef = 2.0;
	cyclicAsideForceCoef = 2.0;
	cyclicForwardForceCoef = 1.2;
    radarTargetSize = 0.05;
	visualTargetSize = 0.05;
	LockDetectionSystem = 12;
    incomingMissileDetectionSystem = 26;
    class SimpleObject
    {
        eden = 1;
        animate[] = {{"damagehide", 0}, {"rotorimpacthide", 0}, {"tailrotorimpacthide", 0}, {"propeller1_rotation", 0}, {"propeller1_blur_rotation", 0}, {"propeller2_rotation", 0}, {"propeller2_blur_rotation", 0}, {"propeller3_rotation", 0}, {"propeller3_blur_rotation", 0}, {"propeller4_rotation", 0}, {"propeller4_blur_rotation", 0}, {"propeller1_hide", 0}, {"propeller1_blur_hide", 0}, {"propeller2_hide", 0}, {"propeller2_blur_hide", 0}, {"propeller3_hide", 0}, {"propeller3_blur_hide", 0}, {"propeller4_hide", 0}, {"propeller4_blur_hide", 0}, {"mainturret", 0}, {"maingun", -0.05}};
        hide[] = {"zasleh", "tail rotor blur", "main rotor blur", "zadni svetlo", "clan", "podsvit pristroju", "poskozeni"};
        verticalOffset = 0.15;
        verticalOffsetWorld = -0.001;
        init = "''";
    };
    editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\B_UAV_01_F.jpg";
    _generalMacro = "cgqc_drone_darter";
    crew = "B_UAV_AI";
    typicalCargo[] = {"B_UAV_AI"};
    accuracy = 0.5;
    class assembleInfo
    {
        primary = 1;
        base = "";
        assembleTo = "";
        displayName = "";
        dissasembleTo[] = {"B_UAV_01_backpack_F"};
    };
    hiddenSelectionsTextures[] = {"\CGQC\vehicles\cgqc_drone_darter_dark.paa"};
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            class OpticsIn {
                class Wide {
                    opticsDisplayName = "W";
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.456;
                    minFov = 0.021875;
                    maxFov = 2.0;
                    directionStabilized = 1;
                    visionMode[] = {"Normal","NVG","Ti"};
                    thermalMode[] = {0,1};
                    gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
                };
            };
        };
    };
    class Sounds
    {
        class Engine
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_01",0.4466836,1.0,200};
            frequency = "rotorSpeed";
            volume = "(camPos*((rotorSpeed-0.72)*4))/3";
        };
        class RotorLowOut
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade",0.31622776,1.0,200};
            frequency = "rotorSpeed";
            volume = "(camPos*(0 max (rotorSpeed-0.1)))/3";
            cone[] = {1.6,3.14,1.6,0.95};
        };
        class RotorHighOut
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_high",0.31622776,1.0,250};
            frequency = "rotorSpeed";
            volume = "(camPos*10*(0 max (rotorThrust-0.9)))/3";
            cone[] = {1.6,3.14,1.6,0.95};
        };
        class EngineIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*((rotorSpeed-0.75)*4))/20";
        };
        class RotorLowIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*(0 max (rotorSpeed-0.1)))/20";
        };
        class RotorHighIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_high_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*3*(rotorThrust-0.9))/20";
        };
    };
};
// Override du deployable darter
class Rev_darter_b: B_UAV_01_F
{
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
    displayName = "CGQC - HQ Darter Deployed";
    camouflage = 0.01;
	audible = 0.05;
    maxSpeed = 250;
    fuelCapacity = 2000;
    liftForceCoef = 2.0;
	cyclicAsideForceCoef = 2.0;
	cyclicForwardForceCoef = 1.2;
    radarTargetSize = 0.05;
	visualTargetSize = 0.05;
	LockDetectionSystem = 12;
    incomingMissileDetectionSystem = 26;
    accuracy = 0.5;
    hiddenSelectionsTextures[] = {"\CGQC\vehicles\cgqc_drone_darter_dark.paa"};
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            class OpticsIn {
                class Wide {
                    opticsDisplayName = "W";
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.456;
                    minFov = 0.021875;
                    maxFov = 2.0;
                    directionStabilized = 1;
                    visionMode[] = {"Normal","NVG","Ti"};
                    thermalMode[] = {0,1};
                    gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
                };
            };
        };
    };
    class Sounds
    {
        class Engine
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_01",0.4466836,1.0,200};
            frequency = "rotorSpeed";
            volume = "(camPos*((rotorSpeed-0.72)*4))/3";
        };
        class RotorLowOut
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade",0.31622776,1.0,200};
            frequency = "rotorSpeed";
            volume = "(camPos*(0 max (rotorSpeed-0.1)))/3";
            cone[] = {1.6,3.14,1.6,0.95};
        };
        class RotorHighOut
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_high",0.31622776,1.0,250};
            frequency = "rotorSpeed";
            volume = "(camPos*10*(0 max (rotorThrust-0.9)))/3";
            cone[] = {1.6,3.14,1.6,0.95};
        };
        class EngineIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\quad_engine_full_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*((rotorSpeed-0.75)*4))/20";
        };
        class RotorLowIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*(0 max (rotorSpeed-0.1)))/20";
        };
        class RotorHighIn
        {
            sound[] = {"A3\Sounds_F\air\Uav_01\blade_high_int",0.56234133,1.0};
            frequency = "rotorSpeed";
            volume = "((1-camPos)*3*(rotorThrust-0.9))/20";
        };
    };
};

class cgqc_drone_darter_light : cgqc_drone_darter
{
    displayName = "CGQC - Darter Léger";
    maxSpeed = 100;
    fuelCapacity = 100;
    liftForceCoef = 1.0;
};

class B_W_MBT_01_TUSK_F;
class cgqc_vic_tank_merkava : B_W_MBT_01_TUSK_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    //hasDriver=-1;
    editorSubcategory = "EdSubcat_cgqc_vic_mbt";
    displayName = "Merkava (3+6)";
    crew = "CGQC_Soldat_Base";
    // Heavy ADS
    class EventHandlers {
        init = "['heavy', _this] call CGQC_fnc_addADS";
    };
};

//
class I_MRAP_03_F;
class cgqc_vic_fennec : I_MRAP_03_F{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    displayName = "Fennek (2+2)";
    crew = "CGQC_Soldat_Base";
    hiddenSelections[] = {"Camo1","Camo2"};
	hiddenSelectionsTextures[] = {
        "\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa",
        "\a3\data_f\vehicles\turret_indp_co.paa"};
    // Light ADS
    class EventHandlers {init = "['light', _this] call CGQC_fnc_addADS";};
};


class LOP_IRA_Landrover;
class cgqc_vic_rover : LOP_IRA_Landrover{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    displayName = "Land Rover (1+6)";
    crew = "CGQC_Soldat_Base";
    hiddenSelections[] = {"Camo1","Camo2"};
};

class LOP_TRK_Landrover_M2;
class cgqc_vic_rover2 : LOP_TRK_Landrover_M2{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_armed";
    displayName = "Land Rover M2(2+1)";
    crew = "CGQC_Soldat_Base";
    hiddenSelections[] = {"Camo1","Camo2"};
};


class I_MRAP_03_hmg_F;
class cgqc_vic_fennec_hmg : I_MRAP_03_hmg_F{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_armed";
    displayName = "Fennek HMG (3+1)";
    crew = "CGQC_Soldat_Base";
    hiddenSelections[] = {"Camo1","Camo2"};
	hiddenSelectionsTextures[] = {"\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa","\a3\data_f\vehicles\turret_indp_co.paa"};
    // Light ADS
    class EventHandlers {init = "['light', _this] call CGQC_fnc_addADS";};
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
        "\CGQC\CGQC\vehicles\cgqc_vic_construction_container.paa"
    };
	class EventHandlers
    {
    	init = "[_this] spawn CGQC_fnc_loadoutConstructionVic;[_this select 0, 'car'] spawn CGQC_fnc_addSpares";
    };
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
        init = "[_this, 0] call CGQC_fnc_refuelSetup";
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
        init = "[_this, 1] call CGQC_fnc_refuelSetup";
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

