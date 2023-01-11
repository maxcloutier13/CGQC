waitUntil {!isNil "cgqc_postInitClient_done"};
waitUntil {cgqc_postInitClient_done};
['chill', false] spawn CGQC_fnc_perksBasic;
sleep 5;
["radio_sides"] execVM "\cgqc\functions\fnc_setRadios.sqf";
