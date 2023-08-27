// --- loadDiary ----------------------------------------------------------
// Post group info in default briefing
diag_log "[CGQC_FNC] loadDiary started";

// CGQC Links
_text = (
	"<font size='22' color='#00CA1B'Rejoignez-nous!</font>" +"<br/>" +
	"<font size='20' color='#BDBDBD'>Discord: cgqc.ca/</font>"+"<br/>" +
	"<font size='20' color='#BDBDBD'>Teamspeak: ts.cgqc.ca</font>"
);
player createDiaryRecord ["Diary", ["CGQC Info", _text]];

// Radio reference
_text = (
	"<font size='20' color='#f2f2f2'>Référence Radios</font>" +"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='18' color='#f2f2f2'>Short-Range - 343</font>" +"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 1 - Spartan 1</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 2 - Spartan 2</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 3 - Spartan 3</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 4 - HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 5+ - Libres</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='18' color='#f2f2f2'>Long-Range - 152</font>" +"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 1 - Spartan/HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 2 - Support/HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 3 - Griffon</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 4 - Centaure</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 5 - Recon</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 6 - Convoy 1</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 7 - Convoy 2</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 8 - Libre</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 9 - Zeus</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"
);
player createDiaryRecord ["Diary", ["Référence Radios", _text]];

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

diag_log "[CGQC_FNC] loadDiary done";
true