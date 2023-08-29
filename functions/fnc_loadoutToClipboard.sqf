// --- loadoutToClipboard ----------------------------------------------------------
// Copy target loadout to clipboard for making new roles
params ["_target"];
diag_log format ["[CGQC_FNC] loadoutToClipboard %1 started", _target];

// Equipment
_loadout_player_helmet = headgear _target;
_loadout_player_goggles = goggles _target;
_loadout_player_uniform = uniform _target;
_loadout_player_vest = vest _target;
_loadout_player_backpack = backpack _target;
_loadout_player_primary = primaryWeapon  _target;
_loadout_player_primary_acc = primaryWeaponItems _target;
_loadout_player_primary_mag = primaryWeaponMagazine _target;
_loadout_player_secondary = handgunWeapon  _target;
_loadout_player_secondary_acc = handgunItems _target;
_loadout_player_secondary_mag = handgunMagazine _target;
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

remove_txt = "
	//Remove stuff;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
";

//Export text format
uniform_txt = "";
uniform_txt = parseText format["
	// --- Loadout ----------------------------------------------------------;
	// Loadout switcher for unit;
	//Uniform;
	player addHeadgear ""%1"";
	player addGoggles ""%2"";
	player forceAddUniform ""%3"";
	player addVest ""%4"";
	player addBackpack ""%5"";"
, _loadout_player_helmet,
_loadout_player_goggles,
_loadout_player_uniform,
_loadout_player_vest,
_loadout_player_backpack
];

// Uniform items
uniform_items_txt = "//Uniform Items;";
{_str = format ["player addItemToUniform ""%1"";", _x];
	uniform_items_txt = uniform_items_txt + _str;
}forEach _loadout_player_items_uniform;
{_str = format ["player addItemToUniform ""%1"";", _x];
	uniform_items_txt = uniform_items_txt + _str;
}forEach _loadout_player_mags_uniform;

// Vest items
vest_items_txt = "//Vest Items;";
{_str = format ["player addItemToVest ""%1"";", _x];
	vest_items_txt = vest_items_txt + _str;
}forEach _loadout_player_items_vest;
{_str = format ["player addItemToVest ""%1"";", _x];
	vest_items_txt = vest_items_txt + _str;
}forEach _loadout_player_mags_vest;

//Backpack items
pack_items_txt = "//Backpack Items;";
{_str = format ["player addItemToBackpack ""%1"";", _x];
	pack_items_txt = pack_items_txt + _str;
}forEach _loadout_player_items_pack;
{_str = format ["player addItemToBackpack ""%1"";", _x];
	pack_items_txt = pack_items_txt + _str;
}forEach _loadout_player_mags_pack;

//Assigned items
assigned_items_txt = "//Assigned Items;";
{_str = format ["player assignItem ""%1"";", _x];
	assigned_items_txt = assigned_items_txt + _str;
}forEach _loadout_player_items_assigned;

//Guns
weapons_txt = "//Weapons;";
//Primary
if (_loadout_player_primary != "") then {
	_str = format ["
		player addWeapon ""%1"";
	", 
		_loadout_player_primary
	];
	weapons_txt = weapons_txt + _str;
};
// Accessories
{_str = format ["player addPrimaryWeaponItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_primary_acc;
// Magazines
{_str = format ["player addPrimaryWeaponItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_primary_mag;

//Handgun
if (_loadout_player_secondary != "") then {
	_str = format ["
		player addWeapon ""%1"";
	", 
		_loadout_player_secondary
	];
	weapons_txt = weapons_txt + _str;
};
// Accessories
{_str = format ["player addHandgunItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_secondary_acc;
// Magazines
{_str = format ["player addHandgunItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_secondary_mag;

//Launcher
if (_loadout_player_launcher != "") then {
	_str = format ["
		player addWeapon ""%1"";
	", 
		_loadout_player_launcher
	];
	weapons_txt = weapons_txt + _str;
};
// Accessories
{_str = format ["player addSecondaryWeaponItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_launcher_acc;
// Magazines
{_str = format ["player addSecondaryWeaponItem ""%1"";", _x];
	weapons_txt = weapons_txt + _str;
}forEach _loadout_player_launcher_mag;


// String prep
items_txt = uniform_items_txt + vest_items_txt + pack_items_txt + assigned_items_txt + weapons_txt;
_loadout_string = remove_txt + str uniform_txt + items_txt;

//Copy result to clipboard
copyToClipboard _loadout_string;
hint "Loadout sent to clipboard";
diag_log "[CGQC_FNC] loadoutToClipboard done";