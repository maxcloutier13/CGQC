class Man;
class CAManBase: Man {
	maxGunElev = 80;
	class ACE_Actions {
		class ACE_MainActions {
			class cgqc_inspect_detail {
				displayName = "Rapid Gear Inspection";
				condition = "true";
				statement = "[0] call CGQC_fnc_inspect";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Quick check of the essentials'";
			};
			class cgqc_inspect {
				displayName = "Full Gear Inspection";
				condition = "true";
				statement = "[1] call CGQC_fnc_inspect";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Inspect the soldiers gear'";
			};
		};
	};
	class ACE_SelfActions {
		// Remove this thing
		delete aceax_ingame_gear;

		// Group manager

		class ACE_TeamManagement
		{
			class CGQC_group_manager
			{
				displayName = "Join Group";
				statement = "";
				condition = "true";
				icon = "\z\ace\addons\interaction\UI\team\team_management_ca.paa";
				class CGQC_group_manager_hq
				{
					displayName = "HQ";
					condition = "true";
					statement = "['HQ'] call CGQC_fnc_joinGroup";
				};
				class CGQC_group_manager_spartan
				{
					displayName = "Spartan";
					condition = "true";
					statement = "";
					class CGQC_group_manager_spartan_1
					{
						displayName = "Spartan-1";
						condition = "true";
						statement = "['Spartan-1'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
					};
					class CGQC_group_manager_spartan_2
					{
						displayName = "Spartan-2";
						condition = "true";
						statement = "['Spartan-2'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
					};
					class CGQC_group_manager_spartan_3
					{
						displayName = "Spartan-3";
						condition = "true";
						statement = "['Spartan-3'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
					};
					class CGQC_group_manager_spartan_4
					{
						displayName = "Spartan-4";
						condition = "true";
						statement = "['Spartan-4'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
					};
				};
				class CGQC_group_manager_typhon
				{
					displayName = "Typhon";
					condition = "true";
					statement = "";
					class CGQC_group_manager_typhon_1
					{
						displayName = "Typhon-1";
						condition = "true";
						statement = "['Typhon-1'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_red_ca.paa";
					};
					class CGQC_group_manager_typhon_2
					{
						displayName = "Typhon-2";
						condition = "true";
						statement = "['Typhon-2'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_blue_ca.paa";
					};
					class CGQC_group_manager_typhon_3
					{
						displayName = "Typhon-3";
						condition = "true";
						statement = "['Typhon-3'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_green_ca.paa";
					};
					class CGQC_group_manager_typhon_4
					{
						displayName = "Typhon-4";
						condition = "true";
						statement = "['Typhon-4'] call CGQC_fnc_joinGroup";
						icon = "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa";
					};
				};
				class CGQC_group_manager_recon
				{
					displayName = "Recon";
					condition = "true";
					statement = "";
					class CGQC_group_manager_hermes
					{
						displayName = "Hermes";
						condition = "true";
						statement = "['Hermes'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_orion_1
					{
						displayName = "Orion-1";
						condition = "true";
						statement = "['Orion-1'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_orion_2
					{
						displayName = "Orion-2";
						condition = "true";
						statement = "['Orion-1'] call CGQC_fnc_joinGroup";
					};
				};
				class CGQC_group_manager_centaure
				{
					displayName = "Centaure";
					condition = "true";
					statement = "";
					class CGQC_group_manager_centaure_1
					{
						displayName = "Centaure-1";
						condition = "true";
						statement = "['Centaure-1'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_centaure_2
					{
						displayName = "Centaure-2";
						condition = "true";
						statement = "['Centaure-2'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_centaure_3
					{
						displayName = "Centaure-3";
						condition = "true";
						statement = "['Centaure-3'] call CGQC_fnc_joinGroup";
					};
				};
				class CGQC_group_manager_griffon
				{
					displayName = "Griffon";
					condition = "true";
					statement = "";
					class CGQC_group_manager_griffon_1
					{
						displayName = "Griffon-1";
						condition = "true";
						statement = "['Griffon-1'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_griffon_2
					{
						displayName = "Griffon-2";
						condition = "true";
						statement = "['Griffon-2'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_griffon_3
					{
						displayName = "Griffon-3";
						condition = "true";
						statement = "['Griffon-3'] call CGQC_fnc_joinGroup";
					};
				};
				class CGQC_group_manager_pegase
				{
					displayName = "Pegase";
					condition = "true";
					statement = "";
					class CGQC_group_manager_pegase_1
					{
						displayName = "Pegase-1";
						condition = "true";
						statement = "['Pegase-1'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_pegase_2
					{
						displayName = "Pegase-2";
						condition = "true";
						statement = "['Pegase-2'] call CGQC_fnc_joinGroup";
					};
					class CGQC_group_manager_pegase_3
					{
						displayName = "Pegase-3";
						condition = "true";
						statement = "['Pegase-3'] call CGQC_fnc_joinGroup";
					};
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