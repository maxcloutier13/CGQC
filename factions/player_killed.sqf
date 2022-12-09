_type = _this select 0;
_unit = _this select 1;
_killer = _this select 2;

if (local _unit) then {
	switch (_type) do	{
		case 0: { // Player respawn
			_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
			_unit enableStamina false; //Re-disable stamina, in-case 
			//["InitializePlayer", [_unit]] call BIS_fnc_dynamicGroups; //Reinit dynamic groups? Necessary?
			sleep 3;
			hint "Check tes radios! Ça inverse parfois au respawn.";
			player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
			_setPatch = [] spawn CGQC_fnc_setPatch; //Set patch again
			sleep 5;
			hintSilent "";
		};
		case 1: { // Player killed
			_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
			//hint format ["Woops! tu t'es fait pèté par: %1", _killer];
		};
	};
};




