#include "\CGQC\script_component.hpp"
// --- playerKilled ----------------------------------------------------------
// Code in the event a player gets dead
params ["_unit", "_killer", "_instigator", "_useEffects"];
LOG_4("[CGQC_EVENT] playerKilled %1/Killer:%2/Inst:%3/Effect:%4 started", _unit, _killer, _instigator, _useEffects);

if (local _unit) then {
	LOG("[CGQC_EVENT] playerKilled Unit local: Saving");
	_unit setVariable["Saved_Face", face _unit];
	_unit setVariable["Saved_Slinged", [_unit] call GRAD_slingHelmet_fnc_getSlungHelmet];
	_unit setVariable["Saved_second", _unit getVariable "WBK_SecondWeapon" select 1];


	// Save radios and ptt priorities
	_allRadios = [] call acre_api_fnc_getCurrentRadioList;
	_radios = [];
	{
		_radio = _x;
		_side = [_x] call acre_api_fnc_getRadioSpatial;
		_vol = [_x] call acre_api_fnc_getRadioVolume;
		_radios pushBack [_radio, _side, _vol];
	} forEach _allRadios;
	_unit setVariable["Radio_Settings_radios", _radios];
	_mpttRadioList = [] call acre_api_fnc_getMultiPushToTalkAssignment;
	_unit setVariable["Radio_Settings_ptt", _mpttRadioList];

	// Loadout
	_loadout = getUnitLoadout [_unit, true]; //reloads magazines
	_unit setVariable["Saved_Loadout",_loadout];

	_killa = "";
	private _killerVehicle = vehicle _killer;
	if (isNil "_instigator") then {
		_killa = name _killer;
	} else {
		_killa = name _instigator;
	};

	if (player isEqualTo _killer || player isEqualTo _instigator) then {
		_killa = ".. toi même?";
	} else {
		if (side player isEqualTo side _killer) then {
			_killa = "ton chummy " + _killa + "!!";
		};
	};
	/*
	_text = format ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Woops! tu t'es fait pèté par:
		<br/> %1", _killa];
 	[_text, 0, 0, 3, 1] spawn BIS_fnc_dynamicText;*/

	// Save drone type if it's a portable one
	_uav = getConnectedUAV player;
	if (_uav isNotEqualTo objNull) then {
		_type = typeOf _uav;
		_types = ["sps_black_hornet_01_F", "Rev_darter_b", "Rev_pelican_b", "Rev_demine_b"];
		if (_type in _types) then {
			deleteVehicle _uav;
			cgqc_player_uav = _type;
		} else {
			cgqc_player_uav = nil;
		};
	};
}else {
	LOG("[CGQC_EVENT] playerKilled Unit NOT local: not saving");
};

LOG_2("[CGQC_KILL]%1 killed by %2", name _unit, _killa);
LOG("[CGQC_EVENT] playerKilled done");