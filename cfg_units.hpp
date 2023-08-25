class B_Soldier_f;
// Basic soldier --------------------------------
class CGQC_Soldat_Base : B_Soldier_f
{
	author = "silent1";
	faction = "CGQC";
	editorSubcategory = "EdSubcat_cgqc_Training";
	side = 1;
	displayName = "Soldat (Base)";
	uniformClass = "cgqc_uniform_mk1";
	hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
	weapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	respawnWeapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	items[] = {
		"ACRE_PRC343", "ACRE_PRC152", "acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		, "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {
		"ACRE_PRC343", "ACRE_PRC152", "acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		, "ACE_microDAGR", "WBK_HeadLampItem"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	respawnMagazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	backpack = "cgqc_pack_mk1_magic";
	editorPreview = "cgqc\pics\cgqc_soldat_base.jpg";
	class EventHandlers {
        //init = "[] spawn CGQC_fnc_initTraining";
    };
};
class CGQC_Officer_Base : B_Soldier_f
{
	author = "silent1";
	faction = "CGQC";
	editorSubcategory = "EdSubcat_cgqc_Training";
	side = 1;
	displayName = "Officier (Base)";
	attendant = 1;
	canDeactivateMines = 1;
	engineer = 1;
	detectSkill = 31;
	uniformClass = "cgqc_uniform_mk1";
	hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
	weapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	respawnWeapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	items[] = {
		"ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152", "acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {
		"ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152", "acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	respawnMagazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_laserdesignator", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_laserdesignator", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	backpack = "cgqc_pack_mk1_magic";
	editorPreview = "cgqc\pics\cgqc_officer_base.jpg";
	class EventHandlers {
        //init = "[] spawn CGQC_fnc_initTraining";
    };
};

class CGQC_units_vanilla_rifleman : CGQC_Soldat_Base
{
    faction = "CGQC";
    editorSubcategory = "EdSubcat_cgqc_vanilla";
    side = 1;
    scope = 2;
    scopeCurator = 2;
    displayName = "Rifleman (Carbine - HK416)";
    uniformClass = "cgqc_uniform_mk1";
	backpack = "B_AssaultPack_rgr";
	weapons[] = {"arifle_SPAR_02_blk_F", "cgqc_gun_p99_wood", "cgqc_item_laserdesignator", "Throw", "Put"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "SmokeShell", "SmokeShell", "SmokeShell", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "ACE_30Rnd_556x45_Stanag_Mk262_mag", "ACE_30Rnd_556x45_Stanag_Mk262_mag","16Rnd_9x21_Mag", "Laserbatteries"};
	items[] = {"ACRE_PRC343", "ACRE_PRC148", "cgqc_items_ifak" "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "MS_Strobe_Mag_1", "ACE_microDAGR", "ACE_EntrenchingTool", "WBK_HeadLampItem"};
	linkedItems[] = {"V_PlateCarrier1_rgr", "H_HelmetSpecB", "None", "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "ACE_NVG_Gen4_Black", "muzzle_snds_M", "ACE_acc_pointer_green", "optic_Hamr", "WBK_HeadLampItem"};

    class EventHandlers
    {
		//init = ["vanilla_rifleman", 1, false] execVM "\CGQC\loadouts\mk3_switch_role.sqf";
    };
};