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



	