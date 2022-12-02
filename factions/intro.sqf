// Show intro info ------------------------------------------------------------------------------------
[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	if (cgqc_config_showIntro) then 
	{
		waitUntil {time > 1};
		sleep 4;
		_text = (
		"<img size= '8' style='vertical-align:middle' shadow='false' image='textures\CGQC.paa'/>" +
		"<br/>" +
		"<t size='2' >%1</t><br /><t size = '1'>%2</t>"
		);
		//Pop le logo et le texte
		_text = format [_text, cgqc_config_mission_name, cgqc_config_author];
		[_text, 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
		sleep 6;
	};
};
