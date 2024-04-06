// --- getRankedBeret ----------------------------------------------------------
// Match steamID with known players
diag_log "[CGQC_FNC] getRankedBeret started";

cgqc_player_beret = "";
//waitUntil {cgqc_player_rank_found};
_rank = player getVariable "cgqc_player_rank";
switch (_rank) do {
	case 1: {  // Sdt
		cgqc_player_beret = "cgqc_beret_yellow"; // Subalternes
		cgqc_player_beret_name = "Jaune";
	};
	case 2: { // Cpl
		cgqc_player_beret = "cgqc_beret_vanilla";
		cgqc_player_beret_name = "Noir";
	};
	case 3: { // CplC
		cgqc_player_beret = "cgqc_beret_green";
		cgqc_player_beret_name = "Vert";
	};
	case 4: { // Sgt
		cgqc_player_beret = "cgqc_beret_gray"; // Sous-Officiers
		cgqc_player_beret_name = "Gris";
	};
	case 5: { // Adju
		cgqc_player_beret = "cgqc_beret_gray";
		cgqc_player_beret_name = "Gris";
	};
	case 6: { // SLdt
		cgqc_player_beret = "cgqc_beret_blue";// Officiers
		cgqc_player_beret_name = "Bleu";
	};
	case 7: { // Lieutenant
		cgqc_player_beret = "cgqc_beret_blue";
		cgqc_player_beret_name = "Bleu";
	};
	case 8: { // Capitaine
		cgqc_player_beret = "cgqc_beret_blue";
		cgqc_player_beret_name = "Bleu";
	};
	case 9: { // Major
		cgqc_player_beret = "cgqc_beret_red";
		cgqc_player_beret_name = "Rouge";
	};
	case 10: { // L-Col
		cgqc_player_beret = "cgqc_beret_red";
		cgqc_player_beret_name = "Rouge";
	};
	case 11: { // Colonel
		cgqc_player_beret = "cgqc_beret_red";
		cgqc_player_beret_name = "Rouge";
	};
	default	{
		hintc "Rank not detected";
		cgqc_player_beret = "cgqc_beret_yellow";
		cgqc_player_beret_name = "Jaune";
	};
};


diag_log "[CGQC_FNC] getRankedBeret done";