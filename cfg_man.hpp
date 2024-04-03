class Man;
class CAManBase: Man {
	maxGunElev = 80;
	class ACE_Actions {
		class ACE_MainActions {
			//delete ACE_TeamManagement;
			class ACE_TeamManagement {
				delete ACE_AssignTeamRed;
				delete ACE_AssignTeamGreen;
				delete ACE_AssignTeamBlue;
				delete ACE_AssignTeamYellow;
				class CGQC_setColor_red {
					displayName = "Team Rouge";
					condition = "true";
					statement = "['RED', _target] call CGQC_fnc_setTeamColors";
					showDisabled = 1;
					icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
				};
				class CGQC_setColor_green {
					displayName = "Team Vert";
					condition = "true";
					statement = "['GREEN', _target] call CGQC_fnc_setTeamColors";
					showDisabled = 1;
					icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
				};
				class CGQC_setColor_blue {
					displayName = "Team Bleu";
					condition = "true";
					statement = "['BLUE', _target] call CGQC_fnc_setTeamColors";
					showDisabled = 1;
					icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
				};
				class CGQC_setColor_yellow {
					displayName = "Team Jaune";
					condition = "true";
					statement = "['YELLOW', _target] call CGQC_fnc_setTeamColors";
					showDisabled = 1;
					icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
				};
				class CGQC_setColor_leave {
					displayName = "Leave Team";
					condition = "assignedTeam _player != 'MAIN'";
					exceptions[] = {};
					statement = "['MAIN', _target] call CGQC_fnc_setTeamColors";
					showDisabled = 1;
				};
			};
			class cgqc_inspect_detail {
				displayName = "Rapid Gear Inspection";
				condition = "true";
				statement = "[0] call CGQC_fnc_inspect";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Quick check of the essentials'";
				distance = 2;
			};
			class cgqc_inspect {
				displayName = "Full Gear Inspection";
				condition = "true";
				statement = "[1] call CGQC_fnc_inspect";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Inspect the soldiers gear'";
				distance = 2;
			};
			class cgqc_CopyClackerCodes
			{
				displayName = "Copy Clacker Codes";
				selection = "";
				statement = "[_player, _target] spawn CGQC_fnc_copyClacker";
				condition = "[_player, _target] call CGQC_fnc_copyClackerCheck";
				icon = "a3\ui_f\data\gui\rsc\RscDisplayArsenal\radio_ca.paa";
				distance = 2;
			};
			class cgqc_strip_152 {
				displayName = "Remove 152!";
				condition = "cgqc_player_rank > 3 && [_target, 'ACRE_PRC152'] call BIS_fnc_hasItem";
				statement = "['strip_152'] spawn CGQC_fnc_getStuff";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Remove 152s'";
				distance = 2;
			};
			class cgqc_set2IC {
				displayName = "Designate: 2iC";
				condition = "cgqc_player_isTL || [player] call CGQC_fnc_checkZeus || cgqc_player_max";
				//[_target, '2IC'] remoteExec ['CGQC_fnc_setLeadership', owner _target];
				statement = "[_target, 'ACRE_PRC152'] remoteExec ['addItem', owner _target]";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "";
				runOnHover = "hint 'Designate as 2iC'";
				distance = 3;
			};
			class cgqc_promotePlayer {
				displayName = "Promote Player";
				condition = "cgqc_player_isTL || [player] call CGQC_fnc_checkZeus || cgqc_player_max";
				statement = "remoteExec ['CGQC_fnc_promotePlayer', owner _target];hint 'target promoted'";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "";
				runOnHover = "hint 'Promote the target to give him access to more stuff/roles'";
				distance = 3;
			};
		};
	};
	class ACE_SelfActions {
		// Remove this thing
		delete aceax_ingame_gear;
		delete fox_self;
		//delete ACE_TeamManagement;
		class ACE_TeamManagement {
			delete ACE_JoinTeamRed;
			delete ACE_JoinTeamGreen;
			delete ACE_JoinTeamBlue;
			delete ACE_JoinTeamYellow;
			delete ACE_LeaveTeam;
			class CGQC_joinColor_red {
				displayName = "1-1 Rouge";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "['RED'] call CGQC_fnc_setTeamColors";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
			};
			class CGQC_joinColor_green {
				displayName = "1-2 Vert";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "['GREEN'] call CGQC_fnc_setTeamColors";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
			};
			class CGQC_joinColor_blue {
				displayName = "2-1 Bleu";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "['BLUE'] call CGQC_fnc_setTeamColors";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
			};
			class CGQC_joinColor_yellow {
				displayName = "2-2 Jaune";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "['YELLOW'] call CGQC_fnc_setTeamColors";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
			};
			class CGQC_joinColor_leave {
				displayName = "0 - Blanc";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "['MAIN'] call CGQC_fnc_setTeamColors";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_white_ca.paa";
			};
			class CGQC_joinGroup {
				displayName = "Join/Create Group";
				condition = "true";
				exceptions[] = {"isNotSwimming", "isNotSitting"};
				statement = "";
				showDisabled = 1;
				icon = "\z\ace\addons\interaction\UI\team\team_management_ca.paa";
				class CGQC_joinGroup_spartan {
					displayName = "Spartan";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "";
					showDisabled = 1;
					class CGQC_joinGroup_spartan_11 {
						displayName = "1-1 Rouge";
						condition = "true";
						exceptions[] = {"isNotSwimming", "isNotSitting"};
						statement = "['Spartan', 'RED'] call CGQC_fnc_joinGroup";
						showDisabled = 1;
						icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
					};
					class CGQC_joinGroup_spartan_12 {
						displayName = "1-2 Vert";
						condition = "true";
						exceptions[] = {"isNotSwimming", "isNotSitting"};
						statement = "['Spartan', 'GREEN'] call CGQC_fnc_joinGroup";
						showDisabled = 1;
						icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
					};
					class CGQC_joinGroup_spartan_21 {
						displayName = "2-1 Bleu";
						condition = "true";
						exceptions[] = {"isNotSwimming", "isNotSitting"};
						statement = "['Spartan', 'BLUE'] call CGQC_fnc_joinGroup";
						showDisabled = 1;
						icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
					};
					class CGQC_joinGroup_spartan_22 {
						displayName = "2-2 Jaune";
						condition = "true";
						exceptions[] = {"isNotSwimming", "isNotSitting"};
						statement = "['Spartan', 'YELLOW'] call CGQC_fnc_joinGroup";
						showDisabled = 1;
						icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
					};
					class CGQC_joinGroup_spartan_0 {
						displayName = "0 - Blanc";
						condition = "true";
						exceptions[] = {"isNotSwimming", "isNotSitting"};
						statement = "['Spartan', 'MAIN'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_white_ca.paa";
						showDisabled = 1;
					};
				};
				class CGQC_joinGroup_hermes {
					displayName = "Hermes";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['Hermes', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
				class CGQC_joinGroup_orion {
					displayName = "Orion";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['Orion', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
				class CGQC_joinGroup_centaure {
					displayName = "Centaure";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['Centaure', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
				class CGQC_joinGroup_griffon {
					displayName = "Griffon";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['Griffon', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
				class CGQC_joinGroup_pegase {
					displayName = "Pegase";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['Pegase', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
				class CGQC_joinGroup_hq {
					displayName = "HQ";
					condition = "true";
					exceptions[] = {"isNotSwimming", "isNotSitting"};
					statement = "['HQ', 'MAIN'] call CGQC_fnc_joinGroup";
					showDisabled = 1;
				};
			};
		};


		class ACE_Animations {
			displayName = "Animations";
			//icon = "\z\ace\addons\gestures\UI\gestures_ca.paa";
			condition = "!cgqc_mk2_animation_locked || cgqc_player_rank > 8";
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
	};
};