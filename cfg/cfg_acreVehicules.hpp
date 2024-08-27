// --- acreVehicules ----------------------------------------------------------
// All the vehicle acre bullshit
class VTOL_01_base_F;
class Boat_F;

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
    class cgqc_ace_stash { \
        displayName = "Stash stuff in Vic"; \
        condition = "true"; \
        icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\box_ca.paa"; \
        statement = ""; \
        runOnHover = "hint 'Stash your stuff in this vic'"; \
        class cgqc_ace_stashGuns { \
            displayName = "Guns"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedGuns_%1', name player], ''] isEqualTo '') && (primaryWeapon player isNotEqualTo '' || handgunWeapon player isNotEqualTo '')"; \
            icon = "\CGQC\textures\cgqc_ace_rifle.paa"; \
            statement = "['guns', 'stash_guns', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your primary/handgun in this vic'"; \
        }; \
        class cgqc_ace_stashLauncher { \
            displayName = "Launcher"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedLauncher_%1', name player], ''] isEqualTo '') && (secondaryWeapon player isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa"; \
            statement = "['launcher', 'stash_launcher', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your launcher in this vic'"; \
        }; \
        class cgqc_ace_stashHead { \
            displayName = "Helmet/Face"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedHead_%1', name player], ''] isEqualTo '') && (goggles player isNotEqualTo "" || headgear player isNotEqualTo "")"; \
            icon = "\CGQC\textures\cgqc_ace_mask.paa"; \
            statement = "['head', 'stash_head', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your helmet/goggles in this vic'"; \
        }; \
        class cgqc_ace_stashUniform { \
            displayName = "Uniform"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedUniform_%1', name player], ''] isEqualTo '') && (uniform player isNotEqualTo '')"; \
            icon = "\CGQC\textures\icon_camo.paa"; \
            statement = "['uniform', 'stash_uniform', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your uniform in this vic'"; \
        }; \
        class cgqc_ace_stashVest { \
            displayName = "Vest"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedVest_%1', name player], ''] isEqualTo '') && (vest player isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\armor_ca.paa"; \
            statement = "['vest', 'stash_vest', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your vest in this vic'"; \
        }; \
        class cgqc_ace_stashPack { \
            displayName = "Backpack"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedPack_%1', name player], ''] isEqualTo '') && (backpack player isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"; \
            statement = "['pack', 'stash_pack', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash your pack in this vic'"; \
        }; \
        class cgqc_ace_stashAll { \
            displayName = "Stash All"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedPack_%1', name player], ''] isEqualTo '') && (_target getVariable [format ['cgqc_vic_stashedUniform_%1', name player], ''] isEqualTo '') && (_target getVariable [format ['cgqc_vic_stashedVest_%1', name player], ''] isEqualTo '') && (_target getVariable [format ['cgqc_vic_stashedHead_%1', name player], ''] isEqualTo '') && (_target getVariable [format ['cgqc_vic_stashedGuns_%1', name player], ''] isEqualTo '') && (_target getVariable [format ['cgqc_vic_stashedLauncher_%1', name player], ''] isEqualTo '')"; \
            icon = "\CGQC\textures\cgqc_ace_goggles.paa"; \
            statement = "['all', 'stash_all', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Stash all your stuff in this vic'"; \
        }; \
    }; \
    class cgqc_ace_grabAll { \
        displayName = "Grab/Swap All"; \
        condition = "(_target getVariable [format ['cgqc_vic_stashedPack_%1', name player], ''] isNotEqualTo '') || (_target getVariable [format ['cgqc_vic_stashedUniform_%1', name player], ''] isNotEqualTo '') || (_target getVariable [format ['cgqc_vic_stashedVest_%1', name player], ''] isNotEqualTo '') || (_target getVariable [format ['cgqc_vic_stashedHead_%1', name player], ''] isNotEqualTo '') || (_target getVariable [format ['cgqc_vic_stashedGuns_%1', name player], ''] isNotEqualTo '') || (_target getVariable [format ['cgqc_vic_stashedLauncher_%1', name player], ''] isNotEqualTo '')"; \
        icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa"; \
        statement = "['pack', 'grab_all', _target] spawn CGQC_fnc_dropStuff"; \
        runOnHover = "hint 'Grab/Swap all equipment'"; \
        class cgqc_ace_grabGuns { \
            displayName = "Guns"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedGuns_%1', name player], ''] isNotEqualTo '')"; \
            icon = "\CGQC\textures\cgqc_ace_rifle.paa"; \
            statement = "['guns', 'unstash_guns', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Grab your guns from this vic'"; \
        }; \
        class cgqc_ace_grabLauncher { \
            displayName = "Launcher"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedLauncher_%1', name player], ''] isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\destroy_ca.paa"; \
            statement = "['launcher', 'unstash_launcher', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Grab your launcher from this vic'"; \
        }; \
        class cgqc_ace_grabHead { \
            displayName = "Helmet/face"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedHead_%1', name player], ''] isNotEqualTo '')"; \
            icon = "\CGQC\textures\cgqc_ace_mask.paa"; \
            statement = "['head', 'unstash_head', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Grab your helmet/goggles from this vic'"; \
        }; \
        class cgqc_ace_grabUniform { \
            displayName = "Uniform"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedUniform_%1', name player], ''] isNotEqualTo '')"; \
            icon = "\CGQC\textures\icon_camo.paa"; \
            statement = "['uniform', 'unstash_uniform', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Swap your uniform from this vic'"; \
        }; \
        class cgqc_ace_grabVest { \
            displayName = "Vest"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedVest_%1', name player], ''] isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\armor_ca.paa"; \
            statement = "['vest', 'unstash_vest', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Grab your vest from this vic'"; \
        }; \
        class cgqc_ace_grabPack { \
            displayName = "Pack"; \
            condition = "(_target getVariable [format ['cgqc_vic_stashedPack_%1', name player], ''] isNotEqualTo '')"; \
            icon = "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa"; \
            statement = "['pack', 'unstash_pack', _target] spawn CGQC_fnc_dropStuff"; \
            runOnHover = "hint 'Grab your pack from this vic'"; \
        }; \
    };

#define MACRO_CGQC_MAINTENANCE \
    class cgqc_maintenance { \
        displayName = "Maintenance"; \
        condition = "cgqc_flag_supply"; \
        statement = "['normal', _target] call CGQC_fnc_refuel"; \
        exceptions[] = {}; \
        icon = "\CGQC\textures\icon_maintenance"; \
        runOnHover = "hint 'Repair/Refuel/Rearm'"; \
    }; \
    class cgqc_maintenance_quick { \
        displayName = "Maintenance (Quick)"; \
        condition = "cgqc_flag_supply_rapide"; \
        statement = "['short', _target] call CGQC_fnc_refuel"; \
        exceptions[] = {}; \
        icon = "\CGQC\textures\icon_maintenance"; \
        runOnHover = "hint 'Repair/Refuel/Rearm'"; \
    };

class LandVehicle;
class Car: LandVehicle {
    class ACE_SelfActions {
        MACRO_CGQC_SPEEDLIMITER
        MACRO_CGQC_RENAME
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
        MACRO_CGQC_RENAME
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
        MACRO_CGQC_RENAME
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
        MACRO_CGQC_RENAME
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
    class ACE_SelfActions {
        MACRO_CGQC_RENAME
    };
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
            MACRO_CGQC_MAINTENANCE
		};
	};
};

class Ship;
class Ship_F: Ship {
    class ACE_SelfActions {
        MACRO_CGQC_RENAME
    };
    class ACE_Actions {
		class ACE_MainActions {
            MACRO_CGQC_RENAME
        };
    };
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