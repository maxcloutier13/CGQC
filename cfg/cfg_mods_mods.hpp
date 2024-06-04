class tsp_paperclip;
class ItemInfo;
class InventoryItem_Base_F;
class ace_medical_treatment_actions
{
    class Morphine;
    class FF_Painkiller: Morphine
    {
        // Add option on all bodyparts instead of just head
        allowedSelections[] = {"Head","LeftArm", "RightArm", "LeftLeg", "RightLeg", "Body"};
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

class tsp_lockpick: tsp_paperclip
{
    class ItemInfo: ItemInfo
    {
        mass = 1;
    };
};
