 cgqc_player_rank_beret = "";

//if (cgqc_player_hasContact) then {
	switch (cgqc_player_rank) do {
		case 1: {  // Sdt
			cgqc_player_rank_beret = "cgqc_beret_vanilla"; // Subalternes
		};
		case 2: { // Cpl
			cgqc_player_rank_beret = "cgqc_beret_vanilla";
		};
		case 3: { // CplC
			cgqc_player_rank_beret = "cgqc_beret_green"; // Sous-Officiers
		};
		case 4: { // Sgt
			cgqc_player_rank_beret = "cgqc_beret_green";
		};
		case 5: { // Adju
			cgqc_player_rank_beret = "cgqc_beret_blue"; // Officiers
		};
		case 6: { // SLdt
			cgqc_player_rank_beret = "cgqc_beret_blue";
		};
		case 7: { // Lieutenant
			cgqc_player_rank_beret = "cgqc_beret_blue";
		};
		case 8: { // Capitaine
			cgqc_player_rank_beret = "cgqc_beret_blue";
		};
		case 9: { // Major
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		case 10: { // L-Col
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		case 11: { // Colonel
			cgqc_player_rank_beret = "cgqc_beret_red";
		};
		default	{
			cgqc_player_rank_beret = "cgqc_beret_vanilla"; // Subalternes
		};
	};
//}else{ // Player doesn't have Contact! BOOOOO THIS MAN!
//	cgqc_player_rank_beret = "cgqc_beret_vanilla";
//};

