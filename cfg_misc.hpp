class ACRE_BaseRadio;
class ACE_ItemCore;
class CBA_MiscItem_ItemInfo;
//
// === Lighter Bodybags ==========================================================================================
class ACE_bodyBag: ACE_ItemCore {
	class ItemInfo: CBA_MiscItem_ItemInfo {
		mass = 2;
	};
};
// === Lighter radios ==========================================================================================
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
		mass = 2;
	};
};
class ACRE_PRC148: ACRE_BaseRadio
{
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 2;
	};
};
class ACRE_PRC343: ACRE_BaseRadio
{
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 2;
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
