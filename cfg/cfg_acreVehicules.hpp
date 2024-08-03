// --- acreVehicules ----------------------------------------------------------
// All the vehicle acre bullshit
class VTOL_01_base_F;
class Boat_F;
class StaticWeapon;
class ACE_SelfActions;
class StaticMortar;
class Mortar_01_base_F: StaticMortar {
    class ACE_SelfActions: ACE_SelfActions	{
        class CGQC_ACE_CSW_FireMode_Lever		{
            displayName = "Switch to Lever Fire";
            statement = "_target setVariable ['CGQC_mortar_dropFireMode', false, true]";
            condition = "_target getVariable ['CGQC_mortar_dropFireMode', false] && gunner _target == player";
        };
        class CGQC_ACE_CSW_FireMode_Drop			{
            displayName = "Switch to Drop Fire";
            statement = "_target setVariable ['CGQC_mortar_dropFireMode', true, true]";
            condition = "!(_target getVariable ['CGQC_mortar_dropFireMode', false]) && gunner _target == player";
        };
    };
    class EventHandlers        {
        reloaded = "[_this] spawn CGQC_fnc_mortar";
    };
};

#define MACRO_CGQC_SPEEDLIMITER \
    class cgqc_ace_vic_limiter { \
        displayName = "Speed limiter"; \
        condition = "_player == driver _target"; \
        statement = ""; \
        class cgqc_ace_vic_limiter_1 { \
            displayName = "Walking (6)"; \
            condition = "true"; \
            statement = "[6, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_2 { \
            displayName = "Gun Up (11)"; \
            condition = "true"; \
            statement = "[11, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_3 { \
            displayName = "Jog (14)"; \
            condition = "true"; \
            statement = "[14, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_4 { \
            displayName = "Sprint (20)"; \
            condition = "true"; \
            statement = "[20, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_5 { \
            displayName = "Convoy Slow (40)"; \
            condition = "true"; \
            statement = "[40, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_6 { \
            displayName = "Convoy (Normal) (60)"; \
            condition = "true"; \
            statement = "[60, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_7 { \
            displayName = "Convoy (Fast) (80)"; \
            condition = "true"; \
            statement = "[80, false] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_limiter_8 { \
            displayName = "Convoy (Full) (100)"; \
            condition = "true"; \
            statement = "[100, false] call CGQC_fnc_speedLimiter"; \
        }; \
    }; \
    class cgqc_ace_vic_cruise { \
        displayName = "Cruise Control"; \
        condition = "_player == driver _target"; \
        statement = ""; \
        class cgqc_ace_vic_cruise_1 { \
            displayName = "Walking (6)"; \
            condition = "true"; \
            statement = "[6, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_2 { \
            displayName = "Gun Up (11)"; \
            condition = "true"; \
            statement = "[11, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_3 { \
            displayName = "Jog (14)"; \
            condition = "true"; \
            statement = "[14, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_4 { \
            displayName = "Sprint (20)"; \
            condition = "true"; \
            statement = "[20, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_5 { \
            displayName = "Convoy Slow (40)"; \
            condition = "true"; \
            statement = "[40, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_6 { \
            displayName = "Convoy (Normal) (60)"; \
            condition = "true"; \
            statement = "[60, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_7 { \
            displayName = "Convoy (Fast) (80)"; \
            condition = "true"; \
            statement = "[80, true] call CGQC_fnc_speedLimiter"; \
        }; \
        class cgqc_ace_vic_cruise_8 { \
            displayName = "Convoy (Full) (100)"; \
            condition = "true"; \
            statement = "[100, true] call CGQC_fnc_speedLimiter"; \
        }; \
    };


#define MACRO_CGQC_RENAME \
    class cgqc_ace_designateVic { \
        displayName = "AutoRename"; \
        condition = "true"; \
        statement = "[_target] call CGQC_fnc_renameVicAuto"; \
        runOnHover = "hint 'Rename Vehicle according to your team'"; \
        class cgqc_ace_renameVic { \
            displayName = "Manual Rename"; \
            condition = "true"; \
            statement = "cgqc_rename_vic = _target;[_target] call CGQC_fnc_renameVic"; \
            runOnHover = "hint 'Rename Vehicle'"; \
        }; \
    }; \
    class cgqc_ace_vicStopBFT { \
        displayName = "Stop transmiting position"; \
        condition = "_target getVariable ['show_marker', false]"; \
        statement = "_target setVariable ['show_marker', false]"; \
        runOnHover = "hint 'Stop the vic from transmitting its position'"; \
    }; \
    class cgqc_ace_stashPack { \
        displayName = "Stash backpack in vic"; \
        condition = "!cgqc_backpack_stashed"; \
        icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"; \
        statement = "[backpack player, 'stash', _target] spawn CGQC_fnc_dropStuff"; \
        runOnHover = "hint 'Stash your pack in this vic'"; \
    }; \
    class cgqc_ace_grabPack { \
        displayName = "Grab your pack"; \
        condition = "cgqc_backpack_stashed"; \
        icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"; \
        statement = "[backpack player, 'unstash', _target] spawn CGQC_fnc_dropStuff"; \
        runOnHover = "hint 'Grab your pack from this vic'"; \
    };

#define MACRO_CGQC_MAINTENANCE \
    class cgqc_maintenance { \
        displayName = "Maintenance"; \
        condition = "cgqc_flag_supply"; \
        statement = "['normal'] call CGQC_fnc_refuel"; \
        exceptions[] = {}; \
        icon = "\CGQC\textures\icon_maintenance"; \
        runOnHover = "hint 'Repair/Refuel/Rearm'"; \
    }; \
    class cgqc_maintenance_quick { \
        displayName = "Maintenance (Quick)"; \
        condition = "cgqc_flag_supply_rapide"; \
        statement = "['short'] call CGQC_fnc_refuel"; \
        exceptions[] = {}; \
        icon = "\CGQC\textures\icon_maintenance"; \
        runOnHover = "hint 'Repair/Refuel/Rearm'"; \
    };

class LandVehicle;
class Car: LandVehicle {
    class ACE_SelfActions {
        MACRO_CGQC_SPEEDLIMITER
    };
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
            MACRO_CGQC_MAINTENANCE
		};
	};
};
class Tank: LandVehicle {
    class ACE_SelfActions {
        MACRO_CGQC_SPEEDLIMITER
    };
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
            MACRO_CGQC_MAINTENANCE
		};
	};
};
class Motorcycle: LandVehicle {
    class ACE_SelfActions {
        MACRO_CGQC_SPEEDLIMITER
    };
    class ACE_MainActions {
        MACRO_CGQC_RENAME
        MACRO_CGQC_MAINTENANCE
    };
};
class Air;
class Helicopter: Air {
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
    class ACE_SelfActions {
        class RetentionLanyard_In {
            displayName = "Clip In";
            icon = "\DEVGRU\RS_Equip_Retention\ui\lanyard.paa";
            exceptions[] = {"notOnMap","isNotInside","isNotSitting"};
            condition = "!(_player getVariable['RS_RetentionLanyard', false])";
            statement = "[] call RS_Retention_fnc_Clip;";
        };
        class RetentionLanyard_Off {
            displayName = "Unclip";
            icon = "\DEVGRU\RS_Equip_Retention\ui\lanyard.paa";
            exceptions[] = {"notOnMap","isNotInside","isNotSitting"};
            condition = "(_player getVariable['RS_RetentionLanyard', false])";
            statement = "[] call RS_Retention_fnc_Clip;";
        };
    };
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
            MACRO_CGQC_MAINTENANCE
		};
	};
    class TransportItems {
        // Ammo -----------------------------------
        class _xx_retention {
            count = 20;
            name = "RS_Equip_Retention";
        };
        class _xx_ACE_EarPlugs {
            count = 2;
            name = "ACE_EarPlugs";
        };
    };
};

class Plane: Air {
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
            MACRO_CGQC_MAINTENANCE
		};
	};
};

 class Ship;
class Ship_F: Ship {
    MACRO_CGQC_RENAME
};


// Class overrides for spares/Acre settings
class Boat_Armed_01_base_F : Boat_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            masterPositions[] = {"driver"};
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
            isRadioRemovable = 1;
        };
    };
};
class Car_F : Car{
    ace_cargo_space = 8;
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", {"cargo", 0}, "external"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2: Rack_1 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
    class EventHandlers
    {
         init = "[_this select 0, 'car'] spawn CGQC_fnc_addSpares";
    };
};
class MRAP_01_base_F : Car_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"commander"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
	class AcreRacks {
		class Rack_1 {
			displayName = "Rack1"; // Name is displayed in the interaction menu.
			shortName = "Rack1";
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"driver", {"cargo", 0}}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			mountedRadio = "ACRE_PRC117F";
			intercom[] = {"intercom_1"};
		};
		class Rack_2: Rack_1 {
			displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
			shortName = "Rack2";
		};
	};
};
class MRAP_02_base_F: Car_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"commander"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
	class AcreRacks {
		class Rack_1 {
			displayName = "Rack1"; // Name is displayed in the interaction menu.
			shortName = "Rack1";
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"driver", {"cargo", 0}}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			mountedRadio = "ACRE_PRC117F";
			intercom[] = {"intercom_1"};
		};
		class Rack_2: Rack_1 {
			displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
			shortName = "Rack2";
		};
	};
};
class MRAP_03_base_F: Car_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"commander"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
	class AcreRacks {
		class Rack_1 {
			displayName = "Rack1"; // Name is displayed in the interaction menu.
			shortName = "Rack1";
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"driver", {"cargo", 0}}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			mountedRadio = "ACRE_PRC117F";
			intercom[] = {"intercom_1"};
		};
		class Rack_2: Rack_1 {
			displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
			shortName = "Rack2";
		};
	};
};

