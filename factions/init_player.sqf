hint "Autorank running";
sleep 10;
_name = name player;
_prefix = _name select[0, 4];
_unknown = 0;
switch (_prefix)
do
{
	case "Sdt.":
	{
		player setRank "PRIVATE";
		hint "Soldat";
	};
	case "Cpl.":
	{
		player setRank "CORPORAL";
		hint "Caporal";
	};
	case "CplC":
	{
		player setRank "CORPORAL";
		hint "Caporal-Chef";
	};
	case "Sgt.":
	{
		player setRank "SERGEANT";
		hint "Sergeant";
	};
	case "Adju":
	{
		player setRank "SERGEANT";
		hint "Adjudent";
	};
	case "SLt.":
	{
		player setRank "LIEUTENANT";
		hint "Sous-Lieutenant";
	};
	case "Lt. ":
	{
		player setRank "LIEUTENANT";
		hint "Lieutenant";
	};
	case "Capt":
	{
		player setRank "CAPTAIN";
		hint "Capitaine";
	};
	case "Maj.":
	{
		player setRank "MAJOR";
		hint "Major";
	};
	case "LCol":
	{
		player setRank "COLONEL";
		hint "Lieutenant-Colonel";
	};
	case "Col.":
	{
		player setRank "COLONEL";
		hint "Colonel";
	};
	default
	{
		_unknown = 1;
		player setRank "PRIVATE";
		_text = ("<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >discord.gg/RCyRKWVG</t>");
		[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
		sleep 6;
	};
};

// random welcome
_welcome_list = ["Yo", "Hello", "Ooooh"];
_message_list = ["what's up?", "what's up buddy?", "Time to fuck shit up", "Asti que t'es beau"];
_welcome = selectRandom _welcome_list;
_message = selectRandom _message_list;

// default text and patch ------------------------------------------------------------------------------------------
_text = (format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", _name]);
if (_unknown == 0) then {
	// default patch pour les joueurs qui en ont pas de custom
	[ player, "cgqc_patch_logo" ] call BIS_fnc_setUnitInsignia;
} else {
	// Patch pour les outsiders
	[ player, "cgqc_patch_outsider" ] call BIS_fnc_setUnitInsignia;
};

// Assign patch based on name  ------------------------------------------------------------------------------------
sleep 2;
if ((_name find["Audi", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_audi.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Audi!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_audi" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Braddock", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_braddock.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Mafia!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_braddock" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Cloutier", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\cgqc_patch_cloutier.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Cloutier!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_cloutier" ] call BIS_fnc_setUnitInsignia;
	player addItemToVest "murshun_cigs_lighter";
	player addItemToVest "murshun_cigs_cigpack";
	player addItemToVest "immersion_cigs_cigar0_nv";
	player addItemToBackpack "UK3CB_H_Woolhat_KHK";
	player addItemToBackpack "rhsusf_m112_mag";
};

if ((_name find["Comeau", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_comeau.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Comeau!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_comeau" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Fortin", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_fortin.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Dogo!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_fortin" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Frechette", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_frechette.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Frechette!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_frechette" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Genest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_genest.paa'/>" +
	"<br/>" + format["<t size='2' >%1 ptit Beurre!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_genest" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Laforest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_laforest.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Frog!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_laforest" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Pinard", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_pinard.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Pinard!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_pinard" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Tremblay", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_tremblay.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Tremblay!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_tremblay" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Villeneuve", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_villeneuve.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Logic!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_villeneuve" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Woods", 0]) > 0) then {
	hint "woods?";
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_woods.paa'/>" +
	"<br/>" + format["<t size='2' >%1 XiPoWnZX!</t><br/><t>%2</t>", _welcome, _message]);
	[ player, "cgqc_patch_woods" ] call BIS_fnc_setUnitInsignia;
};

// Show text and patch ------------------------------------------------------------------------------------
[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
// sleep a bit before going out
sleep 4;