class Man;
class CAManBase: Man {
	class UserActions {
		delete sps_black_hornet_deploy;
	};
	maxGunElev = 80;
	class ACE_Actions {
		class ACE_MainActions {
			class cgqc_become_assistant {
				displayName = "Become Ammo Bearer";
				condition = "missionNamespace getVariable 'CGQC_gamestate_current' isEqualTo 'staging' || missionNamespace getVariable 'CGQC_gamestate_current' isEqualTo 'training'";
				statement = "[_target] call CGQC_fnc_becomeAmmoBearer";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "\cgqc\textures\rearm.paa";
				runOnHover = "hintSilent 'Become the player ammo bearer'";
				distance = 2;
			};
			class cgqc_check_vitals {
				displayName = "Check Vitals";
				condition = "true";
				statement = "[_target] call CGQC_fnc_checkVitals";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "\cgqc\textures\medical.paa";
				runOnHover = "hintSilent 'Confirm if patient is stable'";
				distance = 2;
			};
			/*
			class cgqc_becomeSpotter {
				displayName = "Become spotter";
				condition = "!(player in (missionNamespace getVariable 'cgqc_sniping_spotters'))";
				statement = "_spot = missionNamespace getVariable 'cgqc_sniping_spotters';_spot pushBack player;missionNamespace setVariable ['cgqc_sniping_spotters', _spot, true];";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "";
				runOnHover = "hintSilent 'Become spotter for this player'";
				distance = 2;
			};*/
			class ACE_TeamManagement {
				delete ACE_AssignTeamRed;
				delete ACE_AssignTeamGreen;
				delete ACE_AssignTeamBlue;
				delete ACE_AssignTeamYellow;
			};
			class cgqc_inspect_detail {
				displayName = "Rapid Gear Inspection";
				condition = "true";
				statement = "[0] call CGQC_fnc_inspect";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hintSilent 'Quick check of the essentials'";
				distance = 2;
				class cgqc_inspect {
					displayName = "Full Gear Inspection";
					condition = "_player getVariable 'cgqc_player_isTL' || _player getVariable 'cgqc_player_isSL' || _player getVariable 'cgqc_player_is2iC' || [player] call CGQC_fnc_checkZeus || cgqc_player_max";
					statement = "[1] call CGQC_fnc_inspect";
					exceptions[] = {"isNotInside","isNotSitting"};
					icon = "CGQC\textures\search.paa";
					runOnHover = "hintSilent 'Inspect the soldiers gear'";
					distance = 2;
				};
				class cgqc_inspect_para {
					displayName = "Inspect Para Gear";
					condition = "true";
					statement = "[] call CGQC_fnc_inspectPara";
					exceptions[] = {"isNotInside","isNotSitting"};
					icon = "";
					runOnHover = "hintSilent 'Inspect parachute setup'";
					distance = 2;
				};
			};

			class cgqc_CopyClackerCodes			{
				displayName = "Copy Clacker Codes";
				selection = "";
				statement = "[_player, _target] spawn CGQC_fnc_copyClacker";
				condition = "[_player, _target] call CGQC_fnc_copyClackerCheck";
				icon = "a3\ui_f\data\gui\rsc\RscDisplayArsenal\radio_ca.paa";
				distance = 2;
			};
			class cgqc_strip_152 {
				displayName = "Remove 152!";
				condition = "player getVariable 'cgqc_player_rank' > 3 && [_target, 'ACRE_PRC152'] call BIS_fnc_hasItem";
				statement = "['strip_152'] spawn CGQC_fnc_getStuff";
				icon = "CGQC\textures\search.paa";
				runOnHover = "hintSilent 'Remove 152s'";
				distance = 2;
			};
			class cgqc_leader_options {
				displayName = "Leader Options";
				condition = "leader player == player || _player getVariable 'cgqc_player_isSL' || _player getVariable 'cgqc_player_isTL' || [player] call CGQC_fnc_checkZeus || cgqc_player_max";
				statement = "";
				icon = "";
				runOnHover = "hintSilent 'Leaders options'";
				distance = 2;
				class cgqc_set2IC {
					displayName = "Designate: 2iC";
					condition = "true";
					statement = "['2IC', _player, _target] spawn CGQC_fnc_setLeadership";
					//statement = "[_this, 'ACRE_PRC152'] remoteExec ['addItem', owner _target ]";
					icon = "";
					runOnHover = "hintSilent 'Designate as 2iC'";
					distance = 3;
				};
				class cgqc_setTL {
					displayName = "Designate: TeamLeader";
					condition = "leader player == player || _player getVariable 'cgqc_player_isSL' || [player] call CGQC_fnc_checkZeus || cgqc_player_max";
					statement = "['TL', _player, _target] spawn CGQC_fnc_setLeadership";
					//statement = "[_this, 'ACRE_PRC152'] remoteExec ['addItem', owner _target ]";
					icon = "";
					runOnHover = "hintSilent 'Designate as TeamLeader'";
					distance = 3;
				};
				class cgqc_promotePlayer {
					displayName = "Promote Player - Rank+1";
					condition = "true";
					statement = "['target'] spawn CGQC_fnc_promotePlayer;hint 'target promoted'";
					icon = "";
					runOnHover = "hintSilent 'Promote the target to give him access to more stuff/roles'";
					distance = 3;
				};

