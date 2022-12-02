if (cgqc_player_known) then {
	if ((_name find["Audi", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_audi.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Audi!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_audi";
	};

	if ((_name find["Braddock", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_braddock.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Mafia!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_braddock";
	};

	if ((_name find["Cloutier", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\cgqc_patch_cloutier.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Cloutier!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_cloutier";
		#include "init_cloutier.sqf"
	};

	if ((_name find["Comeau", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_comeau.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Comeau!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_comeau";
	};

	if ((_name find["Fortin", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_fortin.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Dogo!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_fortin";
	};

	if ((_name find["Frechette", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_frechette.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Frechette!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_frechette";
	};

	if ((_name find["Genest", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_genest.paa'/>" +
		"<br/>" + format["<t size='2' >%1 ptit Beurre!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_genest";
	};

	if ((_name find["Laforest", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_laforest.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Frog!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_laforest";
		
	};

	if ((_name find["Pinard", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_pinard.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Pinard!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_pinard";
	};

	if ((_name find["Tremblay", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_tremblay.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Tremblay!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_tremblay";
	};

	if ((_name find["Villeneuve", 0]) > 0) then {
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_villeneuve.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Logic!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_villeneuve";
	};

	if ((_name find["Woods", 0]) > 0) then {
		hint "woods?";
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_woods.paa'/>" +
		"<br/>" + format["<t size='2' >%1 XiPoWnZX!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_woods";
	};

	if ((_name find["Melo", 0]) > 0) then {
		hint "woods?";
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_monolith_2.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Melo!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_monolith_2";
	};

	if ((_name find["Turcotte", 0]) > 0) then {
		hint "woods?";
		_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_turcotte.paa'/>" +
		"<br/>" + format["<t size='2' >%1 Dewark!</t><br/><t>%2</t>", _welcome, _message]);
		player_patch = "cgqc_patch_turcotte";
	};
};