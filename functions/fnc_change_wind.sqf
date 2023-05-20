_type = _this select 0;
//hintc format["%1", _type];

_e_side = selectRandom [-1,1];
_n_side = selectRandom [-1,1];

switch (_type) do {
	case "low": {
		w_east = floor random [0,2,4];
		w_north = floor random [0,2,4];
        break;
	};
	case "med": {
		w_east = floor random [5,7.5,10];
		w_north = floor random [5,7.5,10];
        break;
	};
	case "hi": {
		w_east = floor random [10,15,20];
		w_north = floor random [10,15,20];
        break;
	};
	case "random": {
		w_east = floor (random [0,20,35]);
		w_north = floor (random [0,20,35]);
        break;
	};
	default {
		hint "change_wind fail!"
	};
};
setWind [w_east * _e_side, w_north * _n_side, true];