#include "\CGQC\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
// --- preInit ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing
LOG("[CGQC_preInit] === Started =====================================");

// Version handling
core_version = QUOTE(VERSION);
LOG_1("[CGQC_preInit] Loading version: %1", core_version);
if (isServer) then {
	missionNamespace setVariable ["cgqc_version_server_core", core_version, true]; // Set the server's mod version
	LOG("[CGQC_preInit] Setting server-side version check");
};

// CGQC Variables ===================================================================================================
// *** Init **********************
cgqc_start_preInit_done = false;
cgqc_start_postInitClient_done = false;
cgqc_start_postInitServer_done = false;
cgqc_start_2023_preInit_done = false;

// *** Stats  **********************
cgqc_stats_civilianCasualties = 0;
cgqc_stats_civilianKillers = [];
cgqc_stats_friendlyCasualties = 0;
cgqc_stats_friendlyKillers = [];
cgqc_stats_teamCasualties = 0;
cgqc_stats_teamKillers = [];
cgqc_stats_enemyCasualties = 0;

// Intro/Welcome stuff
cgqc_intro_running = false;
cgqc_intro_running = false;
cgqc_intro_done = false;
cgqc_intro_skipped = false;
cgqc_welcome_message = "";
cgqc_welcome_done = false;
cgqc_welcome_pic = "";
cgqc_mk3_transition = false;
cgqc_player_loadAll = true;
// *** Player **********************
cgqc_player_known = true;
cgqc_player_side = nil;
cgqc_player_face = "";
cgqc_player_patch = "";
cgqc_player_patch_found = false;
cgqc_custom_playername = "";
cgqc_player_crate = false;
player setVariable ["cgqc_player_rank", 0, true];
cgqc_player_rank_name = "";
cgqc_player_rank_found = false;
cgqc_player_rank_unknown = false;
player setVariable ["cgqc_player_isSL", false, true];
player setVariable ["cgqc_player_isTL", false, true];
player setVariable ["cgqc_player_is2IC", false, true];
cgqc_player_role = "Unknown";
cgqc_player_role_optic = 0;
player setVariable ["cgqc_player_role", cgqc_player_role, true];
player setVariable ["cgqc_player_role_optic", cgqc_player_role_optic, true];
player setVariable ["CGQC_player_teamColor", "MAIN", true];
player setVariable ["cgqc_player_roleType", "None", true];
cgqc_player_beret = "";
cgqc_player_beret_name = "";
cgqc_player_chill = false;
cgqc_player_state = 1;
cgqc_player_oldNvg = "";
cgqc_player_oldFace = "";
cgqc_player_slinged_helmet = "";
cgqc_player_max = false;
cgqc_player_group = createGroup west;
cgqc_player_groupID = 0;
cgqc_player_acre_setup = false;
cgqc_player_radio_names = false;
cgqc_roleSwitch_done = true;
cgqc_camoSwitch_done = true;
cgqc_removeAll_done = false;
cgqc_bft_forceUpdate = false;
cgqc_hud_hidden = false;
cgqc_showObject_running = false;
cgqc_player_clearMarkers = [];
cgqc_vic_limiter = false;
cgqc_player_rosterInit = false;
cgqc_player_trait_loadCoef = 1;
cgqc_player_trait_audibleCoef = 1;
cgqc_player_trait_camoCoef = 1;


// Map tools - Advanced
cgqc_player_route_id = 0;
cgqc_player_route = [];
missionNamespace setVariable ["cgqc_maptools_mortar", 0, true];
// Map tools - Basic
missionNamespace setVariable ["cgqc_maptools_hq", 0, true];
missionNamespace setVariable ["cgqc_maptools_obj", 0, true];
missionNamespace setVariable ["cgqc_maptools_irp", 0, true];
missionNamespace setVariable ["cgqc_maptools_wp", 0, true];
missionNamespace setVariable ["cgqc_maptools_rp", 0, true];
missionNamespace setVariable ["cgqc_maptools_orp", 0, true];
missionNamespace setVariable ["cgqc_maptools_near", 0, true];
missionNamespace setVariable ["cgqc_maptools_far", 0, true];
missionNamespace setVariable ["cgqc_maptools_csp", 0, true];
missionNamespace setVariable ["cgqc_maptools_crp", 0, true];
missionNamespace setVariable ["cgqc_maptools_dis", 0, true];
missionNamespace setVariable ["cgqc_maptools_lz", 0, true];
missionNamespace setVariable ["cgqc_maptools_rte", 0, true];
missionNamespace setVariable ["cgqc_maptools_sply", 0, true];
missionNamespace setVariable ["cgqc_maptools_cty", 0, true];
missionNamespace setVariable ["cgqc_maptools_house", 0, true];
missionNamespace setVariable ["cgqc_maptools_op", 0, true];
missionNamespace setVariable ["cgqc_maptools_pl", 0, true];
missionNamespace setVariable ["cgqc_maptools_loa", 0, true];
missionNamespace setVariable ["cgqc_maptools_sbf", 0, true];
missionNamespace setVariable ["cgqc_maptools_ap", 0, true];
missionNamespace setVariable ["cgqc_maptools_inf", 0, true];
missionNamespace setVariable ["cgqc_maptools_unk", 0, true];
missionNamespace setVariable ["cgqc_maptools_stat", 0, true];
missionNamespace setVariable ["cgqc_maptools_vic", 0, true];
missionNamespace setVariable ["cgqc_maptools_ifv", 0, true];
missionNamespace setVariable ["cgqc_maptools_tank", 0, true];
missionNamespace setVariable ["cgqc_maptools_hel", 0, true];
missionNamespace setVariable ["cgqc_maptools_pln", 0, true];
missionNamespace setVariable ["cgqc_maptools_bkr", 0, true];
missionNamespace setVariable ["cgqc_maptools_roadblk", 0, true];
missionNamespace setVariable ["cgqc_maptools_base", 0, true];


