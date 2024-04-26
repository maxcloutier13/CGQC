_condition = {
    true
};
_statement = {
    params ["_target", "_player", "_params"];
    LOG_("_statement [%1, %2, %3]", _target, _player, _params);

    // Run on hover:
    hint "Teleport behind player";
   // ["ace_common_displayTextStructured", ["Ya gonna get yeeted brah", 1.5, _target], [_target]] call CBA_fnc_targetEvent;
};
_insertChildren = {
    params ["_target", "_player", "_params"];
    //hint format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
    {
		if (_x != player) then {
			tp_playerName = name _x;
			tp_player = _x;
			private _childStatement = {hint format ["TP to %1", tp_playerName];["tp", 0, tp_player] spawn CGQC_fnc_perksZeus;};
			private _action = [format ["%1",tp_playerName], tp_playerName, "", _childStatement, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
			_actions pushBack [_action, [], _target]; // New action, it's children, and the action's target
		};

    } forEach [] call CGQC_int_allHumanPlayers;

    _actions
};
_modifierFunc = {
    params ["_target", "_player", "_params", "_actionData"];

    // Modify the action - index 1 is the display name, 2 is the icon...
    _actionData set [1, "Teleport to Player"];
};
_action = [ "menu_self_zeus_telport", "?", "", _statement,_condition,_insertChildren,[123],"",4,[false, false, false, true, false], _modifierFunc] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_players"], _action ] call ace_interact_menu_fnc_addActionToObject;