				class cgqc_setSpecialist {
					displayName = "Give Perks";
					condition = "[player] call CGQC_fnc_checkZeus || cgqc_player_max";
					statement = "";
					icon = "";
					runOnHover = "hintSilent 'Give perk to target'";
					distance = 3;
					class cgqc_setMedic {
						displayName = "Medic";
						condition = "true";
						statement = "['med', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Medic'";
						distance = 3;
					};
					class cgqc_setEng {
						displayName = "Engineer";
						condition = "true";
						statement = "['eng', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Engineer'";
						distance = 3;
					};
					class cgqc_setDriver {
						displayName = "Tank Driver";
						condition = "true";
						statement = "['driver', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Driver'";
						distance = 3;
					};

					class cgqc_setPilot {
						displayName = "Heli Pilot";
						condition = "true";
						statement = "['heli', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Heli Pilot'";
						distance = 3;
					};
					class cgqc_setRecon {
						displayName = "Recon";
						condition = "true";
						statement = "['recon', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Recon'";
						distance = 3;
					};
					class cgqc_setHeavy {
						displayName = "Heavy loads";
						condition = "true";
						statement = "['at', false] remoteExec ['CGQC_fnc_switchPerks', owner _target];";
						icon = "";
						runOnHover = "hintSilent 'Designate as Heavy'";
						distance = 3;
					};
				};
			};
			/*
			class cgqc_qualification {
				displayName = "Qualifications";
				condition = "([player] call CGQC_fnc_checkZeus || cgqc_player_max) && !cgqc_qualif_on";
				statement = "";
				exceptions[] = {"isNotInside","isNotSitting"};
				//icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Qualifications diverses'";
				distance = 2;
				class cgqc_qualification_shooting {
					displayName = "Shooting";
					condition = "true";
					statement = "";
					exceptions[] = {"isNotInside","isNotSitting"};
					runOnHover = "hint 'Qualifications de tir'";
					distance = 2;
					class cgqc_qualification_shooting_rifle {
						displayName = "Service Rifle 100-500m";
						condition = "true";
						statement = "['rifle', 'prep', _target] spawn CGQC_fnc_trainingQualification;";
						exceptions[] = {"isNotInside","isNotSitting"};
						runOnHover = "hint 'Qualifications de tir avec une arme standard'";
						distance = 2;
					};
				};
			};
			*/

			/*
			_action = [ "menu_qualif_range_s", "Short-Range 10-35m", "", {""}, {} ] call ace_interact_menu_fnc_createAction;
			_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_qualif", "menu_qualif_range"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_qualif_range_d", "DMR 150-800m", "", {""}, {} ] call ace_interact_menu_fnc_createAction;
			_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_qualif", "menu_qualif_range"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_qualif_range_p", "Precision 600-1100m", "", {""}, {} ] call ace_interact_menu_fnc_createAction;
			_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_qualif", "menu_qualif_range"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			_action = [ "menu_qualif_range_lr", "Long-Range 1000-1500m", "", {""}, {} ] call ace_interact_menu_fnc_createAction;
			_adding = [ player, 1, ["ACE_SelfActions", "menu_self_training", "menu_qualif", "menu_qualif_range"], _action ] call  ace_interact_menu_fnc_addActionToObject;
			*/

