// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type", "_fromLoadout"];
//Make sure the call is local
waitUntil {!isNil "cgqc_player_patch_found"};
waitUntil {cgqc_player_rank_found};

disableUserInput true;
switch (_type) do {
    case "chill":
    {
        if !(cgqc_player_chill) then {
            //[] call CGQC_fnc_getRankedBeret;
            _new_face = "";
            //c_new_vest = "V_SmershVest_01_radio_F";
            //c_new_nvg = "immersion_cigs_cigar0_nv";
            // Sling helmet
            [player] call GRAD_slingHelmet_fnc_actionSling;
            // Send goggles to backpack
            cgqc_player_oldFace = goggles player;
            player addItemToBackpack cgqc_player_oldFace;
            removeGoggles player;
            // set hat
            player addHeadgear cgqc_player_beret;
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
                player allowDamage false;
                hint "NoDamage";
            };
            cgqc_player_chill = true;
            if !(cgqc_welcome_done) then {
                disableUserInput false;
                waitUntil {cgqc_welcome_done};
                sleep 10;
            };
            if (cgqc_player_chill) then {
                //cgqc_welcome_pic = format["<img size= '3' style='vertical-align:bottom' shadow='false' image='textures\%1.paa'/>", cgqc_player_rank_badge]; 
                _txt = parseText format[
                "<t font='PuristaBold' size='1.6'>Au Repos!</t><br />
                <t font='PuristaBold' size='1.2'>Rang: %1</t><br/>
                <t font='PuristaBold' size='1.2'>Beret: %2</t><br/>", cgqc_player_rank_name ,cgqc_player_beret_name]; 
                //[cgqc_welcome_pic, 0.9, 0.2, 6, 2 ] spawn BIS_fnc_dynamicText; 
                //sleep 1;
                // Rank and color up top
                [_txt, [1.25,0,1,1], nil, 4, [2,3], 0] spawn BIS_fnc_textTiles;
                player removeItemFromBackpack cgqc_player_oldFace; // Get back facestuff to backpack
                player addGoggles cgqc_player_oldFace;
                player removeItemFromBackpack cgqc_player_oldNvg; // Get back nvg's from backpack
                player linkItem cgqc_player_oldNvg;
            };
        };
        break;
    };
    case "ready":
    {
        if (cgqc_player_chill) then {
            removeHeadgear player; // Get rid of beret
            [player] call GRAD_slingHelmet_fnc_actionUnSling;  // Unsling helmet
            if (cgqc_player_max) then {
                player unlinkItem "immersion_cigs_cigar0_nv";
                removeGoggles player;
                player allowDamage true;
            };
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
        break;
    };             
    case "para":
    {
        cgqc_perks_para = false;
        _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Tu drop ton kit de parachutiste</t><br/>");
        [_text, 0, 0, 10, 4] spawn BIS_fnc_dynamicText;
        player playMove "AinvPknlMstpSnonWnonDnon_medic4";
        // Watch / Altimeter
        _items = assignedItems player;
        _current_watch = _items select 2;
        if (_current_watch == "ACE_Altimeter") then {
            player linkItem "ItemWatch";
            hint "Removed altimeter";
            sleep 1;
        };
        //Switch mask 
        _goggles = goggles player;
        if (_goggles find "cgqc_goggles_mk1_para" == 0) then {
            removeGoggles player;
            player removeItemFromBackpack player_goggles_old; // Get back goggles's from backpack
            player addGoggles player_goggles_old;
            hint "Removed Para Mask";
            sleep 1;
        };
        // Drop parachute
        _backpack = backpack player;
        // Get backpack back
        if (_backpack != "") then {
            if (_backpack find "chute" > 0) then {
                    sleep 1;
                    removeBackpack player;
                    hint "Removed parachute";
                    sleep 2;
                    //Backpack on back
                    [player] call bocr_main_fnc_actionOnBack;
                    hint "Backpack on back";
                    sleep 2;
            } else{ //Player already dropped his chute?
                //Backpack on back
                [player] call bocr_main_fnc_actionOnBack;
                hint "No chute? Backpack on back";
                sleep 2;
            };
            sleep 3;
            hintSilent "";
        };
        break;
    };
    case "diver":
    {
        _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Tu drop ton kit de plongeur</t><br/>");
        [_text, 0, 0, 10, 3] spawn BIS_fnc_dynamicText;
        //Switch mask 
        player playMove "AinvPknlMstpSnonWnonDnon_medic4";
        _goggles = goggles player;
        if (_goggles find "cgqc_goggles_mk1_diver" == 0) then {
            player addGoggles player_goggles_old;
            hint "Removed diving mask";
        }else{
            hint "No diving mask?";
        };
        sleep 2;
        // Switch uniform 
        _uniform = uniform player;
        if (_uniform find "cgqc_uniform_mk1_diver" == 0) then {
            _items_uniform = uniformItems player;
            player forceAddUniform player_uniform_old;
            {player addItemToUniform _x} forEach _items_uniform;
            hint "Removed diving suit";
        }else{
            hint "No diving suit?";
        };
        sleep 2;
        if (cgqc_player_has2023) then{
            // Switch Vest 
            if (vest player find "cgqc_vest_mk1_diver" == 0) then {
                _items_vest = vestItems player;
                player addVest player_vest_old;
                {player addItemToVest _x} forEach _items_vest;
                hint "Removed Rebreather";
            }else{
                hint "No rebreather?";
            }; 
            sleep 1;
            // Switch backpack
            _items_pack = backpackItems player;
            removeBackpack player;
            player addBackpack player_backpack_old;
            clearAllItemsFromBackpack player;
            {player addItemToBackpack _x} forEach _items_pack;
            hint "Switched Backpack";
        } else{ // Default stuff
            // Switch Vest 
            if (backpack player find "cgqc_backpack_mk1_diver" == 0) then {
                _items_back = backpackItems player;
                removeBackpack player;
                player addBackpack player_backpack_old;
                {player addItemToBackpack _x} forEach _items_back;
                hint "Removed Diving Bottle";
            }else{
                hint "No Diving Bottle?";
            }; 
        };
        sleep 1;
        hintSilent "";
        cgqc_perks_diver_suit_on = false;
        //cgqc_perks_diver = false;
        break;
    };
    case "chem_ir": {
        _chem = "ACE_G_Chemlight_IR";
        cgqc_perks_chem_ir = cgqc_perks_chem_ir - 1;
        _count = cgqc_perks_chem_ir;
        [_chem, _count] execVM "cgqc\functions\fnc_dropChem.sqf";
        break;
    };
    case "chem_green": {
        _chem = "Chemlight_green";
        cgqc_perks_chem_green = cgqc_perks_chem_green - 1;
        _count = cgqc_perks_chem_green;
        [_chem, _count] execVM "cgqc\functions\fnc_dropChem.sqf";
        break;
    };
    case "chem_orange": {
        _chem = "ACE_G_Chemlight_UltraHiOrange";
        cgqc_perks_chem_orange = cgqc_perks_chem_orange - 1;
        _count = cgqc_perks_chem_orange;
        [_chem, _count] execVM "cgqc\functions\fnc_dropChem.sqf";
        break;
    };
    case "click":{
        [player, "click"] remoteExec ["say3D"];
        break;
    };
    case "fix":
    {
        hint "Sound: Volumes reset";
        [] call ace_volume_fnc_restoreVolume;
        [0.7] call acre_api_fnc_setSelectableVoiceCurve;
        sleep 5;
        hintSilent "";
        break;
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
        sleep 5;
        hintSilent "";
        break;
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
        break;
    };
    case "stash":
    {
        cgqc_perk_player_stash = "cgqc_box_mk2_stash" createVehicle (position player);
        cgqc_perk_player_stash_on = true;
        hint "Stash spawned";
        sleep 5;
        hintSilent "";
        break;
    };
    case "del_stash":
    {
        deleteVehicle cgqc_perk_player_stash;
        cgqc_perk_player_stash_on = false;
        hint "Stash Deleted";
        sleep 5;
        hintSilent "";
        break;
    };
    case "cam":{
        [] spawn {
            _cam = "camera" camCreate (player modelToWorld [-2,2, 2]);
            _cam camSetTarget player;
            _cam cameraEffect ["EXTERNAL", "back"];
            _cam camCommit 1;
            sleep 5;
            _cam cameraEffect ["TERMINATE", "BACK"];
            camDestroy _cam;
         };
        break;
    };
};
// Return control to player
disableUserInput false;
if (userInputDisabled) then {disableUserInput false;};
