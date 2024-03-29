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