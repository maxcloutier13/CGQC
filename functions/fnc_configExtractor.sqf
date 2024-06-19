/*--------------------------------------------------------------------------------------------
	Extracts a whole config class to the Windows clipboard
	It includes every entry in that class plus every subclass (and sub-sub-etc-class) all the way back to the root
	The entries are left in the same order that they are in the config, with ones from parent classes added later, so
	 that the most derived entries are at the top
	The output is formatted as standard ArmA cpp (instead of bin or sqf), so you should hopefully be able to just paste
	 it in a config file without problems

	Don't use this script on huge root classes like CfgVehicles / CfgWeapons, it will never finish

	The parameter can be either the config class to extract, or an array:
	0: Config (Class to extract)
	1: Bool (Add comments indicating which parent class the entries came from, default false)
	2: Bool (Include parent class names in the class definitions, default true)

	Examples:
	(configFile/'CfgWeapons'/'M16A2')               execVM "Scripts\cfgGet.sqf";
	[configFile/'CfgVehicles'/'HMMWV', true]        execVM "Scripts\cfgGet.sqf";
	[configFile/'CfgVehicles'/'HMMWV', true, false] execVM "Scripts\cfgGet.sqf";

	This should work on any ArmA, tested on 2 and 3
	v1.0
	By Kazesim
--------------------------------------------------------------------------------------------*/
params ["_class", ["_addClassLabels", false], ["_addParentClassDefs", true]];
#define DQUOTE 34
#define INC(X) X = X + 1
#define ADD(X, Y) _list set [count _list, [X, Y]]

if not (isClass _class) exitWith {
	hint "Invalid class";
	copyToClipboard "Invalid class"
};

_offset = 0;
_tab = "";

_CRLF = toString [0x0D, 0x0A];
__TAB = toString [0x09];

_getTab = {
	// Update the string containing the current number of tabs
	private ["_c", "_t"];
	_offset = _offset + _class;
	_t = "";
	for "_c" from 1 to _offset do {
		_t = _t + __TAB;
	};
	_tab = _t;
};

_insert = {
	// format: [array, item to insert, index]
	private ["_array", "_index", "_count", "_save", "_last", "_c"];
	_array = _class select 0;
	_index = _class select 2;
	_count = count _array;
	_save = "";
	_last = _class select 1;
	for "_c" from _index to (_count - 1) do {
		_save = _array select _c;
		_array set [_c, _last];
		_last = _save;
	};
	_array set [_count, _last];
};

_formatString = {
	// Re-double-quotes any quotes inside a string
	private ["_c", "_x", "_count"];
	_class = toArray _class;
	_count = count _class;
	for [{
		_c = 0
	}, {
		_c < _count
	}, {
		INC(_c)
	}] do {
	_x = _class select _c;
	if (_x == DQUOTE) then {
		[_class, DQUOTE, _c+1] call _insert;
		INC(_c);
		INC(_count);
	};
};
str toString _class;
};

_formatArray = {
	// switch all the brackets to braces, and add spaces after commas
	private ["_str", "_last"];
	_last = (count _class) - 1;
	_str = "{
		";
		{
			_str = _str + (switch (typeName _x) do {
				case "ARRAY": {
					_x call _formatArray
				};
				case "TEXT": {
					_x call _formatString
				};
				case default {
					str _x
				};
			});
			if (_forEachIndex != _last) then {
				_str = _str + ", "
			};
		} forEach _class;
		_str + "
	}";
};

_scanEntries = {
	private ["_cfg", "_c", "_entry", "_name", "_added", "_str", "_list"];
	_cfg = _class select 0;
	_list = _class select 1;
	_addLabel = _class select 2;
	for "_c" from 0 to ((count _cfg) - 1) do {
		_entry = _cfg select _c;
		_name = configName _entry;
		_added = false;
		{
			if ((_x select 0) == _name) exitWith {
				_added = true
			}
		} forEach _list;
		if (!_added) then {
			// Add the class label comment, if enabled
			if (_addClassLabels and _addLabel) then {
				_str = format ["%1// %2%3", _tab, configName _cfg, _CRLF];
				ADD("", _str);
				_addLabel = false;
			};
			// Add the entry
			_str = "";
			if (isClass _entry) then {
				_str = _entry call _scanCfg;
			} else {
				_str = format ["%1%2%3 = %4;
					%5",
					_tab,
					_name,
					if (isArray _entry) then {
						"[]"
					} else {
						""
					},
					switch (true) do {
						case (isNumber _entry): {
							getNumber _entry
						};
						case (isText _entry): {
							(getText _entry) call _formatString
						};
						case (isArray _entry): {
							(getArray _entry) call _formatArray
						};
					},
					_CRLF
				];
			};
			ADD(_name, _str);
		};
	};
};

_scanCfg = {
	private ["_list", "_tab", "_cfg", "_name", "_count", "_inherit", "_str", "_empty"];
	_list = [];
	0 call _getTab;

	// Add the class name, parent class name, and starting brace
	_cfg = _class;
	_name = configName _cfg;
	_count = count _cfg;
	_inherit = configName inheritsFrom _cfg;
	_empty = _count == 0 and _inherit == "";
	_str = format ["%1class %2%3 {
		%4",
		_tab,
		_name,
		if (_inherit == "" or !_addParentClassDefs) then {
			"";
		} else {
			": " + _inherit;
		},
		if (_empty) then {
			""
		} else {
			_CRLF
		}
	];
	ADD(_name, _str);
	1 call _getTab;

	// get all the entries from this class and every parent class
	if (_count > 0) then {
		[_cfg, _list, false] call _scanEntries
	};
	while { true } do {
		_inherit = inheritsFrom _cfg;
		_inheritName = configName _inherit;
		if (_inheritName == "") exitWith {};// Last class
		_cfg = _inherit;
		[_cfg, _list, _name != _inheritName] call _scanEntries;
	};

	// Add the ending brace
	-1 call _getTab;
	_str = format ["%1
	};
	%2", if (_empty) then {
		""
	} else {
		_tab
	}, _CRLF];
	ADD("", _str);

	// Concat the string and return it
	_str = "";
	{
		_str = _str + (_x select 1)
	} forEach _list;
	_str;
};

hint "Running...";
copyToClipboard (_class call _scanCfg);
hint "Done";