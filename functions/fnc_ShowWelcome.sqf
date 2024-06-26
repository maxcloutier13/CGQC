#include "\CGQC\script_component.hpp"
// --- welcome ----------------------------------------------------------
// Prep un message de bienvenue semi-random
LOG("[showWelcome] - started");

cgqc_welcome_pic = "";
_cgqc_welcome = "";
_cgqc_message = "";
// Welcome screen avec la patch et le message random
if (cgqc_setting_show_welcome) then {
	LOG("[showWelcome] - is true: Showing");
	if(cgqc_player_known) then {
		LOG("[showWelcome] - player is known");
		_welcome_list = ["What's good", "Howdy", "Hiya", "Wassup", "Yo", "R’gard", "Allo", "Hello", "Ooooh",
						"Coucou", "Bonsoir", "Konnichiwa", "Hola", "Hallo", "Nǐ hǎo", "Hoi", "Merhaba", "Vitayu"];
		_message_list = [
			"what's up?", "what's up buddy?", "Time to fuck shit up",
			"Asti que t'es beau", "Ça roule ma poule?", "As-tu couché ta blonde?",
			"BAN dans 3,2,1...", "What's cookin'?", "Wassup homie?", "Greetings and salutations!"
		];
		_cgqc_welcome = selectRandom _welcome_list;
		_cgqc_message = selectRandom _message_list;
		waitUntil {cgqc_player_patch_found};
		LOG("[showWelcome] - CGQC player");
		cgqc_welcome_pic = format["<img size= '3' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\%1.paa'/>", cgqc_player_patch];
		//cgqc_welcome_pic = format["<img size= '4' style='vertical-align:bottom' shadow='false' align='right' image='\cgqc\patches\%1.paa'/>", cgqc_player_patch];
		//cgqc_welcome_message = format["<t size='2' >%1 %2!</t><br/><t>%3</t>", _cgqc_welcome, cgqc_player_steamName, _cgqc_message];
		//cgqc_welcome_message = format [parseText "%1<br /><t font='PuristaBold' size='1.6'>%2</t><br />%3", _cgqc_welcome,cgqc_player_steamName,_cgqc_message];
		cgqc_welcome_message = parseText format["%1<br /><t font='PuristaBold' size='1.6'>%2</t><br />%3", _cgqc_welcome ,cgqc_player_steamName,_cgqc_message];
	} else {
		// default text and patch ------------------------------------------------------------------------------------------
		//cgqc_welcome_text = ("<br/>" + "<br/>" + format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", //cgqc_player_name]);
		LOG("[showWelcome] - unknown player");
		cgqc_welcome_text = ("<br/>" + "<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
			"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
			"<br/>" + "<t size='1' >Discord: CGQC.CA</t>");
			[ cgqc_welcome_text, 0, 0, 5, 2 ] spawn BIS_fnc_dynamicText;
	};
	LOG("[showWelcome] - waiting for intro to finish");
	waitUntil {cgqc_intro_done};
	LOG("[showWelcome] - intro finished");
	if (cgqc_intro_skipped) then {
		sleep 15;
	} else{
		sleep 10;
	};

	if (cgqc_player_known) then {
		LOG("[showWelcome] - Known player popup on the side");
		// Image in small at right of screen
		[ cgqc_welcome_pic, 1, 0.8, 6, 2 ] spawn BIS_fnc_dynamicText;
		sleep 1;
		// Welcome msg as textTiles
		[cgqc_welcome_message, [1.35,1,1,1], nil, 4, [3,3], 0] spawn BIS_fnc_textTiles;
	} else {
		LOG("[showWelcome] - Unknown player popup fullscreen");
		//Big popup middle of screen
		[ cgqc_welcome_text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
	};
};

cgqc_welcome_done = true;
LOG("[showWelcome] - done");