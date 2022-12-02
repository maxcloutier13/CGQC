_type = _this select 0;
_unit = _this select 1;
_killer = _this select 2;

if (local _unit) then {
	switch (_type) do	{
		case 0: { // Player respawn
			_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
			_unit enableStamina false; //Re-disable stamina, in-case 
			["InitializePlayer", [_unit]] call BIS_fnc_dynamicGroups;
			[ _unit, player_patch ] call BIS_fnc_setUnitInsignia; //Set insignia back
			sleep 3;
			hint "Check tes radios! Ça inverse parfois au respawn.";
			sleep 5;
			hintSilent "";
		};
		case 1: { // Player killed
			_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
			//hint format ["Woops! tu t'es fait pèté par: %1", _killer];
		};
	};
};




