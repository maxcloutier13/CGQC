_action = [ "menu_quick", "Quick Stuff", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Items Rapides ========================================================================================================
_action = [ "menu_items", "Items Rapides", "CGQC\textures\icon_items", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Quick Heal
_action = [ "menu_items9", "Quick heal", "", {["heal"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_items10", "Refill Mags", "", {[] call CGQC_fnc_addMags; [] call CGQC_fnc_maxMags;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;

//Radios
_action = [ "menu_items_radios", "Radios", "", {""}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Individual radios
_action = [ "menu_items1", "Get: 343", "", {["343"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_items2", "Get: 152", "", {["152"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_items3", "Get: 148", "", {["148"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_items3", "Get: 117f", "", {["117"] call CGQC_fnc_getStuff}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining || !cgqc_mk2_arsenal_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items","menu_items_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Radios Vietnam
_action = [ "menu_items52", "Radio: Short-Range", "", {["52"] call CGQC_fnc_getStuff}, {cgqc_player_hasUnsung} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_items77", "Radio: Long-Range", "", {["77"] call CGQC_fnc_getStuff}, {!cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Earplugs
_action = [ "menu_items3", "Earplugs", "", {["earplugs"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Bandages
_action = [ "menu_items4", "Bandages x10", "", {["bandages"] call CGQC_fnc_getStuff}, {cgqc_player_hasAceMedical} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Painkillers
_action = [ "menu_items5", "Painkillers x5", "", {["painkillers"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//IFAK
_action = [ "menu_items_ifak", "Kit: Individual First-AId", "", {["ifak"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Bandolier
_action = [ "menu_items_bandolier", "Bandolier: Ammo", "", {["bandolier"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Medikit
_action = [ "menu_items_medkit", "Kit: Medic Supply", "", {["medkit"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
//Kidnapping Kit
_action = [ "menu_items8", "Kidnaping Kit", "", {["kidnap"] call CGQC_fnc_getStuff}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Pistol mags
_action = [ "menu_items11", "2x Secondary mags", "", {["mags_secondary"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Side keys
_action = [ "menu_items12", "Get side vehicle key", "", {["key"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call  ace_interact_menu_fnc_addActionToObject;


if (cgqc_player_has2023) then {
    // Quick Items
    //m72a7
    _action = [ "menu_items6", "Jetable: m72a7 LAW", "", {["law"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
    _adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
    //m136
    _action = [ "menu_items7", "Jetable: m136", "", {["m136"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
    _adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_items"], _action ] call ace_interact_menu_fnc_addActionToObject;
};


// Skill switcher ========================================================================================================
_action = [ "menu_skill", "Switch: Skills", "CGQC\textures\icon_skills", {""}, {player getVariable 'cgqc_player_rank' > 2 || !cgqc_mk2_arsenal_locked || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Medic
_action = [ "skill_medic", "Medic", "", {["med", false] spawn CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Engineer
_action = [ "skill_eng", "Engineer", "", {["eng", false] spawn CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Driver
_action = [ "skill_driver", "Tank Driver", "", {["driver", false] spawn CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Pilot
_action = [ "skill_pilot", "Heli Pilot", "", {["heli", false] spawn CGQC_fnc_switchPerks}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Sniper
_action = ["skill_sniper", "Recon", "", {["recon", false] spawn CGQC_fnc_switchPerks},	{true}] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Heavy
_action = ["skill_heavy", "Heavy loads", "", {["at", false] spawn CGQC_fnc_switchPerks},	{true}] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_skill"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Radio setups
_action = [ "menu_radios", "Switch: Radios", "CGQC\textures\radio.paa", {""}, {player getVariable 'cgqc_player_rank' > 3 || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_1", "Infantry - 343", "", {["inf"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_2", "2iC - 343+148", "", {["2ic"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_3", "TL - 343+152", "", {["tl"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_2", "Medic - 343+152", "", {["medic"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_4", "SL/HQ - 343+117+117", "", {["sl"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_5", "Recon - 343+152+117", "", {["recon"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
//_action = [ "menu_radios_7", "LeCloutier - 343+152+152", "", {["clout"] call CGQC_fnc_getRadioPresets}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_radios_6", "Zeus - 343+117+117", "", {["zeus_radios", 0] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;


LOG(" loadMk3Menu - loading cargo stuff");
// Supplies spawner --------------------------------------------------------------------------------------------------------------
_action = [ "menu_supplies", "Logistics", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick" ], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Ammo can
_action = [ "menu_supplies_ammo", "Squad Ammo Box", "", {["ammo"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Explosives can
_action = [ "menu_supplies_exp", "Explosives Box", "", {["exp"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  60mm mortar crate
_action = [ "menu_supplies_60", "60mm mortar box", "", {["mort60"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  82mm mortar crate
_action = [ "menu_supplies_82", "82mm mk6 mortar box", "", {["mort82"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Fuel can
_action = [ "menu_supplies_fuel", "Fuel Can", "", {["fuel"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Vehicle ammo can
_action = [ "menu_supplies_vic", "Vehicle Ammo Can", "", {["vic_ammo"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Spare wheel
_action = [ "menu_supplies_wheel", "Spare wheel", "", {["wheel"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;
//  Spare tracks
_action = [ "menu_supplies_track", "Spare track", "", {["track"] call CGQC_fnc_getStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_quick", "menu_supplies"], _action ] call  ace_interact_menu_fnc_addActionToObject;