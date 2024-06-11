// Change Zeros and remove ranging from some optics

// == ACE & Vanilla ===============================================================================
class InventoryOpticsItem_Base_F;
class Default;
class optic_Hamr: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class Hamr2Collimator{
                discreteDistance[] = {300};
                discreteDistanceInitIndex = 0;
            };
            class Hamr2Scope {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
class ACE_optic_Hamr_2D: optic_Hamr {scope = 1;};
class ACE_optic_Hamr_PIP: ACE_optic_Hamr_2D {scope = 1;};

class optic_Arco: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class ARCO2collimator{
                discreteDistance[] = {300};
                discreteDistanceInitIndex = 0;
            };
            class ARCO2scope: ARCO2collimator {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
class ACE_optic_Arco_2D: optic_Arco {scope = 1;};
class ACE_optic_Arco_PIP: ACE_optic_Arco_2D {scope = 1;};

class optic_MRCO: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class MRCOcq{
                discreteDistance[] = {300};
                discreteDistanceInitIndex = 0;
            };
            class MRCOscope{
                discreteDistance[] = {300};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
class ACE_optic_MRCO_2D: optic_MRCO {scope = 1;};
class ACE_optic_MRCO_PIP: ACE_optic_MRCO_2D {scope = 1;};

class optic_SOS;
class ACE_optic_SOS_2D: optic_SOS {scope = 1;};
class ACE_optic_SOS_PIP: ACE_optic_SOS_2D {scope = 1;};

class optic_LRPS;
class ACE_optic_LRPS_2D: optic_LRPS {scope = 1;};
class ACE_optic_LRPS_PIP: ACE_optic_LRPS_2D {scope = 1;};

class optic_Holosight: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class ACO {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};
class optic_Holosight_smg: ItemCore	{
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class ACO {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};

class optic_DMS: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F
    {
        class OpticsModes
        {
            class Snip
            {
                discreteDistance[] = {200};
                discreteDistanceInitIndex = 0;
            };
            class Iron: Snip
            {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};

class optic_KHS_base: ItemCore{
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes{
            class KHS	{
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
            class Iron	{
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};

class optic_AMS_base: ItemCore {
    class ItemInfo: InventoryOpticsItem_Base_F {
        class OpticsModes {
            class AMS {
                discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
            class Iron {
              discreteDistance[] = {100};
                discreteDistanceInitIndex = 0;
            };
        };
    };
};