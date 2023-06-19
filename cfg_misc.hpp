class ACRE_BaseRadio;
class ACE_ItemCore;
class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;

class cgqc_items_ifak: CBA_MiscItem
{
    author = "silent1";
    scope = 2;
    displayName = "Kit: Individual First-Aid";
    model = "\A3\Weapons_F\ammo\mag_univ.p3d";
    picture = "\cgqc\textures\first_aidkit.paa";
    class ItemInfo: CBA_MiscItem_ItemInfo
    {
        mass = 10;
    };
};

class cgqc_items_medkit: CBA_MiscItem
{
    author = "silent1";
    scope = 2;
    displayName = "Kit: Medic Supply";
    model = "\A3\Weapons_F\ammo\mag_univ.p3d";
    picture = "\cgqc\textures\first_aidkit.paa";
    class ItemInfo: CBA_MiscItem_ItemInfo
    {
        mass = 20;
    };
};

class cgqc_bandolier_primary: CBA_MiscItem
{
	author = "silent1";
	scope = 2;
	displayName = "Bandolier: Ammo";
	model = "\A3\Weapons_F\ammo\mag_univ.p3d";
	picture = "\cgqc\textures\cgqc_bandolier.paa";
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 20;
	};
};

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

class ACRE_PRC77: ACRE_BaseRadio
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
class ACRE_SEM52SL: ACRE_BaseRadio
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
