#include "\CGQC\script_component.hpp"
// --- Combat ----------------------------------------------------------
// Combat training

CGQC_fnc_combat_openUI = {
	disableSerialization;
	player action ["WeaponOnBack", player];
	createDialog "RscCGQCCombat";
};

CGQC_fnc_combat = {
    hint "Combat started yay";
};
