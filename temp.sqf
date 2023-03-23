// Old green cap
class cgqc_cap_green : H_HelmetB
{
	author = "silent1";
	_generalMacro = "cgqc_cap_green";
	displayName = "CGQC Casquette verte";
	picture = "\A3\Characters_F\data\ui\icon_H_Cap_headphones_khk_CA.paa";
	model = "\A3\Characters_F\common\capb_headphones.p3d";
	descriptionShort = "$STR_A3_SP_NOARMOR";
	class ItemInfo : ItemInfo
	{
		mass = 10;
		uniformModel = "\A3\Characters_F\common\capb_headphones.p3d";
		modelSides[] = {
			6
		};
		hiddenSelections[] =
		{
			"camo"
		};
		class HitpointsProtectionInfo
		{
			class Head
			{
				hitpointName = "HitHead";
				armor = 0;
				passThrough = 1;
			};
		};
	};
	hiddenSelections[] = {
		"camo"
	};
	hiddenSelectionsTextures[] = {
		"\CGQC\helmets\cgqc_cap_green.paa"
	};
};

// Autorank
// set rank by prefix ----------------------------------------------------------------------------------
hint "Autorank running";
_name = name player;
_prefix = _name select[0, 4];
switch (_prefix)
do
{
	case "Sdt.":
	{
		player setRank "PRIVATE";
		hint "Soldat";
	};
	case "Cpl.":
	{
		player setRank "CORPORAL";
		hint "Caporal";
	};
	case "CplC":
	{
		player setRank "CORPORAL";
		hint "Caporal-Chef";
	};
	case "Sgt.":
	{
		player setRank "SERGEANT";
		hint "Sergeant";
	};
	case "Adju":
	{
		player setRank "SERGEANT";
		hint "Adjudent";
	};
	case "SLt.":
	{
		player setRank "LIEUTENANT";
		hint "Sous-Lieutenant";
	};
	case "Lt. ":
	{
		player setRank "LIEUTENANT";
		hint "Lieutenant";
	};
	case "Capt":
	{
		player setRank "CAPTAIN";
		hint "Capitaine";
	};
	case "Maj.":
	{
		player setRank "MAJOR";
		hint "Major";
	};
	case "LCol":
	{
		player setRank "COLONEL";
		hint "Lieutenant-Colonel";
	};
	case "Col.":
	{
		player setRank "COLONEL";
		hint "Colonel";
	};
	default
	{
		player setRank "PRIVATE";
		_text = ("<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >discord.gg/RCyRKWVG</t>");
		[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
		sleep 6;
	};
};

// default text if the player is not known
_text = (format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", _name]);
// default patch pour les joueurs qui en ont pas de custom
[ player, "cgqc_patch_logo" ] call BIS_fnc_setUnitInsignia;

// Assign patch based on name  ------------------------------------------------------------------------------------
sleep 2;
if ((_name find["Audi", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_audi.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Audi!</t><br/><t>what's up?</t>");
	[ player, "cgqc_patch_audi" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Braddock", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_braddock.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Mafia!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_cloutier" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Cloutier", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_cloutier.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Cloutier!</t><br/><t>Asti que t'es beau</t>");
	[ player, "cgqc_patch_cloutier" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Comeau", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_comeau.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Comeau!</t><br/><t>Asti que t'es beau!</t>");
	[ player, "cgqc_patch_comeau" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Fortin", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_fortin.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Dogo!</t><br/><t>ça roule?</t>");
	        // load insignia
	[ player, "cgqc_patch_fortin" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Frechette", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_frechette.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Frechette!</t><br/><t>what's up buddy?</t>");
	        // load insignia
	[ player, "cgqc_patch_frechette" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Genest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_genest.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo petit beurre!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_genest" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Laforest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_laforest.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Frog!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_laforest" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Pinard", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_pinard.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo PinHard!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_pinard" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Tremblay", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_tremblay.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Tremblay!</t><br/><t>what's up Captain'?</t>");
	        // load insignia
	[ player, "cgqc_patch_tremblay" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Villeneuve", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_villeneuve.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo Logic!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_villeneuve" ] call BIS_fnc_setUnitInsignia;
};

if ((_name find["Woods", 0]) > 0) then {
	hint "woods?";
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_woods.paa'/>" +
	"<br/>" +
	"<t size='2' >Yo XiPoWnZX!</t><br/><t>what's up?</t>");
	        // load insignia
	[ player, "cgqc_patch_woods" ] call BIS_fnc_setUnitInsignia;
};

// Show text and patch ------------------------------------------------------------------------------------
[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
// sleep a bit before going out
sleep 4;

// test alignement
_text = ("<img size= '6' style='vertical-align:text-bottom' shadow='false' image='\cgqc\patches\cgqc_patch_cloutier.paa'/>" +
"<br/>" +
"<t size='2' >Yo Cloutier!</t><br/><t>Time to fuck shit up</t>");
[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;

// Integrate category mod 
private _medicalSupplies = ["ACE_adenosine", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_packingBandage", "ACE_quikclot", "ACE_bloodIV", "ACE_bloodIV_250", "ACE_bloodIV_500", "ACE_epinephrine", "Empty_bloodIV_250", "Empty_bloodIV_500", "ACE_morphine", "ACE_personalAidKit", "ACE_plasmaIV", "ACE_plasmaIV_250", "ACE_plasmaIV_500", "ACE_salineIV", "ACE_salineIV_250", "ACE_salineIV_500", "ACE_splint", "ACE_surgicalKit", "ACE_tourniquet"];

[_medicalSupplies, "Medical", "aceAresenalCatagory\icon\medical.paa", 0] call ace_arsenal_fnc_addRightPanelButton;





primary_mag = primaryWeaponMagazine player;
all_mags = magazines player;
all_primary = all_mags select {_x find[primary_mag[0],0]>0};

primary_mags = primaryWeaponMagazine player;
primary_mag = primary_mags select 0;
all_mags = magazines player; 
all_primary = all_mags select {_x ==primary_mag};
primary_count = count all_primary;


//Speakers 
//CHeck if speaker on:
_isSpeaker = ["ACRE_PRC148_ID_123"] call acre_api_fnc_isRadioSpeaker
//set on/off
_success = ["ACRE_PRC148_ID_123", true] call acre_api_fnc_setRadioSpeaker
3


cgqc_player_rank = 0;
cgqc_player_known = false;

// Dynamic groups ------------------------------------------------------------------------------------------------
// Check if dynamic group is initialized
dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
if (!dynamic_group_check) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

// Add player to dynamic group 
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Respawn event handlers ----------------------------------------------------------------------------------------
//Respawn handler 
player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];
	[0, _unit] execVm "\cgqc\factions\player_killed.sqf";
	
}];

//Death handler 
player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[1, _unit, _killer] execVm "\cgqc\factions\player_killed.sqf";
}];

// Shows intro screen with logo and stuff
[ "CBA_loadingScreenDone", {
	null = execVM "\cgqc\factions\intro.sqf";
} ] call CBA_fnc_addEventHandler;

//Maximum mags event handler 
["ace_arsenal_displayClosed", {
	//hint "Arsenal closed";
	execVm "\cgqc\factions\max_mags.sqf";
}] call CBA_fnc_addEventHandler;

//Lock channels by default 
["init"] execVm "\cgqc\factions\channels_lock.sqf";

//Sets radio channel names 
[0] execVm "\cgqc\factions\set_radios.sqf";

// Boost dragging maximum 
ACE_maxWeightDrag = 3000;


// Briefing entry -------------------------------------------------------------------------------------------------
#include "\cgqc\factions\briefing.sqf"

// Player identification --------------------------------------------------------------------------------------------
//ID player
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_rank = 1;


//Find rank
#include "\cgqc\factions\find_rank.sqf"
// Build a random welcome
#include "\cgqc\factions\welcome.sqf"
// Assign patch based on name  
#include "\cgqc\factions\find_patch.sqf"

// ----- Set and keep patch --------------------------------------------------------------------------------------
_setPatch = [] spawn CGQC_fnc_setPatch;

// Fix friendly fire --------------------------------------------------------------------------------------------
#include "\cgqc\factions\fix_friendlyfire.sqf"

// Ace self interaction for players
#include "\cgqc\factions\cgqc_perks.sqf"

// Zeus shenanigans... MAX - to review
#include "\cgqc\factions\zeus.sqf"

// Lower gun 
player action ['SwitchWeapon', player, player, 100];

sleep 3;
// Set default left/right radios
["radio_sides"] execVM "\cgqc\factions\stuff_player.sqf";

// Welcome screen avec la patch et le message random
if (cgqc_setting_show_welcome) then {
	sleep 20;
	[ cgqc_welcome_text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
};

// Player init is complete!
cgqc_player_init = 1;
sleep 5;



UK3CB_B_M151_Jeep_Closed_HIDF

UK3CB_B_M151_Jeep_HMG_HIDF

rhsusf_mrzr4_d

B_W_LSV_01_unarmed_F

B_W_LSV_01_armed_F

B_W_LSV_01_AT_F

rhsusf_m998_d_s_4dr

rhsusf_m1025_d_s_m2

rhsusf_m1165a1_gmv_m2_m240_socom_d

B_W_MRAP_01_F

B_W_MRAP_01_hmg_F

B_T_Truck_01_ammo_F

B_T_Truck_01_cargo_F

B_T_Truck_01_fuel_F

B_T_Truck_01_Repair_F



@CBA_A3;@RHSAFRF;@RHSGREF;@RHSSAF;@RHSUSAF;@ace;@JSRS SOUNDMOD;@3CB Factions;@Canadian_SOF_LITE_mas;@CUP Terrains - Core;@CUP Terrains - Maps;@Tier One Weapons;@ACRE2;@CGQC - 2023;@CGQC - Core - Mk2;@CGQC - Addons;




@CBA_A3;@RHSAFRF;@RHSGREF;@RHSSAF;@RHSUSAF;@ace;@JSRS SOUNDMOD;@3CB Factions;@Canadian_SOF_LITE_mas;@CUP Terrains - Core;@CUP Terrains - Maps;@Tier One Weapons;@ACRE2;@CGQC - 2023;@CGQC - Core - Mk2;@CGQC - Addons;










@CBA_A3;@ace;@ACRE2;@RHSAFRF;@RHSUSAF;@RHSGREF;@RHSSAF;@ACE Compats - RHS Compats;@Antistasi Plus 20;@JSRS SOUNDMOD;@JSRS SOUNDMOD - RHS AiO Mod Pack Sound Support;@CGQC - Addons - Basic;@CGQC - Core - Mk2;


//Remove ACE eventhandlers
this removeAllEventHandlers "HandleDamage";

// Add an on-hit event to the VIP/HVT unit
this addEventHandler ["HandleDamage", {
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex"];
	// Check if the damage would be fatal
	if (_damage > 0.8) then {
		// Make the unit pass out instead of dying
		_unit setUnconscious true;
		_unit setVariable ["ACE_isUnconscious", true];
		_return = _unit call ace_medical_fnc_handleDamage;
	};
}];

// Add a revive event to the VIP/HVT unit
this addEventHandler ["ACE_revive", {
    params ["_unit", "_medic", "_status", "_source"];
    // Reset the unit's damage to 0
    _unit setDamage 0;
}];


// Example 
this setVariable ["ACE_medical_headHitMuliplier", 0.1]; 
this setVariable ["ace_medical_fatalInjuryProbability", 0];
this setVariable ["ace_medical_injury_bleedingCoefficient", 0.1]; 
this addEventHandler ["HandleDamage", {  
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex"];  
 vip_health = getDammage _unit; 
 vip_damage = _damage;
 heartRate = _unit getVariable ["ace_medical_heartrate", "fail"];
  if (vip_health < 0.2) then {  
 _damage = _damage * 0.1;
 _unit setUnconscious true;  
 _unit setVariable ["ACE_isUnconscious", true]; 
 _unit setDamage 0.3; 
 };  
}];