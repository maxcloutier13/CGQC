// --- openItem ----------------------------------------------------------
// Open item and put content on target
_type = _this select 0;
_target = _this select 1;
_forceOpen = _this select 2;

_work = "";
if (player isEqualTo _target) then {
	_work = "Opening your ";
} else {
	_work = "Opening target's ";
};


_check = [];
_content = [];
_kit = "";
_txt = "";
_ammo = false;
_allItems = items _target;
_allMags = magazines _target;
_primaryMag = (primaryWeaponMagazine _target) select 0;
_primaryMags = 0;
_handgunMag = (handgunMagazine _target) select 0;
_handgunMags = 0;
_blood = [];
_bandage = 0;
_earplugs = 0;
_epi = 0;
_morphine = 0;
_painkill = 0;
_splint = 0;
_tourniquet = 0;
_liquids = 0;
_1000ml = 0;
_500ml = 0;
_250ml = 0;
_medbag = 0;
_pak = 0;
_primaryMags = 0;
_nade = 0;
_handgunMags = 0;
_nadeFlash = 0;
_smoke = 0;
_smoke_blue = 0;
_smoke_red = 0;
_smoke_purple = 0;

_bandage = {_x isEqualTo "ACE_fieldDressing" } count _allItems;
_epi ={_x isEqualTo "ACE_epinephrine" } count _allItems;
_morphine = {_x isEqualTo "ACE_morphine" } count _allItems;
_painkill = {_x isEqualTo "FF_Painkiller" } count _allItems;
_splint = {_x isEqualTo "ACE_splint" } count _allItems;
_tourniquet = {_x isEqualTo "ACE_tourniquet" } count _allItems;
_blood = ["ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250"] apply {toLower _x};
_liquids = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV", "ACE_bloodIV", "ACE_plasmaIV"] apply {toLower _x};
_1000ml = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV_500", "ACE_bloodIV_500", "ACE_plasmaIV_500"] apply {toLower _x};
_500ml = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV_250", "ACE_bloodIV_250", "ACE_plasmaIV_250"] apply {toLower _x};
_250ml = {(toLower _x) in _blood} count _allItems;
_medbag = {_x isEqualTo "FSGm_ItemMedicBag" } count _allItems;
_pak = {_x isEqualTo "ACE_personalAidKit" } count _allItems;
_smoke_purple = {_x isEqualTo "SmokeShellPurple" } count _allMags;
//_secondaryMags = {_x isEqualTo _secondaryMag } count _allMags;

