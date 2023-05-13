// --- paxInit ----------------------------------------------------------
// Start of the PAX systemChat
_type = _this select 0;
switch (_type) do {
	case "prep_map": {
		cgqc_pax_prep = true;
	};
	default {
		hint "trainingSniping error";
	};
};

