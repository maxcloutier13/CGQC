class Man;
class CAManBase: Man {
	maxGunElev = 80;
	class ACE_Actions {
		class ACE_MainActions {
			class cgqc_inspect_detail {
				displayName = "Rapid Gear Inspection";
				condition = "true";
				statement = "[0] execVM '\cgqc\functions\fnc_inspect.sqf'";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Quick check of the essentials'";
			};
			class cgqc_inspect {
				displayName = "Full Gear Inspection";
				condition = "true";
				statement = "[1] execVM '\cgqc\functions\fnc_inspect.sqf'";
				exceptions[] = {"isNotInside","isNotSitting"};
				icon = "CGQC\textures\search.paa";
				runOnHover = "hint 'Inspect the soldiers gear'";
			};
			/*
			class cgqc_openIfak {
				displayName = "Open target's IFAK";
				condition = "[cursorTarget, 'cgqc_items_ifak'] call BIS_fnc_hasItem";
				statement = "['ifak', cursorTarget] execVM '\cgqc\functions\fnc_openItem.sqf'";
				exceptions[] = {};
				icon = "\CGQC\textures\icon_med";
				runOnHover = "hint 'Open the target soldiers IFAK'";
			};*/
		};
	};
	class ACE_SelfActions {
		class aceax_ingame_gear
		{
			//displayName = "$STR_aceax_ingame_Gear";
			condition = "false";
			//icon = "\z\aceax\addons\ingame\data\gear.paa";
			//exceptions[] = {"isNotInside","isNotSitting"};
			//statement = "";
			//insertChildren = "_this call aceax_ingame_fnc_aceSelfActions";
			//priority = 0.1;
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