switch (_type) do {
	case "ifak": { 
		if (_forceOpen || _bandage < 2) then {
			_work = _work + "IFAK";
			_target removeItem "cgqc_items_ifak";
			for "_i" from _bandage to 9 do {_target addItem "ACE_fieldDressing"};
			for "_i" from _epi to 1 do {_target addItem "ACE_epinephrine"};
			for "_i" from _morphine to 1 do {_target addItem "ACE_morphine"};
			for "_i" from _painkill to 4 do {_target addItem "FF_Painkiller"};
			for "_i" from _splint to 0 do {_target addItem "ACE_splint"};
			for "_i" from _tourniquet to 1 do {_target addItem "ACE_tourniquet"};
			for "_i" from _liquids to 1 do {_target addItemToBackpack "ACE_salineIV_500"};
			hint _work;
		};
		break;
	};
	case "medkit": { 
		if (player isEqualTo _target) then {
			if (_forceOpen || _liquids < 3) then {
				_work = _work + "Medkit";
				_target removeItem "cgqc_items_medkit";
				for "_i" from _bandage to 49 do {_target addItemToBackpack "ACE_fieldDressing"};
				for "_i" from _epi to 9 do {_target addItemToBackpack "ACE_epinephrine"};
				for "_i" from _morphine to 9 do {_target addItemToBackpack "ACE_morphine"};
				for "_i" from _painkill to 14 do {_target addItemToBackpack "FF_Painkiller"};
				for "_i" from _splint to 5 do {_target addItemToBackpack "ACE_splint"};
				for "_i" from _tourniquet to 5 do {_target addItemToBackpack "ACE_tourniquet"};
				for "_i" from _1000ml to 4 do {_target addItemToBackpack "ACE_salineIV"};
				for "_i" from _500ml to 7 do {_target addItemToBackpack "ACE_salineIV_500"};
				for "_i" from _pak to 0 do {_target addItemToBackpack "ACE_personalAidKit"};
				for "_i" from _smoke_purple to 1 do {_target addItemToBackpack "SmokeShellPurple"};
				for "_i" from _medbag to 0 do {_target addItemToBackpack "FSGm_ItemMedicBag"};
				hint _work;
			};
		};
		break;
	};
	case "mags": {
		_target removeItem "cgqc_bandolier_ammo";
		player playMove "AinvPknlMstpSnonWnonDnon_medic4";
		hint "Standby 10s - Reloading from Bandolier.";
		sleep 5;
		if !(isNil "_primaryMag") then {
			_countVest = 0;
			_countPack = 0;
			for "_i" from 1 to 8 do {
				if (player canAddItemToVest _primaryMag) then {
					player addItemToVest _primaryMag;
					_countVest = _countVest + 1;
				} else { // No space, adding to pack
					player addItemToBackpack _primaryMag;
					_countPack = _countPack + 1;
				};				
			};
			hint format ["Vest: +%1 - Pack: +%2", _countVest, _countPack];
		};
	};
	case "refill": { 
		if !("cgqc_bandolier_ammo" in items player) exitWith{};
		_target removeItem "cgqc_bandolier_ammo";
		player playMove "AinvPknlMstpSnonWnonDnon_medic4";

		// Message to player
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Standby 15s - Unpacking Bandolier</t><br/>";
		[_text, 0, 0, 2, 1] spawn BIS_fnc_dynamicText;
		sleep 5;
		// Count Mag
		if !(isNil "_primaryMag") then {
			_primaryMags = {_x isEqualTo _primaryMag } count _allMags;
		};
		if !(isNil "_handgunMag") then {
			_handgunMags = {_x isEqualTo _handgunMag } count _allMags;
		};
		_grenades = ["rhs_mag_m67", "HandGrenade"] apply {toLower _x};
		_nade = {(toLower _x) in _grenades} count _allMags;
		_flash = ["ACE_M84", "ACE_CTS9"]  apply {toLower _x};
		_nadeFlash = {(toLower _x) in _flash} count _allMags;
		_smoke = {_x isEqualTo "SmokeShell" } count _allMags;
		//_smoke_blue = {_x isEqualTo "SmokeShellBlue" } count _allMags;
		//_smoke_red = {_x isEqualTo "SmokeShellRed" } count _allMags;
		// Throwables
		_nadeCount = 0;
		_nadeFlashCount = 0;
		_smokeCount = 0;
		//_smoke_blueCount = 0;
		//_smoke_redCount = 0;
		for "_i" from _nade to 3 do {_target addItemToVest "HandGrenade";_nadeCount = _nadeCount + 1};
		for "_i" from _nadeFlash to 1 do {_target addItemToVest "ACE_CTS9"; _nadeFlashCount = _nadeFlashCount +1};
		for "_i" from _smoke to 2 do {_target addItemToVest "SmokeShell"; _smokeCount = _smokeCount + 1};
		//for "_i" from _smoke_blue to 0 do {_target addItemToVest "SmokeShellBlue";_smoke_blueCount = _smoke_blueCount +1};
		//for "_i" from _smoke_red to 0 do {_target addItemToVest "SmokeShellRed";_smoke_redCount = _smoke_redCount + 1};
		player playMove "AinvPknlMstpSnonWnonDnon_medic4";
		// Message to player
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Standby 10s - Getting there..</t><br/>";
		[_text, 0, 0, 2, 1] spawn BIS_fnc_dynamicText;
		_magCount = 0;
		_handMagCount = 0;
		sleep 5;
		if !(isNil "_handgunMag") then {
			//hint format ["HandgunMag: %1", _handgunMag];
			for "_i" from _handgunMags to (cgqc_config_sidearm_mag_nbr - 1) do {
				_target addItemToVest _handgunMag;
				_handMagCount = _handMagCount + 1;
				};
		}else{hint "No Secondary weapon!";sleep 1;};
		if !(isNil "_primaryMag") then {
			//hint format ["Mag: %1", _primaryMag];

			// Extract the magazine size from the class name
			_magSize = getNumber(configFile >> "CfgMagazines" >> _primaryMag >> "count");
			// Compare the magazine size
			_addMags = 6;
			switch (true) do {
				case (_magSize > 50): {_addMags = 3; break;};
				case (_magSize > 30): {_addMags = 4; break;};
			};

			for "_i" from 1 to _addMags do {
				if (player canAddItemToVest _primaryMag) then {
					player addItemToVest _primaryMag;
				} else { 
					if (player canAddItemToBackpack _primaryMag) then {// No space, adding to pack
						player addItemToBackpack _primaryMag;
					}else{
						hint "Not enough space for mags... Dropping on ground";
						_itemPos = getPos player; // Get player's position
						_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

						_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
						_groundItem addItemCargoGlobal [_primaryMag, 1]; // Add the magazine to the holder

						// Optional: Set the direction of the weapon holder based on the player's orientation
						_playerDir = direction player;
						_groundItem setDir _playerDir;

						// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
						_name = format ["%1's mag overflow", cgqc_custom_playername];
						_groundItem setVariable ["BIS_displayName", _name];
					};
				};
				_magCount = _magCount + 1;
			};
			/*for "_i" from _primaryMags to (cgqc_setting_limitMags_max - 1) do {
				_target addItemToVest _primaryMag;
				_magCount = _magCount + 1;
			};*/
		}else{hint "No primary weapon!";sleep 1;};
		// Message to player
		_text = "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t size='1' >Standby 5s - almost done</t><br/>";
		[_text, 0, 0, 2, 1] spawn BIS_fnc_dynamicText;
		sleep 5;

		// Prep throwables text 
		_throwables = "";
		_added = false;
		if (_nadeCount > 0) then {_throwables = _throwables + format ["%1 nades", _nadeCount]; _added = true;};
		if (_nadeFlashCount > 0) then {_throwables = _throwables + format ["/%1 bangs", _nadeFlashCount]; _added = true;};
		if (_smokeCount > 0) then {_throwables = _throwables + format ["/%1 smokes", _smokeCount]; _added = true;};
		//if (_smoke_blueCount > 0) then {_throwables = _throwables + format ["Grabbed: %1 blue smokes<br/>", _nadeCount]};
		//if (_smoke_redCount > 0) then {_throwables = _throwables + format ["Grabbed: %1 red smokes<br/>", _nadeCount]};
		if(_added)then {
			_throwables = "Grabbed: " + _throwables;
		};
		_text = parseText format [
			"<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>-- Ammo Bandolier unpacked --<br/>" +
			"- %1 primary mags added<br/>" +
			"- %2 handgun mags refilled<br/>" +
			"%3"
			, _magCount, _handMagCount, _throwables
			];
		[_text, 0, 0, 5, 1] spawn BIS_fnc_dynamicText;
		break;
	};
	default {hint "Erreur openItem" };
};

