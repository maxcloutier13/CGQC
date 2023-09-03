// --- refuel ----------------------------------------------------------
// Refuel/Repair/Ressupply
params ["_type"];

[_type] spawn {
	params ["_type"];
	diag_log format ["[CGQC_FNC] refuel %1 started", _type];
	_timeleft = 0;
	_skip = 0;

	switch (_type) do {
		case "normal": {
			_timeleft = 240;
			_skip = 0;
		};
		case "short": {
			_timeleft = 5;
			_skip = 1;
		};
		default {
			hint "woops";
		};
	};

	// Rearming
	private _playerVic = vehicle player;
	waitUntil{isTouchingGround _playerVic};
	if(_skip ==0) then {_playerVic engineOn false;};
	_playerVic setFuel 0;
	titleText ["<t size='5' shadow='1' shadowOffset='0.05' color='#ff0000'>Maintenance</t>", "PLAIN", 0, true, true];
	while {_timeleft > 0} do {
		hintsilent parseText format ["<t size='2' color='#ff0000'>Ravitaillement.. %1</t>", [((_timeleft)/60)+.01,"HH:MM"] call bis_fnc_timetostring];
		_timeleft = _timeleft -1;
		sleep 1;
	};
	_playerVic setVehicleAmmo 1;
	_playerVic setDamage 0;
	_playerVic setFuel 1;
	if(_skip ==0) then {_playerVic engineOn true;};
	hint "Maintenance terminée";
	sleep 2;
	titleText ["<t size='5' shadow='1' shadowOffset='0.05' color='#ff0000'>Go!</t>", "PLAIN", 0, true, true];
};