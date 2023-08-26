class ace_medical_treatment_actions 
{
    class Morphine;
    class FF_Painkiller: Morphine 
    {
        // Add option on all bodyparts instead of just head
        allowedSelections[] = {"Head","LeftArm", "RightArm", "LeftLeg", "RightLeg", "Body"};
    };

	// Patching
	class BasicBandage;
	class Patch: BasicBandage {
		displayName = "Patch";
		displayNameProgress = "Patching";
		order = 1;
		treatmentTimeMedicCoef = 0.5;
		treatmentTimeSelfCoef = 1.5;
		litter[] = {};
		items[] = {};
		callbackSuccess = "hint 'Patch!'";//"ace_medical_treatment_fnc_treatmentPatch";
		condition = "[_target,_bodyPart] call cgqc_fnc_canBandage && !([ACE_player, 'BasicBandage'] call ace_common_fnc_hasItem)";
		treatmentTime = 20;
		blockUnconsciousChanceForSelfHeal = 1;
	};
};

class ace_medical_treatment 
{
	
	class Bandaging
	{
		class BasicBandage;
		class Patch: BasicBandage{};
	};
    class Medication
    {
        class Morphine;
        class FF_Painkiller: Morphine
        {
            painReduce = 0.2;
            timeInSystem = 600;
            timeTillMaxEffect = 60;
            maxDose = 30;
            incompatibleMedication[] = {};
            viscosityChange = 0;
        };
    };
};