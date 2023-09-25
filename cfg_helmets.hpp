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
class cgqc_beret_vanilla : H_Beret_blk {
	author = "silent1";
	displayName = "CGQC Beret";
	_generalMacro = "cgqc_beret_vanilla";
	picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
	model = "\CGQC\helmets\cgqc_beret_1.p3d";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_vanilla.paa"};
	hiddenSelectionsMaterials[] = {"\CGQC\helmets\cgqc_beret.rvmat"};
	class ItemInfo : ItemInfo
	{
		mass = 6;
		allowedSlots[] = {801, 901, 701, 605};
		uniformModel = "\CGQC\helmets\cgqc_beret.p3d";
		modelSides[] = {3};
	};
};
class cgqc_beret_blue : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret bleu";
	_generalMacro = "cgqc_beret_blue";
	picture = "\A3\characters_f\Data\UI\icon_H_Beret_blk_CA.paa";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_blue.paa"};
};
class cgqc_beret_green : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret Vert";
	_generalMacro = "cgqc_beret_green";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_green.paa"};
};
class cgqc_beret_red : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret Rouge";
	_generalMacro = "cgqc_beret_red";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_red.paa"};
};
class cgqc_beret_gray : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret Gris";
	_generalMacro = "cgqc_beret_gray";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_gray.paa"};
};
class cgqc_beret_yellow : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret Jaune";
	_generalMacro = "cgqc_beret_yellow";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_yellow.paa"};
};
class cgqc_beret_orange : cgqc_beret_vanilla {
	author = "silent1";
	displayName = "CGQC Beret Orange";
	_generalMacro = "cgqc_beret_orange";
	hiddenSelectionsTextures[] = {"\CGQC\helmets\cgqc_beret_orange.paa"};
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

//
class H_Watchcap_blk;
class cgqc_beanie_black: H_Watchcap_blk
{
	author = "silent1";
	_generalMacro = "cgqc_beanie_black";
	scope = 2;
	displayName = "CGQC Beanie";
	allowedFacewear[] = {"",6,"G_Aviator",1,"G_Bandanna_aviator",1,"G_Bandanna_beast",1,"G_Bandanna_blk",1,"G_Bandanna_khk",1,"G_Bandanna_oli",1,"G_Bandanna_shades",1,"G_Bandanna_sport",1,"G_Shades_Black",1,"G_Shades_Blue",1,"G_Shades_Red",1,"G_Shades_Green",1};
	ace_hearing_protection = 0.75;
	ace_hearing_lowerVolume = 0;
};
class cgqc_beanie_coyote: cgqc_beanie_black
{
	author = "silent1";
	_generalMacro = "cgqc_beanie_coyote";
	scope = 2;
	displayName = "CGQC Beanie Coyote";
	picture = "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Watchcap_cbr_ca.paa";
	hiddenSelectionsTextures[] = {"\A3\Characters_F_Bootcamp\Civil\Data\woolhat_brown_co.paa"};
	allowedFacewear[] = {"",6.5,"G_Aviator",1,"G_Bandanna_aviator",1,"G_Bandanna_beast",1,"G_Bandanna_blk",1,"G_Bandanna_khk",1,"G_Bandanna_oli",1,"G_Bandanna_shades",1,"G_Bandanna_sport",1,"G_Bandanna_tan",1,"G_Shades_Black",1,"G_Shades_Blue",1,"G_Shades_Red",1,"G_Shades_Green",1};
};
class cgqc_beanie_khaki: cgqc_beanie_black
{
	author = "silent1";
	_generalMacro = "cgqc_beanie_khaki";
	scope = 2;
	displayName = "CGQC Beanie Khaki";
	picture = "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Watchcap_khk_ca.paa";
	hiddenSelectionsTextures[] = {"\A3\Characters_F_Bootcamp\Civil\Data\woolhat_khk_co.paa"};
	allowedFacewear[] = {"",6.5,"G_Aviator",1,"G_Bandanna_aviator",1,"G_Bandanna_beast",1,"G_Bandanna_blk",1,"G_Bandanna_khk",1,"G_Bandanna_oli",1,"G_Bandanna_shades",1,"G_Bandanna_sport",1,"G_Bandanna_tan",1,"G_Shades_Black",1,"G_Shades_Blue",1,"G_Shades_Red",1,"G_Shades_Green",1};
};
class cgqc_beanie_green: cgqc_beanie_black
{
	author = "silent1";
	_generalMacro = "cgqc_beanie_green";
	scope = 2;
	displayName = "CGQC Beanie Green";
	picture = "\A3\Characters_F_Bootcamp\Data\UI\icon_H_Watchcap_camo_ca.paa";
	hiddenSelectionsTextures[] = {"\A3\Characters_F_Bootcamp\Civil\Data\woolhat_green_co.paa"};
	allowedFacewear[] = {"",6,"G_Aviator",1,"G_Bandanna_aviator",1,"G_Bandanna_beast",1,"G_Bandanna_blk",1,"G_Bandanna_khk",1,"G_Bandanna_oli",1,"G_Bandanna_shades",1,"G_Bandanna_tan",1,"G_Shades_Black",1,"G_Shades_Blue",1,"G_Shades_Red",1,"G_Shades_Green",1};
};
class cgqc_beanie_sage: cgqc_beanie_black
{
	author = "silent1";
	_generalMacro = "cgqc_beanie_sage";
	scope = 2;
	displayName = "CGQC Beanie Sage";
	hiddenSelectionsTextures[] = {"\a3\characters_f\common\data\woolhat_blue_co.paa"};
};

class H_PilotHelmetFighter_B;
class H_PilotHelmetHeli_B;
class H_CrewHelmetHeli_B;

// Jet helmets -----------------------------------------------------------------------------------------------
class cgqc_helmet_mk1_jetpilot : H_PilotHelmetFighter_B
{
    author = "silent1";
    _generalMacro = "cgqc_helmet_mk1_jetpilot";
    displayName = "CGQC Casque Pilote de jet mk1";
    grad_slingHelmet_allow = true;
};

// Helicopter/Crew helmets -----------------------------------------------------------------------------------------------
// CGQC Airforce black -----------------------------------------------------
class cgqc_helmet_heli_black : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Noir";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_black.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Noir full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_black.paa"};
	grad_slingHelmet_allow = true;
};
// CGQC Airforce Green -----------------------------------------------------
class cgqc_helmet_heli_green : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Vert";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_green.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_green : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Vert full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_green.paa"};
	grad_slingHelmet_allow = true;
};
// CGQC Airforce woodland -----------------------------------------------------
class cgqc_helmet_heli_wood : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Woodland";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_wood.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_wood : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Woodland full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_wood.paa"};
	grad_slingHelmet_allow = true;
};

