if (!isNil "cgqc_config_maximumMags") then //Make sure the variable exists first
{
	if (cgqc_config_maximumMags > 0) then //skip if setting is turned off
	{
		_primary_mag = (primaryWeaponMagazine player) select 0; 
		_all_primary = (magazines player) select {_x == _primary_mag}; 
		_primary_count = count _all_primary;
		if (_primary_count > cgqc_config_maximumMags) then  //Check if too much 
		{
			hint "Too many mags mofo!!";
			for "_i" from 0 to (_primary_count - cgqc_config_maximumMags) -1 do { 
				player removeMagazine _primary_mag; //Remove excess
			};
		};
	};
};

// Does not account for "other" variants of magazines, only the ones loaded by default in the gun when exiting arsenal
// Also does not prevent unit from pickup up more mags outside of arsenal. 