// Location names
cgqc_maptools_running = false;
cgqc_location_nato = ["Alfa", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray", "Yankee", "Zulu"];
cgqc_location_space = ["Asteroid", "Blackhole", "Comet", "Darkmatter", "Eclipse", "Fusion", "Galactic", "Halo", "Ion", "Jupiter", "Kuiper", "Lightyear", "Meteor", "Nebula", "Orbit", "Pulsar", "Quasar", "Redshift", "Star", "Telescope", "Universe", "Voyager", "Wormhole", "X-ray", "Yellowstar", "Zenith"];
cgqc_location_metal = ["Aluminium", "Barium", "Calcium", "Diamond", "Erbium", "Fluorite", "Gold", "Hafnium", "Iron", "Jade", "Krypton", "Lithium", "Manganese", "Nickel", "Osmium", "Platinum", "Quartz", "Rhodium", "Silver", "Titanium", "Uranium", "Vanadium", "Wolfram", "Xenon", "Yttrium", "Zinc"];
cgqc_location_dune = ["Arrakis", "Bene Gesserit", "Crusade", "Dune", "Empire", "Fremen", "Guild", "Harkonnen", "Imperial", "Jihad", "Kwisatz Haderach", "Leto", "Mentat", "Naboo", "Ornithopter", "Padishah", "Quin", "Sandworm", "Tleilaxu", "Utterson", "Voyager", "Worm", "Xerxes", "Yen", "Zensunni"];
cgqc_location_dungeon = ["Amulet", "Beholder", "Cave", "Dragon", "Elemental", "Familiar", "Goblin", "Hydra", "Illusion", "Jinn", "Kobold", "Lich", "Mage", "Necromancer", "Ogre", "Potion", "Quest", "Ranger", "Sorcerer", "Treant", "Undead", "Vampire", "Warlock", "Xenon", "Yeti", "Zebra"];

cgqc_location_names = [cgqc_location_space, cgqc_location_metal, cgqc_location_dune, cgqc_location_dungeon];
cgqc_location_currentNames = cgqc_location_names call BIS_fnc_arrayShuffle;

cgqc_location_cities = [
    ["Atlanta", "Buffalo", "Chicago", "Dallas", "El Paso", "Fargo", "Greensboro", "Hartford", "Indianapolis", "Jacksonville", "Kansas", "Lafayette", "Memphis", "Nashville", "Orlando", "Phoenix", "Quincy", "Richmond", "Seattle", "Toronto", "Utica", "Vancouver", "Washington", "Xenia", "Yonkers", "Zanesville"],
    ["Albany", "Boston", "Columbus", "Denver", "Eugene", "Fresno", "Gainesville", "Houston", "Irving", "Juneau", "Kirkland", "Laredo", "Madison", "Newark", "Oakland", "Philadelphia", "Québec City", "Raleigh", "San Diego", "Tampa", "Upland", "Victoria", "Wichita", "Xavier", "York", "Zephyrhills"],
    ["Aurora", "Baltimore", "Calgary", "Durham", "Eastman", "Fairfax", "Garland", "Huntsville", "Indio", "Jasper", "Keene", "Lincoln", "Midland", "Nampa", "Ottawa", "Plano", "Quakertown", "Reno", "Savannah", "Tulsa", "Union", "Valdosta", "Wilmington", "Xanadu", "Yuma", "Zion"],
    ["Amherst", "Banff", "Carlton", "Denver", "Entrelacs", "Ferland", "Geneva", "Helena", "Irvine", "Joliet", "Kenner", "London", "Milford", "Naples", "Omaha", "Pasadena", "Quincy", "Rochester", "Spokane", "Thunder Bay", "Uxbridge", "Valparaiso", "Worcester", "Xochimilco", "Ypsilanti", "Zimmerman"],
    ["Aylmer", "Brossard", "Chester", "Delson", "Eureka", "Fabre", "Goderich", "Havre-Aubert", "Ingram", "Jamestown", "Kelowna", "Lindsay", "Mobile", "Norman", "Orem", "Provo", "Quincy", "Red Deer", "Sarasota", "Trail", "Upper Musquodoboit", "Ventura", "Waterloo", "Xander", "Yorkville", "Zwolle"],
    ["Aurora", "Boston", "Cornwall", "Drummond", "El Paso", "Farnham", "Granby", "Howick", "Inverness", "Jonquière", "Kamouraska", "Lévis", "Miramichi", "Nepean", "Outlook", "Peoria", "Quilcene", "Regina", "Springfield", "Thetford Mines", "Uxbridge", "Valleyfield", "Woodstock", "Xenon", "Yankton", "Zabriskie"],
    ["Austin", "Blainville", "Clifton", "Dunham", "Eugene", "Fermont", "Glendale", "Hope", "Irwin", "Joplin", "Kingston", "Lethbridge", "Monroe", "Nogales", "Oshawa", "Penticton", "Quantico", "Rockford", "Syracuse", "Terrace", "Uplands", "Vicksburg", "Windsor", "Xenia", "Yarmouth", "Zephyr"],
    ["Amherst", "Buffalo", "Cedar", "Dorval", "Eastman", "Forestville", "Gastonia", "Henryville", "Inukjuak", "Joliette", "Kinston", "Lorraine", "Montague", "Newton", "Oromocto", "Pembroke", "Quincy", "Roseville", "Sudbury", "Trois-Rivières", "Uxbridge", "Ville-Marie", "Westmount", "Xavier", "Yorkton", "Zebulon"],
    ["Atlanta", "Brossard", "Chester", "Dallas", "Entrelacs", "Fabre", "Gilbert", "Hamilton", "Iroquois", "Joliette", "Kingsley", "Lincoln", "Mansfield", "Nelson", "Oka", "Pueblo", "Quesnel", "Russell", "Saskatoon", "Union", "Uplands", "Val-d'Or", "Winnipeg", "Xanadu", "Yonkers", "Zionville"],
    ["Austin", "Burlington", "Columbus", "Denver", "El Paso", "Fresno", "Greensboro", "Hudson", "Ithaca", "Jericho", "Kenner", "London", "Milton", "Neuville", "Ontario", "Phoenix", "Qualicum", "Rochester", "San Jose", "Tucson", "Urbana", "Vernon", "Westminster", "Xerxes", "York", "Zephyrhills"]
];

_random = floor (random 10);
cgqc_location_currentCities = cgqc_location_cities select _random;

/*
cgqc_location_us = [
	["Atlanta", "Albany", "Austin", "Aurora", "Amherst", "Aylmer"],
	["Baltimore", "Banff", "Burlington", "Blainville", "Brossard", "Bathurst", "Boston", "Buffalo"],
	["Cleveland", "Chicago", "Columbus", "Calgary", "Carlton", "Cedar", "Cornwall", "Chester", "Clifton", "Coral"],
	["Dallas", "Durham", "Dunham", "Denver", "Delson", "Dolbeau", "Dorval", "Drummond", "Donnacona"],
	["Eugene", "El Paso", "Eureka", "Eastman", "Entrelacs"],
	["Fresno", "Fargo", "Fairfax", "Fremont", "Farnham", "Ferland", "Fermont", "Fabre", "Frampton", "Frontenac", "Frelighsburg", "Forestville"],
	["Greensboro", "Garland", "Gilbert", "Gresham", "Gastonia", "Georgetown", "Gainesville", "Geneva", "Glendale", "Greenwood", "Guelph", "Grimsby", "Goderich", "Granby", "Gibbons", "Gatineau", "Greenwood", "Granby", "Gaspé", "Gatineau", "Granby", "Gentilly", "Granville", "Grandes-Piles"],
	["Houston", "Hartford", "Hoboken", "Helena", "Hampton", "Hamilton", "Halifax", "Hinton", "Huntsville", "Hudson", "Hawkesbury", "Hébertville", "Hemmingford", "Howick", "Hampstead", "Harrington", "Hatley", "Hope", "Havelock", "Havre-Aubert", "Hérouxville", "Huntingdon", "Henryville", "Hemmingford", "Ham-Sud"],
	["Indianapolis", "Indio", "Irving", "Irvine", "Ithaca", "Ingram", "Irwin", "Innisfil", "Inuvik", "Iroquois", "Innisfail", "Inverness", "Inukjuak", "Iberville", "Irlande"],
	["Jacksonville", "Jackson", "Jasper", "Joliet", "Joplin", "Juneau", "Jersey", "Jamestown", "Jericho", "Jenkins", "Johnson", "Jansen", "Joliette", "Jonquière", "Joffre", "Joly", "Joutel", "Jacmel", "Jumelles", "Joliette", "Jonquière"],
	["Kansas", "Kinston", "Kingsley", "Keene", "Kenner",  "Kelowna", "Kingston", "Kenora", "Kirkland",  "Kincardine", "Kanata", "Kemptville", "Killam", "Kapuskasing", "Kamouraska", "Kirkland"],
	["Lincoln", "Laredo", "Lansing", "Lafayette", "Lakeland", "London", "Leduc", "Lindsay", "Lethbridge", "Laval", "Lorraine", "Lévis", "Lorrainville", "LaSalle", "Lachine"],
	["Memphis", "Madison", "Midland", "Macon", "Marion", "Monroe", "Medford", "Milford", "Mobile", "Mansfield", "Milton", "Moncton", "Morden", "Moose Jaw", "Martensville", "Midland", "Miramichi", "Montague", "Melville", "Montreal", "Magog", "Mascouche", "Matane", "Montmagny", "Mont-Laurier", "Marieville", "Mont-Tremblant"],
	["New York", "Nashville", "Newark", "Norfolk", "Naples", "Norman", "Newton", "Nampa", "Napa", "Nogales", "Newport", "Nelson", "Nanaimo", "Norwood", "Nepean", "Newmarket", "Neepawa", "Napierville",  "Neuville", "Nicolet", "Norbertville", "Normandin", "Natashquan", "Notre-Dame", "Nantes"],
	["Omaha", "Orlando", "Oakland", "Odessa", "Olathe", "Orem", "Olympia", "Oxford", "Ontario", "Ottawa", "Oshawa", "Oakville",  "Owen Sound", "Outlook", "Oromocto", "Oliver", "Oxbow", "Orford", "Ormstown", "Otterburn", "Orsainville", "Oka", "Outremont", "Otterburn", "Odanak", "Ostiguy", "Omerville"],
	["Philadelphia", "Phoenix", "Plano", "Pasadena", "Provo", "Paterson", "Pueblo", "Peoria", "Parker", "Pembroke", "Penticton", "Pickering"],
	["Quincy", "Québec City", "Quakertown", "Qualicum", "Quesnel", "Quispamsis", "Quincy", "Quilcene", "Quantico", "Queens", "Quarryville", "Quinton"],
	["Richmond", "Reno", "Raleigh", "Rochester", "Rockford", "Roseville", "Redmond", "Rockville", "Russell", "Regina", "Red Deer", "Richmond Hill"],
	["Seattle", "San Diego", "San Jose", "Savannah", "Spokane", "Salem", "Sarasota", "Springfield", "Syracuse", "Sudbury", "Saskatoon", "Sherbrooke"],
	["Toronto", "Tampa", "Tucson", "Topeka", "Tulsa", "Thorold", "Thunder Bay", "Trois-Rivières", "Trenton", "Trail", "Terrace", "Thetford Mines"],
	["Utica", "Union", "Urbana", "Ukiah", "Upland", "Uxbridge", "Unity", "Ucluelet", "Upper Musquodoboit", "Uxbridge", "Upton", "Ushaw Moor"],
	["Vancouver", "Victoria", "Valdosta", "Valparaiso", "Vernon", "Vicksburg", "Visalia", "Ventura", "Ville-Marie", "Val-d'Or", "Valleyfield", "Victoriaville"],
	["Washington", "Wichita", "Wilmington", "Worcester", "Westminster", "Waterloo", "Windsor", "Whitby", "Welland", "Woodstock", "Winnipeg", "Westmount"],
	["Xenia", "Xavier", "Xanadu", "Xochimilco", "Xanadu", "Xenia", "Xerxes", "Xanadu", "Xochimilco", "Xylophon", "Xander", "Ximenes"],
	["Yonkers", "York", "Yuma", "Ypsilanti", "Yukon", "Yellowknife", "Yarmouth", "Yorkton", "Yorkville", "Yankton", "Yates", "Yarker"],
	["Zanesville", "Zephyrhills", "Zion", "Zebulon", "Zimmerman", "Zeballos", "Zion", "Zephyr", "Zenda", "Zionville", "Zabriskie", "Zwolle"]
];*/

// Wakeup
player setVariable ["cgqc_player_wakeup_time", 0, true];

cgqc_subskills = [
	"aimingAccuracy", "aimingShake", "aimingSpeed", "spotDistance", "spotTime",
	"courage", "reloadSpeed", "commanding", "general"
];

// *** Mission stuff *******************
cgqc_mission_daytime = true;
cgqc_mission_isDark = false;

// *** Anti/DRO compats ******************
cgqc_mission_dro = false;
cgqc_mission_dro_ready = false;

// *** GameState stuff *********************
cgqc_acre_defaultVolume = 0.4;
cgqc_acre_defaultLevel = 0.25;
cgqc_acre_previousVolume = 0;
cgqc_acre_previousLevel = 0;

// *** Magic range stuff *******************
cgqc_range_on = false;
cgqc_range_player_pos = [];
cgqc_range_lane_1_on = false;
cgqc_range_lane_1_check = false;
cgqc_range_lane_2_on = false;
cgqc_range_lane_2_check = false;
cgqc_range_lane_3_on = false;
cgqc_range_lane_3_check = false;
cgqc_range_lane_4_on = false;
cgqc_range_lane_4_check = false;
cgqc_range_lane_5_on = false;
cgqc_range_lane_5_check = false;
cgqc_range_lane_6_on = false;
cgqc_range_lane_6_check = false;
cgqc_range_lane_7_on = false;
cgqc_range_lane_7_check = false;
cgqc_range_lane_8_on = false;
cgqc_range_lane_8_check = false;
cgqc_range_lane_9_on = false;
cgqc_range_lane_9_check = false;

// Test range
cgqc_outdoor_range_tp = false;
cgqc_outdoor_range_hide = false;

// *** DLC stuff *******************
cgqc_player_ownedDLCs = [];
cgqc_player_hasAceMedical = false;
cgqc_player_hasContact = false;
cgqc_player_hasSahara = false;
cgqc_player_hasAnti = false;
cgqc_player_hasRHS = false;
cgqc_player_hasDrongoFactions = false;
cgqc_player_has23rd = false;
cgqc_player_has2023 = false;
cgqc_player_hasIfa3 = false;
cgqc_player_hasNorthern = false;
cgqc_player_hasUnsung = false;
cgqc_player_isModern = false;
cgqc_player_isWw2 = false;
cgqc_player_isVietnam = false;
// *** Perks **********************
cgqc_perks_basic = false;
cgqc_perks_hq = false;
cgqc_perks_sl = false;
cgqc_perks_tl = false;
cgqc_perks_recon = false;
cgqc_perks_diver = false;
cgqc_perks_diver_suit_on = false;
cgqc_perks_para = false;
cgqc_perks_pilot = false;
cgqc_perks_driver = false;
cgqc_perks_pilot_hasCrew = false;
cgqc_perks_driver_hasDriver = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;
cgqc_perks_silence = false;
cgqc_config_fortify_list = [];
cgqc_perks_chems = 10;
cgqc_perks_panel = false;
cgqc_perks_action_list = [];
cgqc_reset_speaker = false;
cgqc_stash_pack = false;
cgqc_stash_pack_backup = [];
cgqc_stash_uniform_backup = "";
cgqc_stash_uniform = false;
cgqc_stash_vest = false;
cgqc_stash_vest_backup = [];
cgqc_stash_head = false;
cgqc_stash_head_backup = [];
cgqc_stash_guns = false;
cgqc_stash_guns_backup = [];
cgqc_stash_launcher = false;
cgqc_stash_launcher_backup = [];
cgqc_stash_vic = [];
cgqc_backpack_dropped = false;
cgqc_backpack_dropped_notif = false;
cgqc_perks_tracking = 5;
// Map stuff
cgqc_map_centerOnplayer = false;
cgqc_map_centerOnLast = false;
cgqc_map_centerOldPosition = [];
// Advanced perks
cgqc_perks_ghillie_isOn = false;
cgqc_perks_ghillie_uniform = "";
cgqc_perk_player_stash_on = false;
cgqc_player_stash_items = [];
cgqc_player_stash_mags = [];
cgqc_perks_camo = false;

// Zeus perks
cgqc_zeus_event = false;
cgqc_zeus_crate = false;
cgqc_zeus_cargo = false;
cgqc_zeus_mapRestricted = false;
cgqc_zeus_mapRestricted_count = 0;
cgqc_zeus_mapRestricted_txt = "";
cgqc_zeus_mapRestricted_txt_on = false;
cgqc_zeus_god = false;
cgqc_zeus_ghost = false;
cgqc_zeus_attached = false;
cgqc_blackout_player_on = false;
cgqc_zeus_radios_set = false;

// PAX System
cgqc_pax_prep = false;

// Sniping stuff
cgqc_training_mode = false;
cgqc_training_sniping = false;
cgqc_training_sniping_comp = [];
cgqc_training_sniping_comp_on = false;
cgqc_spawn = false;
cgqc_spawn_vic = "";
cgqc_sniping_movingTarget = false;
cgqc_sniping_distanceMode = 0;
cgqc_sniping_hit = [];
cgqc_damage_text = [];
// Set up spotter list
missionNamespace setVariable ["cgqc_sniping_spotters", [], true];

// Medical stuff
cgqc_training_medical = false;

// Parachute
cgqc_training_jump = false;
cgqc_training_jump_target = true;
cgqc_training_jump_comp_on = false;
cgqc_training_jump_autoOpen = true;
cgqc_training_jump_comp = [];

// EOD
cgqc_training_eod_objects = [];

// Landnav
cgqc_training_landnav = false;
cgqc_training_landnav_start_time = 0;
cgqc_training_landnav_targetlist = [];
cgqc_training_landnav_distance = 0;
// Landnav default options
cgqc_training_landnav_objective = "city";
cgqc_training_landnav_difficulty = 1;
cgqc_training_landnav_min = 1000;
cgqc_training_landnav_max = 2000;
cgqc_training_landnav_patrols = 0;
cgqc_training_landnav_hunters = 0;
cgqc_training_landnav_playerAssigned = [];
cgqc_training_landnav_playerItems = [];
cgqc_training_landnav_playerBinos = "";

// Convoy
cgqc_training_convoy = false;
cgqc_training_convoy_speed = 60;
cgqc_training_convoy_distance = 15;
cgqc_training_convoy_behavior = 0; // other is "AWARE"
cgqc_training_convoy_vics = ["random", "random", "random", "random", "nothing", "nothing" ];
cgqc_training_convoy_debug = 0;
cgqc_training_convoy_allUnits = [];
cgqc_training_convoy_allVics = [];

// Defense
cgqc_defense_timer = 0;
cgqc_training_defense = false;
cgqc_defense_done = false;
cgqc_defense_start = false;
// Helicopter training
cgqc_training_heli = false;
cgqc_heli_difficulty = 0;
// Mortar training
cgqc_training_mortar = false;
// KOTH training
cgqc_training_koth = false;
cgqc_training_koth_towers_count = 1;
cgqc_training_koth_towers = [];
cgqc_training_koth_difficulty = 1;
cgqc_training_koth_list = [];

// Shooting range
cgqc_training_targetList = [];
cgqc_training_zero_hits = [];

// CQB house training stuff
cgqc_cqb_list = [];
cgqc_cqb_list_moving = [];
cgqc_cqb_list_static = [];
cgqc_cqb_list_civ = [];
cgqc_cqb_on = false;
cgqc_cqb_target_nbr = 10;
cgqc_cqb_move = 0;
cgqc_cqb_timer = 0;
cgqc_cqb_timer_random = false;
cgqc_cqb_civ = false;
cgqc_cqb_nade = false;
cgqc_cqb_tgt_move = 0;
cgqc_cqb_tgt_static = 0;
cgqc_cqb_paused = false;
cgqc_cqb_hostile_class = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F"];
cgqc_cqb_civ_class = ["C_journalist_F", "C_Journalist_01_War_F"];
// *** Mk2 **********************
cgqc_mk2_arsenal_init_done = false;
cgqc_mk2_arsenal_locked = true;
cgqc_mk2_animation_locked = false;
cgqc_mk2_punch_locked = false;
cgqc_mk2_arsenal_ctr = 0;
// *** Unsung **********************
cgqc_unsung_arsenal_init_done = false;
cgqc_unsung_blufor = ["UNSUNG_W","UNSUNG_ROK","UNSUNG_AUS","UNSUNG_NZ"];
// *** IFA3 **********************
cgqc_ifa3_arsenal_init_done = false;
cgqc_ifa3_blufor = ["LIB_DAK", "LIB_FSJ", "LIB_WEHRMACHT", "LIB_WEHRMACHT_w", "SG_STURM"];
// *** Scandinavia **********************
cgqc_scandinavia_arsenal_init_done = false;
cgqc_scandinavia_blufor = ["NORTH_FIN", "NORTH_NOR","LIB_US_ARMY_w", "LIB_UK_ARMY_w", "LIB_UK_AB_w"];
// *** Refueling *****************
cgqc_flag_supply = false;
cgqc_flag_supply_rapide = false;
// *** Unconscious sounds *****************
cgqc_unconscious_sounds = [];
// *** MapSharing default value (instead of 7) *****************
jibrm_restrictmarkers_shareDistance = 10;
// list of non-silencer muzzle adapters
cgqc_list_brakes = ["training_attachment_adapter_base","training_attachment_suppressor_base","training_attachment_adapter_alt_blue","training_attachment_adapter_blue","training_attachment_adapter_yellow","training_attachment_adapter_alt_yellow","training_attachment_suppressor_alt_blue","training_attachment_suppressor_blue","training_attachment_suppressor_yellow","training_attachment_suppressor_alt_yellow","training_attachment_suppressor_762_alt_blue","training_attachment_suppressor_762_blue","training_attachment_suppressor_762_alt_yellow","training_attachment_suppressor_762_yellow","121_USASOC_SFMB338","hlc_muzzle_A1_FlashHider","hlc_muzzle_Miter18T","Tier1_Agency_Compensator","rhs_acc_uuk","hlc_muzzle_apology","rhsusf_acc_ARDEC_M240","hlc_muzzle_snds_ArsenalComp","hlc_muzzle_snds_ROTEX3P","hlc_muzzle_Gunfighter_comp","rhs_acc_dtk1l","hlc_muzzle_Brevis","rhs_acc_ak5","rhs_acc_dtkakm","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","hlc_muzzle_E1_FlashHider","ACE_muzzle_mzls_338","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_L","ACE_muzzle_mzls_H","ACE_muzzle_mzls_B","ACE_muzzle_mzls_smg_02","ACE_muzzle_mzls_93mmg","hlc_muzzle_MAG58_Brake","hlc_muzzle_17SBrake","hlc_muzzle_OEMDevice_556","hlc_muzzle_OEMDevice","rhsgref_acc_falMuzzle_l1a1","rhsusf_acc_m14_flashsuppresor","rhsusf_acc_m24_muzzlehider_black","rhsusf_acc_m24_muzzlehider_d","rhsusf_acc_m24_muzzlehider_wd","rhs_acc_pgs64_74un","rhs_acc_pgs64","rhs_acc_pgs64_74u","hlc_muzzle_FSC30","hlc_muzzle_Cherrybomb","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","rhs_acc_dtkrpk","hlc_muzzle_SF3P_556","hlc_muzzle_SF3P_68","hlc_muzzle_SF3P_762","hlc_muzzle_SF3P_762R","rhsgref_acc_zendl"];

// Check what DLC the player owns
cgqc_player_ownedDLCs = getDLCs 1;
cgqc_player_hasContact = (1021790 in cgqc_player_ownedDLCs);
// CDLC
cgqc_player_hasSahara = (1681170 in cgqc_player_ownedDLCs);

// Mods and actively loaded DLC's
cgqc_player_hasAceMedical = ["ace_medical_treatment"] call ace_common_fnc_isModLoaded;
cgqc_player_hasAnti = ["A3A_Events"] call ace_common_fnc_isModLoaded;

cgqc_player_has23rd = ["23rd_Logo_core"] call ace_common_fnc_isModLoaded;
cgqc_player_hasRHS = ["rhsusf_weapons"] call ace_common_fnc_isModLoaded;
cgqc_player_hasDrongoFactions = ["DSF_ABUS"] call ace_common_fnc_isModLoaded;
cgqc_player_has2023 = ["CGQC_2022"] call ace_common_fnc_isModLoaded;
cgqc_player_hasSWAT = ["CGQC_SWAT"] call ace_common_fnc_isModLoaded;
cgqc_player_hasNorthern = ["NORTH_Main"] call ace_common_fnc_isModLoaded;
cgqc_player_hasIfa3 = ["WW2_Core_c_IF_Data_c"] call ace_common_fnc_isModLoaded;
cgqc_player_hasUnsung = ["uns_base"] call ace_common_fnc_isModLoaded;
// Eras
if (cgqc_player_hasIfa3) then {cgqc_player_isWw2 = true;}; // WW2
if (cgqc_player_hasNorthern) then {cgqc_player_isWw2 = true;}; // WW2
if (cgqc_player_hasUnsung) then {cgqc_player_isVietnam = true;}; // Vietnam
if (!cgqc_player_isVietnam && !cgqc_player_isWw2) then {
	cgqc_player_isModern = true;
};

//For specific modes of games, skip some options
if (cgqc_player_hasAnti) then {
	cgqc_player_loadAll = false;
	cgqc_mission_dro = true;
};

// Western sahara missions
/*
if (cgqc_player_hasSahara) then {
	cgqc_player_loadAll = false;
	//cgqc_mission_dro = true;
};*/

/*
// Acre default radio
if (cgqc_player_hasUnsung) then {
	// Weird radio for Vietnam use
	["ACRE_SEM52SL"] call acre_api_fnc_setItemRadioReplacement;
}else{
	// Default modern radio = 152
	["ACRE_PRC152"] call acre_api_fnc_setItemRadioReplacement;
};*/

// Key-fucking-binds ===================================================================================
#include "\cgqc\cfg\cfg_keybinds.hpp"
#include "\cgqc\cfg\cfg_keybinds_tsp.hpp"

// Init loading event
CGQC_playerLoaded = false;
addMissionEventHandler ["PreloadFinished",
{
  CGQC_playerLoaded = true;
}];

// Initial roster
[] spawn CGQC_fnc_loadDiaryRoster;
[] spawn CGQC_fnc_loadDiaryRecord;
// Original map position
_map = (findDisplay 12 displayCtrl 51);
cgqc_map_centerOldPosition = [_map ctrlMapScreenToWorld [0.5, 0.5], ctrlMapScale _map];

// Map open/close
cgqc_mapOpen = addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	cgqc_mapOpened = _mapIsOpened;
	// Refresh the roster every 5 seconds
	[_mapIsOpened, _mapIsForced] spawn {
		params ["_mapIsOpened", "_mapIsForced"];
		if (_mapIsOpened) then {
			["center"] call CGQC_fnc_centerMap;
			[] spawn CGQC_fnc_loadDiaryRoster;
			[] spawn CGQC_fnc_loadDiaryRecord;
			/*
			while {cgqc_mapOpened} do {
				[] spawn CGQC_fnc_loadDiaryRoster;
				sleep 10;
			};*/
		} else {
			_map = (findDisplay 12 displayCtrl 51);
			cgqc_map_centerOldPosition = [_map ctrlMapScreenToWorld [0.5, 0.5], ctrlMapScale _map];
		};
	};
}];



