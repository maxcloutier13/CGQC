// --- setGroupRadios ----------------------------------------------------------
// Set radio setups depending on role
params [];
diag_log format ["[CGQC_FNC] setGroupRadios started"];

// Set default 343 channel for group
_ch = 0;
switch (groupid cgqc_player_group) do {
case "Spartan-1": {_ch = 1;};
case "Spartan-2": {_ch = 2;};
case "Spartan-3": {_ch = 3;};
case "Spartan-4": {_ch = 4;};
case "Trident-1": {_ch = 5;};
case "Trident-2": {_ch = 6;};
case "Trident-3": {_ch = 7;};
case "Trident-4": {_ch = 8;};
case "Hermes";
case "Orion-1";
case "Orion-2";
case "Recon": {_ch = 9;};
case "Centaure-1";
case "Centaure-2";
case "Centaure-3";
case "Griffon-1";
case "Griffon-2";
case "Griffon-3";
case "Pegase-1";
case "Pegase-2";
case "Pegase-3";
case "Supports": {_ch = 10;};
case "HQ": {_ch = 16;};
default {_ch = 1;};
};
// Find 343
_personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;
// Set channel
[_personalRadio, _ch] call acre_api_fnc_setRadioChannel;

diag_log "[CGQC_FNC] setRadios done";