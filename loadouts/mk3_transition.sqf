_type = _this select 0;
_show = _this select 1;
cgqc_mk3_transition = true;
//hintc format ["TransitionType:%1", _type];sleep 1;
_text = "";
_text_insert = "";
if (cgqc_setting_show_transition && _show) then {
    // Fade to black  
    cutText ["", "BLACK FADED", 999];
    titleText ["", "PLAIN"];
    switch (_type) do {
        case "role":{ 
            _text_insert = cgqc_player_role;
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Role: %1</t><br/>"); 

            // Find traits
            _check_trait_medic = ["Medic", player getUnitTrait "Medic"];
            _check_trait_eng = ["Engineer", player getUnitTrait "Engineer"];
            _check_trait_eod = ["EOD", player getUnitTrait "ExplosiveSpecialist"];
            _found_traits = [];
            _check_traits = "Traits: ";
            _list_traits = [_check_trait_medic,_check_trait_eng,_check_trait_eod];
            {
                if(_x select 1) then {
                    _found_traits pushBack (_x select 0);
                };
            } forEach _list_traits;

            if (count _found_traits >0) then {
                {
                    _check_traits = _check_traits + "/" + _x;
                } forEach _found_traits;
            }else{
                _check_traits = _check_traits + "None";
            };
            
            // Weight and load stuff ----------------------------------------------------------------------
            _maxLoad = ((maxLoad player)*0.1)/2.2;
            _check_maxLoad = parseNumber (_maxLoad toFixed 1);
            _currentLoad = ((loadAbs player)*0.1)/2.2;
            _currentLoadKg = parseNumber (_currentLoad toFixed 1);
            _check_currentLoad_percent = load player; // between 0-1 .. Percentage of fullness
            _check_currentLoad = "";

            switch (true) do {
                case (_check_currentLoad_percent > 0.8) : { 
                    _check_currentLoad = format["<t color='#ff0000'>%1</t>", _currentLoadKg];
                    break;
                };
                case (_check_currentLoad_percent > 0.7) : {
                    _check_currentLoad = format["<t color='#FF5700'>%1</t>", _currentLoadKg];
                    break;
                };
                case (_check_currentLoad_percent > 0.6) : {
                    _check_currentLoad = format["<t color='#F8FF00'>%1</t>", _currentLoadKg];
                    break;
                };
                case (_check_currentLoad_percent > 0) : {
					_check_currentLoad = format["%1", _currentLoadKg];
					break;
				};
            };

            // Show traits 
            _text = _text + format ["Traits: %1<br/>", _check_traits];
            // Show weight
            _text = _text + format ["Loadout weight: %1kg<br/>", _check_currentLoad];
            break;
        };
        case "camo":{ 
            _text_insert = format ["camo %1", _type];
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Changement de %1</t><br/>");
            break;
        };
        case "diver":{
            _text_insert = "Plongeur";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Kit: %1</t><br/>");
            break;
        };
        case "para":{
            _text_insert = "Parachutiste";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >Kit: %1</t><br/>");
            break;
        };
        case "basic_orient":{
            _text_insert = "Orientation";
            _text = ("<br/>" + "<br/>" + "<br/>" +"<t size='2' >%1</t><br/>");
            break;
        };
    };
    //Pop le texte
    _text = format [_text, _text_insert];
    [_text, 0, 0, 3, 2] spawn BIS_fnc_dynamicText;
    sleep 5;
    titleFadeOut 4;
    // Wake up with blur
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    titleCut ["", "BLACK IN", 4];
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 2;
    cgqc_mk3_transition = false;
};