			// Test médical?
			// Test landnavigation
			// Test déminage
		};
	};
	class ACE_SelfActions {
		// Remove this thing
		delete aceax_ingame_gear;
		delete fox_self;
		delete ACE_BlackHornet;
		class ACE_Equipment {
			delete RetentionLanyard_In;
			delete RetentionLanyard_Off;
			class ACE_BlackHornet
			{
				icon = "\x\SPS\Vehicles\sps_blackhornet\Data\UI\sps_blackhornet_CA.paa";
				displayName = "Launch Black Hornet";
				condition = "SPS_BlackHornet_EnableACEInteraction && alive _player && _player == vehicle _player && 'sps_black_hornet_01_Static_F' in (items _player)";
				statement = "_pos = this getPos [1.5, getDir this]; _vehicle = (createVehicle [""sps_black_hornet_01_F"", _pos, [], 0, ""FLY""]); _vehicle setDir (getDir this); createVehicleCrew _vehicle; this removeItem 'sps_black_hornet_01_Static_F'; _vehicle setPosATL [_pos select 0, _pos select 1, ((getPosATL this) select 2) + 1.125];_vehicle flyInHeight(((getPosATL this) select 2) + 2);";
			};
			class azm_bft_main {
				class azm_bft_tx {
					class cgqc_bft_startTX{
						displayName = "CGQC Quick Transmit";
						condition = "!AZMBFT_isTransmitting";
						exceptions[] =  {"isNotDragging", "isNotSwimming", "notOnMap", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
						statement = "['transmit'] spawn CGQC_fnc_bluforceTracker";
						icon = "";
						showDisabled = 0;
					};
				};
				class azm_bft_rx {
					class cgqc_bft_startRX {
						displayName = "CGQC Quick Receive";
						condition = "!AZMBFT_isReceiving";
						exceptions[] =  {"isNotDragging", "isNotSwimming", "notOnMap", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
						statement = "['receive'] spawn CGQC_fnc_bluforceTracker;";
						icon = "";
						showDisabled = 0;
					};
				};
			};
		};
		class ACE_TeamManagement {
			condition = "true";
			delete ACE_JoinTeamRed;
			delete ACE_JoinTeamGreen;
			delete ACE_JoinTeamBlue;
			delete ACE_JoinTeamYellow;
			delete ACE_LeaveTeam;
			class CGQC_joinColor_red {
				displayName = "1-1 Rouge";
				condition = "true";
				statement = "['RED'] call CGQC_fnc_setTeamColor";
				icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
			};
			class CGQC_joinColor_green {
				displayName = "1-2 Vert";
				condition = "true";
				statement = "['GREEN'] call CGQC_fnc_setTeamColor";
				icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
			};
			class CGQC_joinColor_blue {
				displayName = "2-2 Bleu";
				condition = "true";
				statement = "['BLUE'] call CGQC_fnc_setTeamColor";
				icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
			};
			class CGQC_joinColor_yellow {
				displayName = "2-2 Jaune";
				condition = "true";
				statement = "['YELLOW'] call CGQC_fnc_setTeamColor";
				icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
			};
			class CGQC_joinColor_leave {
				displayName = "HQ Blanc";
				condition = "true";
				statement = "['MAIN'] call CGQC_fnc_setTeamColor";
				icon = "\z\ace\addons\interaction\UI\team\team_white_ca.paa";
			};
			class CGQC_joinGroup {
				displayName = "Join Group";
				condition = "true";
				statement = "";

				icon = "\z\ace\addons\interaction\UI\team\team_management_ca.paa";
				class CGQC_joinGroup_spartan {
					displayName = "Spartan";
					condition = "true";
					statement = "['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup";

					class CGQC_joinGroup_spartan_11 {
						displayName = "1-1 Rouge";
						condition = "true";
						statement = "['Spartan', 'RED'] spawn CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
					};
					class CGQC_joinGroup_spartan_12 {
						displayName = "1-2 Vert";
						condition = "true";
						statement = "['Spartan', 'GREEN'] spawn CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
					};
					class CGQC_joinGroup_spartan_21 {
						displayName = "2-1 Bleu";
						condition = "true";
						statement = "['Spartan', 'BLUE'] spawn CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
					};
					class CGQC_joinGroup_spartan_22 {
						displayName = "2-2 Jaune";
						condition = "true";
						statement = "['Spartan', 'YELLOW'] spawn CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
					};
					class CGQC_joinGroup_spartan_0 {
						displayName = "0 - Blanc";
						condition = "true";
						statement = "['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_white_ca.paa";
					};
				};
				class CGQC_joinGroup_centaure {
					displayName = "Centaure";
					condition = "true";;
					statement = "['Centaure', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};
				class CGQC_joinGroup_griffon {
					displayName = "Griffon";
					condition = "true";
					statement = "['Griffon', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};
				class CGQC_joinGroup_hermes {
					displayName = "Hermes";
					condition = "true";
					statement = "['Hermes', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};
				class CGQC_joinGroup_orion {
					displayName = "Orion";
					condition = "true";
					statement = "['Orion', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};
				class CGQC_joinGroup_pegase {
					displayName = "Pegase";
					condition = "true";
					statement = "['Pegase', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};
				/*class CGQC_joinGroup_hq {
					displayName = "HQ";
					condition = "true";
					statement = "['HQ', 'MAIN'] spawn CGQC_fnc_joinGroup";
				};*/
			};
		};


