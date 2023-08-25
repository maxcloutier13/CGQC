// Stamina stuff
class CfgMovesFatigue
{
	staminaDuration = 75; //total amount of stamina
	staminaRestoration = 45; //time required for your current stamina pool (total stamina - inventory load) to restore
	staminaCooldown = 0.1;  //when you run out of stamina the sprinting is disabled for this duration
	//aimPrecisionSpeedCoef = 5; //aimPrecision adjusting rate coefficient between two animation states with different aimPrecision parameter value
	terrainDrainSprint = -1; //when terrain gradient disable sprint, this stamina value is added to every animation state (do not stack with following terrain threshold)
	terrainDrainRun = -1.5; //when terrain gradient enable force walk, this stamina value is added to every animation state (do not stack with previous terrain threshold)
	terrainSpeedCoef = 0.9; //when terrain gradient disable sprint, animation speed is multiplied by this value
};
// Maximum individual weight
class CfgInventoryGlobalVariable
{
	maxSoldierLoad = 1250; //De-fault: 1000 Modded:1800
};

// Slope speed penalties 
class CfgSlopeLimits
{
	maxRun = "0.6f";
	minRun = "-0.8f";
	maxSprint = "0.3f";
	minSprint = "-0.5f";
	maxRunAI = "0.6f";
	minRunAI = "-0.8f";
	maxSprintAI = "0.3f";
	minSprintAI = "-0.5f";
};