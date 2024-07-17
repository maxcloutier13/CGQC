class tsp_paperclip;
class ItemInfo;
class InventoryItem_Base_F;
class ace_medical_treatment_actions
{
    class Morphine;
    /*
    class FF_Painkiller: Morphine
    {
        // Add option on all bodyparts instead of just head
        allowedSelections[] = {"Head","LeftArm", "RightArm", "LeftLeg", "RightLeg", "Body"};
    };*/
    class Carbonate: Morphine {
        displayName = "Use Ammonium Carbonate";
        displayNameProgress = "Using";
        treatmentLocations = 0;
        allowedSelections[] = {"Head"};
        allowSelfTreatment = 1;
        medicRequired = 0;
        treatmentTime = 5;
        items[] = {"CGQC_Carbonate"};
        //condition = "[_medic, 'CGQC_Carbonate'] call ace_common_fnc_hasItem || [_patient,'CGQC_Carbonate'] call ace_common_fnc_hasItem";
        condition = "_patient getVariable ['ACE_isUnconscious', false]";
        patientStateCondition = 0;
        callbackSuccess = "[_player, _patient, 'Carbonate'] call CGQC_fnc_treatment";
        animationMedic = "AinvPknlMstpSnonWrflDnon_medic1";
        animationMedicProne = "AinvPpneMstpSlayWpstDnon_medicOther";
        animationPatient = "";
        animationPatientUnconscious = "AinjPpneMstpSnonWrflDnon_rolltoback";
        animationPatientUnconsciousExcludeOn[] = {"ainjppnemstpsnonwrfldnon"};
    };
    class slap: Carbonate {
        displayName = "Slap!";
        displayNameProgress = "Splapping";
        treatmentTime = 1;
        items[] = {};
        condition = "_patient getVariable ['ACE_isUnconscious', false]";
        callbackSuccess = "[_player, _patient, 'slap'] call CGQC_fnc_treatment";
    };

};

class taro_tripwire_spool
{
    class ItemInfo: InventoryItem_Base_F
    {
        mass = 5;
    };
};

class ace_medical_treatment
{
    class BasicBandage;
	class Patch: BasicBandage{};
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
        class Epinephrine;
        class Carbonate : Epinephrine {
            painReduce = 0;
            timeInSystem = 10;
            timeTillMaxEffect = 1;
            maxDose = 100;
            inCompatableMedication[] = {};
            viscosityChange = 0;
            hrIncreaseLow[] = {10, 20};
            hrIncreaseNormal[] = {10, 50};
            hrIncreaseHigh[] = {10, 40};
            // item class name
            itemClassName = "CGQC_Carbonate";
        };
    };
};

class tsp_lockpick: tsp_paperclip
{
    class ItemInfo: ItemInfo
    {
        mass = 1;
    };
};

class TrainingMine_01_F{
    ace_minedetector_detectable = 1;
};