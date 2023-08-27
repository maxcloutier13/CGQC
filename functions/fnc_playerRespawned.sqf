// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit"];

// Save stuff for player respawn
// Loadout
_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
// Face/identity
_unit setFace(_unit getVariable["Saved_Face",[]]);
// Slinged helmet
[_unit, _unit getVariable["Saved_Slinged",[]]] call GRAD_slingHelmet_fnc_addSlungHelmet;
// Secondary weapon
cgqc_player_second = _unit getVariable "WBK_SecondWeapon";

// Set patch
[] call CGQC_fnc_keepPatch;
// Load Radio priorities
y_mpttRadioList1 = _unit getVariable["Radio_Settings",[]];
_success = [y_mpttRadioList1] call acre_api_fnc_setMultiPushToTalkAssignment;
//hint "Check tes radios! Ça inverse parfois au respawn.";
// Lower gun 
player action ['SwitchWeapon', player, player, 250];
sleep 5;
hintSilent "";
