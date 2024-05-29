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
    if (cgqc_perks_tracking > 90) then {systemChat "You were born to track";};
    if (cgqc_perks_tracking > 80 && cgqc_perks_tracking < 90) then {systemChat "You are a good tracker. You got this";};
    if (cgqc_perks_tracking > 50 && cgqc_perks_tracking < 80) then {systemChat "You are a decent tracker.";};
    if (cgqc_perks_tracking > 30 && cgqc_perks_tracking < 50) then {systemChat "You are... okay at tracking";};
    if (cgqc_perks_tracking > 10 && cgqc_perks_tracking < 30) then {systemChat "You are... Meh at tracking. It's gonna be rough";};
    if (cgqc_perks_tracking < 10) then {systemChat "You suck at tracking. Give up.";};
};

cgqc_int_smellNothing = {
    _rNum = [1,45] call BIS_fnc_randomInt;
    if (_rNum == 1)  then { systemChat "...non-descript; scrub"; };
    if (_rNum == 2)  then { systemChat "...Limestone; soil"; };
    if (_rNum == 3)  then { systemChat "...Vegetation; general"; };
    if (_rNum == 4)  then { systemChat "...bodyodor; self"; };
    if (_rNum == 5)  then { systemChat "...Gun Oil; self"; };
    if (_rNum == 6)  then { systemChat "...Xeric Junipers; tree"; };
    if (_rNum == 7)  then { systemChat "...Rosemary; shrub"; };
    if (_rNum == 8)  then { systemChat "...Terra Rossa, soil"; };
    if (_rNum == 9)  then { systemChat "...Limestone; soil"; };
    if (_rNum == 10) then { systemChat "...Berber Thuya; conifer"; };
    if (_rNum == 11) then { systemChat "...Siliceous Rock; soil"; };
    if (_rNum == 12) then { systemChat "...Cork Oak; tree"; };
    if (_rNum == 13) then { systemChat "...Bay Laurel; shrub"; };
    if (_rNum == 14) then { systemChat "...Strawberry Tree; shrub"; };
    if (_rNum == 15) then { systemChat "...Tree Heath; shrub"; };
    if (_rNum == 16) then { systemChat "...Holly; shrub"; };
    if (_rNum == 17) then { systemChat "...Phillyrea; shrub"; };
    if (_rNum == 18) then { systemChat "...Laurustinus; shrub"; };
    if (_rNum == 19) then { systemChat "...Harry Broom; shrub"; };
    if (_rNum == 20) then { systemChat "...Common Myrtle; shrub"; };
    if (_rNum == 21) then { systemChat "...Holm Oak; tree"; };
    if (_rNum == 22) then { systemChat "...Kermes Oak; tree"; };
    if (_rNum == 23) then { systemChat "...Wild Olive; plant"; };
    if (_rNum == 24) then { systemChat "...Carob; plant"; };
    if (_rNum == 25) then { systemChat "...Sea Salt; ocean"; };
    if (_rNum == 26) then { systemChat "...Aleppo Pine; tree"; };
    if (_rNum == 27) then { systemChat "...Siliceous Rock; soil"; };
    if (_rNum == 28) then { systemChat "...Holm Oak; tree"; };
    if (_rNum == 29) then { systemChat "...non-descript; unknown"; };
    if (_rNum == 30) then { systemChat "...Berber Thuya; conifer"; };
    if (_rNum == 31) then { systemChat "...Xeric Pine; tree"; };
    if (_rNum == 32) then { systemChat "...Dust, Sand; mixed, soil"; };
    if (_rNum == 33) then { systemChat "...Decay, weak; flesh"; };
    if (_rNum == 34) then { systemChat "...Decay, strong; flesh"; };
    if (_rNum == 35) then { systemChat "...Decay, mixed; plant"; };
    if (_rNum == 36) then { systemChat "...Wheat; farmland"; };
    if (_rNum == 37) then { systemChat "...Barley; farmland"; };
    if (_rNum == 38) then { systemChat "...Sesame; farmland"; };
    if (_rNum == 39) then { systemChat "...Animal, varied; farmland"; };
    if (_rNum == 40) then { systemChat "...non-descript; farmland"; };
    if (_rNum == 41) then { systemChat "...Cooking; mediterranean"; };
    if (_rNum == 42) then { systemChat "...Genista; shrub"; };
    if (_rNum == 43) then { systemChat "...Cistus; shrub"; };
    if (_rNum == 44) then { systemChat "...non-descript; scrub"; };
    if (_rNum == 45) then { systemChat "...non-descript; pollen, dust"; };
    systemChat "Nothing out of the ordinary";
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
        systemChat "Sniffing the air...";
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
                if ((_fDir > 338) && (_fDir <  22)) then { systemChat "Campfire... North"; };
                if ((_fDir >  22) && (_fDir <  67)) then { systemChat "Campfire... North-East"; };
                if ((_fDir >  67) && (_fDir < 112)) then { systemChat "Campfire... East"; };
                if ((_fDir > 112) && (_fDir < 157)) then { systemChat "Campfire... South-East"; };
                if ((_fDir > 157) && (_fDir < 202)) then { systemChat "Campfire... South"; };
                if ((_fDir > 202) && (_fDir < 247)) then { systemChat "Campfire... South-West"; };
                if ((_fDir > 247) && (_fDir < 292)) then { systemChat "Campfire... West"; };
                if ((_fDir > 292) && (_fDir < 337)) then { systemChat "Campfire... North-West"; };
            } else { systemChat "Campfire... Somewhere"; };
            if ((_dist < 100)) exitWith {systemChat "The air is thick with the scent of burning wood. The campfire is very close."};
            if ((_dist > 100) && (_dist < 200)) then {systemChat "The scent of burning wood is quite noticeable. The campfire is close by."};
            if ((_dist > 200) && (_dist < 600)) then {systemChat "You can smell a faint hint of smoke in the air. The campfire is somewhere nearby."};
            if ((_dist > 600) && (_dist < 800)) then {systemChat "A distant, almost imperceptible scent of smoke lingers in the air. The campfire is far away."};
        };

        // Launcher oil smells
        if (secondaryWeapon player != "") exitWith {
            LOG("[fieldcraft] Smelling: launcher");
            systemChat "Weapon Oil... Weapon on your back...";
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
            systemChat "Human smell...";
            _rNum = [1,46] call BIS_fnc_randomInt;

            if (_rNum == 1)  then { systemChat "Bodyodor; Human..."; };
            if (_rNum == 2)  then { systemChat "Bodyodor; Human..."; };
            if (_rNum == 3)  then { systemChat "Bodyodor; Sweat..."; };
            if (_rNum == 4)  then { systemChat "Bodyodor; Feet..."; };
            if (_rNum == 5)  then { systemChat "Chemical; Cleaner..."; };
            if (_rNum == 6)  then { systemChat "Chemical; Chlorine..."; };
            if (_rNum == 7)  then { systemChat "Chemical; Clorox..."; };
            if (_rNum == 8)  then { systemChat "Chemical; Dryer Sheet..."; };
            if (_rNum == 9)  then { systemChat "Chemical; Shampoo..."; };
            if (_rNum == 10) then { systemChat "Chemical; Toothpaste..."; };
            if (_rNum == 11) then { systemChat "Chemical; Antiseptic..."; };
            if (_rNum == 12) then { systemChat "Chemical; Iodine..."; };
            if (_rNum == 13) then { systemChat "Chemical; Soap, Washed..."; };
            if (_rNum == 14) then { systemChat "Chemical; Bug Spray..."; };
            if (_rNum == 15) then { systemChat "Chemical; Gasoline..."; };
            if (_rNum == 16) then { systemChat "Chemical; Oil, Synthetic..."; };
            if (_rNum == 17) then { systemChat "Chemical; Bleach..."; };
            if (_rNum == 18) then { systemChat "Chemical; Deodorant..."; };
            if (_rNum == 19) then { systemChat "Chemical; Metal Polish..."; };
            if (_rNum == 20) then { systemChat "Chemical; Lighter Fluid..."; };
            if (_rNum == 21) then { systemChat "Gun Oil; foreign..."; };
            if (_rNum == 22) then { systemChat "Shoe Leather; foreign..."; };
            if (_rNum == 23) then { systemChat "Cotton, fabric; foreign..."; };
            if (_rNum == 24) then { systemChat "non-descript; human..."; };
            if (_rNum == 25) then { systemChat "Tobacco; Cuban..."; };
            if (_rNum == 26) then { systemChat "Tobacco; foreign..."; };
            if (_rNum == 27) then { systemChat "Tobacco; unknown..."; };
            if (_rNum == 28) then { systemChat "Smoke; general..."; };
            if (_rNum == 29) then { systemChat "Smoke; Cigarette..."; };
            if (_rNum == 30) then { systemChat "Cotton; wet..."; };
            if (_rNum == 31) then { systemChat "Spearmint; Chewing Gum..."; };
            if (_rNum == 32) then { systemChat "Alcohol; Beer..."; };
            if (_rNum == 33) then { systemChat "Alcohol; Liquor..."; };
            if (_rNum == 34) then { systemChat "Bodyodor; Human..."; };
            if (_rNum == 35) then { systemChat "Chemical; Cleaner..."; };
            if (_rNum == 36) then { systemChat "Chemical; Chlorine..."; };
            if (_rNum == 37) then { systemChat "Chemical; Clorox..."; };
            if (_rNum == 38) then { systemChat "Chemical; Dryer Sheet..."; };
            if (_rNum == 39) then { systemChat "Chemical; Shampoo..."; };
            if (_rNum == 40) then { systemChat "Chemical; Toothpaste..."; };
            if (_rNum == 41) then { systemChat "Chemical; Antiseptic..."; };
            if (_rNum == 42) then { systemChat "Alcohol; Beer..."; };
            if (_rNum == 43) then { systemChat "Alcohol; Liquor..."; };
            if (_rNum == 44) then { systemChat "Bodyodor; Human..."; };
            if (_rNum == 45) then { systemChat "Chemical; Cleaner..."; };
            if (_rNum == 46) then { systemChat "Chemical; Chlorine..."; };
            sleep 2;

            // direction
            if (random 100 < cgqc_perks_tracking) then {
                if ((_eDir > 338) && (_eDir <  22)) then { systemChat "North"; };
                if ((_eDir >  22) && (_eDir <  67)) then { systemChat "North-East"; };
                if ((_eDir >  67) && (_eDir < 112)) then { systemChat "East"; };
                if ((_eDir > 112) && (_eDir < 157)) then { systemChat "South-East"; };
                if ((_eDir > 157) && (_eDir < 202)) then { systemChat "South"; };
                if ((_eDir > 202) && (_eDir < 247)) then { systemChat "South-West"; };
                if ((_eDir > 247) && (_eDir < 292)) then { systemChat "West"; };
                if ((_eDir > 292) && (_eDir < 337)) then { systemChat "North-West"; };
            };
            if (random 100 < cgqc_perks_tracking) then {
                if ((_dist < 100)) then { systemChat "The air is thick with the scent. Someone is very close"; };
                if ((_dist > 100) && (_dist < 200)) then { systemChat "The smell is distinct. Someone is close by"; };
                if ((_dist > 200) && (_dist < 300)) then { systemChat "Smell is faint. Someone is in the vicinity"; };
                if (_dist > 300) then { systemChat "The smell is barely perceptible. Someone is far away"; };
            } else {
                systemChat "Direction uncertain..";
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

        if (isOnRoad position player) 		exitWith { systemChat "Road... unable to track..."; };
        if (_surfaceType in _tooHardtoDig) 	exitWith { systemChat "Surface too hard... unable to track..."; };



        player playAction "PlayerCrouch"; 							// crouch...
        sleep 2;
        systemChat "Lets take a look . . .";
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