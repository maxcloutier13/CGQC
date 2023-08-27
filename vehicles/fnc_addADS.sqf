// --- addADS ----------------------------------------------------------
// Add active defenses to vehicle

/* MAX Fix needed

if (isServer) then {
	waitUntil {sleep 1;cgqc_start_postInitClient_done};
	_type  = _this select 0;
	y_vic = _this select 1;
	y_vic = y_vic select 0;
	y_vic setVariable["dapsCanSmoke",1,TRUE];
	switch (_type) do {
		case "light": { 
			y_vic spawn DAPS_fnc_APSTrophyLV;
		};
		case "medium": { 
			y_vic spawn DAPS_fnc_APSTrophyMV;
		};
		case "heavy": { 
			y_vic spawn DAPS_fnc_APSTrophyHV;
		};
		case "heavy+": { 
			y_vic spawn DAPS_fnc_APSTrophyHVe;
		};
		default { 
			hint "addADS error";
		};
	};
};

*/
