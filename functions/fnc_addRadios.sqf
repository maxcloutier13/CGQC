#include "\CGQC\script_component.hpp"
// --- addRadios ----------------------------------------------------------
// Add specific radios to player and sets things up
params ["_radios"];
LOG_1("[addRadios] %1 started", _radios);
{
	if (_x isEqualTo "ACRE_PRC117F") then {
		LOG("[addRadios] Adding 117 to pack");
		(backpackContainer ACE_player) addItemCargoGlobal [_x, 1];
	} else {
		LOG_1("[addRadios] Adding %1 to uniform", _x);
		(uniformContainer ACE_player) addItemCargoGlobal [_x, 1];
	};
	if (_x isEqualTo "ACRE_PRC148" && isNil "cgqc_event_148") then {
		cgqc_event_148 = ["acre_startedSpeaking", {
			params ["_unit", "_onRadio", "_radioId", "_speakingType"];
			if (_onRadio) then {
				if(_radioId find "148" > -1) then {
					y_channel = [] call acre_api_fnc_getCurrentRadioChannelNumber;
					if(y_channel == 1) then {
						_channel_txt = parseText( "<br/><br/><br/><br/><br/>148:Ch1 = Listen Only" + "<br/>" + "Change channel to communicate!");
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

LOG("[addRadios] done");