// Medical menu / IFAK eventhandler
["ace_medicalMenuOpened", {
    params ["_acePlayer", "_targetPlayer", "_display"];
	// Check if target has an IFAK
	if([_targetPlayer, 'cgqc_items_ifak'] call BIS_fnc_hasItem) then {
		['ifak', _targetPlayer, false] call CGQC_fnc_openMedical;
	};
	// Check if player
	if([player, 'cgqc_items_medkit'] call BIS_fnc_hasItem) then {
		['medkit', _targetPlayer, false] call CGQC_fnc_openMedical;
	};
    //hint format ["Player %1 opened the ACE medical menu of player %2.", name _acePlayer, name _targetPlayer];
}] call CBA_fnc_addEventHandler;

// Event to catch the player's controlled UAV
player addEventHandler ["VisionModeChanged", {
	params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
	if !(alive player) exitWith {};
	if (_vehicle isEqualTo (getConnectedUAV player)) then {
		cgqc_player_uav = _vehicle;
	};
}];


// Shot hit to spotter
["cgqc_event_showHitToSpotter", {
    params["_pos"];
	_spr = createSimpleObject ["Sign_Sphere10cm_F", [0,0,0], false];
	_spr setPosASL _pos;
	_spr setObjectScale 5;
	[_spr] spawn {
		params ["_spr"];
		sleep 2;
		deleteVehicle _spr;
	};
}] call CBA_fnc_addEventHandler;

