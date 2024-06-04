#include "\CGQC\script_component.hpp"
// --- perksRecon ----------------------------------------------------------
// Perks for the camoman
params ["_type"];

if (hasInterface) then {
	try {
		_ghillie = "";
		_to_ghillie = 0;
		switch (_type) do	{
			case "face_0":{
				player setFace(cgqc_player_face);
			};
			case "face_1":{
				player setFace(format["%1_camo_01",cgqc_player_face]);
			};
			case "face_2":{
				player setFace(format["%1_camo_02",cgqc_player_face]);
			};
			case "face_3":{
				player setFace(format["%1_camo_03",cgqc_player_face]);
			};
			case "face_4":{
				player setFace(format["%1_camo_04",cgqc_player_face]);
			};
			case "face_5":{
				player setFace(format["%1_camo_05",cgqc_player_face]);
			};
			case "face_6":{
				player setFace(format["%1_camo_06",cgqc_player_face]);
			};
			case "face_7":{
				player setFace(format["%1_camo_07",cgqc_player_face]);
			};
			case "face_8":{
				player setFace(format["%1_camo_08",cgqc_player_face]);
			};
			case "face_9":{
				player setFace(format["%1_camo_09",cgqc_player_face]);
			};
			case "face_10":{
				player setFace(format["%1_camo_10",cgqc_player_face]);
			};
			case "face_11":{
				player setFace(format["%1_camo_11",cgqc_player_face]);
			};
			case "face_12":{
				player setFace(format["%1_camo_12",cgqc_player_face]);
			};
			case "face_13":{
				player setFace(format["%1_camo_13",cgqc_player_face]);
			};
			case "face_14":{
				player setFace(format["%1_camo_14",cgqc_player_face]);
			};
			case "face_15":{
				player setFace(format["%1_camo_15",cgqc_player_face]);
			};
			case "face_16":{
				player setFace(format["%1_camo_16",cgqc_player_face]);
			};
			case "arid":{
				_ghillie = "U_B_FullGhillie_ard";
				hintSilent "Ghillie: Arid";
				_to_ghillie = 1;
			};
			case "sarid":{
				_ghillie = "U_B_FullGhillie_sard";
				hintSilent "Ghillie: Semi-Arid";
				_to_ghillie = 1;
			};
			case "lush":{
				_ghillie = "U_B_FullGhillie_lsh";
				hintSilent "Ghillie: Lush";
				_to_ghillie = 1;
			};
			case "jungle":{
				_ghillie = "U_B_T_FullGhillie_tna_F";
				hintSilent "Ghillie: Jungle";
				_to_ghillie = 1;
			};
			case "uniform":{
				hintSilent "Ghillie: Back to Uniform";
				_to_ghillie = 2;
			};

			default
			{
				hintSilent "woops";
				_to_ghillie = 0;
			};
		};
		switch (_to_ghillie) do	{
			case 1: // Change to ghillie
			{
				// Save old uniform
				cgqc_perks_ghillie_uniform = uniform player;
				// Save items
				_uniform_items = uniformItems player;
				// Animation
				player playMove "AinvPknlMstpSnonWnonDnon_medic4";
				sleep 6;
				// switch to ghillie
				player forceAddUniform _ghillie;
				// Add items back
				{
					player addItemToUniform _x
				} forEach _uniform_items;
				//Lower the camouflage level of unit in ghillie
				cgqc_previous_camo = player getUnitTrait "camouflageCoef";
				cgqc_previous_audible = player getUnitTrait "audibleCoef";
				player setUnitTrait ["camouflageCoef", 0.4];
				player setUnitTrait ["audibleCoef", 0.6];
				cgqc_perks_ghillie_isOn = true;
			};
			case 2:// Change back to uniform
			{
				// Save items
				_uniform_items = uniformItems player;
				// Animation
				player playMove "AinvPknlMstpSnonWnonDnon_medic4";
				sleep 6;
				// switch to uniform
				player forceAddUniform cgqc_perks_ghillie_uniform;
				// Add items back
				{player addItemToUniform _x} forEach _uniform_items;
				//Back to default coefs
				player setUnitTrait ["camouflageCoef", cgqc_previous_camo];
				player setUnitTrait ["audibleCoef", cgqc_previous_audible];
				cgqc_perks_ghillie_isOn = false;
			};
		};
		sleep 1;

	} catch{ // In case of error: Return control to player

		hintc "Erreur: perksRecon";
	};

};


