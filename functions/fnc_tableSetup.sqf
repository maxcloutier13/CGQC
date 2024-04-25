#include "script_component.hpp"
// --- tableSetup ----------------------------------------------------------
// Table with option to load other maps
_table = (_this select 0) select 0;

_table addAction ["-- End Mission and load map --", {hint ""}];
_table addAction ["VR Hub", {[] spawn {disableSerialization;createdialog "MissionSwitchVR";}}];
_table addAction ["Malden", {["END2"] remoteExec ["endMission", 0, true]}];
_table addAction ["Takistan", {["END3"] remoteExec ["endMission", 0, true]}];
_table addAction ["Novogorsk", {["END4"] remoteExec ["endMission", 0, true]}];
_table addAction ["Bozcaada", {["END5"] remoteExec ["endMission", 0, true]}];
_table addAction ["Tanoa", {["END6"] remoteExec ["endMission", 0, true]}];