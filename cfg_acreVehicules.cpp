// --- acreVehicules ----------------------------------------------------------
// All the vehicle acre bullshit

class Air;
class Plane;
class VTOL_01_base_F;
class Boat_F;
class Car;
class Tank;
// Class overrides for spares/Acre settings
class Boat_Armed_01_base_F : Boat_F {
    class AcreRacks {
        class Rack_1 {
            displayName = "Rack1"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {"intercom_1"};
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
         init = "[_this select 0, 'car'] execVM '\cgqc\functions\fnc_addSpares.sqf'";
    };
};
class MRAP_01_base_F : Car_F {
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
};
class Helicopter_Base_F: Helicopter {
	class EventHandlers {
        init = "[_this select 0, 'air'] execVM '\cgqc\functions\fnc_addSpares.sqf';";
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
         init = "[_this select 0, 'tank'] execVM '\cgqc\functions\fnc_addSpares.sqf'";
    };
};