// EOD Training eventhandler
["ACE_explosives_defuse", {
    params ["_explosive", "_unit"];
	_check = _explosive getVariable ["CGQC_eod_marker", "none"];
    if (_check isNotEqualTo "none") then {
        deleteVehicle _check;
        [["Good job Viper!", 1.5], false] call CBA_fnc_notify;
		[_explosive] spawn {
			params ["_explosive"];
			sleep 5;
			deleteVehicle _explosive;
		};
    };
}] call CBA_fnc_addEventHandler;

["ace_explosives_place", {
    params ["_explosive", "_dir", "_pitch", "_unit"];
	(side _unit) revealMine _explosive;
}] call CBA_fnc_addEventHandler;


// Addon Options ===================================================================================================
_menu_name = "[CGQC Zeus] Mission Settings";


/*
// Options CBA
Parameters
_setting	Unique setting name.  Matches resulting variable name STRING
_settingType	Type of setting.  Can be “CHECKBOX”, “EDITBOX”, “LIST”, “SLIDER” or “COLOR” STRING
_title	Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
_category	Category for the settings menu + optional sub-category <STRING, ARRAY>
_valueInfo	Extra properties of the setting depending of _settingType.  See examples below <ANY>
_isGlobal	1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
_script	Script to execute when setting is changed.  (optional) <CODE>
_needRestart	Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
Returns
_return	Error code <BOOLEAN> true: Success, no error false: Failure, error
Examples
// CHECKBOX --- extra argument: default value
["Test_Setting_1", "CHECKBOX", ["-test checkbox-", "-tooltip-"], "My Category", true] call CBA_fnc_addSetting;

// LIST --- extra arguments: [_values, _valueTitles, _defaultIndex]
["Test_Setting_2", "LIST",     ["-test list-",     "-tooltip-"], "My Category", [[1, 0], ["enabled","disabled"], 1]] call CBA_fnc_addSetting;

// SLIDER --- extra arguments: [_min, _max, _default, _trailingDecimals, _isPercentage]
["Test_Setting_3", "SLIDER",   ["-test slider-",   "-tooltip-"], "My Category", [0, 10, 5, 0]] call CBA_fnc_addSetting;

// COLOR PICKER --- extra argument: _color
["Test_Setting_4", "COLOR",    ["-test color-",    "-tooltip-"], "My Category", [1, 1, 0]] call CBA_fnc_addSetting;

// EDITBOX --- extra argument: default value
["Test_Setting_5", "EDITBOX",  ["-test editbox-", "-tooltip-"], "My Category", "defaultValue"] call CBA_fnc_addSetting;

// TIME PICKER (time in seconds) --- extra arguments: [_min, _max, _default]
["Test_Setting_6", "TIME",     ["-test time-",    "-tooltip-"], "My Category", [0, 3600, 60]] call CBA_fnc_addSetting;

*/
//Intro Stuff
_section_name = "Mission Options";

["cgqc_config_droneRestriction", "LIST", ["Drones permis", "Types d'optiques disponibles dans le quick switcher"],
	[_menu_name, "Drone Restriction"], [[0, 1, 2, 3], ["No Drones", "BlackHornet only", "+Darter", "Unrestricted"], 2], {publicVariable "cgqc_config_droneRestriction"}] call CBA_fnc_addSetting;


_section_name = "Intro/Cinématiques";
["cgqc_config_showIntro", "CHECKBOX", ["Show Intro", "Intro en début de mission"],
    [_menu_name, _section_name], true] call CBA_fnc_addSetting;
["cgqc_config_showIntro_type", "LIST", ["Intro Style", "Various Intro styles"],
  [_menu_name, _section_name], [[0, 1, 2], ["Original/Logo","Flying", "Establishing"], 0], {publicVariable "cgqc_config_showIntro_type"}] call CBA_fnc_addSetting;
// Options skippables ===================================================================================================
["cgqc_setting_show_transition", "CHECKBOX", ["Show Transition", "Transition lors d'un loadout swtich "],
    [_menu_name, _section_name], true] call CBA_fnc_addSetting;
