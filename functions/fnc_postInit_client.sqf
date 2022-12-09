// --- postInit_client ----------------------------------------------------------
// Start everything player related

// Player identification --------------------------------------------------------------------------------------------
//Get some player info
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_steamName = profileNameSteam;
cgqc_player_rank = 1;
cgqc_player_known = true;

//ID player and find patch
cgqc_player_rank = [] call CGQC_fnc_findRank;
cgqc_player_patch = [] call CGQC_fnc_findPatch;
// Set and keep patch 
[] spawn CGQC_fnc_setPatch;


// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Briefing entry -------------------------------------------------------------------------------------------------
[] spawn CGQC_fnc_briefing; 

// Ace self interaction perks
[] spawn CGQC_fnc_addPerks; 

// Zeus shenanigans... MAX - to review
[] spawn CGQC_fnc_setZeus; 

// Lower gun 
player action ['SwitchWeapon', player, player, 100];

// Set default left/right radios
["radio_sides"] spawn CGQC_fnc_setRadios; 

// Build a random welcome and shows it
[] spawn CGQC_fnc_welcome; 

// Player init is complete!
cgqc_player_init = 1;

