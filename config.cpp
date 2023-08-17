// Mod info -----------------------------------------------------------------------------------------
#include "cfg_patches.hpp"

// Faction
class cfgFactionClasses {
	#include "cfg_factions.hpp"
};

// Mods Modifications ----------------------------------------------------------------------
#include "cfg_mods_mods.hpp"

// Heads/Faces --------------------------------------------------------------------------------------
class CfgFaces {
	#include "cfg_heads.hpp"
};

// Guns and equipment
class cfgWeapons {
	#include "cfg_helmets.hpp"
	#include "cfg_guns.hpp"
	#include "cfg_misc.hpp"
	#include "cfg_uniforms.hpp"
};

// Patches
class cfgUnitInsignia {
	#include "cfg_insignas.hpp"
};

// Custom Editor category for units ------------------------------------------------
class CfgEditorSubcategories
{
	class EdSubcat_cgqc_Training {
		displayName = "Men (Training)";
	};
	class EdSubcat_cgqc_mk1
	{
		displayName = "Men (2023)";
	};
	class EdSubcat_cgqc_swat
	{
		displayName = "Men (SWAT)";
	};
	class EdSubcat_cgqc_vanilla
	{
		displayName = "Men (Vanilla)";
	};
	class EdSubcat_cgqc_mk1_divers
	{
		displayName = "Men (Mk2 Divers)";
	};
	class EdSubcat_cgqc_spawn
	{
		displayName = "Men (Spartan)";
	};
	class EdSubcat_cgqc_spawn_cmd
	{
		displayName = "Men (Command)";
	};
	class EdSubcat_cgqc_spawn_rec
	{
		displayName = "Men (Recon)";
	};
	class EdSubcat_cgqc_spawn_pilot
	{
		displayName = "Men (Pilots)";
	};
	class EdSubcat_cgqc_funstuff
	{
		displayName = "Funstuff";
	};
	class EdSubcat_cgqc_drones
	{
		displayName = "Drones";
	};
	class EdSubcat_cgqc_boats
	{
		displayName = "Boats";
	};
	class EdSubcat_cgqc_vic_ifv
	{
		displayName = "Vehicles (IFV)";
	};
	class EdSubcat_cgqc_vic_mbt
	{
		displayName = "Vehicles (MBT)";
	};
	class EdSubcat_cgqc_cmd
	{
		displayName = "Vehicles (Command)";
	};
	class EdSubcat_cgqc_vic_unarmed
	{
		displayName = "Vehicles (Unarmed)";
	};
	class EdSubcat_cgqc_vic_armed
	{
		displayName = "Vehicles (Armed)";
	};
	class EdSubcat_cgqc_logistics
	{
		displayName = "CGQC";
	};
};

// Units, backpacks, flags
class cfgVehicles {
	#include "cfg_flags.hpp"
	#include "cfg_units.hpp"
	#include "cfg_containers.hpp"
	#include "cfg_items.hpp"
	#include "cfg_man.hpp"
	#include "cfg_acreVehicules.hpp"
	#include "cfg_vehicles.hpp"
};

// Custom functions
class cfgFunctions {
	//CGQC functions
	#include "cfg_functions.hpp"
};

// Face stuff
class CfgGlasses
{
	#include "cfg_goggles.hpp"
};

// Sounds
class CfgSounds
{
	#include "cfg_sounds.hpp"
};
// Custom events
#include "cfg_eventhandlers.hpp"
#include "functions\lockbackpack\Extended_InventoryOpened_EventHandlers.hpp"

// ACEAX Compats ---------------------------------------------
#include "cfg_aceaxCompats.hpp"

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

