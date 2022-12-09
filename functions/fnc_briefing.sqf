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
true