		class ACE_Animations {
			displayName = "Animations";
			//icon = "\z\ace\addons\gestures\UI\gestures_ca.paa";
			condition = "!cgqc_mk2_animation_locked || player getVariable 'cgqc_player_rank' > 8";
			class tsp_ace_animate_cancel
			{
				//displayName = "Cancel Patate Poil";
				//icon = "tsp_animate\gui\cancel.paa";
				//statement = "[_player, ''] remoteExec  ['switchMove', 0]; (call tsp_fnc_playa) setVariable ['tsp_gestureStop', true];";
			};
			class tsp_ace_animate_emotes
			{
				displayName = "Emotes";
				//icon = "tsp_animate\gui\emotes.paa";
			};
			class tsp_ace_animate_dances
			{
				displayName = "Dances";
				//icon = "tsp_animate\gui\dances.paa";
			};
			class ace_gestures_cat_gestures
			{
				displayName = "Signals";
				//icon = "tsp_animate\gui\signal.paa";
				statement = "";
				exceptions[] = {"isNotSwimming"};
				showDisabled = 1;
				class ace_gestures_Advance
				{
					displayName = "Advance";
					condition = "false";
					statement = "[_target, 'gestureAdvance'] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_Go
				{
					displayName = "Go";
					condition = "false";
					statement = "[_target, selectRandom ['gestureGo', 'gestureGoB']] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_Follow
				{
					displayName = "Follow";
					condition = "false";
					statement = "[_target, 'gestureFollow'] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_Up
				{
					displayName = "Up";
					condition = "false";
					statement = "[_target, 'gestureUp'] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_CeaseFire
				{
					displayName = "Cease Fire";
					condition = "false";
					statement = "[_target, 'gestureCeaseFire'] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_Stop
				{
					displayName = "Stop";
					condition = "false";
					statement = "[_target, 'gestureFreeze'] call ace_common_fnc_doGesture";
					showDisabled = 1;
				};
				class ace_gestures_Forward
				{
					displayName = "Forward";
					condition = "false";
					statement = "'ace_gestures_forward' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Regroup
				{
					displayName = "Regroup";
					condition = "false";
					statement = "'ace_gestures_regroup' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Freeze
				{
					displayName = "Freeze";
					condition = "false";
					statement = "'ace_gestures_freeze' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Cover
				{
					displayName = "Cover";
					condition = "false";
					statement = "'ace_gestures_cover' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Point
				{
					displayName = "Point";
					condition = "false";
					statement = "'ace_gestures_point' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Engage
				{
					displayName = "Engage";
					condition = "false";
					statement = "'ace_gestures_engage' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Hold
				{
					displayName = "Hold";
					condition = "false";
					statement = "'ace_gestures_hold' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
				class ace_gestures_Warning
				{
					displayName = "Warning";
					condition = "false";
					statement = "'ace_gestures_warning' call ace_gestures_fnc_playSignal";
					exceptions[] = {"isNotSwimming"};
					showDisabled = 1;
				};
			};
		};
		class CGQC_Bandolier {
			displayName = "Unpack: Ammo Bandolier";
			condition = "[player, 'cgqc_bandolier_ammo'] call BIS_fnc_hasItem";
			exceptions[] = {"isNotSwimming"};
			statement = "['ammo'] spawn CGQC_fnc_openBandolier";
			icon = "\CGQC\textures\rearm.paa";
			class CGQC_Bandolier_ressupply {
				displayName = "Full Ressupply";
				condition = "[player, 'cgqc_bandolier_ammo'] call BIS_fnc_hasItem";
				statement = "['ammo'] spawn CGQC_fnc_openBandolier";
				exceptions[] = {"isNotSwimming"};
			};
			class CGQC_Bandolier_mags_all {
				displayName = "Just Mags: All";
				condition = "[player, 'cgqc_bandolier_ammo'] call BIS_fnc_hasItem";
				statement = "['all'] spawn CGQC_fnc_openBandolier";
			};
			class CGQC_Bandolier_mags_half {
				displayName = "Just Mags: Half";
				condition = "[player, 'cgqc_bandolier_ammo'] call BIS_fnc_hasItem";
				statement = "['half'] spawn CGQC_fnc_openBandolier";
			};
		};
		class CGQC_Bandolier_half {
			displayName = "Unpack: Half Bandolier";
			condition = "[player, 'cgqc_bandolier_ammo_half'] call BIS_fnc_hasItem";
			statement = "['last_half'] spawn CGQC_fnc_openBandolier";
			icon = "\CGQC\textures\rearm.paa";
		};

	};
	class Attributes {
		class SubCategory
		{
			data = "AttributeSystemSubcategory";
			control = "SubCategory";
			displayName = "CGQC";
		};
		class skipLoadout {
			displayName = "Don't switch loadout";
			tooltip = "Skip loadout switch on init";
			property = "cgqc_var_skipLoadoutSwitch";
			control = "Checkbox";
			defaultValue = "false";
			expression = "_this setVariable ['cgqc_var_skipLoadoutSwitch',_value, true];";
			condition = "objectBrain";
		};
		class colorTeam {
			displayName = "Starting colorTeam";
			tooltip = "ColorTeam to join on init";
			property = "cgqc_var_startingColorTeam";
			control = "combo";
			defaultValue = "MAIN";
			expression = "_this setVariable ['cgqc_var_startingColorTeam',_value, true];";
			condition = "objectBrain";
			typeName = "STRING";
			class Values {
				class White {
					name = "White";
					value = "MAIN";
				};
				class Red {
					name = "Red";
					value = "RED";
				};
				class Green {
					name = "Green";
					value = "GREEN";
				};
				class Blue {
					name = "Blue";
					value = "BLUE";
				};
				class Yellow {
					name = "Yellow";
					value = "YELLOW";
				};
			};
		};
		class equipment {
			displayName = "Starting Equipment";
			tooltip = "Inital loadout";
			property = "cgqc_var_startingLoadout";
			control = "combo";
			defaultValue = "basic";
			expression = "_this setVariable ['cgqc_var_startingLoadout',_value, true];";
			condition = "objectBrain";
			typeName = "STRING";
			class Values {
				class basic {
					name = "Basic";
					value = "basic";
				};
				class afghan {
					name = "Afghanistan 2015";
					value = "afg";
				};
			};
		};
		class camo {
			displayName = "Starting Camo";
			tooltip = "Inital camo set";
			property = "cgqc_var_startingCamo";
			control = "combo";
			defaultValue = "GREEN";
			expression = "_this setVariable ['cgqc_var_startingCamo',_value, true];";
			condition = "objectBrain";
			typeName = "STRING";
			class Values {
				class green {
					name = "Vert";
					value = "GREEN";
				};
				class desert {
					name = "Desert";
					value = "desert";
				};
				class multicam {
					name = "Multicam";
					value = "mcam";
				};
				class cadpat {
					name = "CadPat";
					value = "cadpat";
				};
				class black {
					name = "Noir";
					value = "black";
				};
				class white {
					name = "Arctic";
					value = "white";
				};
			};
		};
		class perks {
			displayName = "Perks";
			tooltip = "Add perks on init";
			property = "cgqc_var_startingPerks";
			control = "combo";
			defaultValue = "MAIN";
			expression = "_this setVariable ['cgqc_var_startingPerks',_value, true];";
			condition = "objectBrain";
			typeName = "STRING";
			class Values {
				class hq {
					name = "HQ";
					value = "hq";
				};
				class sl {
					name = "SquadLeader";
					value = "sl";
				};
				class tl {
					name = "TeamLeader";
					value = "tl";
				};
				class heli {
					name = "Heli Pilot";
					value = "heli";
				};
				class heli_crew {
					name = "Heli Crew";
					value = "heli_crew";
				};
				class jet {
					name = "Jet Pilot";
					value = "jet";
				};
				class driver {
					name = "Tank Driver";
					value = "driver";
				};
				class tank_crew {
					name = "Tank Crew";
					value = "tank_crew";
				};
				class recon {
					name = "Recon";
					value = "recon";
				};
				class eng {
					name = "Engineer";
					value = "eng";
				};
				class med {
					name = "Squad Medic";
					value = "med";
				};
				class lifesaver {
					name = "Combat Lifesaver";
					value = "livesaver";
				};
				class at {
					name = "Anti-Tank";
					value = "at";
				};
				class mg {
					name = "Machine-Gunner";
					value = "mg";
				};
				class mortar {
					name = "Mortar";
					value = "mortar";
				};class inf {
					name = "Infantry";
					value = "inf";
				};class zeus {
					name = "Zeus";
					value = "zeus";
				};
			};
		};
	};
};