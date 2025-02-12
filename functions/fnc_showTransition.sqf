#include "\CGQC\script_component.hpp"
// --- showTransition ----------------------------------------------------------
// Black fadout/in with some information in some cases
params ["_type", ["_show", true]];
LOG_2("[showTransition] %1/%2 started", _type, _show);

cgqc_mk3_transition = true;
_text = "";
_text_insert = "";
_sleep = 1;
if (!cgqc_intro_running && cgqc_setting_show_transition && _show) then {
    // Fade to black
    cutText ["", "BLACK", 1e-6];
    titleText ["", "PLAIN"];
    switch (_type) do {
        case "role":{
            LOG_1("[showTransition] RoleswitchDone:%1?", cgqc_roleSwitch_done);
            LOG("[showTransition] Proceeding");
            sleep 2;
            _text_insert = player getVariable "cgqc_player_role";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >%1</t><br/>");
            // Find traits
            _check_trait_medic = ["Medic", player getUnitTrait "Medic"];
            _check_trait_eng = ["Engineer", player getUnitTrait "Engineer"];
            _check_trait_eod = ["EOD", player getUnitTrait "ExplosiveSpecialist"];
            _found_traits = [];
            _check_traits = "Traits: ";
            _list_traits = [_check_trait_medic,_check_trait_eng,_check_trait_eod];

            _check_hq = ["HQ", cgqc_perks_hq];
            _check_sl = ["SL", cgqc_perks_sl];
            _check_tl = ["TL", cgqc_perks_tl];
            _check_recon = ["Recon", cgqc_perks_recon];
            _check_diver = ["Diver", cgqc_perks_diver];
            _check_para = ["Para", cgqc_perks_para];
            _check_driver = ["Driver", cgqc_perks_diver];
            _check_pilot = ["Pilot", cgqc_perks_pilot];
            _list_perks = [_check_hq, _check_sl, _check_tl, _check_recon, _check_diver, _check_para, _check_pilot, _check_driver];

            // Find player's traits
            {
                if(_x select 1) then {
                    _found_traits pushBack (_x select 0);
                };
            } forEach _list_traits;
            // Find player's perks
            {
                if(_x select 1) then {
                    _found_traits pushBack (_x select 0);
                };
            } forEach _list_perks;

            if (count _found_traits >0) then {
                {
                    _check_traits = _check_traits + "/" + _x;
                } forEach _found_traits;
            }else{
                _check_traits = _check_traits + "Basic";
            };

            sleep 0.5;
            // Weight and load stuff ----------------------------------------------------------------------
            _maxLoad = ((maxLoad player)*0.1)/2.2;
            _check_maxLoad = parseNumber (_maxLoad toFixed 1);
            _currentLoad = ((loadAbs player)*0.1)/2.2;
            _currentLoadKg = parseNumber (_currentLoad toFixed 1);
            _check_currentLoad = "";
            _load_desc = "";

            switch (true) do {
                case (_currentLoadKg > 40) : {
                    _check_currentLoad = format["<t color='#ff0000'>%1</t>", _currentLoadKg];
                    _load_desc = "heavy";

                };
                case (_currentLoadKg > 35) : {
                    _check_currentLoad = format["<t color='#FF5700'>%1</t>", _currentLoadKg];
                    _load_desc = "medium+++";

                };
                case (_currentLoadKg > 32) : {
                    _check_currentLoad = format["<t color='#FF8300'>%1</t>", _currentLoadKg];
                    _load_desc = "medium+";

                };
                case (_currentLoadKg > 30) : {
                    _check_currentLoad = format["<t color='#F8FF00'>%1</t>", _currentLoadKg];
                    _load_desc = "medium";

                };
                case (_currentLoadKg > 27) : {
                    _check_currentLoad = format["<t color='#CCFF00'>%1</t>", _currentLoadKg];
                    _load_desc = "light+";

                };
                case (_currentLoadKg > 0) : {
                    _check_currentLoad = format["<t color='#00FF0F'>%1</t>", _currentLoadKg];
                    _load_desc = "light";

                };
            };

            // Show traits
            _text = _text + format ["%1<br/>", _check_traits];
            // Show weight
            _text = _text + format ["Loadout weight: %1kg (%2)<br/>", _check_currentLoad, _load_desc];

        };
        case "camo":{
            _text_insert = format ["camo %1", _type];
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Changement de %1</t><br/>");
            _sleep = 0;
        };
        case "diver":{
            _text_insert = "Plongeur";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Kit: %1</t><br/>");

        };
        case "para":{
            _text_insert = "Parachutiste";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Kit: %1</t><br/>");

        };
        case "landnav":{
            _text_insert = "Orientation";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >%1</t><br/>" + "Find the Flag!");

        };
    };
    //Pop le texte
    _text = format [_text, _text_insert];
    [_text, 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
    sleep _sleep;

    // Wake up with blur
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    cutText ["", "BLACK IN", 2];
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 2;
    cgqc_mk3_transition = false;
};

LOG("[showTransition] done");
