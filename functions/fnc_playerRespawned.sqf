// --- playerRespawned ----------------------------------------------------------
// Code in the event a player respawns
params ["_unit", "_corpse"];
diag_log "[CGQC_EVENT] playerRespawned started";

// Save stuff for player respawn
// Corpse position
_unit setVariable["corpse_position", getPos _corpse];
// Loadout
_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
// Face/identity
_unit setFace(_unit getVariable["Saved_Face",[]]);
// Slinged helmet
[_unit, _unit getVariable["Saved_Slinged",[]]] call GRAD_slingHelmet_fnc_addSlungHelmet;
// WBK Secondary weapon
cgqc_player_second = _unit getVariable "WBK_SecondWeapon";

// Set patch
[] spawn CGQC_fnc_keepPatch;
// Reload radios
_radios = _unit getVariable "Radio_Settings_radios";
{
	_radio = _x select 0;
	_side = _x select 1;
	_vol = _x select 2;
	[_radio, _side] call acre_api_fnc_setRadioSpatial;
	[_radio, _vol] call acre_api_fnc_setRadioVolume;
} forEach _radios;
// Reset ptt's
_mpttRadioList = _unit getVariable "Radio_Settings_ptt";
_success = [_mpttRadioList] call acre_api_fnc_setMultiPushToTalkAssignment;

// Lower gun
[player] call ace_weaponselect_fnc_putWeaponAway;

diag_log "[CGQC_EVENT] playerRespawned done";