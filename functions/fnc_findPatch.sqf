// --- findPatch ----------------------------------------------------------
// Match steamID with known players 

_player_patch = "";
//Check if player had a rank prefix 
if (!cgqc_player_known) then {
	// If player unknown: patch de baby yoda
	_player_patch = "cgqc_patch_outsider";
} else {
	switch (cgqc_player_steamid) do {
		case : 76561198129263895 {_player_patch = "cgqc_patch_audi";};
		case : 76561198846742913 {_player_patch = "cgqc_patch_braddock";};
		case : 76561198024730191 {_player_patch = "cgqc_patch_cloutier"; [] spawn CGQC_fnc_initCloutier;};
		case : 76561199227907428 {_player_patch = "cgqc_patch_comeau";};
		case : 76561198117404775 {_player_patch = "cgqc_patch_fortin";};
		case : 76561198057658135 {_player_patch = "cgqc_patch_frechette";};
		case : 76561198964313408 {_player_patch = "cgqc_patch_genest";};
		case : 76561198249898654 {_player_patch = "cgqc_patch_laforest";};
		case : 76561198087933626 {_player_patch = "cgqc_patch_pinard";};
		case : 76561197981463935 {_player_patch = "cgqc_patch_tremblay";};
		case : 76561198065449719 {_player_patch = "cgqc_patch_villeneuve";};
		//case : 76561198846742913 {_player_patch = "cgqc_patch_woods"};
		//case : 76561198846742913 {_player_patch = "cgqc_patch_monolith_2"}; //melo
		case : 76561198255907431 {_player_patch = "cgqc_patch_turcotte";};
		default	{
			// Patch par défaut: CGQC logo
			_player_patch = "cgqc_patch_logo";
		};
	};
};
//Return patch
_player_patch
