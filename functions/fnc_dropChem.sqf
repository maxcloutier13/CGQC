// --- dropChem ----------------------------------------------------------
// Drop chemlight
_chem = _this select 0;

player addItem _chem;
call ace_advanced_throwing_fnc_drawThrowable;
hint format ["Cycle to item and throw... %1 left", cgqc_perks_chems]; 
hint "Cycle to item and throw";
sleep 5;
hintSilent "";

/*
case "drop": { 
		//sleep 1;
		//player playMove "Acts_Pointing_Down";
		//sleep 2;
		hint format ["Dropped... %1 left", _count];
		_chem createVehicle getPosATL player;
	};
*/
