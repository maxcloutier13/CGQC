#include "\CGQC\script_component.hpp"
// --- loadDiary ----------------------------------------------------------
// Post group info in default briefing
LOG("[loadDiary] started");

waitUntil {CGQC_playerLoaded};

// CGQC Info -------------------------------------------------------------------------------
player createDiarySubject ["CGQC","CGQC"];
// CGQC Links
_text = (
	"<font size='22' color='#00CA1B'Rejoignez-nous!</font>" +"<br/>" +
	"<font size='20' color='#BDBDBD'>Discord: cgqc.ca</font>"+"<br/>" +
	"<font size='20' color='#BDBDBD'>Teamspeak: ts.cgqc.ca</font>"
);
player createDiaryRecord ["CGQC", ["Group Info", _text]];

// Map Options -------------------------------------------------------------------------------
player createDiarySubject ["MapOption","Map Options"];
_text = (
	"Click <execute expression='cgqc_map_centerOnplayer = false; cgqc_map_centerOnLast = false;'>NORMAL</execute> to keep default map behavior"
	+ "<br/> Click <execute expression='cgqc_map_centerOnplayer = false;cgqc_map_centerOnLast = true;'>LAST</execute> to keep map centered on last position"
	+ "<br/> Click <execute expression='cgqc_map_centerOnplayer = true;cgqc_map_centerOnLast = false;'>PLAYER</execute> to keep map centered on player."
);
player createDiaryRecord ["MapOption", ["Centering", _text]];

// Radio References -------------------------------------------------------------------------------
_343_1 = "Spartan-1";
_343_2 = "Spartan-2";
_343_3 = "Typhon-1";
_343_4 = "Typhon-2";
_343_5 = "Libre";
_343_6 = "Libre";
_343_7 = "Libre";
_343_8 = "Libre";
_343_9 = "Recon";
_343_10 = "Supports";
_343_11 = "Libres";
_343_15 = "Typhon HQ";
_343_16 = "Spartan HQ";
_152_1 = "Spartan";
_152_2 = "Supports";
_152_3 = "Griffon";
_152_4 = "Centaure";
_152_5 = "Hermes";
_152_98 = "Blue/Green";
_152_99 = "Blue/Red";

if !(isNil "cgqc_player_side") then {
	switch (cgqc_player_side) do {
		case EAST: {
			_343_1 = "Viper-1";
			_343_2 = "Viper-2";
			_343_3 = "Mamba-1";
			_343_4 = "Mamba-2";
			_343_9 = "Recon";
			_343_10 = "Supports";
			_343_11 = "Libres";
			_343_16 = "HQ";
			_152_1 = "Viper";
			_152_2 = "Supports";
			_152_3 = "Valkyrie";
			_152_4 = "Scorpion";
			_152_98 = "Red/Green";
			_152_99 = "Red/Blue";
		};
		case INDEPENDENT: {
			_343_1 = "Bandit-1";
			_343_2 = "Bandit-2";
			_343_3 = "Tango-1";
			_343_4 = "Tango-2";
			_343_9 = "Recon";
			_343_10 = "Supports";
			_343_11 = "Libres";
			_343_16 = "HQ";
			_152_1 = "Bandit";
			_152_2 = "Supports";
			_152_3 = "Flyboyz";
			_152_4 = "Hardshells";
			_152_98 = "Green/Red";
			_152_99 = "Green/Blue";
		};
		default { };
	};
};


// Common channel names
_152_6 = "Convoy 1";
_152_7 = "Convoy 2";
_152_8 = "Libre";
// Common channels
_152_9 = "Zeus";
_152_69 = "Party";
// Radio reference
_text = (
	"<font size='20' color='#f2f2f2'>Référence Radios</font>" +"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='18' color='#f2f2f2'>Short-Range - 343</font>" +"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 1 - %1</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 2 - %2</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 3 - %3</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 4 - %4</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 5 - %5</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 6 - %6</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 7 - %7</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 8 - %8</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 9 - %9</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 10 - %10</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 11+ - %11</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 16 - %12</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='18' color='#f2f2f2'>Long-Range - 152|117f|177|Racks</font>" +"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 1 - %13</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 2 - %14</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 3 - %15</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 4 - %16</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 5 - %17</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 6 - %18</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 7 - %19</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 8 - %20</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='18' color='#f2f2f2'>Common Channels</font>" +"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 9 - %21</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 69 - %22</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 98 - %23</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 99 - %24</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"
);

_cleantext = format [_text, _343_1,_343_2,_343_3,_343_4,_343_5,_343_6,_343_7,_343_8,_343_9,_343_10,_343_11,_343_16,_152_1,_152_2,_152_3,_152_4, _152_5,_152_6,_152_7,_152_8,_152_9,_152_69, _152_98, _152_99];

player createDiaryRecord ["CGQC", ["Référence Radios", _cleantext]];

// Environment Report -------------------------------------------------------------------------------
[] call CGQC_fnc_envReport;


