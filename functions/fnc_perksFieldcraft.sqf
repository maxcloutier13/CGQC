#include "\CGQC\script_component.hpp"
// --- fieldcraft ----------------------------------------------------------
// Tracking functions
params ["_type"];
LOG_1("[fieldcraft] %1 started", _type);

// TODO
// Prevent smelling if too many other players or vehicles nearby
// Prevent if gun shot within last 5mins
// Consider the wind direction. Bonus there, malus the other way.

cgqc_int_checkSkill = {
    _txt = "";
    if (cgqc_perks_tracking > 90) then {_txt =  "You were born to track";};
    if (cgqc_perks_tracking > 80 && cgqc_perks_tracking < 90) then {_txt = "You are a good tracker. You got this";};
    if (cgqc_perks_tracking > 50 && cgqc_perks_tracking < 80) then {_txt = "You are a decent tracker.";};
    if (cgqc_perks_tracking > 30 && cgqc_perks_tracking < 50) then {_txt = "You are... okay at tracking";};
    if (cgqc_perks_tracking > 10 && cgqc_perks_tracking < 30) then {_txt = "You are... Meh at tracking. It's gonna be rough";};
    if (cgqc_perks_tracking < 10) then {_txt = "You suck at tracking. Give up.";};
    [[_txt, 1.5], false] call CBA_fnc_notify;
};

cgqc_int_smellNothing = {
    _txt = "";
    _rNum = [1,45] call BIS_fnc_randomInt;
    if (_rNum == 1)  then { _txt = "...non-descript; scrub"; };
    if (_rNum == 2)  then { _txt = "...Limestone; soil"; };
    if (_rNum == 3)  then { _txt = "...Vegetation; general"; };
    if (_rNum == 4)  then { _txt = "...bodyodor; self"; };
    if (_rNum == 5)  then { _txt = "...Gun Oil; self"; };
    if (_rNum == 6)  then { _txt = "...Xeric Junipers; tree"; };
    if (_rNum == 7)  then { _txt = "...Rosemary; shrub"; };
    if (_rNum == 8)  then { _txt = "...Terra Rossa, soil"; };
    if (_rNum == 9)  then { _txt = "...Limestone; soil"; };
    if (_rNum == 10) then { _txt = "...Berber Thuya; conifer"; };
    if (_rNum == 11) then { _txt = "...Siliceous Rock; soil"; };
    if (_rNum == 12) then { _txt = "...Cork Oak; tree"; };
    if (_rNum == 13) then { _txt = "...Bay Laurel; shrub"; };
    if (_rNum == 14) then { _txt = "...Strawberry Tree; shrub"; };
    if (_rNum == 15) then { _txt = "...Tree Heath; shrub"; };
    if (_rNum == 16) then { _txt = "...Holly; shrub"; };
    if (_rNum == 17) then { _txt = "...Phillyrea; shrub"; };
    if (_rNum == 18) then { _txt = "...Laurustinus; shrub"; };
    if (_rNum == 19) then { _txt = "...Harry Broom; shrub"; };
    if (_rNum == 20) then { _txt = "...Common Myrtle; shrub"; };
    if (_rNum == 21) then { _txt = "...Holm Oak; tree"; };
    if (_rNum == 22) then { _txt = "...Kermes Oak; tree"; };
    if (_rNum == 23) then { _txt = "...Wild Olive; plant"; };
    if (_rNum == 24) then { _txt = "...Carob; plant"; };
    if (_rNum == 25) then { _txt = "...Sea Salt; ocean"; };
    if (_rNum == 26) then { _txt = "...Aleppo Pine; tree"; };
    if (_rNum == 27) then { _txt = "...Siliceous Rock; soil"; };
    if (_rNum == 28) then { _txt = "...Holm Oak; tree"; };
    if (_rNum == 29) then { _txt = "...non-descript; unknown"; };
    if (_rNum == 30) then { _txt = "...Berber Thuya; conifer"; };
    if (_rNum == 31) then { _txt = "...Xeric Pine; tree"; };
    if (_rNum == 32) then { _txt = "...Dust, Sand; mixed, soil"; };
    if (_rNum == 33) then { _txt = "...Decay, weak; flesh"; };
    if (_rNum == 34) then { _txt = "...Decay, strong; flesh"; };
    if (_rNum == 35) then { _txt = "...Decay, mixed; plant"; };
    if (_rNum == 36) then { _txt = "...Wheat; farmland"; };
    if (_rNum == 37) then { _txt = "...Barley; farmland"; };
    if (_rNum == 38) then { _txt = "...Sesame; farmland"; };
    if (_rNum == 39) then { _txt = "...Animal, varied; farmland"; };
    if (_rNum == 40) then { _txt = "...non-descript; farmland"; };
    if (_rNum == 41) then { _txt = "...Cooking; mediterranean"; };
    if (_rNum == 42) then { _txt = "...Genista; shrub"; };
    if (_rNum == 43) then { _txt = "...Cistus; shrub"; };
    if (_rNum == 44) then { _txt = "...non-descript; scrub"; };
    if (_rNum == 45) then { _txt = "...non-descript; pollen, dust"; };
    _txt = _txt + "... Nothing out of the ordinary";
    [[_txt, 1.5], false] call CBA_fnc_notify;
};

