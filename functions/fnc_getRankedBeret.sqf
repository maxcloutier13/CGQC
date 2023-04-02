 cgqc_player_rank_beret = "";
waitUntil {cgqc_player_rank_found};
if (cgqc_player_23rd) then {
	cgqc_player_rank_beret = "23rd_logo_berret_purp"; //23rd basic beret
} else {
	switch (cgqc_player_rank) do {
		case 1: {  // Sdt
			cgqc_player_rank_beret = "cgqc_beret_yellow"; // Subalternes
		};
		case 2: { // Cpl
			cgqc_player_rank_beret = "cgqc_beret_vanilla";
		};
		case 3: { // CplC
			cgqc_player_rank_beret = "cgqc_beret_green"; 
		};
		case 4: { // Sgt
			cgqc_player_rank_beret = "cgqc_beret_gray"; // Sous-Officiers
		};
		case 5: { // Adju
			cgqc_player_rank_beret = "cgqc_beret_gray"; 
		};
		case 6: { // AdjuM
			cgqc_player_rank_beret = "cgqc_beret_gray"; 
		};
		case 7: { // AdjuC
			cgqc_player_rank_beret = "cgqc_beret_gray"; 
		};
		case 8: { // SLdt
			cgqc_player_rank_beret = "cgqc_beret_blue";// Officiers
		};
		case 9: { // Lieutenant
			cgqc_player_rank_beret = "cgqc_beret_blue";
		};
		case 10: { // Capitaine
			cgqc_player_rank_beret = "cgqc_beret_blue";
		};
		case 11: { // Major
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		case 12: { // L-Col
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		case 13: { // Colonel
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		default	{
			hintc "Rank not detected";
			cgqc_player_rank_beret = "cgqc_beret_vanilla"; 
		};
	};
};

