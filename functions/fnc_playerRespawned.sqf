// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit"];

// Player respawn
_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
_unit setFace(_unit getVariable["Saved_Face",[]]);
[_unit, cgqc_player_slinged_helmet] call GRAD_slingHelmet_fnc_addSlungHelmet;
_unit enableStamina false; //Re-disable stamina, in-case 
//["InitializePlayer", [_unit]] call BIS_fnc_dynamicGroups; //Reinit dynamic groups? Necessary?
_setPatch = [] spawn CGQC_fnc_setPatch; //Set patch again
hint "Check tes radios! Ça inverse parfois au respawn.";
// Lower gun 
player action ['SwitchWeapon', player, player, 250];
sleep 5;
hintSilent "";
