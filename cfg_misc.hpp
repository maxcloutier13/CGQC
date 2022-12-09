class ACRE_BaseRadio;
class ACE_ItemCore;
class CBA_MiscItem_ItemInfo;
// Lighter radios
class ACRE_PRC117F: ACRE_BaseRadio
{
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 30;
	};
};
class ACRE_PRC152: ACRE_BaseRadio
{
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 4;
	};
};
class ACRE_PRC343: ACRE_BaseRadio
{
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 4;
	};
};
// Items
class ACE_Tripod : ACE_ItemCore // Tripod
{ 
    class ItemInfo : CBA_MiscItem_ItemInfo
    {
        mass = 20;
    };
};
