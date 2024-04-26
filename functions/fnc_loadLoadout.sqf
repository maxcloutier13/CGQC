#include "\CGQC\script_component.hpp"
// --- loadLoadout ----------------------------------------------------------
// Load selected uniform items
params ["_loadout"];
LOG(" loadLoadout started");

_hats = _loadout select 0;
_goggles = _loadout select 1;
_vests = _loadout select 2;
_uniforms = _loadout select 3;
_rucks = _loadout select 4;

// Select a random item
_hat = selectRandom _hats;
_goggle = selectRandom _goggles;
_vest = selectRandom _vests;
_uniform = selectRandom _uniforms;
_ruck = selectRandom _rucks;

// DLC checks
if (_ruck isEqualTo "cgqc_pack_mk1_radiobag" && !cgqc_player_hasContact) then {_ruck = "cgqc_pack_mk1_carryall"};

// Load selected items
if (_hat isNotEqualTo "") then {[_hat] call CGQC_fnc_getCustomHelmet};
if (_goggle isNotEqualTo "") then {player addGoggles _goggle;};
if (_vest isNotEqualTo "") then {["vest", _vest] call CGQC_fnc_switchStuff;};
if (_uniform isNotEqualTo "") then {["uniform", _uniform] call CGQC_fnc_switchStuff;};
if (_ruck isNotEqualTo "") then {["backpack", _ruck] call CGQC_fnc_switchStuff;};

LOG(" loadLoadout done");