// Custom helmets -----------------------------------------------------------------------------------------------
// Cloutier -----------------------------------------------------
class cgqc_helmet_heli_black_cloutier : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Cloutier";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_cloutier.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black_cloutier : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Cloutier Full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_cloutier.paa"};
	grad_slingHelmet_allow = true;
};
// Villeneuve -----------------------------------------------------
class cgqc_helmet_heli_black_villeneuve : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Villeneuve DickForce";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_villeneuve_dick.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black_villeneuve : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Villeneuve Full DickForce";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_villeneuve_dick.paa"};
	grad_slingHelmet_allow = true;
};
// Audi -----------------------------------------------------
class cgqc_helmet_heli_black_audi : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Audi";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_audi.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black_audi : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Audi Full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_audi.paa"};
	grad_slingHelmet_allow = true;
};
// Turcotte
class cgqc_helmet_heli_black_turcotte : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Turcotte";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_turcotte.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black_turcotte : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Turcotte Full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_turcotte.paa"};
	grad_slingHelmet_allow = true;
};
// Comeau
class cgqc_helmet_heli_black_comeau : H_PilotHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Comeau";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_comeau.paa"};
	grad_slingHelmet_allow = true;
};
class cgqc_helmet_crew_black_comeau : H_CrewHelmetHeli_B
{
	scope = 2;
	author = "silent1";
	displayName = "CGQC Heli Comeau Full";
	hiddenSelectionsTextures[] = {"\cgqc\helmets\cgqc_helmet_heli_comeau.paa"};
	grad_slingHelmet_allow = true;
};
