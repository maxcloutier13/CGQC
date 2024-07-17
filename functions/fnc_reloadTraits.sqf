#include "\CGQC\script_component.hpp"
// --- reloadTraits ----------------------------------------------------------
// Reload pesky fucking traits
LOG("[reloadTraits] started");

player setUnitTrait ["audibleCoef", cgqc_player_trait_audibleCoef];
player setUnitTrait ["camouflageCoef", cgqc_player_trait_camoCoef];
player setUnitTrait ["loadCoef", cgqc_player_trait_loadCoef];

LOG("[reloadTraits] done");