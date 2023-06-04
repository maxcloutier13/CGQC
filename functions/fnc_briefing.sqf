// --- briefing ----------------------------------------------------------
// Post group info in default briefing

// CGQC Links
_text = (
	"<font size='22' color='#00CA1B'Rejoignez-nous!</font>" +"<br/>" +
	"<font size='20' color='#BDBDBD'>Discord: cgqc.ca/</font>"+"<br/>" +
	"<font size='20' color='#BDBDBD'>Teamspeak: ts.cgqc.ca</font>"
);
player createDiaryRecord ["Diary", ["CGQC", _text]];

// Radio reference
_text = (
	"<font size='20' color='#f2f2f2'Référence Radios</font>" +"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 1 - Spartan/HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 2 - Griffon/HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 3 - Centaure/HQ</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 4 - Inter/Spartan</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 5 - Inter/Griffon</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 6 - Inter/Centaure</font>"+"<br/>" +
	"<font size='16' color='#BDBDBD'>Channel 7 - Inter/Recon</font>"+"<br/>" +
	"<font size='20' color='#545454'>---------------------------------</font>"
);
player createDiaryRecord ["Diary", ["Référence Radios", _text]];

// Training map
_mis = player createDiaryRecord ["Diary", ["Training Map","
	Training Map
	<br/>
	Changer de Map<br/>
	Tout les joueurs peuvent changer de map de façon random en retournant dans le lobby. Quand tout les joueurs sont dans le lobby une nouvelle map sera sélectionnée.<br/>
	Admins<br/>
	Une fois #login, tapez #MISSION et le nom de la mission.<br/>
	Ex: #MISSION training_2023.Altis<br/>
	**Maps disponibles**<br/>
	training_2023.Altis<br/>
	training_2023.bozcaada<br/>
	training_2023.Chernarus_Winter<br/>
	training_2023.dagger_island_summer<br/>
	training_2023.Malden<br/>
	training_2023.sara<br/>
	training_2023.swv_public_novogorsk_map<br/>
	training_2023.takistan<br/>
	training_2023.Tanoa<br/>
"]];
true