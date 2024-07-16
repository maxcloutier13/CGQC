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
        [_patient, "activity", "%1 slapped %2", [[_medic] call ace_common_fnc_getName, "Carbonate"]] call ace_medical_treatment_fnc_addToLog;
        // Check if in cardiac arrest
        if (_patient getVariable ["ace_medical_inCardiacArrest", false];) exitWith {
            LOG("[treatmentLocal] Slap - Patient in cardiac arrest. Skipping.");
        };
        // Check blood loss
        _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6];
        if (_bloodVolume < 4.2) exitWith {
            LOG("[treatmentLocal] Slap - Patient lost too much blood. Skipping.");
        };
        // Not in cardiac arrest: waking up
        LOG("[treatment] Slap: Success. Waking up");
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
        _txt = selectRandom _choices;
        _txt = format[_txt, _medic];
        [_patient, false] call ace_medical_fnc_setUnconscious;
    };

    case "Carbonate": {
        LOG("[treatmentLocal] AmmoniumCarbonate");
        //Journal entry
        [_patient, "activity", "%1 used %2", [[_medic] call ace_common_fnc_getName, "Carbonate"]] call ace_medical_treatment_fnc_addToLog;
        // Check if in cardiac arrest
        if (_patient getVariable ["ace_medical_inCardiacArrest", false];) exitWith {
            LOG("[treatmentLocal] AmmoniumCarbonate - Patient in cardiac arrest. Skipping.");
        };
        // Check blood loss
        _bloodVolume = _patient getVariable ["ace_medical_bloodVolume", 6];
        if (_bloodVolume < 3.6) exitWith {
            LOG("[treatmentLocal] AmmoniumCarbonate - Patient lost too much blood. Skipping.");
        };
        // Not in cardiac arrest: waking up
        LOG("[treatment] AmmoniumCarbonate: Success. Waking up");
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
        _txt = selectRandom _choices;
        [_patient, false] call ace_medical_fnc_setUnconscious;
    };
};

[[_txt, 1.5], false] call CBA_fnc_notify;
LOG("[treatmentLocal] done");








