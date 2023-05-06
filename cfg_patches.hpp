class CfgPatches
{
	class CGQC
	{
		// Meta information for editor
		name = "CGQC Core";
		author = "silent1";
		url = "Insert Github";
		// Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game. Note: was disabled on purpose some time late into Arma 2: OA.
		requiredVersion = 1.60;
		// Required addons, used for setting load order.
		// When any of the addons is missing, pop-up warning will appear when launching the game.
		requiredAddons[] = {"ace_medical_treatment",
							"ace_hearing",
							"ace_captives",
							"ace_maptools",
							"ace_attach",
							"acre_sys_prc343",
							"ace_trenches",
							"ace_microdagr",
							"ace_tagging"};
		// List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups) unlocking.
		units[] = {	"CGQC_Soldat_Base",
					"CGQC_Officer_Base",
					"cgqc_pack_mk1_magic",
					"cgqc_backpack_mk1_diver",					
					"cgqc_flag_coop_black",
					"cgqc_flag_coop_white",
					"cgqc_flag_logo_black",
					"cgqc_flag_logo_white",
					"cgqc_flag_airforce_black",
					"cgqc_flag_airforce_white",
					"cgqc_flag_black_black",
					"cgqc_flag_black_white",
					"cgqc_banner_coop_black",
					"cgqc_banner_coop_white",
					"cgqc_banner_logo_black",
					"cgqc_banner_logo_white",
					"cgqc_box_mk1_fuelcan",
					"cgqc_box_mk1_ammocan",
					"cgqc_box_mk2_stash",
					"cgqc_box_mk1_supplies",
					"cgqc_box_mk2_arsenal",
					"cgqc_box_mk2_parachute",
					"cgqc_box_mk2_diving",
					"Headgear_cgqc_beret_green",
					"Headgear_cgqc_beret_blue",
					"Headgear_cgqc_cap_green",
					"Headgear_cgqc_helmet_cloutier",
					"Headgear_cgqc_helmet_crew_cloutier",
					"Headgear_cgqc_helmet_villeneuve",
					"Headgear_cgqc_helmet_crew_villeneuve",
					"Headgear_cgqc_helmet_audi",
					"Headgear_cgqc_helmet_crew_audi",
					"Headgear_cgqc_helmet_heli_black",
					"Headgear_cgqc_helmet_heli_black",
					"Headgear_cgqc_helmet_heli_green",
					"Headgear_cgqc_helmet_heli_green",
					"Headgear_cgqc_helmet_heli_wood",
					"Headgear_cgqc_helmet_heli_wood",
					"cgqc_gun_p99_wood"};
					/*"cgqc_gun_hk417_tremblay",
					"Weapon_cgqc_gun_spar17_canpat",
					"Weapon_cgqc_gun_spar17_wood"*/
		// List of weapons (CfgWeapons classes) contained in the addon.
		weapons[] = {
					"cgqc_beret_vanilla",
					"cgqc_beret_green",
					"cgqc_beret_blue",
					"cgqc_beret_red",
					"cgqc_beret_gray",
					"cgqc_beret_yellow",
					"cgqc_beret_orange",
					"cgqc_cap_green",
					"cgqc_beret_23",
					"cgqc_beanie_black",
					"cgqc_beanie_sage",
					"cgqc_beanie_green",
					"cgqc_beanie_khaki",
					"cgqc_beanie_coyote",
					"cgqc_uniform_mk1_diver",
					"cgqc_gun_p99_wood"};
	};
};