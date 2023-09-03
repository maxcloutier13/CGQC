// --- trainingMedical ----------------------------------------------------------
// Medical training 
params ["_type"];

[_type] spawn {
	params ["_type"];
	diag_log format ["[CGQC_FNC] trainingMedical %1 started", _type];

	_ll = [0];
	_rl = [0];
	_body = [0];
	_head = [0];
	_la = [0];
	_ra = [0];
	_create = false; 

	switch (_type) do {
		case 0:	{
			// Remove all dead Bodies 
			{deleteVehicle _x} forEach allDead;
			// Remove all patients 
			{
				if ((typeOf _x == 'b_g_survivor_F') && (!isPlayer _x)) then {
					deleteVehicle _x
				};
			} forEach allUnits;
			cgqc_training_medical = false;
		};
		case 1: { //Léger
			_ll = [0, 0.3, 0.5];
			_rl = [0, 0.3, 0.5];
			_body = [0.1, 0.3];
			//_head = [0.1, 0.3];
			_la = [0, 0.3, 0.5];
			_ra = [0, 0.3, 0.5];
			_create = true;
		};
		case 2: { //Medium
			_ll = [0, 0.5, 0.6, 0.7];
			_rl = [0.5, 0.6, 0.7];
			_body = [0.1, 0.3, 0.5];
			_head = [0.1, 0.3, 0.5];
			_la = [0, 0.3, 0.5, 0.6, 0.7];
			_ra = [0.3, 0.5, 0.6, 0.7];
			_create = true;
		};
		case 3: { //Heavy
			_ll = [0.7, 0.9];
			_rl = [0, 0.7, 0.9];
			_body = [0.7, 0.9];
			_head = [0.7, 0.9];
			_la = [0, 0.7, 0.9];
			_ra = [0.7, 0.9];
			_create = true;
		};
		default {
			hint "trainingMedical fail";
		};
	};

	if (_create) then {
		cgqc_training_medical = true;
		if (!isNil ("pat1")) then {deleteVehicle pat1;};
		_group1=createGroup west;
		'b_g_survivor_F' createUnit [position player, _group1, 'pat1=this; dostop pat1;'];
		pat1 setVariable ["ace_medical_ai_lastFired", 9999999]; //Disable AI to self healing
		[pat1, selectRandom _ll, "LeftLeg", selectrandom ["stab", "bullet", "grenade", "falling"]] call ace_medical_fnc_addDamageToUnit;
		[pat1, selectRandom _rl, "RightLeg", selectrandom ["stab", "bullet", "falling"]] call ace_medical_fnc_addDamageToUnit;
		[pat1, selectRandom _body, "Body", selectrandom ["stab", "bullet", "grenade"]] call ace_medical_fnc_addDamageToUnit;
		[pat1, selectRandom _head, "Head", selectrandom ["stab", "bullet", "grenade"]] call ace_medical_fnc_addDamageToUnit;
		[pat1, selectRandom _ra, "RightArm", selectrandom ["stab", "bullet", "grenade"]] call ace_medical_fnc_addDamageToUnit;
		[pat1, selectRandom _la, "LeftArm", selectrandom ["stab", "bullet", "grenade"]] call ace_medical_fnc_addDamageToUnit;
		hint 'Le patient est prêt!';
		sleep 5;
		hintSilent "";
		while {alive pat1} do {
			if (pat1 call ace_medical_status_fnc_isInStableCondition) then{
				titleText ["<t size='5' shadow='1' shadowOffset='0.05' color='#00FF22'>Patient stabilisé!</t>", "PLAIN", 0, true, true];
			};
			sleep 5.0;
		};
		if (!alive pat1 && cgqc_training_medical) then {
			titleText ["<t size='5' shadow='1' shadowOffset='0.05' color='#FF2200'>Le patient est mort...</t>", "PLAIN", 0, true, true];
		};
	};
};
diag_log "[CGQC_FNC] trainingMedical done";