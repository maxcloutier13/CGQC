// --- findPatch ----------------------------------------------------------
// Match steamID with known players 
diag_log "[CGQC_FNC] findPatch started";

//Check if player had a rank prefix 
if (!cgqc_player_known) then {
	// If player unknown: patch de baby yoda
	cgqc_player_patch = "cgqc_patch_outsider";
} else {
	switch (cgqc_player_steamid) do {
		case "76561198129263895" : {cgqc_player_patch = "cgqc_patch_audi"; break;};
		case "76561198846742913" : {cgqc_player_patch = "cgqc_patch_braddock"; break;};
		case "76561198024730191" : {cgqc_player_patch = "cgqc_patch_cloutier"; break; cgqc_player_max = true;};
		case "76561199227907428" : {cgqc_player_patch = "cgqc_patch_comeau"; break;};
		case "76561198117404775" : {cgqc_player_patch = "cgqc_patch_fortin"; break;};
		case "76561198057658135" : {cgqc_player_patch = "cgqc_patch_frechette"; break;};
		case "76561198964313408" : {cgqc_player_patch = "cgqc_patch_genest"; break;};
		case "76561198249898654" : {cgqc_player_patch = "cgqc_patch_laforest"; break;};
		case "76561198087933626" : {cgqc_player_patch = "cgqc_patch_pinard"; break;};
		case "76561197981463935" : {cgqc_player_patch = "cgqc_patch_tremblay"; break;};
		case "76561198065449719" : {cgqc_player_patch = "cgqc_patch_villeneuve"; break;};
		case "76561198255907431" : {cgqc_player_patch = "cgqc_patch_turcotte"; break;};
		case "76561198846742913" : {_player_patch = "cgqc_patch_monolith_2"; break;}; //melo
		case "76561198846742913" : {_player_patch = "cgqc_patch_woods"; break;};
		default	{
			// Patch par défaut: CGQC logo
			cgqc_player_patch = "cgqc_patch_logo";
		};
	};
};
if (cgqc_player_23rd) then {
	cgqc_player_patch = "23rd_Logo_Unit_Old";
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
// lukas 76561198452605720
// frexax 76561198403087179
// asthma 76561198299699562
// kanman 76561198136981280
// robnew skinwalker 76561198174572382


//23rd
//finn 76561198420233487
//melonmafia 76561198287121425
//jamie 76561198220396941
//cactus 76561198060884175


//Set variable
cgqc_player_patch_found = true;
diag_log "[CGQC_FNC] findPatch done";