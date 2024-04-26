#include "\CGQC\script_component.hpp"
// --- openMedical ----------------------------------------------------------
// Open medical items
params ["_type", ["_target", ACE_player], ["_forceOpen", true]];
LOG(" openMedical %1/%2/%3 started");

_work = "";
if (player isEqualTo _target) then {
	_work = "Opening your ";
} else {
	_work = "Opening target's ";
};

_allItems = items _target;
_allMags = magazines _target;
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
_smoke_purple = 0;

// Checking player inventory
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
_bodybags = {_x isEqualTo "ACE_bodyBag" } count _allItems;

switch (_type) do {
	case "ifak": {
		if (_forceOpen || _bandage < 2) then {
			_work = _work + "IFAK";
			_target removeItem "cgqc_items_ifak";
			LOG(" openMedical - unpacking ifak");
			for "_i" from _bandage to 9 do {_target addItem "ACE_fieldDressing"};
			for "_i" from _epi to 1 do {_target addItem "ACE_epinephrine"};
			for "_i" from _morphine to 1 do {_target addItem "ACE_morphine"};
			for "_i" from _painkill to 4 do {_target addItem "FF_Painkiller"};
			for "_i" from _splint to 0 do {_target addItem "ACE_splint"};
			for "_i" from _tourniquet to 1 do {_target addItem "ACE_tourniquet"};
			for "_i" from _liquids to 1 do {_target addItemToBackpack "ACE_salineIV_500"};
			hint _work;
		};

	};
	case "medkit": {
		if (player isEqualTo _target) then {
			if (_forceOpen || _liquids < 3) then {
				_work = _work + "Medkit";
				_target removeItem "cgqc_items_medkit";
				LOG(" openMedical - unpacking medkit");
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
				for "_i" from _bodybags to 1 do {player addItemToBackpack "ACE_bodyBag"};
				hint _work;
			};
		};

	};
	default {ERROR("[CGQC_ERROR] openMedical didn't match _type");};
};

LOG(" openMedical done");