// --- lockChannels ----------------------------------------------------------
// Lock some of the comms channels

/*

param ["_type"];

if (cgqc_config_hide_channels) then {
	switch (_type)
	do{
		case "init": { //Locks everything but Global. For debug on logon mostly.
			hint "Start: Locking all but Global";
			0 enableChannel true; //Global
			1 enableChannel false;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
			sleep 3;
			hintSilent "";
		};
		case "high": { //High Command/Comms unit - Vehicle for personal + Side for sharing
			hint "Locking Global/Command/Group";
			0 enableChannel false; //Global
			1 enableChannel true;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
			sleep 3;
			hintSilent "";
		};
		case "low": {  //Normal units - Vehicle ONLY. 
			hint "Locking All Channels";
			0 enableChannel false; //Global
			1 enableChannel false;	//Side
			2 enableChannel false;	//Command
			3 enableChannel false;	//Group
			4 enableChannel false; //Vehicle
			sleep 3;
			hintSilent "";
		};
	};
} else {
	0 enableChannel true; //Global
	1 enableChannel true;	//Side
	2 enableChannel true;	//Command
	3 enableChannel true;	//Group
	4 enableChannel true; //Vehicle
};



*/