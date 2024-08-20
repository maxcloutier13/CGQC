#include "\CGQC\script_component.hpp"
// --- treatmentLocal ----------------------------------------------------------
// Custom Ace medical treatments
//  [_player, _patient, 'Carbonate'] call CGQC_fnc_treatment;
params["_medic", "_patient", "_medication"];
LOG_3("[treatmentLocal] %1/%2/%3 started", _medic, _patient, _medication);

_txt = "";
switch (_medication) do {
    case "slap": {
        LOG("[treatmentLocal] Slap!");
        //Journal entry
        [_patient, "activity", "%1 slapped the patient", [name _medic]] call ace_medical_treatment_fnc_addToLog;
        // Check if in cardiac arrest
        _noHeartBeat = _patient getVariable ["ace_medical_inCardiacArrest", false];
        if (_noHeartBeat) exitWith {
            LOG("[treatmentLocal] Slap - Patient in cardiac arrest. Skipping.");
        };
        // Check blood loss
        _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6];
        if (_bloodVolume < 4.2) exitWith {
            LOG("[treatmentLocal] Slap - Patient lost too much blood. Skipping.");
        };
        _randomtarget = 1;
        _check = random _randomtarget;
        if (_check <= 0.1) then {
            ["ace_medical_WakeUp", _patient] call CBA_fnc_localEvent;
            if !(player getVariable ["ACE_isUnconscious", false]) then {
                // Not in cardiac arrest: waking up
                LOG_2("[treatmentLocal] Slap: Success. %1<%2 Waking up", _check, _randomtarget);
                _choices = [
                    "%1 jolted you awake with a slap!",
                    "%1 brought you back with a sharp slap!",
                    "%1's slap snapped you back to reality!",
                    "%1 woke you up with a stinging slap!",
                    "%1's slap pulled you out of it!",
                    "%1 brought you around with a smack!",
                    "%1's slap got your attention fast!",
                    "%1 revived you with a swift slap!",
                    "%1's slap shocked you awake!",
                    "%1 woke you with a quick smack!",
                    "%1 slapped you awake!"
                ];
                _txt = format ["<t size='2'>%1</t>", selectRandom _choices];
                _txt = format[_txt, name _medic];
                cutText ["","PLAIN DOWN", 1, false, true];
                cutText [_txt,"PLAIN DOWN", 1, false, true];
                ["cgqc_event_notify", ["Slap!", "Yes! There he is!"], _medic] spawn CBA_fnc_targetEvent;
            } else {
                LOG("[treatmentLocal] Slap: Didn't wake up for some reason");
                ["cgqc_event_notify", ["Slap!", "No effect..."], _medic] spawn CBA_fnc_targetEvent;
            };
        } else {
            ["cgqc_event_notify", ["Slap!", "No effect..."], _medic] spawn CBA_fnc_targetEvent;
            LOG_2("[treatmentLocal] Slap - Failed random check: %1>%2", _check, _randomtarget);
        };
    };

    case "Carbonate": {
        LOG("[treatmentLocal] AmmoniumCarbonate");
        //Journal entry
        [_patient, "activity", "%1 used %2", [[_medic] call ace_common_fnc_getName, "Ammonium"]] call ace_medical_treatment_fnc_addToLog;
        // Check if in cardiac arrest
        _noHeartBeat = _patient getVariable ["ace_medical_inCardiacArrest", false];
        // Check blood loss
        _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6];
        if (_noHeartBeat || _bloodVolume < 3) exitWith {
            ["cgqc_event_notify", ["Ammonimum", "No effect..."], _medic] spawn CBA_fnc_targetEvent;
            LOG("[treatmentLocal] AmmoniumCarbonate - Patient in cardiac arrest/Lowblood. Skipping.");
        };
        //_wakeup = [_patient, false, 0, true] call ace_medical_fnc_setUnconscious;
        LOG("[treatmentLocal] AmmoniumCarbonate - Patient has heartbeat");
        LOG("[treatmentLocal] AmmoniumCarbonate - Patient has blood %1", _bloodVolume);
        // Not in cardiac arrest: waking up
        LOG("[treatment] AmmoniumCarbonate: Success. Waking up");
        ["ace_medical_WakeUp", _patient] call CBA_fnc_localEvent;
        if !(player getVariable ["ACE_isUnconscious", false]) then {
            _choices = [
                "Wow! That smell feels like a punch in the face!",
                "Holy crap! My nose is on fire!",
                "Yikes! That stings like crazy!",
                "Whoa! It feels like my nostrils just exploded!",
                "Oh man! That smell is intense!",
                "Jeez! It's like inhaling pure fire!",
                "Good grief! That smell is a wake-up call!",
                "Dang! That smell is no joke!",
                "Whoa! It's like a shockwave to my senses!",
                "Holy smokes! That scent is brutal!",
                "Holy fucking shit!",
                "Woah"
            ];
            _txt = format ["<t size='3'>%1</t>", selectRandom _choices];
            cutText ["","PLAIN DOWN", 1, false, true];
            cutText [_txt,"PLAIN DOWN", 1, false, true];
        } else {
            LOG("[treatment] AmmoniumCarbonate: Didn't wake up for some reason");
            ["cgqc_event_notify", ["Ammonium", "No effect strangely"], _medic] spawn CBA_fnc_targetEvent;
        };

    };
};


LOG("[treatmentLocal] done");








