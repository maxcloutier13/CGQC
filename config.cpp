// Mod info -----------------------------------------------------------------------------------------
#include "cfg_patches.hpp"
// Faction
class cfgFactionClasses {
	#include "cfg_factions.hpp"
};

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

// Editor categories
class CfgEditorSubcategories {
	class EdSubcat_cgqc_Training {
		displayName = "Men (Training)";
	};
};

// Units, backpacks, flags
class cfgVehicles {
	#include "cfg_flags.hpp"
	#include "cfg_units.hpp"
	#include "cfg_backpacks.hpp"
	#include "cfg_items.hpp"
};

// Custom events
#include "cfg_eventhandlers.hpp"

// Custom functions
class cfgFunctions {
	#include "cfg_functions.hpp"
};


