// --- inspectSort ----------------------------------------------------------
// Sort mags and throwables

_allMags = _this select 0;
_gunMags = _this select 1;
_throwables = _this select 2;
_txt = _this select 3; 

_seen = [];
{
	_itemClassName = _x;
	_displayName = (getText (configFile >> 'CfgMagazines' >> _itemClassName >> 'displayName'));
	if (!(_itemClassName in _seen) && (_itemClassName call BIS_fnc_isThrowable)) then
	{
		_seen pushBack _itemClassName;
		_throwables pushBack [_displayName]; 
	};
	if (!(_itemClassName in _seen) && !(_itemClassName call BIS_fnc_isThrowable)) then
	{
		_seen pushBack _itemClassName;
		_gunMags pushBack [_displayName]; 
	};
} forEach _allMags;
// Sort in case
_gunMags sort true;
_throwables sort true;

// Add to  text 
if (count _gunMags > 0) then {
	{
		_item = _x;
		_count = {_x isEqualTo _item } count _allMags;
		_txt = _txt + format ["%1 - %2<br/>", _item, _count];
	} forEach _gunMags;
}else{
	// No items?
	_txt = _txt + "- No Mags - <br/>";
};
if (count _throwables > 0) then {
	{
		_item = _x;
		_count = {_x isEqualTo _item } count _allMags;
		_txt = _txt + format ["%1 - %2<br/>", _item, _count];
	} forEach _throwables;
}else{
	// No items?
	_txt = _txt + "- No Throwables - <br/>";
};