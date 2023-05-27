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
