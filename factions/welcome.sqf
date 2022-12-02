_welcome_list = ["Yo", "R’gard", "Allo", "Hello", "Ooooh", "Coucou", "Bonsoir", "Konnichiwa"];
_message_list = ["what's up?", "what's up buddy?", "Time to fuck shit up", "Asti que t'es beau", 
"Ça roule ma poule?", "As-tu couché ta blonde?", "BAN dans 3,2,1...", "Prêt à répandre la démocratie dans l'monde?"];
_welcome = selectRandom _welcome_list;
_message = selectRandom _message_list;
// default text and patch ------------------------------------------------------------------------------------------
_text = (format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", _name]);

};