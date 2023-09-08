// --- lockChannels ----------------------------------------------------------
// Lock some of the comms channels
params ["_type"];
diag_log format ["[CGQC_FNC] lockChannels %1 started", _type];

if (cgqc_config_hide_channels) then {
	0 enableChannel false; //Global
	1 enableChannel false;	//Side
	2 enableChannel false;	//Command
	3 enableChannel false;	//Group
	4 enableChannel false; //Vehicle
} else {
	switch (_type) do {
		case "globside": { //Lock all but global and side, for simplicity
			0 enableChannel true; //Global
			1 enableChannel true;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
		};
		case "init": { //Locks everything but Global. For debug on logon mostly.
			0 enableChannel true; //Global
			1 enableChannel false;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
		};
		case "high": { //High Command/Comms unit - Vehicle for personal + Side for sharing
			0 enableChannel false; //Global
			1 enableChannel true;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
		};
		case "low": {  //Normal units - Vehicle ONLY.
			0 enableChannel false; //Global
			1 enableChannel false;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
		};
		case "reset": {
			0 enableChannel true; //Global
		1 enableChannel true;	//Side
		2 enableChannel true;	//Command
		3 enableChannel true;	//Group
		4 enableChannel true; //Vehicle
		};
	};
};


diag_log "[CGQC_FNC] lockChannels done";