["cgqc_setting_show_welcome", "CHECKBOX", ["Show Msg de Bienvenue", "Message de bienvenue avec la patch si dispo"],
    [_menu_name, _section_name], true] call CBA_fnc_addSetting;

// Info sur la mission
cgqc_config_author = getMissionConfigValue ["author", "Cpl. Quelquechose"];
cgqc_config_mission_name = getMissionConfigValue ["onLoadName", "Mission: Something"];

// Option toggles ===================================================================================================
// Training
["cgqc_flag_isTraining", "CHECKBOX", ["Training setup?", "Unlock tout les objets et setup radio spécifique"],
    [_menu_name, "Option Toggles"], false] call CBA_fnc_addSetting;
// Training respawn points
["cgqc_training_spawnpoints", "CHECKBOX", ["Spawnpoint on Arsenals", "Auto-create spawnpoints on mk3 arsenals"],
    [_menu_name, "Option Toggles"], false, 1, {publicVariable "cgqc_flag_backpackNotif"}] call CBA_fnc_addSetting;
// Map Sharing
["cgqc_zeus_mapRestricted", "CHECKBOX",["Restrict map sharing", "Empêche les markeurs magiques"],
   [_menu_name, "Option Toggles"], false, 1, {jib_restrictmarkers_enabled = cgqc_zeus_mapRestricted;publicVariable "jib_restrictmarkers_enabled";}, false] call CBA_fnc_addSetting;
// Spares
["cgqc_config_spares", "CHECKBOX",["Add spares to Vehicles", "Inclus un can de fuel + ammo + tracks/tires"],
[_menu_name, "Option Toggles"], true] call CBA_fnc_addSetting;
["cgqc_config_signals", "CHECKBOX",["Signals perk available", "Lets player spawn smoke/flare/chemlights"],
[_menu_name, "Option Toggles"], true, 1, {}, false] call CBA_fnc_addSetting;
// Zeus radios
["cgqc_config_zeusRadios", "CHECKBOX",["Auto-Add Zeus Radios", "Ajoute automatiquement les radios sur le zeus"],
[_menu_name, "Option Toggles"], false, 1, {}, false] call CBA_fnc_addSetting;
["cgqc_flag_backpackNotif", "CHECKBOX", ["Backpack Notification", "Notify the player if he moves too far from his pack"],
    [_menu_name, "Option Toggles"], true, 1, {publicVariable "cgqc_flag_backpackNotif"}, false] call CBA_fnc_addSetting;

["cgqc_config_sideLanguage", "CHECKBOX", ["Separate language per side", "Each side has specific languages"],
	[_menu_name, "Adversarial"], false, 1, {publicVariable "cgqc_config_sideLanguage"}] call CBA_fnc_addSetting;
["cgqc_config_sideRadios", "CHECKBOX", ["Separate radios per side", "Each side has specific radio frequencies"],
	[_menu_name, "Adversarial"], false, 1, {publicVariable "cgqc_config_sideRadios"}] call CBA_fnc_addSetting;

// Custom medical stuff ===================================================================================================
["cgqc_player_wakeup_active", "CHECKBOX", ["Activate custom wakeup", "Randomly lets player wake up if not in cardia arrest"],
	[_menu_name, "Custom Medical"], false, 1, {publicVariable "cgqc_player_wakeup_active"}] call CBA_fnc_addSetting;
["cgqc_player_wakeup_min","SLIDER", ["Min Wakeup check", "Minimum time before a wakeup check"],
	[_menu_name, "Custom Medical"], [5, 300, 10, 0], 1, {publicVariable "cgqc_player_wakeup_min"}, false] call CBA_fnc_addSetting;
["cgqc_player_wakeup_max","SLIDER", ["Max Wakeup check", "Maximum time before a wakeup check"],
	[_menu_name, "Custom Medical"], [5, 300, 30, 0], 1, {publicVariable "cgqc_player_wakeup_max"}, false] call CBA_fnc_addSetting;
["cgqc_player_wakeup_random","SLIDER", ["Chance of wakeup", "Random chance of waking up"],
	[_menu_name, "Custom Medical"], [0, 100, 30, 0], 1, {publicVariable "cgqc_player_wakeup_random"}, false] call CBA_fnc_addSetting;
["cgqc_player_wakeup_randomBoost","SLIDER", ["Bonus for next check", "More % bonus at each fail to get more chance to wake up"],
	[_menu_name, "Custom Medical"], [0, 100, 10, 0], 1, {publicVariable "cgqc_player_wakeup_randomBoost"}, false] call CBA_fnc_addSetting;

// Radio stuff ==============================================================================================
["cgqc_config_hide_channels", "CHECKBOX",["Lock Channels (pour le map sharing)", "Cache les channels global/side/group pour utiliser plutôt le mod pour partager la map"],
   [_menu_name, "Radios"], false] call CBA_fnc_addSetting;
["cgqc_config_DefaultRadios", "CHECKBOX", ["Radios CGQC", "Utilise les noms de channels CGQC par défaut"],
    [_menu_name, "Radios"], true] call CBA_fnc_addSetting;
