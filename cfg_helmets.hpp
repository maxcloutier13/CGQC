class ItemCore;
class H_HelmetB : ItemCore
{
	class ItemInfo;
};
class HelmetBase : ItemCore
{
	class ItemInfo;
};
class H_Beret_blk : HelmetBase
{
	class ItemInfo;
};
// Berets ----------------------------------------------------------------------
class H_Beret_02;
class cgqc_beret_vanilla : H_Beret_02{
	author = "silent1";
	displayName = "CGQC Beret Vanilla";
	_generalMacro = "cgqc_beret_vanilla";
	picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_vanilla.paa"};
	hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_beret.rvmat"};
};

class cgqc_beret_blue : H_Beret_blk
{
	author = "silent1";
	displayName = "CGQC Beret bleu";
	_generalMacro = "cgqc_beret_blue";
	picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
	model = "\CGQC\helmets\cgqc_beret_1.p3d";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_blue.paa"};
	hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_beret.rvmat"};
	class ItemInfo : ItemInfo
	{
		mass = 6;
		allowedSlots[] = {801, 901, 701, 605};
		uniformModel = "\CGQC\helmets\cgqc_beret.p3d";
		modelSides[] = {3};
	};
};

class cgqc_beret_green : cgqc_beret_blue
{
	author = "silent1";
	displayName = "CGQC Beret Vert";
	_generalMacro = "cgqc_beret_green";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_green.paa"};
	//hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_beret.rvmat"};
};

class cgqc_beret_red : cgqc_beret_blue
{
	author = "silent1";
	displayName = "CGQC Beret Rouge";
	_generalMacro = "cgqc_beret_red";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_red.paa"};
	//hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_beret.rvmat"};
};

class cgqc_cap_green : H_HelmetB
{
	author = "silent1";
	_generalMacro = "cgqc_cap_green";
	displayName = "CGQC Casquette verte";
	picture = "\A3\Characters_F\data\ui\icon_H_Cap_headphones_khk_CA.paa";
	model = "\A3\Characters_F\common\capb_headphones.p3d";
	descriptionShort = "$STR_A3_SP_NOARMOR";
	class ItemInfo : ItemInfo
	{
		mass = 10;
		uniformModel = "\A3\Characters_F\common\capb_headphones.p3d";
		modelSides[] = {6};
		hiddenSelections[] =
			{
				"camo"};
		class HitpointsProtectionInfo
		{
			class Head
			{
				hitpointName = "HitHead";
				armor = 0;
				passThrough = 1;
			};
		};
	};
	ace_hearing_protection = 0.75;
	ace_hearing_lowerVolume = 0;
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_cap_green.paa"};
	hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_cap_green.rvmat"};
};


