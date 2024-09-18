#include "\CGQC\script_component.hpp"
// --- loadDiaryRecord ----------------------------------------------------------
// List the player's Service Record
LOG("[loadDiaryRecord] started");
waitUntil {CGQC_playerLoaded};
waitUntil {cgqc_player_patch_found};

if(cgqc_player_known) then {
    waitUntil {cgqc_player_patch_found};
    cgqc_personal_patch = format[
        "<t align='center'><img image='\cgqc\patches\%1.paa' width='384' height='384'/></t><br/>",
        cgqc_player_patch
    ];
   } else {
    cgqc_personal_patch = "";
};

cgqc_personal_text = "";
// Service Record title centered with large font, followed by a line break
cgqc_personal_text = cgqc_personal_text + "<font size='30'>Service Record</font><br/><br/>";
cgqc_personal_text = cgqc_personal_text + format ["<font size='22'><b>%1</b></font><br/><br/>", name player];
cgqc_personal_text = cgqc_personal_text + cgqc_personal_patch;

// Qualifications section with N/A placeholders
cgqc_personal_text = cgqc_personal_text + "<font size='24'><b>Qualifications</b></font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>QMB: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>LAT: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>Service Rifle: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>MAT: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>HAT: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>MachineGun: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>DMR: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>Sniper: N/A</font><br/><br/>";

// Evaluations section with N/A placeholders
cgqc_personal_text = cgqc_personal_text + "<font size='24'><b>Evaluations</b></font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>1.0 Sdt: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>2.0 Cpl: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>3.0 CplC: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>4.0 Sgt: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>5.0 Adju: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>6.0 AdjuM: N/A</font><br/>";
cgqc_personal_text = cgqc_personal_text + "<font size='18'>Zeus: N/A</font><br/><br/>";

// Diary record creation or update
if (!(player diarySubjectExists "CGQC_Record")) then {
    // Create subject and record
    player createDiarySubject ["CGQC_Record", "Service Records"];
    player createDiaryRecord ["CGQC_Record", ["Personal File", cgqc_personal_text]];
} else {
    _records = player allDiaryRecords "CGQC_Record";
    _record = _records#0;
    player setDiaryRecordText [["CGQC_Record", _record#8], ["Personal File", cgqc_personal_text]];
};


// Practice page
// Check if qualification data exists
cgqc_qualificationPractice_text = "";
_serviceQualif = MissionProfileNamespace getVariable ["cgqc_qualification_1_rifle_practice", []];
if (count _serviceQualif isNotEqualTo 0) then {
	// Qualification section with a slightly smaller font
	cgqc_qualificationPractice_text = cgqc_qualificationPractice_text + "<font size='24'><b>Qualification Practice</b></font><br/><br/>";
	cgqc_qualificationPractice_text = cgqc_qualificationPractice_text + "<font size='18'>- Service Rifle 100-450m</font><br/>";

	// Extract date, score, and badge information
	_date = _serviceQualif select 1;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_dateTxt = format ["%1/%2/%3", _year, _month, _day];
	_qualifyTxt = _serviceQualif select 2;
	_points = _serviceQualif select 3;
	_max = _serviceQualif select 4;

	// Append date, score, and badge to the text
	cgqc_qualificationPractice_text = cgqc_qualificationPractice_text + format ["<font size='18'>-- Date: %1 | Score: %2/%3 | Badge: %4</font><br/><br/>", _dateTxt, _points, _max, _qualifyTxt];
};

if ( count (player allDiaryRecords "CGQC_Record") > 1 ) then {
    _records = player allDiaryRecords "CGQC_Record";
	_record = _records#1;
	player setDiaryRecordText [["CGQC_Record", _record#8], ["Qualification Practice", cgqc_qualificationPractice_text]];
} else {
    player createDiaryRecord ["CGQC_Record", ["Qualification Practice", cgqc_qualificationPractice_text]];
};

LOG("[loadDiaryRecord] done");



