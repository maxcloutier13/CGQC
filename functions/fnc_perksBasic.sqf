// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type", "_fromLoadout"];
//Make sure the call is local
waitUntil {!isNil "cgqc_player_patch_found"};
waitUntil {cgqc_player_rank_found};
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
        if !(cgqc_player_chill) then {
            [] call CGQC_fnc_getRankedBeret;
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
            player addHeadgear cgqc_player_rank_beret;
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
            if (cgqc_player_max) then {
                player linkItem "immersion_cigs_cigar0_nv";
                player addGoggles "G_Aviator";
            };
            cgqc_player_chill = true;
            // Set radio left/right if this is from init 
            if !(_fromLoadout) then {
                _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Au Repos...</t><br/>");
                [_text, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
            };
        };
    };
    case "ready":
    {
        if (cgqc_player_chill) then {
            removeHeadgear player; // Get rid of beret
            [player] call GRAD_slingHelmet_fnc_actionUnSling;  // Unsling helmet
            player removeItemFromBackpack cgqc_player_oldFace; // Get back facestuff to backpack
            player addGoggles cgqc_player_oldFace;
            player removeItemFromBackpack cgqc_player_oldNvg; // Get back nvg's from backpack
            player linkItem cgqc_player_oldNvg;
            cgqc_player_chill = false; // All done
            if !(_fromLoadout) then {
                _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Prêt au combat</t><br/>");
                [_text, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
            };
        };
    };
};

