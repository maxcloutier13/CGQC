class ACRE_BaseRadio;
class ACE_ItemCore;
class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
class InventoryItem_Base_F;

class cgqc_items_ifak: CBA_MiscItem
{
    author = "silent1";
    scope = 2;
    displayName = "Kit: Individual First-Aid";
    model = "\A3\Weapons_F\ammo\mag_univ.p3d";
    picture = "\cgqc\textures\first_aidkit.paa";
    class ItemInfo: CBA_MiscItem_ItemInfo
    {
        mass = 23; // Bonus 2 free 500ml in backpack
    };
};

class cgqc_items_medkit: CBA_MiscItem
{
    author = "silent1";
    scope = 2;
    displayName = "Kit: Medic Supply";
    model = "\A3\Weapons_F\ammo\mag_univ.p3d";
    picture = "\cgqc\textures\medikit.paa";
    class ItemInfo: CBA_MiscItem_ItemInfo
    {
        mass = 120;
    };
};

class cgqc_bandolier_ammo: CBA_MiscItem
{
	author = "silent1";
	scope = 2;
	displayName = "Bandolier: Ammo";
	model = "\A3\Weapons_F\ammo\mag_univ.p3d";
	picture = "\cgqc\textures\cgqc_bandolier.paa";
	class ItemInfo: CBA_MiscItem_ItemInfo
	{ 
		mass = 80;
	};
};

// === Lighter Headlamps ==========================================================================================
class WBK_HeadLampItem: ItemCore {
	class ItemInfo: InventoryItem_Base_F
	{
		mass = 1;
	};
};

// === Lighter Flashlight ==========================================================================================
class ACE_Flashlight_XL50: ItemCore {
	class ItemInfo: InventoryItem_Base_F
	{
		mass = 1;
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
