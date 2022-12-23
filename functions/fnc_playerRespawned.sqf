// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit"];

// Player respawn
_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
_unit setFace(_unit getVariable["Saved_Face",[]]);
_unit enableStamina false; //Re-disable stamina, in-case 
//["InitializePlayer", [_unit]] call BIS_fnc_dynamicGroups; //Reinit dynamic groups? Necessary?
player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
_setPatch = [] spawn CGQC_fnc_setPatch; //Set patch again
hint "Check tes radios! Ça inverse parfois au respawn.";
sleep 5;
hintSilent "";
