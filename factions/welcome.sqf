if(cgqc_player_known) then {
	_welcome_list = ["Yo", "R’gard", "Allo", "Hello", "Ooooh", "Coucou", "Bonsoir", "Konnichiwa"];
	_message_list = [
		"what's up?", "what's up buddy?", "Time to fuck shit up", 
		"Asti que t'es beau", "Ça roule ma poule?", "As-tu couché ta blonde?", 
		"BAN dans 3,2,1...", "Prêt à répandre la démocratie dans l'monde?"
	];
	cgqc_welcome = selectRandom _welcome_list;
	cgqc_message = selectRandom _message_list;
} else {
	// default text and patch ------------------------------------------------------------------------------------------
	cgqc_welcome_text = (format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", cgqc_player_name]);
};

