// Mod info -----------------------------------------------------------------------------------------
#include "\CGQC\cfg\cfg_patches.hpp"


// Faction
class cfgFactionClasses {
	#include "\CGQC\cfg\cfg_factions.hpp"
};

// Mods Modifications ----------------------------------------------------------------------
#include "\CGQC\cfg\cfg_mods_mods.hpp"

// Heads/Faces --------------------------------------------------------------------------------------
class CfgFaces {
	#include "\CGQC\cfg\cfg_heads.hpp"
};

// Guns and equipment
class cfgWeapons {
	#include "\CGQC\cfg\cfg_helmets.hpp"
	#include "\CGQC\cfg\cfg_guns.hpp"
	#include "\CGQC\cfg\cfg_misc.hpp"
	#include "\CGQC\cfg\cfg_uniforms.hpp"
};

// Mags and stuff
class CfgMagazines
{
	#include "\CGQC\cfg\cfg_mags.hpp"
};

// Patches
class cfgUnitInsignia {
	#include "\CGQC\cfg\cfg_insignas.hpp"
};

// Custom Editor category for units ------------------------------------------------
class CfgEditorSubcategories
{
	class EdSubcat_CGQC_Training {
		displayName = "Men (Training)";
	};
	class EdSubcat_CGQC_mk1
	{
		displayName = "Men (2024)";
	};
	class EdSubcat_CGQC_swat
	{
		displayName = "Men (SWAT)";
	};
	class EdSubcat_CGQC_vanilla
	{
		displayName = "Men (Vanilla)";
	};
	class EdSubcat_CGQC_mk1_divers
	{
		displayName = "Men (Mk2 Divers)";
	};
	class EdSubcat_CGQC_funstuff
	{
		displayName = "Funstuff";
	};
	class EdSubcat_CGQC_drones
	{
		displayName = "Drones";
	};
	class EdSubcat_CGQC_boats
	{
		displayName = "Boats";
	};
	class EdSubcat_CGQC_vic_ifv
	{
		displayName = "Vehicles (IFV)";
	};
	class EdSubcat_CGQC_vic_mbt
	{
		displayName = "Vehicles (MBT)";
	};
	class EdSubcat_CGQC_cmd
	{
		displayName = "Vehicles (Command)";
	};
	class EdSubcat_CGQC_vic_unarmed
	{
		displayName = "Vehicles (Unarmed)";
	};
	class EdSubcat_CGQC_vic_armed
	{
		displayName = "Vehicles (Armed)";
	};
	class EdSubcat_CGQC_logistics
	{
		displayName = "\CGQC";
	};
};
// Units, backpacks, flags
class cfgVehicles {
	#include "\CGQC\cfg\cfg_flags.hpp"
	#include "\CGQC\cfg\cfg_units.hpp"
	#include "\CGQC\cfg\cfg_containers.hpp"
	#include "\CGQC\cfg\cfg_items.hpp"
	#include "\CGQC\cfg\cfg_man.hpp"
	#include "\CGQC\cfg\cfg_acreVehicules.hpp"
	#include "\CGQC\cfg\cfg_vehicles.hpp"
};
// Custom functions
class cfgFunctions {
	//\CGQC functions
	#include "\CGQC\cfg\cfg_functions.hpp"
};
// Face stuff
class CfgGlasses
{
	#include "\CGQC\cfg\cfg_goggles.hpp"
};
// Sounds
class CfgSounds
{
	#include "\CGQC\cfg\cfg_sounds.hpp"
};
// Custom events
#include "\CGQC\cfg\cfg_eventhandlers.hpp"
#include "functions\lockbackpack\Extended_InventoryOpened_EventHandlers.hpp"
// ACEAX Compats ---------------------------------------------
#include "\CGQC\cfg\cfg_aceaxCompats.hpp"
// Stamina stuff
#include "\CGQC\cfg\cfg_stamina.hpp"
// Dialog stuff
#include "\CGQC\cfg\cfg_dialogs.hpp"
// Interface / UI modifications
#include "\CGQC\cfg\cfg_interface.hpp"
// Spotlight
#include "\CGQC\cfg\cfg_spotlight.hpp"
// Marker Colors
#include "\CGQC\cfg\cfg_markerColors.hpp"