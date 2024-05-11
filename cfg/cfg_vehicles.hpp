// --- cfgVehicles ----------------------------------------------------------
// Vehicles definition. Yeah I know.

class B_UGV_01_F;
class B_UGV_01_rcws_F;
class B_T_UGV_01_olive_F;
class B_T_UGV_01_rcws_olive_F;

class sps_black_hornet_01_F {
    class Viewoptics;
    class Turrets{
        class MainTurret;
    };
};
class cgqc_black_hornet_01_F: sps_black_hornet_01_F {
    scope = 2;
    hiddenSelections[] = {"camo"};
    hiddenSelectionsTextures[] = {"x\SPS\Vehicles\sps_blackhornet\Data\Standard\SPS_BH_low_CO.paa"};
    displayName = "Black Hornet [CGQC]";
    descriptionShort = "Micro UAV";
    displaynameshort = "Black Hornet";
    picture = "\x\SPS\Vehicles\sps_blackhornet\Data\UI\sps_blackhornet_CA.paa";
    class Viewoptics: ViewOptics {
        initAngleX = 0;
        minAngleX = 0;
        maxAngleX = 0;
        initAngleY = 0;
        minAngleY = 0;
        maxAngleY = 0;
        minFov = 0.25;
        maxFov = 1.25;
        initFov = 0.75;
        visionMode[] = {"Normal","NVG", "Ti"};
        thermalMode[] = {0,1};
    };
    class Turrets: Turrets {
        class MainTurret: MainTurret {
            isCopilot = 0;
            minElev = -90;
            maxElev = 3;
            initElev = -3;
            minTurn = -360;
            maxTurn = 360;
            initTurn = 0;
            maxHorizontalRotSpeed = 10.0;
            maxVerticalRotSpeed = 10.0;
            body = "mainTurret";
            gun = "mainGun";
            animationSourceBody = "mainTurret";
            animationSourceGun = "mainGun";
            class OpticsIn {
                class Wide {
                    opticsDisplayName = "W";
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.5;
                    minFov = 0.5;
                    maxFov = 0.5;
                    directionStabilized = 1;
                    visionMode[] = {"Normal","NVG","Ti"};
                    thermalMode[] = {0,1};
                    gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
                };
                class Medium: Wide {
                    opticsDisplayName = "M";
                    initFov = 0.1;
                    minFov = 0.1;
                    maxFov = 0.1;
                    gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_medium_F.p3d";
                };
                class Narrow: Wide {
                    opticsDisplayName = "N";
                    initFov = 0.0286;
                    minFov = 0.0286;
                    maxFov = 0.0286;
                    gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_narrow_F.p3d";
                };
            };
            class OpticsOut {
                class Monocular {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 1.1;
                    minFov = 0.133;
                    maxFov = 1.1;
                    visionMode[] = {"Normal","NVG"};
                    gunnerOpticsModel = "";
                    gunnerOpticsEffect[] = {};
                };
            };
            inGunnerMayFire = 1;
            outGunnerMayFire = 1;
            commanding = -1;
            primaryGunner = 1;
            memoryPointGun = "PiP0_dir";
            memoryPointGunnerOptics = "PiP0_pos";
            gunnerOpticsModel = "A3\drones_f\Weapons_F_Gamma\Reticle\UGV_01_Optics_Gunner_F.p3d";
            gunnerForceOptics = 1;
            turretInfoType = "RscOptics_UAV_gunner";
            stabilizedInAxes = 3;
            weapons[] = {"Laserdesignator_mounted_blank"};
            magazines[] = {"Laserbatteries"};
            soundServo[] = {"A3\Sounds_F\vehicles\air\noises\servo_drone_turret_2",0.01,0.065,4};
            soundServoVertical[] = {"A3\Sounds_F\vehicles\air\noises\servo_drone_turret_2",0.01,0.065,4};
            GunnerCompartments = "Compartment1";
            LODTurnedIn = -1;
            LODTurnedOut = -1;
        };
    };

    class UserActions
    {
        class sps_black_hornet_Pickup
        {
            displayNameDefault = "Pick Up Black Hornet";
            priority = 6;
            showWindow = 1;
            hideOnUse = 1;
            displayName = "Pick Up Black Hornet";
            position = "action";
            radius = 6.5;
            onlyForPlayer = 1;
            condition = " this == cursorObject && SPS_BlackHornet_EnableVanillaScrollWheel && alive this && player == vehicle player && player canadd ""cgqc_black_hornet_01_Static_F"" ";
            statement = "player addItem 'cgqc_black_hornet_01_Static_F'; deleteVehicle this";
        };
    };
};

class cgqc_vic_stomper_tan : B_UGV_01_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_drones";
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

class B_W_MBT_01_TUSK_F;
class cgqc_vic_tank_merkava : B_W_MBT_01_TUSK_F {
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
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
    	init = "[_this] call CGQC_fnc_loadoutConstructionVic;if (isServer) then {[_this select 0, 'car'] call CGQC_fnc_addSpares}";
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


