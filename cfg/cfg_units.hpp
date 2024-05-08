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
	items[] = {"azm_bft_tx", "azm_bft_rx","acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {"acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	respawnMagazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	backpack = "cgqc_pack_mk1_magic";
	editorPreview = "cgqc\pics\cgqc_soldat_base.jpg";
	class Attributes {
		class SubCategory
		{
			data = "AttributeSystemSubcategory";
			control = "SubCategory";
			displayName = "CGQC";
		};
		class skipLoadout {
			displayName = "Don't switch loadout";
			tooltip = "Skip loadout switch on init";
			property = "cgqc_var_skipLoadoutSwitch";
			control = "Checkbox";
			defaultValue = "false";
			expression = "_this setVariable ['cgqc_var_skipLoadoutSwitch',_value, true];";
			condition = "objectBrain";
		};
		class colorTeam {
			displayName = "Starting colorTeam";
			tooltip = "ColorTeam to join on init";
			property = "cgqc_var_startingColorTeam";
			control = "combo";
			defaultValue = "MAIN";
			expression = "_this setVariable ['cgqc_var_startingColorTeam',_value, true];";
			condition = "objectBrain";
			typeName = "STRING";
			class Values {
				class White {
					name = "White";
					value = "MAIN";
				};
				class Red {
					name = "Red";
					value = "RED";
				};
				class Green {
					name = "Green";
					value = "GREEN";
				};
				class Blue {
					name = "Blue";
					value = "BLUE";
				};
				class Yellow {
					name = "Yellow";
					value = "YELLOW";
				};
			};
		};
	};
};

class CGQC_soldat_desert : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Desert)";
	uniformClass = "cgqc_uniform_mk1_desert";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_desert.paa"};
};

class CGQC_soldat_mcam : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Multicam)";
	uniformClass = "cgqc_uniform_mk1_desert";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_multi.paa"};
};

class CGQC_soldat_cadpat : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Cadpat)";
	uniformClass = "cgqc_uniform_mk1_cadpat";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_cadpat_all.paa"};
};

class CGQC_soldat_cadpat_2 : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Cadpat 2)";
	uniformClass = "cgqc_uniform_mk1_cadpat_2";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_cadpat.paa"};
};

class CGQC_soldat_black : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Black)";
	uniformClass = "cgqc_uniform_mk1_black";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_black.paa"};
};

class CGQC_soldat_black_all : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (All Black)";
	uniformClass = "cgqc_uniform_mk1_allBlack";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_black_all.paa"};
};

class CGQC_soldat_white : CGQC_Soldat_Base
{
	scope = 1;
	displayName = "Soldat (Winter)";
	uniformClass = "cgqc_uniform_mk1_white";
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_white.paa"};
};

class CGQC_Officer_Base : CGQC_Soldat_Base
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
	items[] = {"azm_bft_tx", "azm_bft_rx", "acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {"acex_intelitems_notepad", "cgqc_items_ifak", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "ACE_microDAGR", "WBK_HeadLampItem"};
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
	items[] = {"cgqc_items_ifak" "ACE_CableTie", "ACE_CableTie", "ACE_MapTools", "MS_Strobe_Mag_1", "ACE_microDAGR", "ACE_EntrenchingTool", "WBK_HeadLampItem"};
	linkedItems[] = {"V_PlateCarrier1_rgr", "H_HelmetSpecB", "None", "ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "ACE_NVG_Gen4_Black", "muzzle_snds_M", "ACE_acc_pointer_green", "optic_Hamr", "WBK_HeadLampItem"};
};