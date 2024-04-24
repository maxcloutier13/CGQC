// --- loadoutToClipboard ----------------------------------------------------------
// Copy target loadout to clipboard for making new roles
params ["_target"];
diag_log format ["[CGQC_FNC] loadoutToClipboard %1 started", _target];

_loadout_string = "";

// Get all the needed info
// Equipment
_loadout_player_helmet = headgear _target;
_loadout_player_goggles = goggles _target;
_loadout_player_uniform = uniform _target;
_loadout_player_vest = vest _target;
_loadout_player_backpack = backpack _target;
_loadout_player_primary = primaryWeapon  _target;
_loadout_player_primary_acc = primaryWeaponItems _target;
_loadout_player_primary_mag = primaryWeaponMagazine _target;
_loadout_player_handgun = handgunWeapon  _target;
_loadout_player_handgun_acc = handgunItems _target;
_loadout_player_handgun_mag = handgunMagazine _target;
_loadout_player_launcher = secondaryWeapon  _target;
_loadout_player_launcher_acc = secondaryWeaponItems _target;
_loadout_player_launcher_mag = secondaryWeaponMagazine _target;

// Items
_loadout_player_items_uniform = uniformItems _target;
_loadout_player_mags_uniform = uniformMagazines _target;
_loadout_player_items_vest = vestItems _target;
_loadout_player_mags_vest = vestMagazines _target;
_loadout_player_items_pack = backpackItems _target;
_loadout_player_mags_pack = backpackMagazines _target;
_loadout_player_items_assigned = assignedItems _target;

//Export text format
// === Intro =================================================================================================================
_txt_intro = "
// --- role_type ----------------------------------------------------------
// Description
";

_txt_loadout = "";
_txt_loadout = format["
// === Clothing ==========================================================================================================
_hats = [ ""%1""];
_goggles = [""%2""];
_vests = [""%3""];
_uniforms = [""%4""];
_rucks = [""%5""];
_loadout = [_hats, _goggles, _vests, _uniforms, _rucks];
[_loadout] call CGQC_fnc_loadLoadout;"
, _loadout_player_helmet,
_loadout_player_goggles,
_loadout_player_vest,
_loadout_player_uniform,
_loadout_player_backpack
];

// === Primary =================================================================================================================
_txt_primary = "";
//Primary
if (_loadout_player_primary != "") then {
	// We have a handgun
	_txt_primary = format["

// === Primary   ====================================================================================================
[""%1""] call CGQC_fnc_getCustomGun;", _loadout_player_primary];

	// Magazines
	{
		if (_x isNotEqualTo "") then {
			_str = format ["
player addPrimaryWeaponItem ""%1"";", _x];
			_txt_primary = _txt_primary + _str;
		};
	}forEach _loadout_player_primary_mag;
	// Accessories
	{
		if (_x isNotEqualTo "") then {
			_str = format ["
player addPrimaryWeaponItem ""%1"";", _x];
			_txt_primary = _txt_primary + _str;
		};
	}forEach _loadout_player_primary_acc;
};

// === Handgun =================================================================================================================
_txt_handgun = "
";
//Handgun
if (_loadout_player_handgun != "") then {
	// We have a handgun
	_txt_handgun = format["

// === Handgun   ====================================================================================================
_handgun = [""%1""", _loadout_player_handgun];
	// Magazine
	{
		if (_x isNotEqualTo "") then {
			_str = format [", ""%1""", _x];
			_txt_handgun = _txt_handgun + _str;
		};
	}forEach _loadout_player_handgun_mag;

	// Accessories
	{
		if (_x isNotEqualTo "") then {
			_str = format [", ""%1""", _x];
			_txt_handgun = _txt_handgun + _str;
		};
	}forEach _loadout_player_handgun_acc;
	// Suffix and function call
	_txt_handgun = _txt_handgun + "];
[_handgun] call CGQC_fnc_getCustomHandgun;";
};

// === Launcher =================================================================================================================
_txt_launcher = "";
//Primary
if (_loadout_player_launcher != "") then {
	// We have a handgun
	_txt_launcher = format["

// === Launcher   ====================================================================================================
[""%1""] call CGQC_fnc_getCustomGun;", _loadout_player_launcher];

	// Magazines
	{
		if (_x isNotEqualTo "") then {
			_str = format ["
player addSecondaryWeaponItem ""%1"";", _x];
			_txt_launcher = _txt_launcher + _str;
		};
	}forEach _loadout_player_launcher_mag;
	// Accessories
	{
		if (_x isNotEqualTo "") then {
			_str = format ["
player addSecondaryWeaponItem ""%1"";", _x];
			_txt_launcher = _txt_launcher + _str;
		};
	}forEach _loadout_player_launcher_acc;
};

// === Assigned items =================================================================================================================
_txt_assigned = "

// === Assigned Items ====================================================================================================";
{
	if (_x isNotEqualTo "ItemRadioAcreFlagged") then {
		_str = format ["
player assignItem ""%1"";", _x];
		_txt_assigned = _txt_assigned + _str;
	};
}forEach _loadout_player_items_assigned;

// === Uniform items =================================================================================================================
_txt_uniformItems = "

// === Uniform Items ====================================================================================================";
{
	_str = format ["
player addItemToUniform ""%1"";", _x];
	_txt_uniformItems = _txt_uniformItems + _str;
}forEach _loadout_player_items_uniform;

// Vest items
_txt_vestItems = "

// === Vest Items ====================================================================================================";
{
	_str = format ["
player addItemToVest ""%1"";", _x];
	_txt_vestItems = _txt_vestItems + _str;
}forEach _loadout_player_items_vest;

//Backpack items
_txt_packItems = "

// === Backpack Items ====================================================================================================";
{
	_str = format ["
player addItemToBackpack ""%1"";", _x];
	_txt_packItems = _txt_packItems + _str;
}forEach _loadout_player_items_pack;

_txt_finale = "

// === Mags ====================================================================================================;
[] call CGQC_fnc_addMags;
";


// String prep
_loadout_string = _txt_intro + _txt_loadout + _txt_radios + _txt_primary + _txt_handgun + _txt_launcher + _txt_assigned + _txt_uniformItems + _txt_vestItems + _txt_packItems + _txt_finale;

//Copy result to clipboard
copyToClipboard _loadout_string;
hint format ["Loadout %1 sent to clipboard", _target];
diag_log "[CGQC_FNC] loadoutToClipboard done";