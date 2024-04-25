#include "\CGQC\script_component.hpp"
// --- inspect ----------------------------------------------------------
// Inspect target laodout and reports problems
params ["_type"];
LOG_1()" inspect %1 started", _type);

inspect_target = cursorTarget;
_inspect_txt = "";
// Player info ----------------------------------------------------------------------------------
inspect_target_name = name inspect_target;
if (inspect_target_name isEqualTo "Error: No unit") then {
	_inspect_txt = "No Unit<br/>";
}else{
	// Good to go bro
	inspect_target_trait_medic = ["Medic", inspect_target getUnitTrait "Medic"];
	inspect_target_trait_eng = ["Engineer", inspect_target getUnitTrait "Engineer"];
	inspect_target_trait_eod = ["EOD", inspect_target getUnitTrait "ExplosiveSpecialist"];
	inspect_target_trait_hacker = ["Hacker", inspect_target getUnitTrait "UavHacker"];
	_found_traits = [];
	inspect_target_traits = "";
	_check_traits = [inspect_target_trait_medic,inspect_target_trait_eng,inspect_target_trait_eod,inspect_target_trait_hacker];
	{
		if(_x select 1) then {
			_found_traits pushBack (_x select 0);
		};
	} forEach _check_traits;

	if (count _found_traits >0) then {
		{
			inspect_target_traits = inspect_target_traits + "/" + _x;
		} forEach _found_traits;
	}else{
		inspect_target_traits = "NONE";
	};

	// Weight and load stuff ----------------------------------------------------------------------
	_maxLoad = ((maxLoad inspect_target)*0.1)/2.2;
	inspect_target_maxLoad = parseNumber (_maxLoad toFixed 1);
	_currentLoad = ((loadAbs inspect_target)*0.1)/2.2;
	_currentLoadKg = parseNumber (_currentLoad toFixed 1);
	inspect_target_currentLoad_percent = load inspect_target; // between 0-1 .. Percentage of fullness
	inspect_target_currentLoad = "";

	if (inspect_target_currentLoad_percent > 0.8) then { // Heavy
		inspect_target_currentLoad = format["<t color='#ff0000'>%1</t>", _currentLoadKg];
	}else{
		inspect_target_currentLoad = format ["%1", _currentLoadKg];
	};

	// Uniform load
	inspect_target_uniform_load = floor (loadUniform inspect_target * 100);
	if (inspect_target_uniform_load > 80) then { // Heavy
		inspect_target_uniform_load = format["<t color='#ff8000'>%1</t>", inspect_target_uniform_load];
	};
	// Vest Load
	inspect_target_vest_load = floor (loadVest inspect_target * 100);
	if (inspect_target_vest_load > 80) then { // Heavy
		inspect_target_vest_load = format["<t color='#ff8000'>%1</t>", inspect_target_vest_load];
	};
	// Backpack Load
	inspect_target_backpack_load = floor (loadBackpack inspect_target * 100);
	if (inspect_target_backpack_load > 80) then { // Heavy
		inspect_target_backpack_load = format["<t color='#ff8000'>%1</t>", inspect_target_backpack_load];
	};

	// All stuff ----------------------------------------------------------------------------------------
	// All items
	inspect_target_allItems = items inspect_target;
	inspect_target_allItems sort true;
	// All mags
	inspect_target_allMags = magazines inspect_target;
	inspect_target_allMags sort true;
	// Throwables
	inspect_target_allThrowables = [];
	_seenThrowables = [];
	{
		_itemClassName = _x;
		if (!(_itemClassName in _seenThrowables) && (_itemClassName call BIS_fnc_isThrowable)) then
		{
		_seenThrowables pushBack _itemClassName;
		_picture	 = (getText (configFile >> 'CfgMagazines' >> _itemClassName >> 'picture'));
		_displayName = (getText (configFile >> 'CfgMagazines' >> _itemClassName >> 'displayName'));
		inspect_target_allThrowables append [[_itemClassName, _picture, _displayName]]; // use pushBack
		}
	} forEach inspect_target_allMags;
	inspect_target_allThrowables sort true;
	// Remove throwables from mags
	inspect_target_allMags = inspect_target_allMags - inspect_target_allThrowables;
	// Radios
	inspect_target_allRadios = call acre_api_fnc_getCurrentRadioList;
	{
		_x = toUpper _x;
	} forEach inspect_target_allRadios;

	// Assigned Items
	inspect_target_items_assigned = assignedItems inspect_target;
	// Head/face --------------------------------------------------------------------------
	inspect_target_helmet = headgear inspect_target;
	inspect_target_goggles = goggles inspect_target;
	// Uniform ----------------------------------------------------------------------------
	inspect_target_uniform = uniform inspect_target;
	inspect_target_uniform_txt = "---------- Uniform ----------<br/>";
	if !(inspect_target_uniform isEqualTo "") then {
		inspect_target_uniform_items = uniformItems inspect_target;
		inspect_target_uniform_items = inspect_target_uniform_items - inspect_target_allRadios;
		inspect_target_uniform_items_list = [];
		if (count inspect_target_uniform_items > 0) then {
			// Find unique entries
			{
				if (!(_x in inspect_target_uniform_items_list)) then {
					inspect_target_uniform_items_list pushBack _x;
				}
			} forEach inspect_target_uniform_items;
			{
				_item = _x;
				_count = {_x isEqualTo _item } count inspect_target_uniform_items;
				//_itemName = (getText (configFile >> 'CfgWeapons' >> _item >> 'displayName'));
				inspect_target_uniform_txt = inspect_target_uniform_txt + format ["%1 - %2<br/>", _item, _count];
			} forEach inspect_target_uniform_items_list;
		}else{
			// No items?
			inspect_target_uniform_txt = inspect_target_uniform_txt + "- No Items - <br/>";
		};

		// Uniform - Mags
		inspect_target_uniform_allMags = uniformMagazines inspect_target;
		inspect_target_uniform_gunMags = [];
		inspect_target_uniform_throwables = [];

		[inspect_target_uniform_allMags, inspect_target_uniform_gunMags, inspect_target_uniform_throwables, inspect_target_uniform_txt] call CGQC_fnc_inspectSort;

	}else{
		inspect_target_uniform_txt = inspect_target_uniform_txt + "-- None --<br/>";
	};


	// Vest ----------------------------------------------------------------------------
	inspect_target_vest = vest inspect_target;
	inspect_target_vest_items = vestItems inspect_target;
	inspect_target_vest_items_list = [];
	inspect_target_vest_txt = "---------- Vest ----------<br/>";
	if !(inspect_target_vest isEqualTo "") then {
		if (count inspect_target_vest_items > 0) then {
			// Find unique entries
			{
				if (!(_x in inspect_target_vest_items_list)) then {
					inspect_target_vest_items_list pushBack _x;
				}
			} forEach inspect_target_vest_items;
			{
				_item = _x;
				_count = {_x isEqualTo _item } count inspect_target_vest_items;
				//_itemName = (getText (configFile >> 'CfgWeapons' >> _item >> 'displayName'));
				inspect_target_vest_txt = inspect_target_vest_txt + format ["%1 - %2<br/>", _item, _count];
			} forEach inspect_target_vest_items_list;
		}else{
			// No items?
			inspect_target_vest_txt = inspect_target_vest_txt + "- No Items - <br/>";
		};

		// Vest - Mags
		inspect_target_vest_allMags = vestMagazines inspect_target;
		inspect_target_vest_gunMags = [];
		inspect_target_vest_throwables = [];
		[inspect_target_vest_allMags, inspect_target_vest_gunMags, inspect_target_vest_throwables, inspect_target_vest_txt] call CGQC_fnc_inspectSort;
	} else {
		inspect_target_vest_txt = inspect_target_vest_txt + "-- None --<br/>";
	};

	// Backpack
	inspect_target_backpack = backpack inspect_target;
	inspect_target_backpack_items = backpackItems inspect_target;
	inspect_target_backpack_items_list = [];
	inspect_target_backpack_txt = "---------- Backpack  ----------<br/>";

	if !(inspect_target_backpack isEqualTo "") then {
		if (count inspect_target_backpack_items > 0) then {
			// Find unique entries
			{
				if (!(_x in inspect_target_backpack_items_list)) then {
					inspect_target_backpack_items_list pushBack _x;
				}
			} forEach inspect_target_backpack_items;
			{
				_item = _x;
				_count = {_x isEqualTo _item } count inspect_target_backpack_items;
				//_itemName = (getText (configFile >> 'CfgWeapons' >> _item >> 'displayName'));
				inspect_target_backpack_txt = inspect_target_backpack_txt + format ["%1 - %2<br/>", _item, _count];
			} forEach inspect_target_backpack_items_list;
		}else{
			// No items?
			inspect_target_backpack_txt = inspect_target_backpack_txt + "- No Items - <br/>";
		};

		// Backpack - Mags
		inspect_target_backpack_allMags = backpackMagazines inspect_target;
		inspect_target_backpack_gunMags = [];
		inspect_target_backpack_throwables = [];
		[inspect_target_backpack_allMags, inspect_target_backpack_gunMags, inspect_target_backpack_throwables, inspect_target_backpack_txt] call CGQC_fnc_inspectSort;
	} else {
		inspect_target_backpack_txt = inspect_target_backpack_txt + "-- None --<br/>";
	};

	// Weapons -----------------------------------------------------------------------------------------
	inspect_target_primary = primaryWeapon  inspect_target;
	inspect_target_primary_mag_types = compatibleMagazines inspect_target_primary;
	inspect_target_primary_mag_valid = [];
	{if (_x in inspect_target_primary_mag_types) then {inspect_target_primary_mag_valid pushBack _x};
	} forEach inspect_target_allMags;
	inspect_target_primary_mag_total = count inspect_target_primary_mag_valid;
	// Handgun
	inspect_target_handgun = handgunWeapon  inspect_target;
	inspect_target_handgun_mag_types = compatibleMagazines inspect_target_handgun;
	inspect_target_handgun_mag_valid = [];
	{if (_x in inspect_target_handgun_mag_types) then {inspect_target_handgun_mag_valid pushBack _x};
	} forEach inspect_target_allMags;
	inspect_target_handgun_mag_total = count inspect_target_handgun_mag_valid;
	// Launcher
	inspect_target_launcher = secondaryWeapon  inspect_target;
	inspect_target_launcher_mag_types = compatibleMagazines inspect_target_launcher;
	inspect_target_launcher_mag_valid = [];
	{if (_x in inspect_target_launcher_mag_types) then {inspect_target_launcher_mag_valid pushBack _x};
	} forEach inspect_target_allMags;
	inspect_target_launcher_mag_total = count inspect_target_launcher_mag_valid;

	// Specific alerts  - Low ammo/meds/radios/essentials
	inspect_target_alerts = "";
	_ifak = 0;
	_bandage = 0;
	_earplugs = 0;
	_epi = 0;
	_morphine = 0;
	_painkill = 0;
	_splint = 0;
	_tourniquet = 0;
	_liquids = 0;
	_map = 0;
	_compass = 0;
	_gps = 0;
	_notepad = 0;
	_maptools = 0;
	// Count meds
	_ifak = {_x isEqualTo "cgqc_items_ifak" } count inspect_target_allItems;
	_bandage = {_x isEqualTo "ACE_fieldDressing" } count inspect_target_allItems;
	_earplugs = {_x isEqualTo "ACE_EarPlugs" } count inspect_target_allItems;
	_epi ={_x isEqualTo "ACE_epinephrine" } count inspect_target_allItems;
	_morphine = {_x isEqualTo "ACE_morphine" } count inspect_target_allItems;
	_painkill = {_x isEqualTo "FF_Painkiller" } count inspect_target_allItems;
	_splint = {_x isEqualTo "ACE_splint" } count inspect_target_allItems;
	_tourniquet = {_x isEqualTo "ACE_tourniquet" } count inspect_target_allItems;
	_blood = ["ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250", "ACE_bloodIV", "ACE_bloodIV_500", "ACE_blood_250"] apply {toLower _x};
	_liquids = {(toLower _x) in _blood} count inspect_target_allItems;
	// Count Essentials
	_map = {_x isEqualTo "ItemMap" } count inspect_target_items_assigned;
	_compass = {_x isEqualTo "ItemCompass" } count inspect_target_items_assigned;
	_gps = {_x isEqualTo "ItemGPS" } count inspect_target_items_assigned;
	_notepad = {_x isEqualTo "acex_intelitems_notepad" } count inspect_target_allMags;
	_maptools = {_x isEqualTo "ACE_MapTools" } count inspect_target_allItems;
	// Build message
	if (inspect_target_primary isEqualTo "") then {inspect_target_alerts = inspect_target_alerts + "-No Primary<br/>"};
	if (inspect_target_primary_mag_total < 4) then {inspect_target_alerts = inspect_target_alerts + "-Low Primary Ammo<br/>"};
	if (inspect_target_handgun isEqualTo "") then {inspect_target_alerts = inspect_target_alerts + "-No Handgun<br/>"};
	if (inspect_target_handgun_mag_total < 2) then {inspect_target_alerts = inspect_target_alerts + "-Low Handgun Ammo<br/>"};
	if (_ifak < 1) then {
		inspect_target_alerts = inspect_target_alerts + "-IFAK<br/>";
		if (_bandage < 10) then {inspect_target_alerts = inspect_target_alerts + "-Bandages<br/>"};
		if (_epi < 1) then {inspect_target_alerts = inspect_target_alerts + "-Epinephrine<br/>"};
		if (_morphine < 1) then {inspect_target_alerts = inspect_target_alerts + "-Morphine<br/>"};
		if (_painkill < 5)  then {inspect_target_alerts = inspect_target_alerts + "-Painkillers<br/>"};
		if (_splint < 1) then {inspect_target_alerts = inspect_target_alerts + "-Splint<br/>"};
		if (_tourniquet < 2) then {inspect_target_alerts = inspect_target_alerts + "-Tourniquet<br/>"};
		if (_liquids < 2)  then {inspect_target_alerts = inspect_target_alerts + "-Saline<br/>"};
	};
	// Essentials
	if (count inspect_target_allRadios < 1) then {inspect_target_alerts = inspect_target_alerts + "-No Radio<br/>"};
	if (_earplugs < 1) then {inspect_target_alerts = inspect_target_alerts + "-Earplugs<br/>"};
	if (_map < 1) then {inspect_target_alerts = inspect_target_alerts + "-Map<br/>"};
	if (_compass < 1) then {inspect_target_alerts = inspect_target_alerts + "-Compass<br/>"};
	if (_gps < 1)  then {inspect_target_alerts = inspect_target_alerts + "-GPS<br/>"};
	if (_notepad < 1)  then {inspect_target_alerts = inspect_target_alerts + "-Notepad<br/>"};
	if (_maptools< 1)  then {inspect_target_alerts = inspect_target_alerts + "-MapTools<br/>"};

	// Prep text
	_percent = "%";
	_kg = "kg";
	if (inspect_target_primary isEqualTo "") then {
		inspect_target_primary = "-None-"
	}else{
		inspect_target_primary = (getText (configFile >> 'CfgWeapons' >> inspect_target_primary >> 'displayName'));
	};
	if (inspect_target_handgun isEqualTo "") then {
		inspect_target_handgun = "-None-"
	}else{
		inspect_target_handgun = (getText (configFile >> 'CfgWeapons' >> inspect_target_handgun >> 'displayName'));
	};
	if (inspect_target_launcher isEqualTo "") then {
		inspect_target_launcher = "-None-"
	}else{
		inspect_target_launcher = (getText (configFile >> 'CfgWeapons' >> inspect_target_launcher >> 'displayName'));
	};

	switch (_type) do {
		case 0: {
			// Build the text
			_inspect_txt = format [
				"------- QuickCheck: %1 ------- <br/>" +
				"Load: %2%3/%4kg <br/>" +
				"Uniform:%5%6 -Vest:%7%8 -Pack:%9%10<br/>" +
				"Traits: %11<br/>" +
				"---------- Weapons ----------<br/>" +
				"Primary: %12<br/>" +
				"--Mags: %13<br/>" +
				"Handgun: %14<br/>" +
				"--Mags: %15<br/>" +
				"Launcher: %16<br/>" +
				"--Mags%17<br/>" +
				"<t color='#ff0000'>---------- MISSING/LOW ----------<br/></t>" +
				"%18"
				,
				inspect_target_name, //1
				inspect_target_currentLoad, //2
				_kg, //3
				inspect_target_maxLoad, //4
				inspect_target_uniform_load, //5
				_percent, //6
				inspect_target_vest_load, //7
				_percent, //8
				inspect_target_backpack_load, //9
				_percent, //10
				inspect_target_traits, //11
				inspect_target_primary, //12
				inspect_target_primary_mag_total, //13
				inspect_target_handgun, //14
				inspect_target_handgun_mag_total, //15
				inspect_target_launcher, //16
				inspect_target_launcher_mag_total, //17
				inspect_target_alerts //18
			];
		};
		case 1: {  // Full inspection
			// Build the text
			_inspect_txt = format [
				"------- Inspection: %1 ------- <br/>" +
				"Load: %2%3/%4kg <br/>" +
				"Uniform:%5%6 -Vest:%7%8 -Pack:%9%10<br/>" +
				"Traits: %11<br/>" +
				"------------------------<br/>" +
				"Helmet: %12<br/>" +
				"Goggles: %13<br/>" +
				"Uniform: %14<br/>" +
				"Vest: %15<br/>" +
				"Pack: %16<br/>" +
				"%17" +
				"%18" +
				"%19" +
				"---------- Weapons ----------<br/>" +
				"Primary: %20<br/>" +
				"--Mags: %21<br/>" +
				"Handgun: %22<br/>" +
				"--Mags: %23<br/>" +
				"Launcher: %24<br/>" +
				"--Mags%25<br/>" +
				"<t color='#ff0000'>---------- MISSING/LOW ----------<br/></t>" +
				"%26"
				,
				inspect_target_name, //1
				inspect_target_currentLoad, //2
				_percent, //3
				inspect_target_maxLoad, //4
				inspect_target_uniform_load, //5
				_percent, //6
				inspect_target_vest_load, //7
				_percent, //8
				inspect_target_backpack_load, //9
				_percent, //10
				inspect_target_traits,
				inspect_target_helmet,
				inspect_target_goggles,
				inspect_target_uniform,
				inspect_target_vest,
				inspect_target_backpack,
				inspect_target_uniform_txt,
				inspect_target_vest_txt,
				inspect_target_backpack_txt,
				inspect_target_primary,
				inspect_target_primary_mag_total,
				inspect_target_handgun,
				inspect_target_handgun_mag_total,
				inspect_target_launcher,
				inspect_target_launcher_mag_total,
				inspect_target_alerts
			];


		};
		default {hint "Error: Inspect"};
	};
};

// Show inspection message
[_inspect_txt] spawn {
	params ["_txt"];
	Hint parseText format ["%1", _txt];
	sleep 30;
	hintSilent "";
};

LOG(" inspect done");