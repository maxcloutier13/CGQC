// --- acreVehicules ----------------------------------------------------------
// All the vehicle acre bullshit
class VTOL_01_base_F;
class Boat_F;

class LandVehicle;
class Car: LandVehicle {
    class ACE_Actions {
		class ACE_MainActions {
            class cgqc_maintenance {
				displayName = "Maintenance";
				condition = "cgqc_flag_supply";
				statement = "['normal'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
			class cgqc_maintenance_quick {
				displayName = "Maintenance (Quick)";
				condition = "cgqc_flag_supply_rapide";
				statement = "['short'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
		};
	};
};
class Tank: LandVehicle {
    class ACE_Actions {
		class ACE_MainActions {
            class cgqc_maintenance {
				displayName = "Maintenance";
				condition = "cgqc_flag_supply";
				statement = "['normal'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
			class cgqc_maintenance_quick {
				displayName = "Maintenance (Quick)";
				condition = "cgqc_flag_supply_rapide";
				statement = "['short'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
		};
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
    class ACE_Actions {
		class ACE_MainActions {
            class cgqc_maintenance {
				displayName = "Maintenance";
				condition = "cgqc_flag_supply";
				statement = "['normal'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
			class cgqc_maintenance_quick {
				displayName = "Maintenance (Quick)";
				condition = "cgqc_flag_supply_rapide";
				statement = "['short'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
		};
	};
};

class Plane: Air {
    class ACE_Actions {
		class ACE_MainActions {
            class cgqc_maintenance {
				displayName = "Maintenance";
				condition = "cgqc_flag_supply";
				statement = "['normal'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
			class cgqc_maintenance_quick {
				displayName = "Maintenance (Quick)";
				condition = "cgqc_flag_supply_rapide";
				statement = "['short'] call CGQC_fnc_refuel";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_maintenance";
				runOnHover = "hint 'Repair/Refuel/Rearm'";
			};
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
         init = "[_this select 0, 'car'] call CGQC_fnc_addSpares";
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
        init = "[_this select 0, 'air'] call CGQC_fnc_addSpares;";
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
         init = "[_this select 0, 'tank'] call CGQC_fnc_addSpares";
    };
};