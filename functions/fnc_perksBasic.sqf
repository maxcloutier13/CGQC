// --- perksBasic ----------------------------------------------------------
// Perks for the everyman
params ["_type", ["_fromLoadout", false]];
diag_log format ["[CGQC_FNC] perksBasic %1/%2  started", _type, _fromLoadout];

[_type, _fromLoadout] spawn {
    params ["_type", "_fromLoadout"];
    //
    switch (_type) do {
        case "stealth":{
            cgqc_player_state = 0;
            [player, "whisper"] call CGQC_fnc_setVoiceVolume;
            // Install Silencer if found
            _currentWeapon = currentWeapon player;
            _compatible = _currentWeapon call bis_fnc_compatibleItems;
            _compatibleSilencers = [];
            _hasSilencer = false;
            _actualSilencer = "";
            _itemClassName = "";
            _addedSilencer = false;
            _speakerOff = false;
            {
                _type = (_x call bis_fnc_itemType) select 1;
                if (_type isEqualTo "AccessoryMuzzle") then {
                    _compatibleSilencers pushBack _x;
                };
            } forEach _compatible;
            // Check inventory
            if (count _compatibleSilencers > 0) then {
                {
                    _silencerClassName = _x;
                    {
                        _itemClassName = _x;
                        if (_itemClassName == _silencerClassName) then {
                            _hasSilencer = true;
                            _actualSilencer = _itemClassName;
                            break;
                        }
                    } forEach (items player);
                } forEach _compatibleSilencers;
            };

            if (_hasSilencer) then { // Silencer found!
                player removeItem _actualSilencer;
                player addWeaponItem [_currentWeapon, _actualSilencer];
                _addedSilencer = true;
            };

            // Turn off speakers
            _handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType;
            if (count _handRadios > 0) then {
                _handRadio_1 = _handRadios select 0;
                // Check speaker state
                _isSpeaker = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
                if(_isSpeaker) then {
                    // Turn speaker off
                    _speakerOff = true;
                    cgqc_reset_speaker = true;
                    _success = [_handRadio_1, false] call acre_api_fnc_setRadioSpeaker;
                    _speaker_check = [_handRadio_1] call acre_api_fnc_isRadioSpeaker;
                    hint format ["%1 Speaker: %2", _handRadio_1, _speaker_check];
                };
            };
            _txt = "-- Stealth --<br/>";
            if (_addedSilencer) then {
                _txt = _txt + "Silencer: On<br/>";
            } else {
                _txt = _txt + "No silencer found...<br/>";
            };
            if (_speakerOff) then {
                _txt = _txt + "Radio Speaker: Off<br/>";
            };
            hint parseText _txt;

        };
        case "normal":{
            cgqc_player_state = 1;
            // Normal voice
            [player, "default"] call CGQC_fnc_setVoiceVolume;
            _txt = "Normal:<br/> Default voice level<br/>";

            //Turn speaker back on
            if(cgqc_reset_speaker) then {
                cgqc_reset_speaker = false;
                ["speaker_on"] call CGQC_fnc_setRadios;
                _txt = _txt + "Radio Speaker: On<br/>";
            };

            hint parseText _txt;

        };
        case "battle":{
            cgqc_player_state = 2;
            [player, "loud"] call CGQC_fnc_setVoiceVolume;
            // Remove silencer
            _currentWeapon = currentWeapon player;
            _compatible = _currentWeapon call bis_fnc_compatibleItems;
            _compatibleSilencers = [];
            _silencerRemoved = false;
            _speakerOff = false;
            _actualSilencer = "";
            {
                _type = (_x call bis_fnc_itemType) select 1;
                if (_type isEqualTo "AccessoryMuzzle") then {
                    _compatibleSilencers pushBack _x;
                };
            } forEach _compatible;
            _player = player;
            _currentWeapon = primaryWeapon _player;
            _items = primaryWeaponItems player;

            {
                _silencerClassName = _x;
                if (_silencerClassName in _items) then {
                    // Remove the silencer from the current weapon
                    player removePrimaryWeaponItem _silencerClassName;
                    // Add the silencer to the player's backpack
                    player addItemToBackpack _silencerClassName;
                    _silencerRemoved = true;
                    //hint format ["Silencer '%1' removed from %2 and added to backpack.", _silencerClassName, _currentWeapon];
                }
            } forEach _compatibleSilencers;

            //Turn speaker back on
            if(cgqc_reset_speaker) then {
                cgqc_reset_speaker = false;
                _speakerOff = true;
                ["speaker_on"] call CGQC_fnc_setRadios;
            };

            _txt = "-- Battle --<br/>";
            _txt = _txt + "Shouting<br/>";
            if (_silencerRemoved) then {
                _txt = _txt + "Silencer: Off<br/>";
            };
            if (_speakerOff) then {
                _txt = _txt + "Radio Speaker: On<br/>";
            };
            hint parseText _txt;

        };

        case "flip_chill":{
            if (cgqc_player_chill) then {
                ["ready", false] spawn CGQC_fnc_perksBasic;
            } else {
                ["chill", false] spawn CGQC_fnc_perksBasic;
            };

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
                [player] call ace_weaponselect_fnc_putWeaponAway;
                if (cgqc_player_max) then {
                    //player linkItem "immersion_cigs_cigar0_nv";
                    player addGoggles "G_Aviator";
                    player allowDamage false;
                    hint "NoDamage";
                };
                cgqc_player_chill = true;
                if !(cgqc_welcome_done) then {

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
                [] call CGQC_fnc_isDaytime;
                if !(cgqc_mission_daytime) then {
                    player removeItemFromBackpack cgqc_player_oldNvg; // Get back nvg's from backpack
                    player linkItem cgqc_player_oldNvg;
                };

                cgqc_player_chill = false; // All done
                if !(_fromLoadout) then {
                    _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Prêt au combat</t><br/>");
                    [_text, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
                };
                [player] call ace_weaponselect_fnc_putWeaponAway;
            };

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
            cgqc_perks_diver_suit_on = false;
            //cgqc_perks_diver = false;

        };
        case "click":{
            [player, "click"] remoteExec ["say3D"];

        };
        case "fix":
        {
            hint "Sound: Volumes reset";
            [] call ace_volume_fnc_restoreVolume;
            [player, "default"] call CGQC_fnc_setVoiceVolume;
        };
        case "fix_blackout":
        {
            titleCut ["", "BLACK IN", 1];
            hint "Black screen should be fixed";

        };
        case "spawn_range":
        {
            // Take player position to return later
            cgqc_range_player_pos = getPosATL player;
            // Check if range already exists
            if (!cgqc_range_on) then {
                [ "cgqc_range", [0,0, 10000] , [0,0,0], 0 ] call LARs_fnc_spawnComp;
                cgqc_range_on = true;
            };
            // TP to range
            player setPos (getPos cgqc_range_tp);
            hint "Welcome to the range";
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

        };
        case "cone_off":
        {
            //Delete trigger zone
            if !(isNil "cgqc_cone_silence") then {deleteVehicle cgqc_cone_silence;};
            //Restore volume
            [] call ace_volume_fnc_restoreVolume;
            cgqc_perks_silence = false;
            hint "Cone of silence: Off";

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

        };
        case "del_stash":
        {
            _items = getItemCargo cgqc_perk_player_stash;
            _mags = getMagazineCargo cgqc_perk_player_stash;
            _count = count _items + count _mags;
            if (_count >0) then {
                hint format["%1 stash Items saved", _count];
                cgqc_player_stash_items = [];
                cgqc_player_stash_mags = [];
                cgqc_player_stash_items = _items;
                cgqc_player_stash_mags = _mags;
            }else{
                hint "Empty stash deleted";
            };
            deleteVehicle cgqc_perk_player_stash;
            cgqc_perk_player_stash_on = false;

        };
        case "cam":{
            [player, [
                "G_mas_can_gasmask",
                "G_mas_can_gog",
                "G_mas_can_wrap_gog_T",
                "G_mas_can_wrap_gog_B",
                "G_mas_can_shemag_gog_l",
                "G_mas_can_shemag_gog",
                "G_mas_can_mask_b",
                "G_mas_can_mask",
                "G_mas_can_balaM_b",
                "G_mas_can_balaM_T",
                "G_mas_can_shemag_mask",
                "rhs_googles_black",
                "rhsusf_oakley_goggles_blk",
                "rhsusf_shemagh_gogg_tan",
                "rhsusf_shemagh2_gogg_tan",
                "G_Lowprofile"
            ]] call ace_arsenal_fnc_initBox;
            [player, player, false] call ace_arsenal_fnc_openBox;

        };
        case "check":{
            _allItems = items player;
            _allMags = magazines player;
            _allRadios = call acre_api_fnc_getCurrentRadioList;
            _allAssigned = assignedItems player;
            _primaryMag = (primaryWeaponMagazine player) select 0;
            _secondaryMag = (handgunMagazine player) select 0;
            _txt_ifak = "";
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
            _ifak = 0;
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
            _ifak = {_x isEqualTo "cgqc_items_ifak" } count _allItems;
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
            if (_ifak > 0) then {
                _txt_ifak = "ok";
                if (_bandage > 10) then {_txt_bandage = "ok"} else {_txt_bandage = "low"};
                if (_epi > 0) then {_txt_epi = "ok"} else {_txt_epi = "low"};
                if (_morphine > 0) then {_txt_morphine = "ok"} else {_txt_morphine = "low"};
                if (_painkill > 4) then {_txt_painkill = "ok"} else {_txt_painkill = "low"};
                if (_splint > 0) then {_txt_splint = "ok"} else {_txt_splint = "low"};
                if (_tourniquet > 0) then {_txt_tourniquet = "ok"} else {_txt_tourniquet = "low"};
                if (_liquids > 0) then {_txt_liquids = "ok"} else {_txt_liquids = "none"};
            } else {
                _txt_ifak = "<t color='#ff0000'>MISSING</t>";
                if (_bandage > 10) then {_txt_bandage = "ok"} else {_txt_bandage = "<t color='#ff0000'>LOW</t>"};
                if (_epi > 0) then {_txt_epi = "ok"} else {_txt_epi = "<t color='#ff0000'>LOW</t>"};
                if (_morphine > 0) then {_txt_morphine = "ok"} else {_txt_morphine = "<t color='#ff0000'>LOW</t>"};
                if (_painkill > 4) then {_txt_painkill = "ok"} else {_txt_painkill = "<t color='#ff0000'>LOW</t>"};
                if (_splint > 0) then {_txt_splint = "ok"} else {_txt_splint = "<t color='#ff0000'>LOW</t>"};
                if (_tourniquet > 0) then {_txt_tourniquet = "ok"} else {_txt_tourniquet = "<t color='#ff0000'>LOW</t>"};
                if (_liquids > 0) then {_txt_liquids = "ok"} else {_txt_liquids = "<t color='#ff0000'>MISSING</t>"};
            };

            if (_earplugs > 0) then {_txt_earplugs = "ok"} else {_txt_earplugs = "<t color='#ff0000'>MISSING</t>"};
            if (_map > 0) then {_txt_map = "ok"} else {_txt_map = "<t color='#ff0000'>MISSING</t>"};
            if (_compass > 0) then {_txt_compass = "ok"} else {_txt_compass = "<t color='#ff0000'>MISSING</t>"};
            if (_gps > 0) then {_txt_gps = "ok"} else {_txt_gps = "<t color='#ff0000'>MISSING</t>"};
            if (_notepad > 0) then {_txt_notepad = "ok"} else {_txt_notepad = "<t color='#ff0000'>MISSING</t>"};
            if (_maptools > 0) then {_txt_maptools = "ok"} else {_txt_maptools = "<t color='#ff0000'>MISSING</t>"};
            if (_primaryMags > 4) then {_txt_primaryMags = "ok"} else {_txt_primaryMags = "<t color='#ff0000'>LOW</t>"};
            if (_secondaryMags > 1) then {_txt_secondaryMags = "ok"} else {_txt_secondaryMags = "<t color='#ff0000'>LOW</t>"};

            _check_trait_medic = ["Medic", player getUnitTrait "Medic"];
            _check_trait_eng = ["Engineer", player getUnitTrait "Engineer"];
            _check_trait_eod = ["EOD", player getUnitTrait "ExplosiveSpecialist"];
            _check_trait_hacker = ["Hacker", player getUnitTrait "UavHacker"];
            _found_traits = [];
            _check_traits = "";
            _list_traits = [_check_trait_medic,_check_trait_eng,_check_trait_eod,_check_trait_hacker];
            {
                if(_x select 1) then {
                    _found_traits pushBack (_x select 0);
                };
            } forEach _list_traits;

            if (count _found_traits >0) then {
                {
                    _check_traits = _check_traits + "/" + _x;
                } forEach _found_traits;
            }else{
                _check_traits = "NONE";
            };

            // Weight and load stuff ----------------------------------------------------------------------
            _maxLoad = ((maxLoad player)*0.1)/2.2;
            _check_maxLoad = parseNumber (_maxLoad toFixed 1);
            _currentLoad = ((loadAbs player)*0.1)/2.2;
            _currentLoadKg = parseNumber (_currentLoad toFixed 1);
            _check_currentLoad_percent = load player; // between 0-1 .. Percentage of fullness
            _check_currentLoad = "";

            if (_check_currentLoad_percent > 0.8) then { // Heavy
                _check_currentLoad = format["<t color='#ff0000'>%1</t>", _currentLoadKg];
            }else{
                _check_currentLoad = format ["%1", _currentLoadKg];
            };

            // Uniform load
            _check_uniform_load = floor (loadUniform player * 100);
            if (_check_uniform_load > 80) then { // Heavy
                _check_uniform_load = format["<t color='#ff8000'>%1</t>", _check_uniform_load];
            };
            // Vest Load
            _check_vest_load = floor (loadVest player * 100);
            if (_check_vest_load > 80) then { // Heavy
                _check_vest_load = format["<t color='#ff8000'>%1</t>", _check_vest_load];
            };
            // Backpack Load
            _check_backpack_load = floor (loadBackpack player * 100);
            if (_check_backpack_load > 80) then { // Heavy
                _check_backpack_load = format["<t color='#ff8000'>%1</t>", _check_backpack_load];
            };

            _percent = "%";
            _kg = "kg";

            Hint parseText format [
                "------ QuickCheck -------<br/>" +
                "Load: %1%2/%3kg <br/>" +
                "Uniform:%4%5 -Vest:%6%7 -Pack:%8%9<br/>" +
                "Traits: %10<br/>" +
                "------- Medical ------- <br/>" +
                " -IFAK: %11 <br/>" +
                "- Bandage: %12 <br/>" +
                "- Epinephrine: %13 <br/>" +
                "- Morphine: %14 <br/>" +
                "- Painkiller: %15 <br/>" +
                "- Splint: %16 <br/>" +
                "- Tourniquet: %17 <br/>" +
                "- Blood: %18 <br/>" +
                "<br/>------- Essentials ------- <br/>" +
                "- Earplugs: %19 <br/>" +
                "- Map: %20 <br/>" +
                "- Compass: %21 <br/>" +
                "<br/>------- Nice to haves ------- <br/>" +
                "- GPS: %22 <br/>" +
                "- Notepad: %23 <br/>" +
                "- Maptools: %24 <br/>" +
                "<br/>------- Magazines ------- <br/>" +
                "- Primary: %25 <br/>" +
                "- Handgun: %26 <br/>"
                ,
                _check_currentLoad,
                _kg,
                _check_maxLoad,
                _check_uniform_load,
                _percent,
                _check_vest_load,
                _percent,
                _check_backpack_load,
                _percent,
                _check_traits,
                _ifak,
                _txt_bandage,
                _txt_epi,
                _txt_morphine,
                _txt_painkill,
                _txt_splint,
                _txt_tourniquet,
                _txt_liquids,
                _txt_earplugs,
                _txt_map,
                _txt_compass,
                _txt_gps,
                _txt_notepad,
                _txt_maptools,
                _txt_primaryMags,
                _txt_secondaryMags
            ];
        };
    };
    // Return control to player

    if (userInputDisabled) then {};
};

diag_log "[CGQC_FNC] perksBasic done";