// --- addRadios ----------------------------------------------------------
// Add specific radios to player and sets things up
params ["_radios"];
diag_log format ["[CGQC_FNC] addRadios %1 started", _radios];
{
	(uniformContainer ACE_player) addItemCargoGlobal [_x, 1];
	waitUntil {sleep 0.5; [ACE_player, _x] call acre_api_fnc_hasKindOfRadio;};
	if (_x isEqualTo "ACRE_PRC148" && isNil "cgqc_event_148") then {
		cgqc_event_148 = ["acre_startedSpeaking", {   
			params ["_unit", "_onRadio", "_radioId", "_speakingType"];   
			if (_onRadio) then {  
				if(_radioId find "148" > -1) then {
					y_channel = [] call acre_api_fnc_getCurrentRadioChannelNumber;
					if(y_channel == 1) then {
						_channel_txt = parseText( "148:Ch1 = Listen Only" + "<br/>" + "Change channel to communicate!");
						[ _channel_txt, 0, 0, 3, 1 ] spawn BIS_fnc_dynamicText;
					}; 
				};  
			};  
		}] call CBA_fnc_addEventHandler;
	} else {
		// Delete 148 event in case it exists
		if(!isNil "cgqc_event_148") then {
			["acre_startedSpeaking", cgqc_event_148] call CBA_fnc_removeEventHandler;
		};
	};
}forEach _radios;

diag_log "[CGQC_FNC] addRadios done";