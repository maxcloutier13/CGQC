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



// upgrade to welcome screen 
 [] spawn {
_cgqc_welcome_pic = parseText format["<img size= '3' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\%1.paa'/>", cgqc_player_patch]; 
cgqc_welcome_message = parseText format["%1<br /><t font='PuristaBold' size='1.6'>%2</t><br />%3", "Whats up ",cgqc_player_steamName," ready to blow shit up?"]; 
[ _cgqc_welcome_pic, 1, 0.8, 6, 2 ] spawn BIS_fnc_dynamicText; 
sleep 1;
  // Welcome msg as textTiles  
[cgqc_welcome_message, [1.35,1,1,1], nil, 4, [3,3], 0] spawn BIS_fnc_textTiles;};



cgqc_event_148 = ["acre_startedSpeaking", { 
    params ["_unit", "_onRadio", "_radioId", "_speakingType"]; 
    //hint format["Unit:%1 -onRadio:%2 -radioId:%3 -speakingType:%4", _unit,_onRadio,_radioId,_speakingType ]; 
    if !(_onRadio) then {
        if(_radioId find "148" == 0) then {
            Hint parseText( "148 Ch:1 = Listen Only" + "<br/>" + "Change channel to communicate");
        };
    };
}] call CBA_fnc_addEventHandler;

cgqc_event_148 = ["acre_startedSpeaking", {  
	params ["_unit", "_onRadio", "_radioId", "_speakingType"];  
	//hint format["Unit:%1 -onRadio:%2 -radioId:%3 -speakingType:%4", _unit,_onRadio,_radioId,_speakingType ]; 
	Y_unit =_unit; 
	Y_onRadio = _onRadio;
	Y_radioId = _radioId;
	Y_speakingType = _speakingType;
	if (Y_onRadio) then { 
		if(Y_radioId find "148" == 0) then { 
			hintc "148!";
			//Hint parseText( "148 Ch:1 = Listen Only" + "<br/>" + "Change channel to communicate"); 
		}; 
	}; 
}] call CBA_fnc_addEventHandler;



cgqc_event_148 = ["acre_startedSpeaking", {   
 params ["_unit", "_onRadio", "_radioId", "_speakingType"];   
 if (_onRadio) then {  
  if(_radioId find "148" > -1) then {
	y_channel = [] call acre_api_fnc_getCurrentRadioChannelNumber;
	if(y_channel == 1) then {
		_channel_txt = parseText( "148:Ch1 = Listen Only" + "<br/>" + "Change channel to communicate!");
		[ _channel_txt, 0, 0, 3, 1 ] spawn BIS_fnc_dynamicText;
	}; 
  };  
 };  
}] call CBA_fnc_addEventHandler;



_this addAction ["Delete Vehicle", "{deleteVehicle _x;} forEach (vehicles select { _x inArea spawn_zone })", [], 1, false, true, "", "_this distance _target < 3"]; 

