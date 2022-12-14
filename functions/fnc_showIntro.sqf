// --- showIntro ----------------------------------------------------------
// Show intro on load
_type = _this select 0;

// Show intro info ------------------------------------------------------------------------------------
[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	if (cgqc_config_showIntro) then {
		if (cgqc_config_author find "Cpl. Quelque chose" != 0) then {
			cgqc_intro_running = true;
			ace_hearing_disableVolumeUpdate = true;
			0 fadeSound 0;
			disableUserInput true;
			// Start with a silent black screen.
			titleCut ["", "BLACK FADED", 999];
			sleep 2;
			_text = (
				"<img size= '8' style='vertical-align:middle' shadow='false' image='\cgqc\textures\CGQC.paa'/>" +
				"<br/>" +
				"<t size='2' >%1</t><br /><t size = '1'>par %2</t>"
			);
			//Pop le logo et le texte
			_text = format [_text, cgqc_config_mission_name, cgqc_config_author];
			[_text, 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
			// Fade from black, to blur, to clear as text types.
			10 fadeSound 1;
			sleep 3;
			disableUserInput false;
			"dynamicBlur" ppEffectEnable true;   
			"dynamicBlur" ppEffectAdjust [3];   
			"dynamicBlur" ppEffectCommit 0;     
			"dynamicBlur" ppEffectAdjust [0.0];  
			"dynamicBlur" ppEffectCommit 5;  
			titleCut ["", "BLACK IN", 10];
			sleep 10;
			cgqc_intro_running = false;
			ace_hearing_disableVolumeUpdate = false;
		};	
	};
};

