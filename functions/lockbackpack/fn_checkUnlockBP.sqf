/*
 * Author: diwako
 * Check if unit can have backpack locked status after inventory change
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [bob] call diwako_lockbackpack_fnc_checkUnlockBP
 *
 * Public: No
 */
params ["_unit"];

if ((_unit getVariable ["diwako_lockbackpack_locked",false]) && {isNull (unitBackpack _unit)} ) then {
  _unit setVariable ["diwako_lockbackpack_locked", false, true];
  if !(isNil "ace_common_fnc_displayTextStructured") then {
    [{["Backpack lock removed"] call ace_common_fnc_displayTextStructured;}, []] call CBA_fnc_execNextFrame;
  } else {
    hint "Backpack lock removed";
  };
};