if (hasInterface) then {
	 " \n " this addAction [""Advanced sniping mode->ON"", { " \n "  titleText [""Advanced mode on"", ""BLACK FADED"", 5]; " \n "  titleFadeOut 2; " \n "  nul=execVM ""scripts\max_dynamic_range.sqf""; " \n " }, [], 10, true, true]; " \n 
	 " this addAction [""Advanced sniping mode->OFF"", { " \n "  titleText [""Advanced mode on"", ""BLACK FADED"", 5]; " \n "  titleFadeOut 2; " \n "  nul=execVM ""scripts\max_dynamic_range_off.sqf""; " \n " }, [], 10, true, true]; " \n "};this attachTo[table_snipe];";





[] spawn { 
player switchCamera "external";
private _camera = "camera" camCreate getPosATL player;
_camera cameraEffect ["EXTERNAL", "BACK"];
sleep 5;
player switchCamera "INTERNAL";
_camera cameraEffect ["TERMINATE", "BACK"];


class MRAP_01_base_F : Car_F {
	class AcreRacks {
		class Rack_1 {
			displayName = CSTRING(dashUpper); // Name is displayed in the interaction menu.
			shortName = CSTRING(dashUpperShort);
			componentName = "ACRE_VRC110";
			allowedPositions[] = {"driver", {"cargo", 0}}; // Who has access "inside" - anyone inside, "external" - provides access upto 10m away, "driver", "gunner", "copilot", "commander"
			isRadioRemovable = 1;
			intercom[] = {"intercom_1"};
		};
		class Rack_2 {
			displayName = CSTRING(dashLower); // If you have multiple racks a text label helps identify the particular rack.
			shortName = CSTRING(dashLowerShort);
			componentName = "ACRE_VRC103";
			allowedPositions[] = {"driver", {"cargo", 0}};
			mountedRadio = "ACRE_PRC117F";
			intercom[] = {"intercom_1"};
		};
	};
};



@CBA_A3;@RHSAFRF;@RHSGREF;@RHSSAF;@RHSUSAF;@ace;@JSRS SOUNDMOD;@3CB Factions;@Canadian_SOF_LITE_mas;@CUP Terrains - Core;@CUP Terrains - Maps;@Tier One Weapons;@ACRE2;@CGQC - Core - mk3;@CGQC - Addons;@CGQC - Addons - 2023;



@CBA_A3;@ace;@ACRE2;@JSRS SOUNDMOD;@Anrop Unsung JSRS;@Unsung;@Fox Vanam;@KLPQ Vietnam Radio;@CGQC - Core - mk3;@CGQC - Addons;@Gruppe Adler Trenches;



[[Location NameCity at 12273, 10444],[Location NameCity at 8908, 11116],[Location NameCity at 11173, 8422],[Location NameCity at 8426, 12526],[Location NameCity at 8203, 8274],[Location NameCity at 8374, 5664],[Location NameCity at 5152, 10006],[Location NameCity at 5465, 13309],[Location NameCity at 9866, 4642],[Location NameCity at 6008, 6651],[Location NameCity at 5272, 14638],[Location NameCity at 3007, 13988],[Location NameCity at 10718, 1832],[Location NameCity at 2806, 7015],[Location NameCity at 2348, 7034],[Location NameCity at 1439, 7984],[Location NameCity at 7700, 1210],[Location NameCity at 3571, 3008],[Location NameLocal at 9800, 12470],[Location NameLocal at 10458, 8177],[Location NameLocal at 7691, 14239],[Location NameLocal at 11266, 4929],[Location NameLocal at 7415, 5586],[Location NameLocal at 4643, 7286],[Location NameLocal at 4021, 5365],[Location NameLocal at 1700, 10787],[Location NameLocal at 4950, 3057],[Location NameLocal at 828, 2793],[Location NameMarine at 11130, 13166],[Location NameMarine at 8501, 6977],[Location NameMarine at 13838, 6901],[Location NameMarine at 13552, 5472],[Location NameMarine at 4271, 11687],[Location NameMarine at 12730, 2635],[Location NameMarine at 3250, 6508],[Location NameMarine at 7589, 2509]]



@CBA_A3;@ace;@ACRE2;;@JSRS SOUNDMOD;@CGQC - Core - mk3;@CGQC - Addons;@Gruppe Adler Trenches;@Unsung;@Antistasi - The Mod;@CGQC - Addons - Unsung;




["ace_interact_menu_newControllableObject", {
    params ["_type"]; // string of the object's classname
    if (!(_type isKindOf "CAManBase")) exitWith {};
    hint "NEW UNIT YEAH BUDDY";
    //private _action = ["playRadio","Play Radio","",{playMusic "NeverGonnaGiveYouUp"},{true}] call ace_interact_menu_fnc_createAction;
    //[_type, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
}] call CBA_fnc_addEventHandler;


_action = [ "menu_self_zeus_1", "Zeus action", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {[player] call CGQC_fnc_checkZeus} ] call ace_interact_menu_fnc_createAction;
_adding = [["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;




class Missions {
      class Mission1    {
            template ="Antistasi_vt7.vt7"; //replace with your mission name
            difficulty = "Custom";
            class Params {
				autoLoadLastGame = 1;
             };
      };
};



if (player canAdd ["ACRE_PRC117F", 3]) then { 
	// There is enough space, add the items 
	player addItem "ACRE_PRC117F"; 
	player addItem "ACRE_PRC117F"; 
	player addItem "ACRE_PRC117F"; 
} else { 
	// There is not enough space 
	hint "Not enough inventory space!";
	_items_pack = backpackItems player;
	removeBackpack player;
	player addBackpack "cgqc_pack_mk1_magic_zeus";
	clearAllItemsFromBackpack player;
	{player addItemToBackpack _x} forEach _items_pack;
	player addItem "ACRE_PRC117F"; 
	player addItem "ACRE_PRC117F"; 
	player addItem "ACRE_PRC117F"; 
};



[] spawn {

sleep 0.5; 
  // 117f's 
  y_packRadios = ["ACRE_PRC117F"] call acre_api_fnc_getAllRadiosByType; 
  waitUntil {sleep 0.5;!isNil "_packRadios"}; 
  if (count y_packRadios < 3) then { 
   hint "Setting Zeus radios"; 
   //Remove all radios  
   _radios = call acre_api_fnc_getCurrentRadioList; 
   { 
	player removeItem _x; 
   }forEach _radios; 
   // Add 3 zeus radios 
   if (player canAdd ["ACRE_PRC117F", 3]) then {  
	// There is enough space, add the items  
	player addItem "ACRE_PRC117F";  
	player addItem "ACRE_PRC117F";  
	player addItem "ACRE_PRC117F";  
   } else {  
	// There is not enough space  
	hint "Not enough inventory space!"; 
	_items_pack = backpackItems player; 
	removeBackpack player; 
	player addBackpack "cgqc_pack_mk1_magic_zeus"; 
	clearAllItemsFromBackpack player; 
	{player addItemToBackpack _x} forEach _items_pack; 
	player addItem "ACRE_PRC117F";  
	player addItem "ACRE_PRC117F";  
	player addItem "ACRE_PRC117F";  
   }; 
  }; 
	y_packRadio_1 = y_packRadios select 0; 
   y_packRadio_2 = y_packRadios select 1; 
   y_packRadio_3 = y_packRadios select 2; 
   waitUntil {sleep 0.5;!isNil "y_packradio_1"}; 
   [y_packradio_1, 1] call acre_api_fnc_setRadioChannel; //Spartan 
   waitUntil {sleep 0.5;!isNil "y_packradio_2"}; 
   [y_packradio_2, 2] call acre_api_fnc_setRadioChannel; //Air-Net 
   waitUntil {sleep 0.5;!isNil "y_packradio_3"}; 
   [y_packradio_3, 3] call acre_api_fnc_setRadioChannel; //Ground-Net 
   // Set order 
   _success = [ [ y_packradio_1, y_packradio_2, y_packradio_3] ] call acre_api_fnc_setMultiPushToTalkAssignment; 
   // Set sides  
   _success = [y_packradio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial; 
   _success = [y_packradio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
   _success = [y_packradio_3, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
   hintSilent parseText "<t> 
   --- Zeus Radios -------------<br/> 
   Radio1:Gauche/117/Spartan<br/>  
   Radio2:Droite/117/Griffon<br/>  
   Radio3:Droite/117/Centaure</t>"; 
};






\cgqc\textures\projector\projector_qmb_whatsnew.paa, \cgqc\textures\projector\projector_qmb_keybinds.paa, \cgqc\textures\projector\projector_qmb_ACE.paa, \cgqc\textures\projector\projector_qmb_radio343.paa, \cgqc\textures\projector\projector_1_cgqc.paa


case "zeus_radios":
	{
		sleep 0.5;  
		//Remove all radios 
		_radios = call acre_api_fnc_getCurrentRadioList;  
		{  
		player removeItem _x;  
		}forEach _radios; 
		sleep 0.5;
		// Add Zeus radios 
		player addItem "ACRE_PRC152";  
		player addItem "ACRE_PRC152";
		sleep 0.5;  
		_handRadios = ["ACRE_PRC152"] call acre_api_fnc_getAllRadiosByType; 
		sleep 0.5;
		//waitUntil {sleep 1;!isNil "_handRadios"}; 
		_handRadio_1 = _handRadios select 0; 
		_handRadio_2 = _handRadios select 1; 
		// Channels 
		waitUntil {sleep 0.5;!isNil "_handRadio_1"}; 
		[_handRadio_1, 1] call acre_api_fnc_setRadioChannel;  
		waitUntil {sleep 0.5;!isNil "_handRadio_2"}; 
		[_handRadio_2, 9] call acre_api_fnc_setRadioChannel; 
		// Set sides  
		_success = [_handRadio_1, "LEFT" ] call acre_api_fnc_setRadioSpatial; 
		_success = [_handRadio_2, "RIGHT" ] call acre_api_fnc_setRadioSpatial; 
		// Set radio orders 
		_success = [ [ _handRadio_1, _handRadio_2, "" ] ] call acre_api_fnc_setMultiPushToTalkAssignment; 
		hintSilent parseText "<t> 
		Radio1:Gauche/152/Spartan-HQ<br/>  
		Radio2:Droite/152/Inter-Zeus</t>";
	};



["Gatling_30mm_Plane_CAS_01_F",	"Bomb_04_Plane_CAS_01_F", "ace_hellfire_launcher", "ace_hellfire_launcher_N","missiles_SCALPEL","BombCluster_01_F"]



["weapon_Fighter_Gun20mm_AA","weapon_BIM9xLauncher","weapon_AMRAAMLauncher","weapon_GBU12Launcher","weapon_SDBLauncher","BombCluster_01_F"]	




_crate = _this select 0;
_action = [ "menu_switch", "Change Map", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_vr", "VR Hub", "", {["END1"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_mald", "Malden", "", {["END2"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_tak", "Takistan", "", {["END3"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_novo", "Novogorsk", "", {["END4"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_switch_boz", "Bozcaada", "", {["END5"] remoteExec ["endMission", 0, true];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions", "menu_switch"], _action ] call ace_interact_menu_fnc_addActionToObject;		


end2 = training_malden;
    end3 = training_takistan;
    end4 = training_novogorsk;
    end5 = training_bozcaada;



        class training_malden : MissionDefault
        {template = cgqc_training_2023_v1.Malden;};

        class training_takistan : MissionDefault
        {template = cgqc_training_2023_v1.takistan;};

        class training_novogorsk : MissionDefault
        {template = cgqc_training_2023_v1.swu_public_novogorsk_map;};

        class training_bozcaada : MissionDefault
        {template = cgqc_training_2023_v1.bozcaada;};





this addAction ["End Mission and load map:", { 
 hint ""; 
}]; 
this addAction [ 
 "VR Hub", {["END1"] remoteExec ["endMission", 0, true];} 
]; 
this addAction [ 
 "Malden", {["END2"] remoteExec ["endMission", 0, true];} 
]; 
this addAction [ 
 "Takistan", {["END3"] remoteExec ["endMission", 0, true];} 
]; 
this addAction [ 
 "Novogorsk", {["END4"] remoteExec ["endMission", 0, true];} 
]; 
this addAction [ 
 "Bozcaada", {["END5"] remoteExec ["endMission", 0, true];} 
]; 



[] spawn {
	hint "Click anywhere on the map to select a position."; 
	// Define the event handler function for MapSingleClick 
	onMapClick = { 
		params["_control", "_pos", "_shift", "_alt", "_ctrl"]; 
			// Store the clicked position 
		y_clickedPos = _pos;
		
		// Remove the MapSingleClick event handler 
		removeMissionEventHandler ["MapSingleClick", _this]; 
		openMap [false, false]; 
	};
	// Add the MapSingleClick event handler 
	_check = addMissionEventHandler ["MapSingleClick", onMapClick]; 
	openMap [true, false];
	// Wait for the player to click on the map 
	waitUntil {sleep 0.5; !(isNil "y_clickedPos") }; 
	// Display the selected position in the hint 
	hint format ["Selected position: %1", y_clickedPos];
};


[[13799.6,18743.5,5.08387],[13791.4,18744.6,9.16632],[13792.7,18747.2,13.3234],[13790.7,18741.4,13.4792],[13791,18737.7,13.6406],[13796.4,18738.5,16.1597],[13801.8,18741.6,16.0863],[13801.5,18746.4,15.8193],[13789.2,18746.6,16.1553],[13794.5,18741.3,16.0672],[13798,18738.6,18.5225],[13802.1,18741.5,18.3982],[13797,18746.7,18.4145],[13793.6,18747.9,18.3244],[13790.9,18747.9,18.3806],[13790.4,18739.9,18.5583],[13791,18737.2,18.7103],[13793.9,18736.9,18.6137]]

last 7 positions for snipers and statics



// Random time between sunset/sunrise noon/midnight
//Only run once 
if (isNil "cgqc_setInitialTime") then {
	_sun = date call BIS_fnc_sunriseSunsetTime;
	_sunrise = _sun select 0;
	_sunset = _sun select 1;
	_year = date select 0;
	_month = date select 1;
	_day = date select 2;
	_hour = date select 3;
	_min= date select 4;
	_pick = selectRandom [1,2,3,4];
	switch (_pick) do {
		case 1:	{ // Sunrise
			setDate [_year, _month, _day, _sunrise, 0];
		};
		case 2:	{ // Sunset
			setDate [_year, _month, _day, _sunset, 0];
		};
		case 3:	{ // Noon
			setDate [_year, _month, _day, 12, 0];
		};
		case 4:	{ // Midnight
			setDate [_year, _month, _day, 0, 0];
		};
};

// Random weather
_over = random 1;
_rain = random 1;
[0,{ 0 setOvercast _over}] call CBA_fnc_globalExecute;
[0,{ 0 setRain _rain}] call CBA_fnc_globalExecute;
[0,{ forceWeatherChange}] call CBA_fnc_globalExecute;





// ------ Change Goggles --------------------------------------------------------------------------------------
_action = [ "cgqc_perk_goggles", "Change Goggles", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ---- Types
_action = [ "cgqc_perk_goggles_clr", "Clear Glasses", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_clr_msk", "Clear Mask", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_sun", "Sunglasses", "", {}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_gas", "Gasmask", "", {["G_mas_can_gasmask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear glasses
_action = [ "cgqc_perk_goggles_base", "Ballistic Glasses", "", {["G_mas_can_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_t", "Facewrap (Tan)", "", {["G_mas_can_wrap_gog_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_b", "Facewrap (Blk)", "", {["G_mas_can_wrap_gog_B"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_down", "Shemagh Up", "", {["G_mas_can_shemag_gog_l"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_up", "Shemagh Down", "", {["G_mas_can_shemag_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear mask 
_action = [ "cgqc_perk_mask_blk", "Mask (Black)", "", {["G_mas_can_mask_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_tan", "Mask (Tan)", "", {["G_mas_can_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_blk", "Balaclava (Blk)", "", {["G_mas_can_balaM_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_tan", "Balaclava (Tan)", "", {["G_mas_can_balaM_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_shemagh", "Shemagh Up", "", {["G_mas_can_shemag_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Sunglasses
_action = [ "cgqc_perk_sun_blk", "Dark Glasses", "", {["rhs_goggles_black"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_mask", "Dark Mask", "", {["rhusf_oakley_goggles_blk"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh", "Mask+Shemagh Up", "", {["rhsusf_shemagh_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh_d", "Mask+Shemagh Down", "", {["rhsusf_shemagh2_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_low", "Low Profile Goggles", "", {["G_Lowprofile"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;



// Build the text
	_inspect_txt = format [
		"------- Inspection: %1 ------- <br/>" +
		"Load:%2%3 - Max:%4 <br/>" +
		"Uniform:%5%6 -Vest:%7%8 -Pack:%9%10<br/>" +
		"Traits: %11<br/>" +
		"------------------------<br/>" +
		"Helmet: %12<br/>" +
		"Goggles: %13<br/>" + 
		"Uniform: %14<br/>" +
		"Vest: %15<br/>" + 
		"Pack: %16<br/>" + 
		"%17" +
		"%18" +
		"%19" +
		"---------- Primary ----------<br/>" +
		"Gun: %20<br/>" +
		"TotalMags: %21<br/>" +
		"---------- Handgun ----------<br/>" +
		"Pistol: %22<br/>" +
		"TotalMags: %23<br/>" +
		"---------- Launcher ----------<br/>" +
		"Launcher: %24<br/>" +
		"TotalMags: %25<br/>" +
		"<t color='#ff0000'>---------- MISSING/LOW ----------<br/></t>" +
		"%26"
		, 
		inspect_target_name, //1
		inspect_target_currentLoad, //2
		_percent, //3
		inspect_target_maxLoad, //4
		inspect_target_uniform_load, //5
		_percent, //6
		inspect_target_vest_load, //7
		_percent, //8
		inspect_target_backpack_load, //9
		_percent, //10
		inspect_target_traits,  
		inspect_target_helmet, 
		inspect_target_goggles,
		inspect_target_uniform, 
		inspect_target_vest, 
		inspect_target_backpack, 
		inspect_target_uniform_txt, 
		inspect_target_vest_txt, 
		inspect_target_backpack_txt,
		inspect_target_primary,
		inspect_target_primary_mag_total,
		inspect_target_handgun,
		inspect_target_handgun_mag_total,
		inspect_target_launcher,
		inspect_target_launcher_mag_total,
		inspect_target_alerts
	];





// Intel Laptop

if (hasInterface) then 
{ 
 this addAction [ 
  "Pick up laptop", // custom addAction title 
  { [_this, "action"] spawn BIS_fnc_initIntelObject }, 
  [], 
  10, 
  true, 
  true, 
  "", 
  "isPlayer _this && { _this distance _target < 2 } && 
  { (side group _this) in (_target getVariable ['RscAttributeOwners', [west, east, resistance, civilian]]) }" 
 ]; 
};





[] spawn { sleep 1;
[laptop_intel] call BIS_fnc_initIntelObject;
if (isServer) then 
{ 
 // Diary picture: 
 laptop_intel setVariable [ 
  "RscAttributeDiaryRecord_texture", 
  "secret.paa", // Path to picture 
  true 
 ]; 
 
 // Diary Title and Description: 
 [ 
  laptop_intel, 
  "RscAttributeDiaryRecord", 
  ["OMFG Guys", "J'en ai ma claque, tabarnak ! Tu vois-tu pas c'qui s'passe icitte ? Y sont en train de détruire notre beau pays, d'manipuler nos propres gens, d'diviser les frères. C'est un ostie d'jeu malsain auquel y jouent, là, en essayant de nous contrôler, d'nos dire comment on doit vivre nos vies. Ben non, mon esti ! Y veulent nous arracher nos armes, étouffer nos voix pis écraser notre liberté. Mais j'les laisserai pas faire, criss ! On a versé notre sang pour c'te maudite terre, on s'est battus pour nos convictions. Y pensent qu'y peuvent nous écraser comme ça ? Pas question, sacrament ! C'est l'heure d'se lever, d'leur montrer qu'on reculera pas. Y veulent nous pousser ? Ben on va riposter en sacrament ! Y vont pas détruire tout c'qu'on a bâti, câlice. Soyez à mes côtés, mes chums patriotes, pis faisons-les regretter le jour où y nous ont cherchés. C'est l'moment du Boogaloo, tabarnak !"] // Array in format [Title, Description] 
 ] call BIS_fnc_setServerVariable; 
 
 // Diary entry shared with (follows BIS_fnc_MP target rules): 
 laptop_intel setVariable ["recipients", west, true]; 
 
 // Sides that can interact with the intel object: 
 laptop_intel setVariable ["RscAttributeOwners", [west], true]; 
};
};



if (isServer) then {[this,[0,"images\home1.jpg"]] remoteExec ["setObjectTexture", 0, true]};                                       this addAction ["<t color='#ff9900'>HALO C130</t>",{params ["_target", "_caller"]; [_caller, C130] execVM "ROS_GroupHalo\scripts\ROS_GroupHalo.sqf"},[],1.5,false,false,"","player distance _target <3 && count (((position C130) nearObjects ['CAManBase', 10]) select {alive _x}) ==0"];                                            this addAction ["<t color='#b2ff66'>Move C130</t>",{[C130] execVM "ROS_GroupHalo\scripts\ROS_MoveHaloPlane.sqf"},[],1.4,false,false,"","player distance _target <3 && count (((position C130) nearObjects ['CAManBase', 10]) select {alive _x}) ==0"]; 
 
                                                                                                                                                                                                                                                                                                        _light = "#lightpoint" createVehicleLocal position this; 
_light setLightAmbient [0.02,0.1,0.06]; 
_light setLightColor [0.1,0.5,0.3];                                     _light setLightBrightness 0.15;                                                                                                                     this addAction ["<t color='#3399ff'>Weather Report</t>", "ROS_GroupHalo\scripts\ROS_weatherReport.sqf",[], 1.3, false, false,"","_this distance _target < 4"]; 



gm_handgrenade_conc_dm51,gm_handgrenade_conc_dm51a1,gm_handgrenade_frag_dm51,gm_handgrenade_frag_dm51a1,gm_handgrenade_frag_rgd5,vn_chicom_grenade_mag,vn_f1_grenade_mag,vn_m34_grenade_mag,vn_m61_grenade_mag,vn_m67_grenade_mag,vn_rg42_grenade_mag,vn_rgd33_grenade_mag,vn_rgd5_grenade_mag,vn_rkg3_grenade_mag,vn_t67_grenade_mag,vn_v40_grenade_mag,CUP_HandGrenade_L109A1_HE,CUP_HandGrenade_L109A2_HE,CUP_HandGrenade_M67,HandGrenade,CUP_HandGrenade_RGD5,CUP_HandGrenade_RGO,MiniGrenade



_tempGroup = createGroup WEST;
_tempUnit = _tempGroup createUnit ["B_Soldier_F", [0, 0, 0], [], 0, "NONE"];
removeAllItems _tempUnit;
removeAllAssignedItems _tempUnit;
removeAllWeapons _tempUnit;
_tempUnit setPosASL (getPosASL tank_test);
_tempUnit setDir (random 360);
_tempUnit addItem "HandGrenade"; 
[_tempUnit, "HandGrenadeMuzzle"] call BIS_fnc_fire;
sleep 0.5;
deleteVehicle _tempUnit;


y_this = curstorTarget getVariable ["cgqc_version_core"];



[[["cgqc_gun_mk1_mk12","Tier1_KAC_556_QDC_CQB_Black","Tier1_M4BII_NGAL_M600V_Black","Tier1_Razor_Gen3_110_Geissele_Docter",["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull",0],[],"Tier1_Harris_Bipod_Black"],[],["cgqc_gun_p99_wood","","","",["16Rnd_9x21_Mag",17],[],""],["cgqc_uniform_mk1",[["cgqc_items_ifak",1],["ACE_CableTie",2],["ACE_MapTools",1],["ACE_microDAGR",1],["WBK_HeadLampItem",1],["ACRE_PRC343",1],["immersion_cigs_cigar0_nv",1],["grad_paceCountBeads_functions_paceCountBeads",1],["G_Aviator",1],["G_mas_can_balaM_b",1],["ACE_Canteen_Half",1],["16Rnd_9x21_Mag",2,17],["acex_intelitems_notepad",1,1],["murshun_cigs_lighter",1,100],["murshun_cigs_cigpack",1,20]]],["V_Rangemaster_belt",[]],["cgqc_pack_mk1_magic",[["ACE_EntrenchingTool",1],["ACRE_PRC117F",1],["ACRE_PRC117F",1],["SmokeShell",2,1],["MS_Strobe_Mag_2",1,1]]],"cgqc_beret_red","",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","immersion_cigs_cigar0_nv"]],[["ace_arsenal_insignia","cgqc_patch_cloutier"],["grad_slingHelmet","cgqc_cap_green"]]]





[[["cgqc_gun_mk1_mk12","Tier1_KAC_556_QDC_CQB_Black","Tier1_M4BII_NGAL_M600V_Black","Tier1_Razor_Gen3_110_Geissele_Docter",["grcb_mag_30Rnd_556x45_Mk262_PMAG_mix",30],[],"Tier1_Harris_Bipod_Black"],[],["cgqc_gun_p99_wood","","","",["16Rnd_9x21_Mag",17],[],""],["cgqc_uniform_mk1",[]],["V_Rangemaster_belt",[]],["cgqc_pack_mk1_magic",[[
	,,
	"cgqc_beret_red","G_mas_can_gog",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","immersion_cigs_cigar0_nv"]],[["ace_arsenal_insignia","cgqc_patch_cloutier"],["grad_slingHelmet","cgqc_cap_green"]]]




_currentWeapon = currentWeapon player;
_compatible = _currentWeapon call bis_fnc_compatibleItems;
_compatibleSilencers = [];
_hasSilencer = false;
_actualSilencer = "";
{
	_type = (_x call bis_fnc_itemType) select 1;
	if (_type isEqualTo "AccessoryMuzzle") then {
		_compatibleSilencers pushBack _x;
	};
} forEach _compatible;
// Check inventory 
if (count _compatibleSilencers > 0) then  {
	{
		_silencerClassName = _x;
		{
			_itemClassName = configName _x;
			if (_itemClassName == _silencerClassName) then {
				_hasSilencer = true;
				_actualSilencer = _itemClassName;
				break;
			}
		} forEach (items _player);
	} forEach _compatibleSilencers;
};

if (_hasSilencer) then { // Silencer found!
	player removeItem _actualSilencer;
	player addWeaponItem [_currentWeapon, _actualSilencer select 0];
};
hint "pouet";


_currentWeapon = currentWeapon player;
_compatible = _currentWeapon call bis_fnc_compatibleItems;
_compatibleSilencers = [];
_hasSilencer = false;
_actualSilencer = "";
{
	_type = (_x call bis_fnc_itemType) select 1;
	if (_type isEqualTo "AccessoryMuzzle") then {
		_compatibleSilencers pushBack _x;
	};
} forEach _compatible;
_player = player;
_currentWeapon = primaryWeapon _player;
_items = _currentWeapon call BIS_fnc_weaponComponents;

{
	_silencerClassName = _x;
	
	if (_silencerClassName in _items) then {
		// Remove the silencer from the current weapon
		player removePrimaryWeaponItem _silencerClassName;
		
		// Add the silencer to the player's backpack
		_player addBackpackItem _silencerClassName;
		
		hint format ["Silencer '%1' removed from %2 and added to backpack.", _silencerClassName, _currentWeapon];
		
		// Break the loop after finding and processing the first compatible silencer
	}
} forEach _compatibleSilencers;



gm_handgrenade_conc_dm51,gm_handgrenade_conc_dm51a1,gm_handgrenade_frag_dm51,gm_handgrenade_frag_dm51a1,gm_handgrenade_frag_rgd5,vn_chicom_grenade_mag,vn_f1_grenade_mag,vn_m34_grenade_mag,vn_m61_grenade_mag,vn_m67_grenade_mag,vn_rg42_grenade_mag,vn_rgd33_grenade_mag,vn_rgd5_grenade_mag,vn_rkg3_grenade_mag,vn_t67_grenade_mag,vn_v40_grenade_mag,CUP_HandGrenade_L109A1_HE,CUP_HandGrenade_L109A2_HE,CUP_HandGrenade_M67,HandGrenade,CUP_HandGrenade_RGD5,CUP_HandGrenade_RGO,MiniGrenade, rhs_mag_rgd5, rhs_mag_m67, rhs_mag_an_m14




[[["rhs_weap_m4a1_blockII_grip2","Tier1_KAC_556_QDC_CQB_Black","Tier1_M4BII_NGAL_M600V_Black","Tier1_Razor_Gen2_16_Geissele_Docter_PIP",["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull",30],[],"rhsusf_acc_grip2"],[],["cgqc_gun_glock19_wood","Tier1_TiRant9S","Tier1_DBALPL","Tier1_SIG_Romeo1",["Tier1_20Rnd_9x19_JHP",20],[],""],["cgqc_uniform_mk1",[["ACE_EarPlugs",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_RangeCard",1],["WBK_HeadLampItem",1],["ACE_microDAGR",1],["cgqc_items_ifak",1],["MS_Strobe_Mag_1",1,1],["acex_intelitems_notepad",1,1],["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull",1,30]]],["cgqc_vest_mk1_tan",[["Tier1_15Rnd_9x19_JHP",2,15],["rhs_mag_m67",2,1],["ACE_CTS9",3,1],["SmokeShell",3,1],["rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull",7,30]]],["cgqc_pack_mk1_Radiobag",[["ACE_EntrenchingTool",1],["Rev_darter_item",1],["ACE_UAVBattery",1],["ItemcTab",1],["JAS_GPNVG18_Full_blk_TI",1],["ACRE_PRC117F",1],["ACRE_PRC117F",1],["ACRE_PRC117F",1],["ACRE_VHF30108SPIKE",1],["SmokeShell",1,1],["MS_Strobe_Mag_2",1,1],["rhs_mag_m67",2,1]]],"cgqc_helmet_mk1","G_mas_can_shemag_gog_l",["Laserdesignator_01_khk_F","","","",["Laserbatteries",1],[],""],["ItemMap","B_UavTerminal","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","cgqc_patch_logo"]]]





Swat  
[[["Tier1_SIG_MCX_115_Virtus_300BLK_Black","Tier1_Gemtech_Halo","Tier1_MCX_NGAL_M600V_Black","Tier1_MicroT2_Black",["Tier1_30Rnd_762x35_300BLK_SMK_PMAG",30],[],"Tier1_AFG_MLOK_FDE"],[],["hgun_mas_can_p226_F","","","",["30Rnd_9x21_Mag",30],[],""],["cgqc_uniform_mk1_black",[["cgqc_items_ifak",1],["ACE_CableTie",2],["ACE_MapTools",1],["ACE_microDAGR",1],["WBK_HeadLampItem",1],["immersion_cigs_cigar0_nv",1],["grad_paceCountBeads_functions_paceCountBeads",1],["ACRE_PRC343",1],["ACRE_PRC152",1],["acex_intelitems_notepad",1,1],["murshun_cigs_lighter",1,100],["murshun_cigs_cigpack",1,20],["16Rnd_9x21_Mag",2,17]]],["UK3CB_GAF_B_MBAV_MEDIC_BLK_01",[["30Rnd_9x21_Mag",2,30],["ACE_M84",10,1],["rhs_mag_m7a3_cs",2,1],["Tier1_30Rnd_762x35_300BLK_SMK_PMAG",8,30]]],["B_ViperLightHarness_blk_F",[["ACE_EntrenchingTool",1],["ACE_Canteen",1],["SmokeShell",2,1],["MS_Strobe_Mag_2",1,1],["rhs_mag_m7a3_cs",10,1]]],"cgqc_helmet_mk1_f_black","G_mas_can_gasmask",["Rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch","JAS_GPNVG18_Full_blk_TI"]],[["ace_arsenal_insignia","cgqc_patch_cloutier"]]]


Tier1_SIG_MCX_115_Virtus_300BLK_Black


SWAT - Blackout 
[[["Tier1_SIG_MCX_115_Virtus_300BLK_Black","Tier1_KAC_556_QDC_CQB_Black","Tier1_MCX_NGAL_M300C_Black","Tier1_MicroT2_Leap_Black",["Tier1_30Rnd_762x35_300BLK_SMK_PMAG",30],[],"Tier1_AFG_MLOK_Black"],[],["cgqc_gun_glock19_wood","Tier1_TiRant9S","Tier1_DBALPL","Tier1_SIG_Romeo1",["Tier1_20Rnd_9x19_JHP",20],[],""],["cgqc_uniform_mk1_black",[["ACE_EarPlugs",1],["ItemAndroid",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_RangeCard",1],["WBK_HeadLampItem",1],["ACE_microDAGR",1],["cgqc_items_ifak",1],["tsp_lockpick",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["acex_intelitems_notepad",1,1],["Tier1_15Rnd_9x19_JHP",2,15]]],["cgqc_vest_mk1_black",[["rhs_mag_m67",4,1],["ACE_CTS9",3,1],["SmokeShell",3,1],["Tier1_30Rnd_762x35_300BLK_SMK_PMAG",8,30]]],["cgqc_pack_mk1_assault_black",[["ACE_EntrenchingTool",1],["ACE_Canteen",1],["ACE_wirecutter",1],["JAS_GPNVG18_blk",1],["rhs_mag_m67",4,1]]],"cgqc_helmet_mk1_f_black","G_mas_can_gasmask",["cgqc_item_rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","cgqc_patch_logo"]]]

SWAT - MP7 
[[["rhsusf_weap_MP7A2_grip2","rhsusf_acc_rotex_mp7","Tier1_MP7_NGAL_M300C_Black_FL","rhsusf_acc_T1_low",["rhsusf_mag_40Rnd_46x30_AP",40],[],"rhsusf_acc_grip2"],[],["cgqc_gun_glock19_wood","Tier1_TiRant9S","Tier1_DBALPL","Tier1_SIG_Romeo1",["Tier1_20Rnd_9x19_JHP",20],[],""],["cgqc_uniform_mk1_black",[["ACE_EarPlugs",1],["ItemAndroid",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_RangeCard",1],["WBK_HeadLampItem",1],["ACE_microDAGR",1],["cgqc_items_ifak",1],["tsp_lockpick",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["acex_intelitems_notepad",1,1],["Tier1_15Rnd_9x19_JHP",2,15]]],["cgqc_vest_mk1_black",[["rhs_mag_m67",4,1],["ACE_CTS9",3,1],["SmokeShell",3,1]]],["cgqc_pack_mk1_assault_black",[["ACE_EntrenchingTool",1],["ACE_Canteen",1],["ACE_wirecutter",1],["JAS_GPNVG18_blk",1],["rhs_mag_m67",4,1]]],"cgqc_helmet_mk1_f_black","G_mas_can_gasmask",["cgqc_item_rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","cgqc_patch_logo"]]]

MP5SD6
[[["UK3CB_MP5SD6","","","Tier1_MicroT2_Leap_Black",["30Rnd_9x21_Mag_SMG_02",27],[],""],[],["cgqc_gun_glock19_wood","Tier1_TiRant9S","Tier1_DBALPL","Tier1_SIG_Romeo1",["Tier1_20Rnd_9x19_JHP",20],[],""],["cgqc_uniform_mk1_black",[["ACE_EarPlugs",1],["ItemAndroid",1],["ACE_MapTools",1],["ACE_CableTie",2],["ACE_RangeCard",1],["WBK_HeadLampItem",1],["ACE_microDAGR",1],["cgqc_items_ifak",1],["tsp_lockpick",1],["ACRE_PRC343",1],["ACRE_PRC148",1],["acex_intelitems_notepad",1,1],["Tier1_15Rnd_9x19_JHP",2,15]]],["cgqc_vest_mk1_black",[["rhs_mag_m67",4,1],["ACE_CTS9",3,1],["SmokeShell",3,1],["30Rnd_9x21_Mag_SMG_02",8,30]]],["cgqc_pack_mk1_assault_black",[["ACE_EntrenchingTool",1],["ACE_Canteen",1],["ACE_wirecutter",1],["JAS_GPNVG18_blk",1],["rhs_mag_m67",4,1],["rhs_mag_m7a3_cs",1,1]]],"cgqc_helmet_mk1_f_black","G_mas_can_gasmask",["cgqc_item_rangefinder","","","",[],[],""],["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""]],[["ace_arsenal_insignia","cgqc_patch_logo"]]]


Backpack setup 
for "_i" from 1 to 3 do {player addItemToVest ""};
ACE_M84 // bangs
DIGI_M7A3 // CS 
tsp_popperCharge_auto_mag // Lock poppers


this addAction [ 
 "Check Target", {
	[cgqc_range_tgt_1,getpos tgt_1_far,getPos tgt_1_close,1,0.001] execVM "move_object.sqf";
	} 
]; 



_laptop = _this select 0;
_action = [ "menu_target_check", "Check Target", "", {
	[lane_1_check] call BIS_fnc_timeline_play;
}, {!lane_1_end} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;		
_action = [ "menu_target_check_off", "Done Checking", "", {[lane_1_check, reverse] call BIS_fnc_timeline_setReverse; [lane_1_check] call BIS_fnc_timeline_play;}, {lane_1_end} ] call ace_interact_menu_fnc_createAction;
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;		

_action = [ "menu_target_check_off", "Done Checking", "", {
	[lane_1_check, true] call BIS_fnc_timeline_setReverse;
	[lane_1_check] call BIS_fnc_timeline_play;
}, {lane_1_end} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _crate, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  

_laptop = lane_laptop_1;
_action = [ "menu_target_check", "Check Target", "", {
	[lane_check_1, false] call BIS_fnc_timeline_setReverse; 
	[lane_check_1] call BIS_fnc_timeline_play;
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_target_check_off", "Done Checking", "", {
	[lane_check_1, true] call BIS_fnc_timeline_setReverse; 
	[lane_check_1] call BIS_fnc_timeline_play; 
}, {cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction;  
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  




_laptop = lane_laptop_1;
_lane = lane_check_1; 
_check = cgqc_range_lane_1_check;
_on = cgqc_range_lane_1_on;



// Check target
_action = [ "menu_target_check", "Check Target", "", { 
 [_lane, false] call BIS_fnc_timeline_setReverse;  
 [_lane] call BIS_fnc_timeline_play; 
}, {!_check} ] call ace_interact_menu_fnc_createAction;  
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject; 
// Stop checking
_action = [ "menu_target_check_off", "Stop checking", "", { 
 [_lane, true] call BIS_fnc_timeline_setReverse;  
 [_lane] call BIS_fnc_timeline_play;  
}, {_check} ] call ace_interact_menu_fnc_createAction;   
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  




// Setup target
_action = [ "menu_target", "Setup Target", "", {
	cgqc_range_tgt_1 hideObjectGlobal false;
}, {!_on} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;


// on target 
tgt_ary_1=[];
this addEventHandler ["HitPart", {
	_mkr = "Land_PencilRed_F" createVehicle [0,0,0];
	_mkr setDir 90;
	_mkr enableSimulation false; 
	_mkr setPosASL (_this select 0 select 3); 
	lane_check_1 synchronizeObjectsAdd [_mkr];
	tgt_ary_1 = tgt_ary_1+[_mkr]
}];


// Reset 
this addAction ["remove hits",{{deletevehicle  _x} foreach ary;ary=[]}]; 
this addAction ["Activate Screen",{ 
_target=(_this select 0); 
_caller=(_this select 1); 
_id=(_this select 2); 
 
null=[] execvm "target.sqf"; 
 
},[],2,false,true,"",""];


// The good stuff
_laptop = lane_laptop_1;

_action = [ "menu_target_check", "Check Target", "", {
	[lane_check_1, false] call BIS_fnc_timeline_setReverse; 
	[lane_check_1] call BIS_fnc_timeline_play;
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_target_reset", "Reset Target", "", {
	{deletevehicle  _x} foreach tgt_ary_1;
	tgt_ary_1=[]
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_target_check_off", "Done Checking", "", {
	[lane_check_1, true] call BIS_fnc_timeline_setReverse; 
	[lane_check_1] call BIS_fnc_timeline_play; 
}, {cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction;  
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;  




this addAction ["Activate Screen",{ 
_target=(_this select 0); 
_caller=(_this select 1); 
_id=(_this select 2); 
 
null=[] execvm "target.sqf"; 
 
},[],2,false,true,"",""];


// Without the moving panel
_laptop = lane_laptop_1;

_action = [ "menu_target_check", "Check Target", "", {
	_pipcam = "camera" camCreate [0,0,0];
	_pipcam setVectorDirAndUp [[0,-0.66,0],[0,0.33,0.66]];
	_pipcam cameraEffect ["Internal", "Back", "piprendertg"];
	_pipcam camSetFov 0.5;
	_campos = getposatl cam_1;
	_campos set [2,1];
	_pipcam setpos _campos;
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_target_reset", "Reset Target", "", {
	{deletevehicle  _x} foreach tgt_ary_1;
	tgt_ary_1=[]
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;


this addAction ["Reset target",{
	{deletevehicle  _x} foreach tgt_ary_1;
	tgt_ary_1=[]
}]; 
this addAction ["Activate Screen",{ 
_target=(_this select 0); 
_caller=(_this select 1); 
_id=(_this select 2); 
null=[] execvm "target.sqf";
},[],2,false,true,"",""];



// Avec check cam
_laptop = lane_laptop_1;

_action = [ "menu_target_check", "Check Target", "", {
	[] spawn {
		_position = getPosATL cgqc_range_tgt_1;
		_offsetVector = _position vectorFromTo getPosATL player;
		_offsetVector set [2, 0.0];
		_offsetVector = _offsetVector vectorMultiply 2;
		_offsetVector set [2, 1.0];

		_position = _position vectorAdd _offsetVector;

		_camera = "Camera" CamCreate _position;
		_camera CameraEffect ["INTERNAL", "BACK"];
		_camera CamSetFOV 0.6;
		ShowCinemaBorder False;
		_camera CamSetTarget cgqc_range_tgt_1;
		_camera CamCommit 0;
		Sleep 5.0;
		_camera CameraEffect ["TERMINATE", "BACK"];
		CamDestroy _camera;
	};
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "menu_target_reset", "Reset Target", "", {
	{deletevehicle  _x} foreach tgt_ary_1;
	tgt_ary_1=[]
}, {!cgqc_range_lane1_check} ] call ace_interact_menu_fnc_createAction; 
_adding = [ _laptop, 0, ["ACE_MainActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Original settings 
class CfgMovesFatigue
{
	staminaDuration = 90; //total amount of stamina
	staminaRestoration = 45; //time required for your current stamina pool (total stamina - inventory load) to restore
	staminaCooldown = 0.1;  //when you run out of stamina the sprinting is disabled for this duration
	terrainDrainSprint = -0.2; //when terrain gradient disable sprint, this stamina value is added to every animation state (do not stack with following terrain threshold)
	terrainDrainRun = -0.8; //when terrain gradient enable force walk, this stamina value is added to every animation state (do not stack with previous terrain threshold)
	terrainSpeedCoef = 0.9; //when terrain gradient disable sprint, animation speed is multiplied by this value
};
class CfgInventoryGlobalVariable
{
	maxSoldierLoad = 1800;
};


// Vanilla settings 
class CfgMovesFatigue
{
	staminaDuration = 60;
	staminaCooldown = 10;
	staminaRestoration = 30;
	aimPrecisionSpeedCoef = 5;
	terrainDrainSprint = -1;
	terrainDrainRun = -1;
	terrainSpeedCoef = 0.9;
};

// Vanilla slope specs
class CfgSlopeLimits
{
	maxRun = "0.436332f";
	maxRunAI = "0.6f";
	maxSprint = "0.174533f";
	maxSprintAI = "0.4f";
	minRun = "-0.8f";
	minRunAI = "-0.8f";
	minSprint = "-0.349066f";
	minSprintAI = "-0.5f";
	class Duty
	{
		maxDuty = 1;
		maxSlope = 0.839;
		minDuty = 0.15;
		minSlope = -1;
		optimalSlope = -0.268;
	};
};