// --- cfg_mags ----------------------------------------------------------
// "Mags" which also means shit like grenades apparently

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
class CA_Magazine;
class ClaymoreDirectionalMine_Remote_Mag: CA_Magazine {
	class ACE_Triggers {
		SupportedTriggers[] = {"Command", "MK16_Transmitter", "Timer"};
		class Command {
			FuseTime = 0.5;
		};
		class MK16_Transmitter: Command {};
		class Timer {
			FuseTime = 0.5;
		};
	};
};

// Hide 9bangs
class ACE_CTS9 {
    scope = 1;
};