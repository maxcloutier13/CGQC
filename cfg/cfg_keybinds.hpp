// -- Repos --
["[CGQC]", "cgqc_kb_repos", "Au Repos",
	{ ["flip_chill", false] spawn CGQC_fnc_perksBasic;}, {""}, []
] call cba_fnc_addKeybind;

// -- Crickets --
["[CGQC]", "cgqc_kb_criquet", "Criquet",
	{ ["click", false] spawn CGQC_fnc_perksBasic;}, {""}, []
] call cba_fnc_addKeybind;

// -- QuickStates --
["[CGQC]", "cgqc_kb_stealth", "Quick States: Stealth",
	{ ["stealth", false] spawn CGQC_fnc_perksBasic}, {""}, []
] call cba_fnc_addKeybind;
["[CGQC]", "cgqc_kb_normal", "Quick States: Normal",
	{ ["normal", false] spawn CGQC_fnc_perksBasic}, {""}, []
] call cba_fnc_addKeybind;
["[CGQC]", "cgqc_kb_battle", "Quick States: Battle",
	{ ["battle", false] spawn CGQC_fnc_perksBasic}, {""}, []
] call cba_fnc_addKeybind;

// -- 152 speakers --
["[CGQC]", "cgqc_kb_speaker1", "Toggle speaker 1",
	{ ["toggle_speaker"] spawn CGQC_fnc_setRadios}, {""}, []
] call cba_fnc_addKeybind;
["[CGQC]", "cgqc_kb_speaker2", "Toggle speaker radio 2",
	{ ["toggle_speaker_2"] spawn CGQC_fnc_setRadios}, {""}, []
] call cba_fnc_addKeybind;

//-- Drop Backpack --
["[CGQC]", "cgqc_kb_dropPack_toggle", "Quickdrop/Pickup Backpack",
	{[backpack player, 'toggle'] call CGQC_fnc_dropStuff}, {""}, []
] call cba_fnc_addKeybind;

["[CGQC]", "cgqc_kb_markClear", "Mark building as Clear",
	{[] spawn CGQC_fnc_markClear}, {""}, [DIK_O, [false, true, false]]
] call cba_fnc_addKeybind;

//-- Hide the HUD
["[CGQC]", "toggle", "Toggle HUD", {
	_this call CGQC_fnc_toggleUI}, {""}, [DIK_O, [true, false, false]]
] call CBA_fnc_addKeybind;

//-- Route planner
["[CGQC]", "cgqc_kb_routePlanner", "Start Route planner", {
	["init"] spawn CGQC_fnc_routePlanner}, {""}, []
] call CBA_fnc_addKeybind;

//-- Check temperature
["[CGQC]", "cgqc_kb_checkTemp", "Check Weapon Temperature", {
	[player, player, currentWeapon player] call ace_overheating_fnc_checkTemperature}, {""}, [DIK_R, [true, false, false]]
] call CBA_fnc_addKeybind;

//-- Medical Stuff
["[CGQC]", "cgqc_kb_checkPulse", "Medical: Check Pulse", {
	["pulse"] spawn CGQC_fnc_medicalTreatment}, {""}, [DIK_C, [true, false, false]]
] call CBA_fnc_addKeybind;

["[CGQC]", "cgqc_kb_checkResp", "Medical: Check Response", {
	["response"] spawn CGQC_fnc_medicalTreatment}, {""}, [DIK_C, [false, false, true]]
] call CBA_fnc_addKeybind;


