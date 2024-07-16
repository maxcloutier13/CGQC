class ACRE_BaseRadio;
class ACE_ItemCore;
class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
class InventoryItem_Base_F;


//Lockpicks - Breaching stuff
class tsp_paperclip;
class tsp_lockpick: tsp_paperclip
{
	class ItemInfo: ItemInfo
	{
		mass = 1;
	};
};


class CGQC_Carbonate: CBA_MiscItem {
	scope = 2;
	author = "silent1";
	displayName = "Ammonium Carbonate";
    descriptionShort = "Smelling salts. Used to restore consciousness.";
    model = "\A3\Structures_F_EPA\Items\Medical\Painkillers_F.p3d";
    picture = "\CGQC\textures\icon_Carbonate.paa";
	class ItemInfo: CBA_MiscItem_ItemInfo {
		mass = 0;
	};
};

// Logistics stuff
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
	/*
	class EventHandlers {
        init = "_this setVariable ['cgqc_bandolier_mags', cgqc_config_ammo_primary]";
    };*/
};

class cgqc_bandolier_ammo_half: cgqc_bandolier_ammo
{
	displayName = "Bandolier: Half";
	class ItemInfo: CBA_MiscItem_ItemInfo
	{
		mass = 30;
	};
	/*class EventHandlers {
        init = "_this setVariable ['cgqc_bandolier_mags', cgqc_config_ammo_primary / 2]";
    };*/
};

// === Lighter Tookit
/*
class ToolKitItem;
class ToolKit: ItemCore
{
	class ItemInfo: ToolKitItem
	{
		mass = 50;
	};
};*/

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
