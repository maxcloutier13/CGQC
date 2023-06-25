// --- cfgGuns ----------------------------------------------------------
// Description of all the gun sheeit

// Prevent backpack reloading of primary weapons
class RifleCore;
class Rifle: RifleCore
{
	class EventHandlers
	{
		reload = "_vestMags = (getMagazineCargo vestContainer player) select 0;_validMags = compatibleMagazines (primaryWeapon player);if(cgqc_reloaded_empty)then{if(count (_vestMags intersect _validMags) > 0) then{cgqc_reloaded_empty = false;};};cgqc_reload_new = (_this select 3) select 0;if !(cgqc_reload_new in _vestMags) then {cgqc_prevent_reload = true;} else {cgqc_prevent_reload = false;};";
	};
};


/*
//reload = "_vestMags = vestMagazines player; cgqc_reload_new = _this select 3;if !(cgqc_reload_new in _vestMags) then {cgqc_prevent_reload = true} else {cgqc_prevent_reload = false};";
	
class RifleCore;
class Rifle: RifleCore
{
	class EventHandlers
	{
		fired		= "systemchat format['fired EH output: %1 [time: %2]', _this, time]";
		reload		= "systemchat format['reload EH output: %1 [time: %2]', _this, time]";
		reloaded	= "systemchat format['reloaded EH output: %1 [time: %2]', _this, time]";
	};
};
//reload = "[0, _this] execVM '\cgqc\functions\fnc_reloading.sqf'"; //List all vest/pack mags
//reloaded = "[1, _this] execVM '\cgqc\functions\fnc_reloading.sqf'"; //Check where reload is from

*/

// Pistol for default soldier
class hgun_P07_F;
class cgqc_gun_p99_wood : hgun_P07_F
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_gun_p99_wood";
	baseWeapon = "cgqc_gun_p99_wood";
	displayName = "CGQC P99 Woodland";
	hiddenSelectionsTextures[] = {
		"\CGQC\guns\cgqc_gun_p99_wood.paa"};
	picture = "\A3\Weapons_F_Exp\Pistols\P07\Data\UI\icon_hgun_P07_khk_F_X_CA.paa";
};

class Rangefinder;
class cgqc_item_rangefinder : Rangefinder
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_item_rangefinder";
	baseWeapon = "cgqc_item_rangefinder";
	displayName = "CGQC Rangefinder ";
};
class Laserdesignator_03;
class cgqc_item_laserdesignator : Laserdesignator_03
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_item_laserdesignator";
	baseWeapon = "cgqc_item_laserdesignator";
	displayName = "CGQC Laser Designator";
};
class launch_MRAWS_green_F;
class cgqc_gun_mk1_MAAWS : launch_MRAWS_green_F
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_gun_mk1_MAAWS";
	baseWeapon = "cgqc_gun_mk1_MAAWS";
	displayName = "CGQC MAAWS";
	hiddenSelectionsTextures[] = {
		"\cgqc\guns\cgqc_gun_maaws_darkgreen",
		"\A3\Weapons_F_Tank\Launchers\MRAWS\Data\launch_MRAWS_02_F_co"};
	class LinkedItems
	{
	};
};
// Custom skins ----------------------------------------------------------
class cgqc_gun_mk1_MAAWS_cadpat : launch_MRAWS_green_F 
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_gun_mk1_MAAWS_cadpat";
	baseWeapon = "cgqc_gun_mk1_MAAWS_cadpat";
	displayName = "CGQC MAAWS - Cadpat";
	hiddenSelectionsTextures[] = {
	"\CGQC\guns\cgqc_gun_MAAWS_cadpat",
	"\A3\Weapons_F_Tank\Launchers\MRAWS\Data\launch_MRAWS_02_F_co"};
	class LinkedItems
	{
	};
};
class cgqc_gun_mk1_MAAWS_woodland : launch_MRAWS_green_F 
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_gun_mk1_MAAWS_woodland";
	baseWeapon = "cgqc_gun_mk1_MAAWS_woodland";
	displayName = "CGQC MAAWS - Woodland";
	hiddenSelectionsTextures[] = {
	"\CGQC\guns\cgqc_gun_maaws_woodland",
	"\A3\Weapons_F_Tank\Launchers\MRAWS\Data\launch_MRAWS_02_F_co"};
	class LinkedItems
	{
	};
};

class cgqc_gun_mk1_MAAWS_laforest : launch_MRAWS_green_F 
{
	scope = 2;
	author = "silent1";
	_generalMacro = "cgqc_gun_mk1_MAAWS_laforest";
	baseWeapon = "cgqc_gun_mk1_MAAWS_laforest";
	displayName = "CGQC - Le Scalpel de Laforest";
	hiddenSelectionsTextures[] = {
	"\CGQC\guns\cgqc_gun_maaws_laforest",
	"\A3\Weapons_F_Tank\Launchers\MRAWS\Data\launch_MRAWS_02_F_co"};
	class LinkedItems
	{
	};
};

class Binocular;
class ACE_Vector: Binocular {
	//Laser = 1;
	//magazines[] = {"Laserbatteries"};
	visionMode[] = {"Normal","NVG","TI"};
	thermalMode[] = {0};
	opticsZoomMin = 0.001;
	opticsZoomMax = 0.15;
	opticsZoomInit = 0.03;
};