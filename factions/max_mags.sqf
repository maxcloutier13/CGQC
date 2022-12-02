if (cgqc_setting_limitMags) then
{
	_primary_mag = (primaryWeaponMagazine player) select 0; 
	if(!isNil _primary_mag) then { //Only act if there are primary mags
		_all_primary = (magazines player) select {_x == _primary_mag}; 
		_primary_count = count _all_primary;
		if (_primary_count > cgqc_setting_limitMags_max) then  //Check if too much 
		{
			hint format["Too many mags mofo!! Max:%1", cgqc_setting_limitMags_max];
			for "_i" from 0 to (_primary_count - cgqc_setting_limitMags_max) -1 do { 
				player removeMagazine _primary_mag; //Remove excess
			};
			sleep 3;
			hintSilent "";
		}else{
			hint "Mags: good";
			sleep 3;
			hintSilent "";
		};
	};
	
};
// Does not account for "other" variants of magazines, only the ones loaded by default in the gun when exiting arsenal
// Also does not prevent unit from pickup up more mags outside of arsenal. 



