#include "\CGQC\script_component.hpp"
// --- setTeamColorReloadAll ----------------------------------------------------------
// set player color
LOG(" setTeamColorReloadAll started");

[-1, {
	[] spawn CGQC_fnc_setTeamColorReload;
}] call CBA_fnc_globalExecute;


LOG(" setTeamColorReloadAll done");