["cgqc_config_ch1", "EDITBOX", ["Channel 1:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Spartan/HQ"] call CBA_fnc_addSetting;
["cgqc_config_ch2", "EDITBOX", ["Channel 2:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Support/HQ"] call CBA_fnc_addSetting;
["cgqc_config_ch3", "EDITBOX", ["Channel 3:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Griffon"] call CBA_fnc_addSetting;
["cgqc_config_ch4", "EDITBOX", ["Channel 4:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"],  "Centaure"] call CBA_fnc_addSetting;
["cgqc_config_ch5", "EDITBOX", ["Channel 5:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Recon"] call CBA_fnc_addSetting;
["cgqc_config_ch6", "EDITBOX", ["Channel 6:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Convoy 1"] call CBA_fnc_addSetting;
["cgqc_config_ch7", "EDITBOX", ["Channel 7:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Convoy 2"] call CBA_fnc_addSetting;
["cgqc_config_ch8", "EDITBOX", ["Channel 8:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Libre"] call CBA_fnc_addSetting;
["cgqc_config_ch9", "EDITBOX", ["Channel 9:", "Nom affiché dans le jeux"],
    [_menu_name, "Radios"], "Zeus"] call CBA_fnc_addSetting;


// Gamestate ===============================================================================================
["cgqc_config_state_pause", "CHECKBOX",["Auto-Pause AI before/after mission", "Pauses the AI when mission is not running. Unpaused manually or at mission start"],
[_menu_name, "GameState"], false, 1, {publicVariable "cgqc_config_state_pause"}, false] call CBA_fnc_addSetting;
// Briefing
["cgqc_setting_briefingCmd_area","SLIDER", ["Leaders's Briefing area size", "Square around the Zeus"],
[_menu_name, "GameState"], [5, 50, 10, 0]] call CBA_fnc_addSetting;
["cgqc_setting_briefing_area","SLIDER", ["Full Briefing area size", "Square around the Zeus"],
[_menu_name, "GameState"], [5, 100, 20, 0]] call CBA_fnc_addSetting;


// Fixes ===============================================================================================
// Color fix
["cgqc_config_fix_colorFix", "CHECKBOX",["Auto-reload colors", "Reloads color on a timed basis"],
[_menu_name, "Fixes"], false, 1] call CBA_fnc_addSetting;

["cgqc_config_fix_colorFix_timer","SLIDER", ["Auto-reload colors - Timer", "Delay between checks"],
[_menu_name, "Fixes"], [5, 600, 30, 0]] call CBA_fnc_addSetting;



// Grenade in Hatch ===============================================================================================
// Distance
["cgqc_config_grenade_distance", "SLIDER",["Distance", "Minimal distance for option to be visible"],
[_menu_name, "Grenade in tank Hatch"], [2, 20, 5, 0], 1, {publicVariable "cgqc_config_grenade_distance"}, false] call CBA_fnc_addSetting;
// Types
["cgqc_config_grenade_types","EDITBOX", ["Compatible Grenades", "Classnames usable to drop in tank hatches"],
	[_menu_name, "Grenade in tank Hatch"],
	"gm_handgrenade_conc_dm51,gm_handgrenade_conc_dm51a1,gm_handgrenade_frag_dm51,gm_handgrenade_frag_dm51a1,gm_handgrenade_frag_rgd5,vn_chicom_grenade_mag,vn_f1_grenade_mag,vn_m34_grenade_mag,vn_m61_grenade_mag,vn_m67_grenade_mag,vn_rg42_grenade_mag,vn_rgd33_grenade_mag,vn_rgd5_grenade_mag,vn_rkg3_grenade_mag,vn_t67_grenade_mag,vn_v40_grenade_mag,CUP_HandGrenade_L109A1_HE,CUP_HandGrenade_L109A2_HE,CUP_HandGrenade_M67,HandGrenade,CUP_HandGrenade_RGD5,CUP_HandGrenade_RGO,MiniGrenade, rhs_mag_rgd5, rhs_mag_m67, rhs_mag_an_m14",
	true
] call CBA_fnc_addSetting;



// Fortify tool ===============================================================================================
["cgqc_config_fortify", "CHECKBOX", ["Custom ACE Fortify", "Les items que l'outil fortify permet de construire"],
    [_menu_name, "Fortify"], true
] call CBA_fnc_addSetting;
// Item list
["cgqc_config_fortify_1", "EDITBOX", ["Item 1:", "Item 1"],
    [_menu_name, "Fortify"],"Land_BagFence_Short_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_2", "EDITBOX", ["Item 2:", "Item 2"],
    [_menu_name, "Fortify"],"Land_BagFence_Long_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_3", "EDITBOX", ["Item 3:", "Item 3"],
    [_menu_name, "Fortify"],"Land_BagFence_Round_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_4", "EDITBOX", ["Item 4:", "Item 4"],
    [_menu_name, "Fortify"],"Land_Plank_01_4m_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_5", "EDITBOX", ["Item 5:", "Item 5"],
    [_menu_name, "Fortify"],"Land_Plank_01_8m_F"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_6", "EDITBOX", ["Item 6:", "Item 6"],
    [_menu_name, "Fortify"],"Land_CamoNetVar_NATO"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_7", "EDITBOX", ["Item 7:", "Item 7"],
    [_menu_name, "Fortify"],"Land_fortified_nest_small_EP1"
] call CBA_fnc_addSetting;
["cgqc_config_fortify_8", "EDITBOX", ["Item 8:", "Item 8"],
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;
["cgqc_config_fortify_9", "EDITBOX", ["Item 9:", "Item 9"],
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;
["cgqc_config_fortify_10", "EDITBOX", ["Item 10:", "Item 10"],
    [_menu_name, "Fortify"],""
] call CBA_fnc_addSetting;

// IFAK/Medkit/Bandolier content ===================================================================================================
_menu_name = "[CGQC Zeus] Custom Containers";
// IFAK
["cgqc_config_ifak_bandages", "SLIDER",["Bandages", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 10, 0], 1, {publicVariable "cgqc_config_ifak_bandages"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_epi", "SLIDER",["Epinephrine", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 1, 0], 1, {publicVariable "cgqc_config_ifak_epi"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_morphine", "SLIDER",["Morphine", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 1, 0], 1, {publicVariable "cgqc_config_ifak_morphine"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_painkill", "SLIDER",["Painkillers", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 5, 0], 1, {publicVariable "cgqc_config_ifak_painkill"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_splint", "SLIDER",["Splint", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 1, 0], 1, {publicVariable "cgqc_config_ifak_splint"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_tourniquet", "SLIDER",["Tourniquets", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 4, 0], 1, {publicVariable "cgqc_config_ifak_tourniquet"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_ammonium", "SLIDER",["Ammonium Carbonate", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 1, 0], 1, {publicVariable "cgqc_config_ifak_ammonium"}, false] call CBA_fnc_addSetting;
["cgqc_config_ifak_liquids", "SLIDER",["Saline", "Number in IFAK"],
    [_menu_name, "Content: IFAK"], [0, 30, 2, 0], 1, {publicVariable "cgqc_config_ifak_liquids"}, false] call CBA_fnc_addSetting;



// Medic Supplies
["cgqc_config_medkit_bandages", "SLIDER",["Bandages", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 100, 50, 0], 1, {publicVariable "cgqc_config_medkit_bandages"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_epi", "SLIDER",["Epinephrine", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 20, 0], 1, {publicVariable "cgqc_config_medkit_epi"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_morphine", "SLIDER",["Morphine", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 20, 0], 1, {publicVariable "cgqc_config_medkit_morphine"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_adenosine", "SLIDER",["Adenosine", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 5, 0], 1, {publicVariable "cgqc_config_medkit_adenosine"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_painkill", "SLIDER",["Painkillers", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 50, 20, 0], 1, {publicVariable "cgqc_config_medkit_painkill"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_splint", "SLIDER",["Splint", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 25, 5, 0], 1, {publicVariable "cgqc_config_medkit_splint"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_ammonium", "SLIDER",["Ammonium Carbonate", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 15, 0], 1, {publicVariable "cgqc_config_medkit_ammonium"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_tourniquet", "SLIDER",["Tourniquets", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 25, 5, 0], 1, {publicVariable "cgqc_config_medkit_tourniquet"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_1000", "SLIDER",["Saline 1000ml", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 10, 0], 1, {publicVariable "cgqc_config_medkit_1000"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_500", "SLIDER",["Saline 500ml", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 30, 10, 0], 1, {publicVariable "cgqc_config_medkit_500"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_pak", "SLIDER",["PAK", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 5, 1, 0], 1, {publicVariable "cgqc_config_medkit_pak"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_smoke", "SLIDER",["Smoke (Purple)", "Number in medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 5, 2, 0], 1, {publicVariable "cgqc_config_medkit_smoke"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_medbag", "SLIDER",["Medbag", "Numberin medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 1, 1, 0], 1, {publicVariable "cgqc_config_medkit_medbag"}, false] call CBA_fnc_addSetting;
["cgqc_config_medkit_bodybag", "SLIDER",["BodyBags", "Numberin medkit"],
    [_menu_name, "Content: Medic Supplies"], [0, 20, 2, 0], 1, {publicVariable "cgqc_config_medkit_medbag"}, false] call CBA_fnc_addSetting;

// Ammo Bandoliers
["cgqc_config_ammo_primary", "SLIDER",["Primary mags", "Number in bandolier"],
	[_menu_name, "Content: Ammo Bandolier"], [0, 25, 8, 0], 1, {publicVariable "cgqc_config_ammo_primary"}, false] call CBA_fnc_addSetting;

["cgqc_config_ammo_refill", "CHECKBOX", ["Refill", "Refill handgun/throwables instead of adding more"],
	[_menu_name, "Content: Ammo Bandolier"], true] call CBA_fnc_addSetting;
["cgqc_config_ammo_handgun", "SLIDER",["Handgun mags", "Number in bandolier"],
	[_menu_name, "Content: Ammo Bandolier"], [0, 25, 2, 0], 1, {publicVariable "cgqc_config_ammo_handgun"}, false] call CBA_fnc_addSetting;


if (cgqc_player_hasNorthern) then {
	["cgqc_config_ammo_nade", "SLIDER",["Grenades", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 2, 0], 1, {publicVariable "cgqc_config_ammo_nade"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_nade_type", "EDITBOX", ["Grenade Type", "Type of grenade"],
		[_menu_name, "Content: Ammo Bandolier"], "NORTH_M43Grenade_mag"] call CBA_fnc_addSetting;

	["cgqc_config_ammo_flash", "SLIDER",["Flashbangs", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 0, 0], 1, {publicVariable "cgqc_config_ammo_flash"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_flash_type", "EDITBOX", ["Flashbang Type", "Type of bangs"],
		[_menu_name, "Content: Ammo Bandolier"], "tsp_flashbang_cts"] call CBA_fnc_addSetting;

	["cgqc_config_ammo_smoke", "SLIDER",["Smoke grenades", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 2, 0], 1, {publicVariable "cgqc_config_ammo_smoke"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_smoke_type", "EDITBOX", ["Smoke Grenade Type", "Type of smoke"],
		[_menu_name, "Content: Ammo Bandolier"], "NORTH_M43SmokeGrenade_mag"] call CBA_fnc_addSetting;

} else {
	["cgqc_config_ammo_nade", "SLIDER",["Grenades", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 4, 0], 1, {publicVariable "cgqc_config_ammo_nade"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_nade_type", "EDITBOX", ["Grenade Type", "Type of grenade"],
		[_menu_name, "Content: Ammo Bandolier"], "HandGrenade"] call CBA_fnc_addSetting;

	["cgqc_config_ammo_flash", "SLIDER",["Flashbangs", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 2, 0], 1, {publicVariable "cgqc_config_ammo_flash"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_flash_type", "EDITBOX", ["Flashbang Type", "Type of bangs"],
		[_menu_name, "Content: Ammo Bandolier"], "tsp_flashbang_cts"] call CBA_fnc_addSetting;

	["cgqc_config_ammo_smoke", "SLIDER",["Smoke grenades", "Number in bandolier"],
		[_menu_name, "Content: Ammo Bandolier"], [0, 25, 2, 0], 1, {publicVariable "cgqc_config_ammo_smoke"}, false] call CBA_fnc_addSetting;
	["cgqc_config_ammo_smoke_type", "EDITBOX", ["Smoke Grenade Type", "Type of smoke"],
		[_menu_name, "Content: Ammo Bandolier"], "SmokeShell"] call CBA_fnc_addSetting;
};



// Squad Supply box
["cgqc_config_supply_squad_ammo", "SLIDER",["Ammo bandoliers", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 50, 15, 0], 1, {publicVariable "cgqc_config_supply_squad_ammo"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_ifak", "SLIDER",["Kit: Individual First-Aid", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 50, 15, 0], 1, {publicVariable "cgqc_config_supply_squad_ifak"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_medkit", "SLIDER",["Kit: Medic Supply", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 50, 2, 0], 1, {publicVariable "cgqc_config_supply_squad_medkit"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_squad_launcher", "SLIDER",["Launchers", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 5, 2, 0], 1, {publicVariable "cgqc_config_supply_squad_launcher"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_nlaw", "SLIDER",["NLAW", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 5, 0, 0], 1, {publicVariable "cgqc_config_supply_squad_nlaw"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_squad_maaws", "SLIDER",["Maaws ammo", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 5, 4, 0], 1, {publicVariable "cgqc_config_supply_squad_maaws"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_javelin", "SLIDER",["Javelin ammo", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 5, 0, 0], 1, {publicVariable "cgqc_config_supply_squad_javelin"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_squad_batteries", "SLIDER",["Batteries", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 10, 1, 0], 1, {publicVariable "cgqc_config_supply_squad_batteries"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_radios", "SLIDER",["Radios 343", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 10, 1, 0], 1, {publicVariable "cgqc_config_supply_squad_radios"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_squad_radios_152", "SLIDER",["Radios 152", "Number in supply box"],
    [_menu_name, "Content: Box - Squad"], [0, 10, 0, 0], 1, {publicVariable "cgqc_config_supply_squad_radios"}, false] call CBA_fnc_addSetting;

// Fireteam Supply Box
["cgqc_config_supply_team_ammo", "SLIDER",["Ammo bandoliers", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 50, 8, 0], 1, {publicVariable "cgqc_config_supply_team_ammo"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_ifak", "SLIDER",["Kit: Individual First-Aid", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 50, 4, 0], 1, {publicVariable "cgqc_config_supply_team_ifak"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_medkit", "SLIDER",["Kit: Medic Supply", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 50, 1, 0], 1, {publicVariable "cgqc_config_supply_team_medkit"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_team_launcher", "SLIDER",["Launchers", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 5, 1, 0], 1, {publicVariable "cgqc_config_supply_team_launcher"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_nlaw", "SLIDER",["NLAW", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 5, 0, 0], 1, {publicVariable "cgqc_config_supply_team_nlaw"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_team_maaws", "SLIDER",["Maaws ammo", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 5, 0, 0], 1, {publicVariable "cgqc_config_supply_team_maaws"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_javelin", "SLIDER",["Javelin ammo", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 5, 0, 0], 1, {publicVariable "cgqc_config_supply_team_javelin"}, false] call CBA_fnc_addSetting;

["cgqc_config_supply_team_batteries", "SLIDER",["Batteries", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 10, 0, 0], 1, {publicVariable "cgqc_config_supply_team_batteries"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_radios", "SLIDER",["Radios 343", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 10, 0, 0], 1, {publicVariable "cgqc_config_supply_team_radios"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_team_radios_152", "SLIDER",["Radios 152", "Number in supply box"],
    [_menu_name, "Content: Box - Fireteam"], [0, 10, 0, 0], 1, {publicVariable "cgqc_config_supply_team_radios"}, false] call CBA_fnc_addSetting;



// Explosives
["cgqc_config_supply_explosives_charges", "SLIDER",["Explosive charges", "Number in supply box"],
    [_menu_name, "Content: Explosives Box"], [0, 50, 5, 0], 1, {publicVariable "cgqc_config_supply_explosives_charges"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_explosives_mine_large", "SLIDER",["Large mines", "AT mines"],
    [_menu_name, "Content: Explosives Box"], [0, 50, 5, 0], 1, {publicVariable "cgqc_config_supply_explosives_mine_large"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_explosives_mine_medium", "SLIDER",["Medium mines", "Anti vehicles mines"],
    [_menu_name, "Content: Explosives Box"], [0, 50, 5, 0], 1, {publicVariable "cgqc_config_supply_explosives_mine_small"}, false] call CBA_fnc_addSetting;
["cgqc_config_supply_explosives_mine_small", "SLIDER",["Small mines", "Anti-personel mines"],
    [_menu_name, "Content: Explosives Box"], [0, 50, 5, 0], 1, {publicVariable "cgqc_config_supply_explosives_mine_small"}, false] call CBA_fnc_addSetting;

["cgqc_config_sideKeys", "CHECKBOX", ["Sidekeys for all", "Adds a key for all side vehicles to player"],
	[_menu_name, "Keys"], true, 1, {publicVariable "cgqc_config_sideKeys"}] call CBA_fnc_addSetting;
["cgqc_config_customKey", "CHECKBOX", ["Get CustomKey action", "Action on player to get a custom key to specific vehicle"],
	[_menu_name, "Keys"], false, 1, {publicVariable "cgqc_config_sideKeys"}] call CBA_fnc_addSetting;




// Loadout restrictions ===================================================================================================
_menu_name = "[CGQC Zeus] Loadout/Looting Control";
_section = "Looting Options";
// Looting settings
["cgqc_lootingRestriction_on", "CHECKBOX", ["Restrict corpse looting?", "Empêche/limite le looting des corps"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_lootingRestriction_on"}, false] call CBA_fnc_addSetting;
["cgqc_looting_gun", "CHECKBOX", ["Keep primary gun", "Le gun de l'ennemi reste lootable"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_gun"}, false] call CBA_fnc_addSetting;
["cgqc_looting_gun_amnt", "SLIDER",["Max mags", "Combien de mags maximum"],
    [_menu_name, _section], [0, 20, 4, 0], 1, {publicVariable "cgqc_looting_gun_amnt"}, false] call CBA_fnc_addSetting;
["cgqc_looting_handgun", "CHECKBOX", ["Keep handgun", "Comme ça le dit"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_handgun"}, false] call CBA_fnc_addSetting;
["cgqc_looting_handgun_amnt", "SLIDER",["Max Handgun mags", "Combien de mags maximum"],
    [_menu_name, _section], [0, 20, 2, 0], 1, {publicVariable "cgqc_looting_handgun_amnt"}, false] call CBA_fnc_addSetting;
["cgqc_looting_launcher", "CHECKBOX", ["Keep Launcher", "Comme ça le dit"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_launcher"}, false] call CBA_fnc_addSetting;
["cgqc_looting_launcher_amnt", "SLIDER",["Max Launcher ammo", "Combien de mags maximum"],
    [_menu_name, _section], [0, 10, 2, 0], 1, {publicVariable "cgqc_looting_launcher_amnt"}, false] call CBA_fnc_addSetting;
["cgqc_looting_assigned", "CHECKBOX", ["Keep GPS/Binoculars/NVG's", "Comme ça le dit"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_assigned"}, false] call CBA_fnc_addSetting;
["cgqc_looting_throwable", "CHECKBOX", ["Keep throwables", "Garde les grenades/smokes"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_throwable"}, false] call CBA_fnc_addSetting;

_section = "Lootlist Common";
["cgqc_looting_common", "CHECKBOX", ["Lootlist: Common", "Items de base"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_common"}, false] call CBA_fnc_addSetting;
["cgqc_looting_common_items", "EDITBOX", ["Common Items", "Liste des items possibles"],
    [_menu_name, _section], "ACE_fieldDressing, FF_Painkiller", 1, {publicVariable "cgqc_looting_common_items"}, false] call CBA_fnc_addSetting;
["cgqc_looting_common_chance", "SLIDER",["% de chances", "Chances de trouver des items Common."],
    [_menu_name, _section], [0, 100, 50, 0], 1, {publicVariable "cgqc_looting_common_chance"}, false] call CBA_fnc_addSetting;
["cgqc_looting_common_max", "SLIDER",["Maximum de chaques", "Maximum de chaques items possibles"],
    [_menu_name, _section], [0, 20, 2, 0], 1, {publicVariable "cgqc_looting_common_max"}, false] call CBA_fnc_addSetting;

_section = "Lootlist Normal";
["cgqc_looting_normal", "CHECKBOX", ["Lootlist: Normal", "Items normaux"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_normal"}, false] call CBA_fnc_addSetting;
["cgqc_looting_normal_items", "EDITBOX", ["Normal Items", "Liste des items possibles"],
    [_menu_name, _section], "ACE_tourniquet, ACE_morphine, ACE_epinephrine, ACE_salineIV_500", 1, {publicVariable "cgqc_looting_normal_items"}, false] call CBA_fnc_addSetting;
["cgqc_looting_normal_chance", "SLIDER",["% de chances", "Chances de trouver des items Normaux."],
    [_menu_name, _section], [0, 100, 25, 0], 1, {publicVariable "cgqc_looting_normal_chance"}, false] call CBA_fnc_addSetting;
["cgqc_looting_normal_max", "SLIDER",["Maximum de chaques", "Maximum de chaques items possibles"],
    [_menu_name, _section], [0, 20, 2, 0], 1, {publicVariable "cgqc_looting_normal_max"}, false] call CBA_fnc_addSetting;

_section = "Lootlist Rare";
["cgqc_looting_rare", "CHECKBOX", ["Lootlist: Rare", "Items rare"],
    [_menu_name, _section], false, 1, {publicVariable "cgqc_looting_rare"}, false] call CBA_fnc_addSetting;
["cgqc_looting_rare_items", "EDITBOX", ["Normal Items", "Liste des items possibles"],
    [_menu_name, _section], "ACE_salineIV, ACE_splint", 1, {publicVariable "cgqc_looting_rare_items"}, false] call CBA_fnc_addSetting;
["cgqc_looting_rare_chance", "SLIDER",["% de chances", "Chances de trouver des items Normaux."],
    [_menu_name, _section], [0, 100, 5, 0], 1, {publicVariable "cgqc_looting_rare_chance"}, false] call CBA_fnc_addSetting;
["cgqc_looting_rare_max", "SLIDER",["Maximum de chaques", "Maximum de chaques items possibles"],
    [_menu_name, _section], [0, 20, 1, 0], 1, {publicVariable "cgqc_looting_rare_max"}, false] call CBA_fnc_addSetting;

// Restrictions d'optiques
["cgqc_config_scopeRestriction", "LIST", ["Optiques", "Types d'optiques disponibles dans le quick switcher"],
	[_menu_name, "Weapon Restrictions"], [[0, 1, 2, 3, 4], ["Iron sight", "Dot Only", "Dot + RCO", "Default", "Unlocked"], 3], {publicVariable "cgqc_config_scopeRestriction"}] call CBA_fnc_addSetting;

_section = "Maximum Mags";
// Maximum mags ===============================================================================================
["cgqc_setting_limitMags", "CHECKBOX", ["Limite Mags dans l'arsenal", "Limite le nombre de magazines par soldat"],
    [_menu_name, _section], false] call CBA_fnc_addSetting;
["cgqc_setting_limitMags_max","SLIDER", ["Maximum 5.56", "Combien de mags 5.56 maximum?"],
    [_menu_name, _section], [0, 30, 10, 0]] call CBA_fnc_addSetting;
["cgqc_mk2_arsenal_locked", "CHECKBOX", ["Lock mk2 arsenal?", "Limite les rôles et l'arsenal selon les rangs"],
    [_menu_name, _section], true] call CBA_fnc_addSetting;
["cgqc_mk2_animation_locked", "CHECKBOX", ["Lock Player animations?", "Limite l'accès des joueurs aux animations/emotes"],
    [_menu_name, _section], false, 1, {["animation_setting", 0, ""] spawn CGQC_fnc_perksZeus}, false] call CBA_fnc_addSetting;



// Player custom Options ===================================================================================================
_menu_name_player = "[CGQC] Player settings";

["cgqc_flag_mapCenterSetting", "LIST", ["Default Map Centering Mode", "Mode that is set on gamestart"],
  [_menu_name_player, "Map Centering Mode"], [[0, 1, 2], ["Normal","Last position", "Player"], 0], {["initial"] call CGQC_fnc_centerMap}] call CBA_fnc_addSetting;

_section = "BFT - Blue Force Tracking";
["cgqc_bft_initials", "LIST", ["Name type", "Name size on BFT Icons. Normal: full name. Initials: short name. And then no name"],
	[_menu_name_player, _section], [[0, 1, 2], ["Full names","Short names", "No names"], 1], 0, {cgqc_bft_forceUpdate = true}] call CBA_fnc_addSetting;
["cgqc_bft_scale", "SLIDER",["BFT Icon scaling", "Smaller equals... smaller ;o)"],
    [_menu_name_player,_section], [0, 2, 1, 0, true], 0, {cgqc_bft_forceUpdate = true}, false] call CBA_fnc_addSetting;

// Default gun
_default_sideArm_text = "";
_default_sideArm = "";
_default_sideArm_mag = "";
_default_sideArm_laser = "";
_default_sideArm_suppress = "";
_default_sideArm_optic = "";

// Check that 2023 is not present
if (cgqc_player_has2023) then {
	_default_sideArm_text = "Sidearm Perso (2023)";
	_default_sideArm = "cgqc_gun_glock19_wood";
	_default_sideArm_mag = "Tier1_15Rnd_9x19_JHP";
	_default_sideArm_laser = "tier1_dbalpl";
	_default_sideArm_suppress = "";
	_default_sideArm_optic = "tier1_sig_romeo1";
} else {
	_default_sideArm_text = "Sidearm Perso (Vanilla)";
	_default_sideArm = "cgqc_gun_p99_wood";
	_default_sideArm_mag = "16Rnd_9x21_Mag";
	_default_sideArm_laser = "";
	_default_sideArm_suppress = "";
	_default_sideArm_optic = "";
};

["cgqc_config_sidearm", "CHECKBOX", ["Custom Sidearm", "À vos risques et périls. Assurez vous d'avoir une classe valide"],
	[_menu_name_player, _default_sideArm_text], false] call CBA_fnc_addSetting;
["cgqc_config_sidearm_pistol", "EDITBOX", ["Pistolet", "Ton pistolet préféré"],
	[_menu_name_player, _default_sideArm_text], _default_sideArm] call CBA_fnc_addSetting;
["cgqc_config_sidearm_mag", "EDITBOX", ["Magazine", "Chargeur"],
	[_menu_name_player, _default_sideArm_text], _default_sideArm_mag] call CBA_fnc_addSetting;
["cgqc_config_sidearm_acc", "EDITBOX", ["Laser/Flashlight", "Accessoire"],
	[_menu_name_player, _default_sideArm_text], _default_sideArm_laser] call CBA_fnc_addSetting;
["cgqc_config_sidearm_suppress", "EDITBOX", ["Silencieux", "Silencieux"],
	[_menu_name_player, _default_sideArm_text], _default_sideArm_suppress] call CBA_fnc_addSetting;
["cgqc_config_sidearm_optic", "EDITBOX", ["Optique", "Optique"],
	[_menu_name_player, _default_sideArm_text], _default_sideArm_optic] call CBA_fnc_addSetting;
["cgqc_config_sidearm_mag_nbr","SLIDER", ["Nbr de Magazine", "Nombre de chargeurs de pistol"],
	[_menu_name_player, _default_sideArm_text], [2, 8, 2, 0]] call CBA_fnc_addSetting;

["cgqc_config_cigs", "CHECKBOX", ["Fumeur?", "Rajoute des topes à votre loadout"],
	[_menu_name_player, "Smoking"], false] call CBA_fnc_addSetting;

// === Custom arsenal categories ===============================================================================
private _medical = [
	"ACE_fieldDressing",
	"ACE_elasticBandage",
	"ACE_packingBandage",
	"ACE_quikclot",
	"ACE_bloodIV",
	"ACE_bloodIV_250",
	"ACE_bloodIV_500",
	"ACE_epinephrine",
	"Empty_bloodIV_250",
	"Empty_bloodIV_500",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_plasmaIV",
	"ACE_plasmaIV_250",
	"ACE_plasmaIV_500",
	"ACE_salineIV",
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"ACE_splint",
	"ACE_surgicalKit",
	"ACE_tourniquet",
	"FSGm_ItemMedicBag",
	"FF_Painkiller",
	"ACE_adenosine",
	"ACE_bodyBag",
	"CGQC_Carbonate"
];

private _electronics = [
	"ACRE_PRC117F",
	"ACRE_PRC148",
	"ACRE_PRC152",
	"ACRE_PRC343",
	"ACRE_PRC77",
	"cgqc_radios_zeus",
	"ACE_ATragMX",
	"ACRE_BF888S",
	"ACE_Cellphone",
	"ACE_DAGR",
	"ACE_DeadManSwitch",
	"ACE_Kestrel4500",
	"ACE_M26_Clacker",
	"Ace_Clacker",
	"Ace_Microdagr",
	"MineDetector",
	"ACRE_SEM52SL",
	"ACRE_SEM70",
	"ACE_UAVBattery",
	"Laserbatteries",
	"ACRE_VHF30108SPIKE",
	"ACRE_VHF30108",
	"ACRE_VHF30108MAST",
	"ACE_Flashlight_KSF1",
	"ace_flashlight_xl50",
	"ACE_IR_Strobe_Item",
	"ACE_HuntIR_monitor",
	"ACE_Flashlight_MX991",
	"ItemAndroid",
	"ItemcTabHCam",
	"ItemcTab",
	"WBK_HeadLampItem",
	"sps_black_hornet_01_Static_F",
	"MRH_BluForTransponder",
	"MRH_TacticalDisplay",
	"MRH_FoldedSatcomAntenna",
	"NER_item_bulatv3",
	"Item_JammerSania",
	"Item_JammerVolnorez",
	"azm_bft_rx",
    "azm_bft_tx"
];
private _logistics = [
	"cgqc_items_medkit",
	"cgqc_items_ifak",
	"cgqc_bandolier_ammo",
	"cgqc_bandolier_ammo_half"
];

[_logistics, "Logistics", "cgqc\textures\rearm.paa"] call ace_arsenal_fnc_addRightPanelButton;
[_medical, "Medical", "cgqc\textures\medical.paa"] call ace_arsenal_fnc_addRightPanelButton;
[_electronics, "Electronics", "cgqc\textures\electronics.paa"] call ace_arsenal_fnc_addRightPanelButton;

// === Sounds ===============================================================================
cgqc_unconscious_sounds = [
	"cgqc\sounds\scream_01.wav",
	"cgqc\sounds\scream_02.wav",
	"cgqc\sounds\scream_03.wav",
	"cgqc\sounds\scream_04.wav",
	"cgqc\sounds\scream_05.wav",
	"cgqc\sounds\scream_06.wav",
	"cgqc\sounds\scream_07.wav",
	"cgqc\sounds\scream_08.wav",
	"cgqc\sounds\scream_09.wav",
	"cgqc\sounds\scream_10.wav",
	"cgqc\sounds\scream_11.wav",
	"cgqc\sounds\scream_12.wav",
	"cgqc\sounds\scream_13.wav",
	"cgqc\sounds\scream_14.wav",
	"cgqc\sounds\scream_15.wav",
	"cgqc\sounds\scream_16.wav"
];

// PAX Units definitions
#include "\cgqc\cfg\cfg_paxUnits.hpp"

// Loading UI functions
_landnav = [] spawn compile PreprocessFileLineNumbers "\cgqc\dialogs\landnav_fnc.sqf";
waitUntil {scriptDone _landnav};
_convoy = [] spawn compile PreprocessFileLineNumbers "\cgqc\dialogs\convoy_fnc.sqf";
waitUntil {scriptDone _convoy};

// Loadout functions
#include "\CGQC\loadouts\vanilla\loadouts.hpp"
#include "\CGQC\loadouts\2023\loadouts.hpp"
#include "\CGQC\loadouts\swat\loadouts.hpp"
#include "\CGQC\loadouts\pmct\loadouts.hpp"
#include "\CGQC\loadouts\unsung\loadouts.hpp"
#include "\CGQC\loadouts\ifa3\loadouts.hpp"

//Sets radio channel names
[0] spawn CGQC_fnc_nameRadios;

// Set PTT Delay
_delay = [0.5] call acre_api_fnc_setPTTDelay;
// Lock superfluous channels
["globside"] call CGQC_fnc_lockChannels;

// Fonctions customs
CGQC_int_allHumanPlayers = {
    // Returns all humans
    _units = allPlayers select {!(_x isKindOf "VirtualMan_F")};
	_units;
};

CGQC_int_allAIUnits = {
    // Returns all AI
    _units = allUnits - ([] call CGQC_int_allHumanPlayers);
    _units = _units - (entities "HeadlessClient_F");
    _units;
};

/* Menu option
if (hasInterface) then {
    [["CGQC", "Options CGQC"], "cgqc_pause_test"] call CBA_fnc_addPauseMenuOption;
};
*/

/*
// Create default languages
if (cgqc_config_sideLanguage) then {
	["en", "English"] call acre_api_fnc_babelAddLanguageType;
	["ru", "Russian"] call acre_api_fnc_babelAddLanguageType;
	["ab", "Arabic"] call acre_api_fnc_babelAddLanguageType;
	//[false, true] call acre_api_fnc_setupMission; // Scramble frequencies
	//[ [west, "English"], [east, "Russian"], [independent, "Arabic"], [civilian, "English", "Russian", "Arabic"] ] call acre_api_fnc_babelSetupMission;
};*/

/*
// Player switch event
["unit", {
    params ["_player"];
	if (cgqc_config_sideLanguage) then {
		["side"] call CGQC_fnc_setACRE;
	};
}, true] call CBA_fnc_addPlayerEventHandler;
*/

// **************************************************************************************************************
cgqc_start_preInit_done = true;
LOG("[CGQC_preInit] === Done =====================================");