// --- postInit_client ----------------------------------------------------------
// Start everything player related

if (cgqc_setting_limitMags) then {
	_primary_mag = (primaryWeaponMagazine player) select 0;
	_all_primary = (magazines player) select {_x == _primary_mag}; 
	_primary_count = count _all_primary;

	// Find type of mags
	_magname = toLower _primary_mag;
	_ratio = 0;
	if ((_magname find["30rnd", 0]) > 0) then {
		_ratio = 1;
	};
	if ((_magname find["20rnd", 0]) > 0) then {
		_ratio = 1.5
	};
	if ((_magname find["7rnd", 0]) > 0) then {
		_ratio = 3
	};
	if (_ratio > 0) then {
		_mag_delta = _primary_count - (cgqc_setting_limitMags_max * _ratio);
		if (_mag_delta > 0) then  //Check if too much 
		{
			hint format["Too many mags mofo!! Max:%1!", cgqc_setting_limitMags_max];
			for "_i" from 1 to _mag_delta do { 
				player removeMagazine _primary_mag; //Remove excess
			};
			sleep 5;
			hintSilent "";
		}else{
			hint "Mags: good";
			sleep 3;
			hintSilent "";
		};	
	}else{
		hint "Mags: unknown";
		sleep 3;
		hintSilent "";
	};	
	
};
// Does not account for "other" variants of magazines, only the ones loaded by default in the gun when exiting arsenal
// Also does not prevent unit from pickup up more mags outside of arsenal. 



