params ["_unit","_bodyPart"];

private _targetHP = ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] find toLower _bodyPart;

private _bloodLossOnBodyPart = 0;

{
    _x params ["", "", "_bodyPartN", "_amountOf", "_percentageOpen"];

    if (_bodyPartN == _targetHP) then {
        _bloodLossOnBodyPart = _bloodLossOnBodyPart + (_amountOf * _percentageOpen);
    };
} forEach (_unit getVariable [QEGVAR(medical,openWounds), []]);

_bloodLossOnBodyPart > 0