#include "\CGQC\script_component.hpp"
// --- findPatch ----------------------------------------------------------
// Match steamID with known players
LOG(" findPatch started");

//Check if player had a rank prefix
if (!cgqc_player_known) then {
	// If player unknown: patch de baby yoda
	cgqc_player_patch = "cgqc_patch_outsider";
} else {
	switch (cgqc_player_steamid) do {
		case "76561198129263895" : {cgqc_player_patch = "cgqc_patch_audi"; };
		case "76561198846742913" : {cgqc_player_patch = "cgqc_patch_braddock"; };
		case "76561198024730191" : {
			cgqc_player_patch = "cgqc_patch_cloutier";
			cgqc_player_max = true;
			cgqc_perks_tracking = 100;
			player setVariable ["cgqc_version_core", core_version, true];
		};
		case "76561199227907428" : {cgqc_player_patch = "cgqc_patch_comeau"; };
		case "76561198117404775" : {cgqc_player_patch = "cgqc_patch_fortin"; };
		case "76561198057658135" : {cgqc_player_patch = "cgqc_patch_frechette"; };
		case "76561198964313408" : {cgqc_player_patch = "cgqc_patch_genest"; };
		case "76561198249898654" : {cgqc_player_patch = "cgqc_patch_laforest"; };
		case "76561198087933626" : {cgqc_player_patch = "cgqc_patch_pinard"; };
		case "76561197981463935" : {cgqc_player_patch = "cgqc_patch_tremblay"; };
		case "76561198065449719" : {cgqc_player_patch = "cgqc_patch_villeneuve"; };
		case "76561198255907431" : {cgqc_player_patch = "cgqc_patch_turcotte"; };
		case "76561198846742913" : {_player_patch = "cgqc_patch_monolith_2"; }; //melo
		case "76561198846742913" : {_player_patch = "cgqc_patch_woods"; };
		default	{
			// Patch par défaut: CGQC logo
			cgqc_player_patch = "cgqc_patch_logo";
		};
	};
};

cgqc_custom_playername = cgqc_player_patch select[11, 22];
// dubé 76561198056436035
// gagnon 76561199217287480
// lauzon 76561198062504123
// kruger 76561198037344119
// Denny Lortie 76561198077195969
// Lustersheen 76561199156866182
// epic 76561198171218045
// pike 76561198171218045
// ben 76561198030215888
// mouland 76561199156866182
// deslauriers 76561198209656813
// aubin - 76561198051143824
// valiquette - 76561197982780429
// trépanier - 76561198010960491
// sparnaay - 76561198862826585


//Set variable
cgqc_player_patch_found = true;

LOG(" findPatch done");