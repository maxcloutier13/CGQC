// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type"];

switch (_type) do {
    case "stash":
    {
        cgqc_perk_player_stash = "cgqc_box_mk2_stash" createVehicle (position player);
        cgqc_perk_player_stash_on = true;
    };
    case "del_stash":
    {
        deleteVehicle cgqc_perk_player_stash;
        cgqc_perk_player_stash_on = false;
    };
    case "chill":
    {
        _new_hat = "";
        switch (true) do {
            case (cgqc_player_rank > 3 && cgqc_player_rank <= 5): { // Sous-officiers
                _new_hat = "cgqc_beret_blue";
            };
            case (cgqc_player_rank > 5): { // Officiers
                _new_hat = "cgqc_beret_green";
            };
            default	{
                _new_hat = "cgqc_beret_vanilla"; // Subalternes
		    };
        };
		_new_face = "";
		//c_new_vest = "V_SmershVest_01_radio_F";
		//c_new_nvg = "immersion_cigs_cigar0_nv";
		// Sling helmet
		[player] call GRAD_slingHelmet_fnc_actionSling;
		// Send facestuff to backpack
		cgqc_player_oldFace = goggles player;
		player addItemToBackpack cgqc_player_oldFace;
        removeGoggles player;
		// set hat
		player addHeadgear _new_hat;
		// set glasses 
		player addGoggles _new_face;
		// Find nvgs
        if ([player, "JAS_GPNVG18_Full_blk_TI"] call BIS_fnc_hasItem) then {
            cgqc_player_oldNvg = "JAS_GPNVG18_Full_blk_TI";
        };
         if ([player, "JAS_GPNVG18_blk"] call BIS_fnc_hasItem) then {
            cgqc_player_oldNvg = "JAS_GPNVG18_blk";
        };
        player addItemToBackpack cgqc_player_oldNvg;
        player unlinkItem cgqc_player_oldNvg;
        // Holster all weapons
        player action ['SwitchWeapon', player, player, 250];
		cgqc_player_chill = true;
        hint "au Repos!";
        sleep 5;
        hintSilent "";
    };
    case "ready":
    {
        removeHeadgear player; // Get rid of beret
		[player] call GRAD_slingHelmet_fnc_actionUnSling;  // Unsling helmet
		player removeItemFromBackpack cgqc_player_oldFace; // Get back facestuff to backpack
		player addGoggles cgqc_player_oldFace;
        player removeItemFromBackpack cgqc_player_oldNvg; // Get back nvg's from backpack
        player linkItem cgqc_player_oldNvg;
		cgqc_player_chill = false; // All done
        hint "Ready to roll";
        sleep 5;
        hintSilent "";
    };
};