class Helicopter_Base_F: Helicopter {
	class EventHandlers {
        init = "[_this select 0, 'air'] spawn CGQC_fnc_addSpares;";
    };
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"driver"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "gunner", "copilot", "external"}; // Attack helicopters have "gunner" copilots usually
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };

        class Rack_2: Rack_1 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
};
class VTOL_01_unarmed_base_F: VTOL_01_base_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            disabledPositions[] = {{"turret", {1}, {2}}};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"driver", "copilot"};
            numLimitedPositions = 2;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"},{"turret", "all"},{"ffv", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
	class AcreRacks {
		class Rack_1 {
			displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"driver", "copilot", {"turret", {1}, {2}}, "external"};
			mountedRadio = "ACRE_PRC117F";
			intercom[] = {"intercom_1"};
		};

		 class Rack_2: Rack_1 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
	};
};
class Plane_Base_F: Plane {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"driver"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "copilot", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };

        class Rack_2: Rack_1 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
};
class Plane_Civil_01_base_F: Plane_Base_F {
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"driver"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "copilot"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
    };
};
class Wheeled_APC_F: Car_F {
    ace_cargo_space = 8;
    acre_hasInfantryPhone = 1;
    acre_infantryPhoneDisableRinging = 1;
    acre_infantryPhoneIntercom[] = {"all"};
    acre_infantryPhoneControlActions[] = {"intercom_1"};
    class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"commander"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
     };
};
class Tank_F: Tank {
    ace_cargo_space = 8;
     class AcreIntercoms {
        class Intercom_1 {
            displayName = "Crew Intercom";
            shortName = "Crew";
            allowedPositions[] = {"crew"};
            limitedPositions[] = {{"cargo", "all"}};
            masterPositions[] = {"commander"};
            numLimitedPositions = 1;
            connectedByDefault = 1;
        };
        class Intercom_2: Intercom_1 {
            displayName = "PAX Intercom";
            shortName = "PAX";
            allowedPositions[] = {"crew", {"cargo", "all"}};
            limitedPositions[] = {};
            numLimitedPositions = 0;
            connectedByDefault = 0;
        };
    };
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", "commander", "gunner", "external"}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
        };
        class Rack_2 :Rack_1 {
            displayName = "Rack2"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
    class EventHandlers
    {
         init = "[_this select 0, 'tank'] spawn CGQC_fnc_addSpares";
    };
};