// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type", "_fromLoadout"];
//Make sure the call is local
waitUntil {!isNil "cgqc_player_patch_found"};
waitUntil {cgqc_player_rank_found};
_time = 5;

disableUserInput true;
switch (_type) do {
    case "flip_chill":{
        if (cgqc_player_chill) then {
            ["ready", false] spawn CGQC_fnc_perksBasic;
        } else {
            ["chill", false] spawn CGQC_fnc_perksBasic;
        };
        break;
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
            // Send goggles to backpack
            cgqc_player_oldFace = goggles player;
            //player addItemToBackpack cgqc_player_oldFace;
            removeGoggles player;
            // set hat
            player addHeadgear cgqc_player_beret;
            // set glasses to nothing
            player addGoggles _new_face;
            // Find nvgs
            if ([player, "JAS_GPNVG18_Full_blk_TI"] call BIS_fnc_hasItem) then {
                cgqc_player_oldNvg = "JAS_GPNVG18_Full_blk_TI";
            };
            if ([player, "JAS_GPNVG18_blk"] call BIS_fnc_hasItem) then {
                cgqc_player_oldNvg = "JAS_GPNVG18_blk";
            };
            //player addItemToBackpack cgqc_player_oldNvg;
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
               // player removeItemFromBackpack cgqc_player_oldFace; // Get back facestuff to backpack
                //player addGoggles cgqc_player_oldFace;
                //player removeItemFromBackpack cgqc_player_oldNvg; // Get back nvg's from backpack
               // player linkItem cgqc_player_oldNvg;
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
                while {!isDamageAllowed player} do
                {
                    player allowDamage true;
                    sleep 0.5;
                };
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
            player action ["SwitchWeapon", player, player, 0];
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
    case "click":{
        [player, "click"] remoteExec ["say3D"];
        break;
    };
    case "fix":
    {
        hint "Sound: Volumes reset";
        [] call ace_volume_fnc_restoreVolume;
        [0.7] call acre_api_fnc_setSelectableVoiceCurve;
        break;
    };
    case "cone":
    {
       
        if (vehicle player != player) then // If player in a vehicle, skip the trigger 
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
        };
        cgqc_perks_silence = true;
        [] spawn {
            while {cgqc_perks_silence} do { 
                [format["<img size= '1' style='vertical-align:bottom' shadow='false' image='\cgqc\textures\icon_sound_off.paa'/>"]
                , 1.05, 0.2, 4, 2] spawn BIS_fnc_dynamicText; 
                sleep 5;
            };
        };
        hint "Cone of silence: On";
        break;
    };
    case "cone_off":
    {
        //Delete trigger zone
        if !(isNil "cgqc_cone_silence") then {deleteVehicle cgqc_cone_silence;};
        //Restore volume
        [] call ace_volume_fnc_restoreVolume;
        cgqc_perks_silence = false;
        hint "Cone of silence: Off";
        break;
    };
    case "stash":
    {
        cgqc_perk_player_stash = "cgqc_box_mk2_stash" createVehicle (position player);
        if (count cgqc_player_stash_items > 0) then {  
		    _items = cgqc_player_stash_items select 0; 
			_amnts = cgqc_player_stash_items select 1; 
			_cnt = 0; 
			{  
				_amnt = _amnts select _cnt; 
				cgqc_perk_player_stash addItemCargo [_x, _amnt]; 
				_cnt = _cnt + 1;  
			}forEach _items;  
		};
        if (count cgqc_player_stash_mags > 0) then {  
		    _mags = cgqc_player_stash_mags select 0; 
			_amnts = cgqc_player_stash_mags select 1; 
			_cnt = 0; 
			{  
				_amnt = _amnts select _cnt; 
				cgqc_perk_player_stash addMagazineCargo [_x, _amnt]; 
				_cnt = _cnt + 1;  
			}forEach _mags;  
		};
        cgqc_perk_player_stash_on = true;
        break;
    };
    case "del_stash":
    {
        _items = getItemCargo cgqc_perk_player_stash;
        _mags = getMagazineCargo cgqc_perk_player_stash;
        _count = count _items + count _mags;
        if (_count >0) then {
            hint format["Stash Items saved", _count]; 
            cgqc_player_stash_items = [];
            cgqc_player_stash_mags = [];
            cgqc_player_stash_items = _items;
            cgqc_player_stash_mags = _mags;
        }else{
            hint "Empty stash deleted";
        };
        deleteVehicle cgqc_perk_player_stash;
        cgqc_perk_player_stash_on = false;
        break;
    };
    case "cam":{
        [player, ["ACE_WaterBottle"]] call ace_arsenal_fnc_initBox;
        [player, player, false] call ace_arsenal_fnc_openBox;
        /*
        [] spawn {
            _cam = "camera" camCreate (player modelToWorld [-2,2, 2]);
            _cam camSetTarget player;
            _cam cameraEffect ["EXTERNAL", "back"];
            _cam camCommit 1;
            sleep 5;
            _cam cameraEffect ["TERMINATE", "BACK"];
            camDestroy _cam;
         };
         */
        break;
    };
    case "check":{
        _allItems = items player;
        _allMags = magazines player;
        _allRadios = call acre_api_fnc_getCurrentRadioList;
        _allAssigned = assignedItems player;
        _primaryMag = (primaryWeaponMagazine player) select 0;
        _secondaryMag = (handgunMagazine player) select 0;
        _txt_bandage = "";
        _txt_earplugs = "";
        _txt_epi = "";
        _txt_morphine = "";
        _txt_painkill = "";
        _txt_splint = "";
        _txt_tourniquet = "";
        _txt_liquids = "";
        _txt_earplugs = "";
        _txt_map = "";
        _txt_compass = "";
        _txt_gps = "";
        _txt_notepad = "";
        _txt_maptools = "";
        _txt_primaryMags = "";
        _txt_secondaryMags = "";
        _bandage = 0;
        _earplugs = 0;
        _epi = 0;
        _morphine = 0;
        _painkill = 0;
        _splint = 0;
        _tourniquet = 0;
        _liquids = 0;
        _map = 0;
        _compass = 0;
        _gps = 0;
        _notepad = 0;
        _maptools = 0;
        _primaryMags = 0;
        _secondaryMags = 0;
        // Count meds
        _bandage = {_x isEqualTo "ACE_fieldDressing" } count _allItems;
        _earplugs = {_x isEqualTo "ACE_EarPlugs" } count _allItems;
        _epi ={_x isEqualTo "ACE_epinephrine" } count _allItems;
        _morphine = {_x isEqualTo "ACE_morphine" } count _allItems;
        _painkill = {_x isEqualTo "FF_Painkiller" } count _allItems;
        _splint = {_x isEqualTo "ACE_splint" } count _allItems;
        _tourniquet = {_x isEqualTo "ACE_tourniquet" } count _allItems;
        _blood = ["ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250"] apply {toLower _x};
        _liquids = {(toLower _x) in _blood} count _allItems;
        // Count Essentials
        _map = {_x isEqualTo "ItemMap" } count _allAssigned;
        _compass = {_x isEqualTo "ItemCompass" } count _allAssigned;
        _gps = {_x isEqualTo "ItemGPS" } count _allAssigned;
        _notepad = {_x isEqualTo "acex_intelitems_notepad" } count _allMags;
        _maptools = {_x isEqualTo "ACE_MapTools" } count _allItems;
        // Count Mags
        if !(isNil "_primaryMag") then {
            _primaryMags = {_x isEqualTo _primaryMag } count _allMags;
        }else{
            _primaryMags = 0;
        };
         if !(isNil "_secondaryMag") then {
            _secondaryMags = {_x isEqualTo _secondaryMag } count _allMags;
        }else{
            _secondaryMags = 0;
        };
        if (_bandage > 10) then {_txt_bandage = "ok"} else {_txt_bandage = "<t color='#ff0000'>LOW</t>"};
        if (_epi > 0) then {_txt_epi = "ok"} else {_txt_epi = "<t color='#ff0000'>LOW</t>"};
        if (_morphine > 0) then {_txt_morphine = "ok"} else {_txt_morphine = "<t color='#ff0000'>LOW</t>"};
        if (_painkill > 4) then {_txt_painkill = "ok"} else {_txt_painkill = "<t color='#ff0000'>LOW</t>"};
        if (_splint > 0) then {_txt_splint = "ok"} else {_txt_splint = "<t color='#ff0000'>LOW</t>"};
        if (_tourniquet > 0) then {_txt_tourniquet = "ok"} else {_txt_tourniquet = "<t color='#ff0000'>LOW</t>"};
        if (_liquids > 0) then {_txt_liquids = "ok"} else {_txt_liquids = "<t color='#ff0000'>MISSING</t>"};

        if (_earplugs > 0) then {_txt_earplugs = "ok"} else {_txt_earplugs = "<t color='#ff0000'>MISSING</t>"};
        if (_map > 0) then {_txt_map = "ok"} else {_txt_map = "<t color='#ff0000'>MISSING</t>"};
        if (_compass > 0) then {_txt_compass = "ok"} else {_txt_compass = "<t color='#ff0000'>MISSING</t>"};
        if (_gps > 0) then {_txt_gps = "ok"} else {_txt_gps = "<t color='#ff0000'>MISSING</t>"};
        if (_notepad > 0) then {_txt_notepad = "ok"} else {_txt_notepad = "<t color='#ff0000'>MISSING</t>"};
        if (_maptools > 0) then {_txt_maptools = "ok"} else {_txt_maptools = "<t color='#ff0000'>MISSING</t>"};
        if (_primaryMags > 4) then {_txt_primaryMags = "ok"} else {_txt_primaryMags = "<t color='#ff0000'>LOW</t>"};
        if (_secondaryMags > 1) then {_txt_secondaryMags = "ok"} else {_txt_secondaryMags = "<t color='#ff0000'>LOW</t>"};

        Hint parseText format [ 
            "------- Medical ------- <br/>" + 
            "- Bandage: %1 <br/>" + 
            "- Epinephrine: %3 <br/>" + 
            "- Morphine: %4 <br/>" + 
            "- Painkiller: %5 <br/>" +
            "- Splint: %6 <br/>" +
            "- Tourniquet: %7 <br/>" +
            "- Blood: %8 <br/>" +
            "<br/>------- Essentials ------- <br/>" +
            "- Earplugs: %9 <br/>" +
            "- Map: %10 <br/>" + 
            "- Compass: %11 <br/>" + 
            "<br/>------- Nice to haves ------- <br/>" +
            "- GPS: %12 <br/>" + 
            "- Notepad: %13 <br/>" + 
            "- Maptools: %14 <br/>" + 
            "<br/>------- Magazines ------- <br/>" +
            "- Primary: %15 <br/>" +  
            "- Handgun: %16 <br/>"   
            ,_txt_bandage, _txt_earplugs, _txt_epi, _txt_morphine, _txt_painkill, _txt_splint, _txt_tourniquet, _txt_liquids,
            _txt_earplugs, _txt_map, _txt_compass, _txt_gps, _txt_notepad, _txt_maptools, _txt_primaryMags, _txt_secondaryMags
        ];
        _time = 30;
    };
};
// Return control to player
disableUserInput false;
if (userInputDisabled) then {disableUserInput false;};
sleep _time;
hintSilent "";
