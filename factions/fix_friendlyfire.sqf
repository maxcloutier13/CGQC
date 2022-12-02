player addEventHandler [
    "HandleRating",
    {
        params["_player", "_rating"];
        _return = _rating;
        if(rating _player < 0) then {
			hint "Méchant garçon!";
            _return = abs rating _player;
        } else {
            if(_rating + rating _player < 0) then {
				hintSilent "Woops!!!!";
                _return = 0;
            };
        };
        _return
    }
];