switch (_type) do {
    case "cut_grass":{
        hintSilent "Cutting grass";
        _to_ghillie = 0;
        sleep 2;
        _pos1 = player modelToWorld [0,3,0];
        _pos2 = player modelToWorld [0,6,0];
        _cut1 = createVehicle ["Land_ClutterCutter_medium_F", _pos1, [], 0, "CAN_COLLIDE"];
        _cut2 = createVehicle ["Land_ClutterCutter_medium_F", _pos2, [], 0, "CAN_COLLIDE"];
    };
    case "camo": {
        player playMove "AinvPknlMstpSnonWnonDnon_medic4";
        [
            15, [], {
                cgqc_player_camoCoef = player getUnitTrait "camouflageCoef";
                cgqc_player_audibleCoef = player getUnitTrait "audibleCoef";
                //hide the player
                player setUnitTrait ["camouflageCoef", 0.4];
                player setUnitTrait ["audibleCoef ", 0.8];
                // Setup trigger
                y_act = ""; // Lower volume on player
                y_deAct = "
                    deleteVehicle cgqc_hide_trg;
                    cgqc_perks_camo = false;
                    hint 'Not hidden anymore!';
                    player setUnitTrait ['camouflageCoef', cgqc_player_camoCoef];
                    player setUnitTrait ['audibleCoef', cgqc_player_audibleCoef];";
                _int = 2;
                // Create trigger
                cgqc_hide_trg = createTrigger ["EmptyDetector",getPos player, true];
                cgqc_hide_trg triggerAttachVehicle [player];
                cgqc_hide_trg setTriggerArea [2, 2, 0, false];
                cgqc_hide_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
                cgqc_hide_trg setTriggerStatements ["this", y_act, y_deAct];
                cgqc_hide_trg setTriggerInterval _int;
                player playActionNow "PlayerProne";
                cgqc_perks_camo = true;
            }, {player switchMove "";hint "Aborted!";}, "Hiding yourself"
        ] call ace_common_fnc_progressBar;
        hint "You are hidden!";
    };
    case "smell": {
        LOG("[fieldcraft] Smelling");
        addCamShake [3,2,2]; //p,d,f
        playSound "cgqc_sound_sniff";
        [] call cgqc_int_checkSkill;
        _txt = "";
        _txt = "Sniffing the air...";
        [[_txt, 1.5], false] call CBA_fnc_notify;
        sleep 2;

        //Campfire
        _campfires = nearestObjects [player, ["Campfire_burning_F", "Land_Campfire_burning"], 800];
        if (count _campfires > 0) then {
            LOG("[fieldcraft] Campfire in the area");
            _campfire = _campfires select 0;
            _dist = player distance _campfire;
            _fDir = player getDir _campfire;
            // Finding direction
            if (random 100 < cgqc_perks_tracking) then {
                if ((_fDir > 338) && (_fDir <  22)) then { _txt = "Campfire... North"; };
                if ((_fDir >  22) && (_fDir <  67)) then { _txt = "Campfire... North-East"; };
                if ((_fDir >  67) && (_fDir < 112)) then { _txt = "Campfire... East"; };
                if ((_fDir > 112) && (_fDir < 157)) then { _txt = "Campfire... South-East"; };
                if ((_fDir > 157) && (_fDir < 202)) then { _txt = "Campfire... South"; };
                if ((_fDir > 202) && (_fDir < 247)) then { _txt = "Campfire... South-West"; };
                if ((_fDir > 247) && (_fDir < 292)) then { _txt = "Campfire... West"; };
                if ((_fDir > 292) && (_fDir < 337)) then { _txt = "Campfire... North-West"; };
            } else { _txt = "Campfire... Somewhere"; };
            [[_txt, 1.5], false] call CBA_fnc_notify;
            if ((_dist < 100)) exitWith {_txt = "The air is thick with the scent of burning wood. The campfire is very close."};
            if ((_dist > 100) && (_dist < 200)) then {_txt = "The scent of burning wood is quite noticeable. The campfire is close by."};
            if ((_dist > 200) && (_dist < 600)) then {_txt = "You can smell a faint hint of smoke in the air. The campfire is somewhere nearby."};
            if ((_dist > 600) && (_dist < 800)) then {_txt = "A distant, almost imperceptible scent of smoke lingers in the air. The campfire is far away."};
            [[_txt, 1.5], false] call CBA_fnc_notify;
        };

        // Launcher oil smells
        if (secondaryWeapon player != "") exitWith {
            LOG("[fieldcraft] Smelling: launcher");
            _txt = "Weapon Oil... Weapon on your back...";
            [[_txt, 1.5], false] call CBA_fnc_notify;
        };

        // Advanced detection failed: exit with random normal smells
        if (random 100 > cgqc_perks_tracking) exitWith {
            LOG("[fieldcraft] Unit check: Fail. Exit.");
            call cgqc_int_smellNothing;
        };

        // Unit detection
        _redEnemy = [west, east] call BIS_fnc_sideIsEnemy;			// enemy - true/false
        _grnEnemy = [west, independent] call BIS_fnc_sideIsEnemy;	// enemy - true/false

        // Find Location/Direction
        _posE = [];													// Array Default
        {
            if (player distance _x < 500) then {					// Add to Array, []+[]				500m
                if (_redEnemy == true) then { if (side _x == east) 			then { _posE = _posE + [getPos _x]; }; };
                if (_grnEnemy == true) then { if (side _x == independent)	then { _posE = _posE + [getPos _x]; }; };
            };
        } forEach allUnits;

        _nPos = [_posE, player] call BIS_fnc_nearestPosition;		// Nearest Position in Array
        _eDir = player getDir _nPos;
        _dist = player distance _nPos;
        sleep 1;

        // Enemy Nearby!
        if (count _posE > 0) then {
            LOG("[fieldcraft] Unit check: Found one!");
            _txt = "Human smell...";
            [[_txt, 1.5], false] call CBA_fnc_notify;
            _rNum = [1,46] call BIS_fnc_randomInt;

            if (_rNum == 1)  then { _txt = "Bodyodor; Human..."; };
            if (_rNum == 2)  then { _txt = "Bodyodor; Human..."; };
            if (_rNum == 3)  then { _txt = "Bodyodor; Sweat..."; };
            if (_rNum == 4)  then { _txt = "Bodyodor; Feet..."; };
            if (_rNum == 5)  then { _txt = "Chemical; Cleaner..."; };
            if (_rNum == 6)  then { _txt = "Chemical; Chlorine..."; };
            if (_rNum == 7)  then { _txt = "Chemical; Clorox..."; };
            if (_rNum == 8)  then { _txt = "Chemical; Dryer Sheet..."; };
            if (_rNum == 9)  then { _txt = "Chemical; Shampoo..."; };
            if (_rNum == 10) then { _txt = "Chemical; Toothpaste..."; };
            if (_rNum == 11) then { _txt = "Chemical; Antiseptic..."; };
            if (_rNum == 12) then { _txt = "Chemical; Iodine..."; };
            if (_rNum == 13) then { _txt = "Chemical; Soap, Washed..."; };
            if (_rNum == 14) then { _txt = "Chemical; Bug Spray..."; };
            if (_rNum == 15) then { _txt = "Chemical; Gasoline..."; };
            if (_rNum == 16) then { _txt = "Chemical; Oil, Synthetic..."; };
            if (_rNum == 17) then { _txt = "Chemical; Bleach..."; };
            if (_rNum == 18) then { _txt = "Chemical; Deodorant..."; };
            if (_rNum == 19) then { _txt = "Chemical; Metal Polish..."; };
            if (_rNum == 20) then { _txt = "Chemical; Lighter Fluid..."; };
            if (_rNum == 21) then { _txt = "Gun Oil; foreign..."; };
            if (_rNum == 22) then { _txt = "Shoe Leather; foreign..."; };
            if (_rNum == 23) then { _txt = "Cotton, fabric; foreign..."; };
            if (_rNum == 24) then { _txt = "non-descript; human..."; };
            if (_rNum == 25) then { _txt = "Tobacco; Cuban..."; };
            if (_rNum == 26) then { _txt = "Tobacco; foreign..."; };
            if (_rNum == 27) then { _txt = "Tobacco; unknown..."; };
            if (_rNum == 28) then { _txt = "Smoke; general..."; };
            if (_rNum == 29) then { _txt = "Smoke; Cigarette..."; };
            if (_rNum == 30) then { _txt = "Cotton; wet..."; };
            if (_rNum == 31) then { _txt = "Spearmint; Chewing Gum..."; };
            if (_rNum == 32) then { _txt = "Alcohol; Beer..."; };
            if (_rNum == 33) then { _txt = "Alcohol; Liquor..."; };
            if (_rNum == 34) then { _txt = "Bodyodor; Human..."; };
            if (_rNum == 35) then { _txt = "Chemical; Cleaner..."; };
            if (_rNum == 36) then { _txt = "Chemical; Chlorine..."; };
            if (_rNum == 37) then { _txt = "Chemical; Clorox..."; };
            if (_rNum == 38) then { _txt = "Chemical; Dryer Sheet..."; };
            if (_rNum == 39) then { _txt = "Chemical; Shampoo..."; };
            if (_rNum == 40) then { _txt = "Chemical; Toothpaste..."; };
            if (_rNum == 41) then { _txt = "Chemical; Antiseptic..."; };
            if (_rNum == 42) then { _txt = "Alcohol; Beer..."; };
            if (_rNum == 43) then { _txt = "Alcohol; Liquor..."; };
            if (_rNum == 44) then { _txt = "Bodyodor; Human..."; };
            if (_rNum == 45) then { _txt = "Chemical; Cleaner..."; };
            if (_rNum == 46) then { _txt = "Chemical; Chlorine..."; };
            [[_txt, 1.5], false] call CBA_fnc_notify;
            sleep 2;

            // direction
            if (random 100 < cgqc_perks_tracking) then {
                if ((_eDir > 338) && (_eDir <  22)) then { _txt = "North"; };
                if ((_eDir >  22) && (_eDir <  67)) then { _txt = "North-East"; };
                if ((_eDir >  67) && (_eDir < 112)) then { _txt = "East"; };
                if ((_eDir > 112) && (_eDir < 157)) then { _txt = "South-East"; };
                if ((_eDir > 157) && (_eDir < 202)) then { _txt = "South"; };
                if ((_eDir > 202) && (_eDir < 247)) then { _txt = "South-West"; };
                if ((_eDir > 247) && (_eDir < 292)) then { _txt = "West"; };
                if ((_eDir > 292) && (_eDir < 337)) then { _txt = "North-West"; };
                [[_txt, 1.5], false] call CBA_fnc_notify;
            };
            if (random 100 < cgqc_perks_tracking) then {
                if ((_dist < 100)) then { _txt = "The air is thick with the scent. Someone is very close"; };
                if ((_dist > 100) && (_dist < 200)) then { _txt = "The smell is distinct. Someone is close by"; };
                if ((_dist > 200) && (_dist < 300)) then { _txt = "Smell is faint. Someone is in the vicinity"; };
                if (_dist > 300) then { _txt = "The smell is barely perceptible. Someone is far away"; };
            } else {
                _txt = "Direction uncertain..";
            };

        };
        // Nothing...
        if (count _posE == 0) then {
            LOG("[fieldcraft] Unit Check: No one found");
            call cgqc_int_smellNothing;
        };
        LOG("[fieldcraft] Smelling finished");
    };
    case "track": {
        // check surface type
        _surfaceType = surfaceType position player;
        _vegPosition = position player;

        _tooHardtoDig = [
        "#SurfRoadDirt","#SurfRoadConcrete","#SurfRoadTarmac","#GdtStratisConcrete","#GdtStratisRocky","#GdtRubble","#GdtConcrete","#GdtRock",
        "#concrete","#concrete_out","#concrete_inside","#dirtrunway","#road","#floor","#floor_inside","#carpet_inside","#carpet","#concrete_hall","#stones",
        "#woodenFloor","#planks","#planks_inside","#rubble","#BuildingRubble","#surf_roadconcrete","#surf_roaddirt","#surf_roadtarmac","#surfint_concrete",
        "#road_exp","#SurfRoadDirt_exp","#SurfRoadConcrete_exp","#SurfRoadTarmac_exp","#concrete_exp","#concrete_in_exp","#concrete_hall_exp","#stones_exp",
        "#GdtAsphalt","#SurfRoadDirt_Enoch","#SurfRoadTarmac1_Enoch","#SurfRoadTarmac2_Enoch","#SurfRoadTarmac3_Enoch","#SurfTrailDirt_Enoch","#GdtKlTarmac",
        "#GdtKlWeatheredTarmac","#GdtKLCobblestone","#GdtStratisBeach","#GdtStratisDirt","#GdtBeach","#GdtDirt","#GdtSoil","#GdtStony","#GdtDead","#GdtSeabed"];

        if (isOnRoad position player) 		exitWith {
            _txt = "Road... unable to track...";
            [[_txt, 1.5], false] call CBA_fnc_notify;
        };
        if (_surfaceType in _tooHardtoDig) 	exitWith {
            _txt = "Surface too hard... unable to track...";
            [[_txt, 1.5], false] call CBA_fnc_notify;
        };

        player playAction "PlayerCrouch"; 							// crouch...
        sleep 2;
        _txt = "Lets take a look . . .";
        [[_txt, 1.5], false] call CBA_fnc_notify;
        sleep 10;

    };
    case "fire": {
        player playMove "AinvPknlMstpSnonWnonDnon_medic4";
        [
            15, [], {
                "Campfire_burning_F" createVehicle position player;
            }, {player switchMove "";hint "Aborted!";}, "Building Campfire"
        ] call ace_common_fnc_progressBar;
        LOG("[fieldcraft] Campfire done");
    };
};

LOG("[fieldcraft]  started");