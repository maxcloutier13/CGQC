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
		displayName = "Men (Mk2)";
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
	#include "cfg_actions.hpp"
	#include "cfg_vehicles.hpp"
};

// Custom functions
class cfgFunctions {
	//CGQC functions
	#include "cfg_functions.hpp"
};

// Custom events
#include "cfg_eventhandlers.hpp"