// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type", "_fromLoadout"];
//Make sure the call is local
waitUntil {!isNil "cgqc_player_patch_found"};
waitUntil {cgqc_player_rank_found};

try {
    disableUserInput true;
    switch (_type) do {
        case "fix":
        {
            hint "Sound: Volumes reset";
            [] call ace_volume_fnc_restoreVolume;
            [0.7] call acre_api_fnc_setSelectableVoiceCurve;
        };
        case "cone":
        {
            // Setup trigger
			y_act = "[] call ace_volume_fnc_lowerVolume;"; // Lower volume on player
			y_deAct = "[] call ace_volume_fnc_restoreVolume;deleteVehicle cgqc_cone_silence;cgqc_perks_silence = false; hint 'Cone of silence: Off';";
			_int = 2;
			// Create trigger
			cgqc_cone_silence = createTrigger ["EmptyDetector",getPos player, true];
            cgqc_cone_silence triggerAttachVehicle [player];
			cgqc_cone_silence setTriggerArea [2, 2, 0, false];
			cgqc_cone_silence setTriggerActivation ["ANYPLAYER", "PRESENT", true];
			cgqc_cone_silence setTriggerStatements ["this", y_act, y_deAct];
			cgqc_cone_silence setTriggerInterval _int;
            cgqc_perks_silence = true;
            hint "Cone of silence: On";
        };
        case "cone_off":
        {
            //Delete trigger zone
            deleteVehicle cgqc_cone_silence;
            //Restore volume
            [] call ace_volume_fnc_restoreVolume;
            cgqc_perks_silence = false;
            hint "Cone of silence: Off";
            sleep 5;
            hintSilent "";
        };
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
                //[] call CGQC_fnc_getRankedBeret;
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
        case "para":
        {
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Tu drop ton kit de parachutiste</t><br/>");
            [_text, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
            //Switch mask 
            _goggles = goggles player;
            if (_goggles find "cgqc_goggles_mk1_para" == 0) then {
                removeGoggles player;
                player removeItemFromBackpack player_goggles_old; // Get back goggles's from backpack
                player addGoggles player_goggles_old;
            };
            // Drop parachute
            _backpack = backpack player;
            // Get backpack back
            if (_backpack find "B_Parachute" == 0) then {
                player playMove "AinvPknlMstpSnonWnonDnon_medic4";
                sleep 2;
                removeBackpack player;
                sleep 2;
                //Backpack on back
                [player] call bocr_main_fnc_actionOnBack;
                sleep 2;
            };
            // Watch / Altimeter
            _items = assignedItems player;
            _current_watch = _items select 2;
            if (_current_watch == "ACE_Altimeter") then {
                player linkItem "ItemWatch";
            };
            cgqc_perks_para = false;
        };
        case "diver":
        {
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Tu drop ton kit de plongeur</t><br/>");
            [_text, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
            //Switch mask 
            player playMove "AinvPknlMstpSnonWnonDnon_medic4";
            _goggles = goggles player;
            if (_goggles find "cgqc_goggles_mk1_diver" == 0) then {
                player addGoggles player_goggles_old;
            };
            sleep 2;
            // Switch uniform 
            _uniform = uniform player;
            if (_uniform find "cgqc_uniform_mk1_diver" == 0) then {
                _items_uniform = uniformItems player;
                player forceAddUniform player_uniform_old;
                {player addItemToUniform _x} forEach _items_uniform;
            };
            sleep 2;
            // Switch Vest 
            _vest = vest player;
            if (_vest find "cgqc_vest_mk1_diver" == 0) then {
                _items_vest = vestItems player;
                player addVest player_vest_old;
                {player addItemToVest _x} forEach _items_vest;
            }; 
            sleep 2;
            // Switch backpack
            _items_pack = backpackItems player;
            removeBackpack player;
            player addBackpack player_backpack_old;
            clearAllItemsFromBackpack player;
            {player addItemToBackpack _x} forEach _items_pack;
            cgqc_perks_diver = false;
        };
    };
    disableUserInput false;
    if (userInputDisabled) then {
        disableUserInput false;
    };
} catch{ // In case of error: Return control to player
	disableUserInput false;
    if (userInputDisabled) then {
        disableUserInput false;
    };
    hintc "Erreur: perksBasic";
};



