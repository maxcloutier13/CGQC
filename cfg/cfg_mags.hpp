// --- cfg_mags ----------------------------------------------------------
// "Mags" which also means shit like grenades apparently
class CA_Magazine;
class SLAMDirectionalMine_Wire_Mag;
class tsp_popperCharge_mag: SLAMDirectionalMine_Wire_Mag
{
	mass = 1;
};

class tsp_stickCharge_mag: SLAMDirectionalMine_Wire_Mag
{
	mass = 2;
};

class tsp_frameCharge_mag: SLAMDirectionalMine_Wire_Mag
{
	mass = 5;
};

// Custom Claymores
class ClaymoreDirectionalMine_Remote_Mag;
class CGQC_claymore_mag: ClaymoreDirectionalMine_Remote_Mag {
	scope = 2;
	class ACE_Triggers {
		SupportedTriggers[] = {"Timer", "Command","MK16_Transmitter","PressurePlate"};
		class Command {
			ammo = "CGQC_claymore_command_ammo";
			FuseTime = 0.5;
		};
		class MK16_Transmitter: Command {};
		class PressurePlate {
			digDistance = 0.06;
			//ammo = "CGQC_claymore_pressure_ammo";
		};/*
		class Tripwire {
			digDistance = 0.06;
			ammo = "CGQC_claymore_tripwire_ammo";
		};*/
		class Timer {
			ammo = "CGQC_claymore_timer_ammo";
		};
	};
};
class DirectionalBombBase;
class CGQC_claymore_ammo: DirectionalBombBase{
	indirectHitRange = 20;
	ace_explosives_explodeOnDefuseChance = 0;
	ace_explosives_magazine = "CGQC_claymore_mag";
	ace_explosives_size = 0;
	ace_explosives_Explosive = "ClaymoreDirectionalMine_Remote_Ammo_Scripted";
};
/*
class CGQC_claymore_pressure_ammo: CGQC_claymore_ammo {
	mineTrigger = "RangeTrigger";
};
*/
class CGQC_claymore_command_ammo: CGQC_claymore_ammo {
	mineTrigger = "RemoteTrigger";
};

class CGQC_claymore_timer_ammo: CGQC_claymore_ammo	{
	mineTrigger = "TimeTrigger";
};

/*
class CGQC_claymore_tripwire_ammo: CGQC_claymore_ammo	{
	mineTrigger = "ClaymoreDirectionalMine_WireTrigger";
};

class CfgMineTriggers
{
	class WireTrigger;
	class ClaymoreDirectionalMine_WireTrigger: WireTrigger
	{
		mineWireStart[] = {0,0.3,8};
		mineWireEnd[] = {0,0.3,0};
		mineTriggerRange = 4;
	};
};
*/

/* REference SLAM
class ATMine_Range_Mag: CA_Magazine {
	GVAR(Placeable) = 1;
	useAction = 0;
	GVAR(SetupObject) = "ACE_Explosives_Place_ATMine"; // CfgVehicle class for setup object.
	GVAR(DelayTime) = 2.5;
	class ACE_Triggers {
		SupportedTriggers[] = {"PressurePlate"};
		class PressurePlate {
			digDistance = 0.06;
		};
	};
};

class SLAMDirectionalMine_Wire_Mag: ATMine_Range_Mag {
	GVAR(SetupObject) = "ACE_Explosives_Place_SLAM";
	class ACE_Triggers {
		SupportedTriggers[] = {"IRSensor", "PressurePlate", "Timer", "Command", "MK16_Transmitter"};
		class PressurePlate {
			displayName = CSTRING(SLAME_Magnetic);
			digDistance = 0;
			ammo = "ACE_SLAMDirectionalMine_Magnetic_Ammo";
			pitch = 90;
		};
		class IRSensor {
			displayName = CSTRING(SLAME_IRSensor);
		};
		class Timer {
			ammo = "ACE_SLAMDirectionalMine_Timer_Ammo";
		};
		class Command {
			ammo = "ACE_SLAMDirectionalMine_Command_Ammo";
			fuseTime = 0.5;
		};
		class MK16_Transmitter: Command {};
	};
};



// "The SLAM has an anti-tamper feature that is only active in the bottom- and side-attack modes."
    class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
        indirectHitRange = 20;
        GVAR(explodeOnDefuseChance) = 1;
        GVAR(magazine) = "SLAMDirectionalMine_Wire_Mag";
        GVAR(size) = 0;
    };
    class ACE_SLAMDirectionalMine_Command_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "RemoteTrigger";
        GVAR(explodeOnDefuseChance) = 0;
    };
    class ACE_SLAMDirectionalMine_Timer_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "TimeTrigger";
        GVAR(explodeOnDefuseChance) = 0;
    };
    class ACE_SLAMDirectionalMine_Magnetic_Ammo: SLAMDirectionalMine_Wire_Ammo {
        mineTrigger = "ACE_MagneticTrigger";
        GVAR(explodeOnDefuseChance) = 1;
        explosionAngle = 360;
        indirectHitRange = 1;
        mineInconspicuousness = 25;
        icon = "iconExplosiveGP";
    };

*/