// Training map
/*
_mis = player createDiaryRecord ["Diary", ["Training Map","
	<font size='20'>Changer de Map</font><br/>
	<font size='16'>Tout les joueurs peuvent changer de map de façon random en retournant dans le lobby. Quand tout les joueurs sont dans le lobby une nouvelle map sera sélectionnée.</font><br/>
	<font size='18'><br/>Admins<br/></font>
	<font size='16'>Une fois #login, tapez #MISSION et le nom de la mission.<br/><br/>
	Ex: #MISSION training_2023.Altis<br/></font>
	<font size='18'>**Maps disponibles**</font><br/>
	<font size='16'>- training_2023.Altis<br/>
	- training_2023.bozcaada<br/>
	- training_2023.Chernarus_Winter<br/>
	- training_2023.dagger_island_summer<br/>
	- training_2023.Malden<br/>
	- training_2023.sara<br/>
	- training_2023.swv_public_novogorsk_map<br/>
	- training_2023.takistan<br/>
	- training_2023.Tanoa<br/></font>
"]];*/

//player createDiarySubject ["MapTools","Map Tools"];
_text = (
	"-- Simple Map Markings --"
	+ "<br/><Click the type you want to use and then click on desired position on map"
	+ "<br/><Some tools stay on to mark multiple locatoins. Shift+Click to stop"
	+ "<br/><br/><execute expression='[10] spawn CGQC_fnc_mapTools;'>HQ</execute>  | <execute expression='[11] spawn CGQC_fnc_mapTools;'>Objective</execute>"
	+ "<br/><br/>-- Positions --"
	+ "<br/><execute expression='[20] spawn CGQC_fnc_mapTools;'>Landing Zone</execute> | <execute expression='[201] spawn CGQC_fnc_mapTools;'>Observation Point</execute>"
	+ "<br/><execute expression='[203] spawn CGQC_fnc_mapTools;'>Support by Fire</execute> | <execute expression='[204] spawn CGQC_fnc_mapTools;'>Assault Position</execute>"
	+ "<br/><execute expression='[22] spawn CGQC_fnc_mapTools;'>Supplies</execute>"
	+ "<br/><br/>-- Routes --"
	+ "<br/><execute expression='[202] spawn CGQC_fnc_mapTools;'>Phase Line</execute> | <execute expression='[2021] spawn CGQC_fnc_mapTools;'>Limit of Advance</execute>"
	+ "<br/><execute expression='[12] spawn CGQC_fnc_mapTools;'>Initial Rally Point</execute> | <execute expression='[121] spawn CGQC_fnc_mapTools;'>Waypoints</execute> | <execute expression='[13] spawn CGQC_fnc_mapTools;'>Rally points</execute> | <execute expression='[14] spawn CGQC_fnc_mapTools;'>Objective Rally Point</execute>"
	+ "<br/><execute expression='[15] spawn CGQC_fnc_mapTools;'>Near-side Rally Point</execute> | <execute expression='[16] spawn CGQC_fnc_mapTools;'>Far-side Rally Point</execute>"
	+ "<br/><execute expression='[17] spawn CGQC_fnc_mapTools;'>Convoy Starting Point</execute> | <execute expression='[18] spawn CGQC_fnc_mapTools;'>Convoy Rally Point</execute> | <execute expression='[19] spawn CGQC_fnc_mapTools;'>Dismount Point</execute>"
	+ "<br/><execute expression='[21] spawn CGQC_fnc_mapTools;'>Route</execute> | <execute expression='[23] spawn CGQC_fnc_mapTools;'>City</execute> | <execute expression='[24] spawn CGQC_fnc_mapTools;'>House</execute>"
	+ "<br/><br/>-- Ennemy Positions --"
	+ "<br/><execute expression='[30] spawn CGQC_fnc_mapTools;'>Infantry</execute> | <execute expression='[301] spawn CGQC_fnc_mapTools;'>Unknown</execute> | <execute expression='[302] spawn CGQC_fnc_mapTools;'>Static Weapon</execute> | <execute expression='[3021] spawn CGQC_fnc_mapTools;'>Unarmed Vehicle</execute>"
	+ "<br/><execute expression='[303] spawn CGQC_fnc_mapTools;'>IFV/APC</execute> | <execute expression='[304] spawn CGQC_fnc_mapTools;'>Tank</execute> | <execute expression='[305] spawn CGQC_fnc_mapTools;'>Helicopter</execute> | <execute expression='[306] spawn CGQC_fnc_mapTools;'>Plane</execute>"
	+ "<br/><execute expression='[307] spawn CGQC_fnc_mapTools;'>Bunker</execute> | <execute expression='[3071] spawn CGQC_fnc_mapTools;'>Roadblock</execute> | <execute expression='[308] spawn CGQC_fnc_mapTools;'>HQ</execute>"
	+ "<br/><br/>-- Advanced Map Tools --"
	+ "<br/>Click <execute expression='[0] spawn CGQC_fnc_mapTools;'>Mortar Tool</execute> and then click on target"
	+ "<br/>Click <execute expression='[1] spawn CGQC_fnc_mapTools;'>Precise Route Planner</execute> and then click on starting point"
);
player createDiaryRecord ["MapOption", ["Maptools", _text]];

LOG("[loadDiary] done");
true