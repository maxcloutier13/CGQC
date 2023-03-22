// --- Fortification - GRAD Fortification ----------------------------------------------------------
// Settings for Grad fortif... yeah you know. 
// ==  ==============================================================================================================
class CfgGradFortifications {
    canDemolishDefault = 1;
    demolitionTimeFactor = 1;
    playerInventorySize = 70;
    vehicleInventorySizeFactor = 2;

    class Fortifications {
        class Land_BagFence_Long_F {
            boundingBoxSize = 1;
            canFloat = 1;
            canCollide = 1;
            size = 3;
            demolitionTime = 10;
        };

        class Land_HBarrier_5_F {
            boundingBoxSize = 0.8;
            surfaceNormal = 0;
            canDemolish = 0;
        };
    };

    class Vehicles {
        class cgqc_vic_construction {
            isStorage = 1;
            vehicleInventorySize = 100;
        };
    };
};


// == General Settings ==============================================================================================================
// Attribute	Default Value	Explanation
//boundingBoxSizeFactor	1	Number - Global size factor of bounding box - smaller means collision detection is less strict
//buildTimeFactor	1	Number - Higher means building takes longer.
//demolishTimeFactor	1	Number - Higher means demolitions take longer.
//packUpTimeFactor	1	Number - Higher means packing up takes longer.
//playerInventorySize	70	Number - Size of the virtual inventory of units.
//vehicleInventorySizeFactor	1	Number - Size factor for vehicle inventories.
//canDemolishDefault	1	(1/0) - Can anyone demolish fortifications by default?
//canPackUpDefault	1	(1/0) - Can fortification owners pack up fortifications by default?
//canStoreInLandVehicles	1	(1/0) - Can fortifications be stored in land vehicles?
//canStoreInShips	1	(1/0) - Can fortifications be stored in ships?
//canStoreInHelicopters	1	(1/0) - Can fortifications be stored in helicopters?
//canStoreInPlanes	1	(1/0) - Can fortifications be stored in planes?
//canStoreInContainers	1	(1/0) - Can fortifications be stored in containers (anything with an inventory that's not one of the above)?
//fortificationOwnerType	"BUILDER"	String - Who owns a fortification? Owner demolishes more quickly and can pack up the fortification. ("BUILDER"/"GROUP"/"SIDE")
//onPlaceStart	""	String - Code that is executed when unit starts placement. Local to unit. Passed: [unit,fort class name,local fort object]
//onPlaceCancel	""	String - Code that is executed when unit cancels placement. Local to unit. Passed: [unit,fort class name,local fort object]
//onBuildStart	""	String - Code that is executed when unit starts building. Local to unit. Passed: [unit,fort class name,local fort object]
//onBuildComplete	""	String - Code that is executed when unit completes building and server spawns the actual object. Local to server. Passed: [unit,fort object]


// == Fortifications ==============================================================================================================
//Create the class Fortifications inside CfgGradFortifications. Inside that class, create classes for all fortifications that you want to configure. This is entirely optional. Any object will work as a fortification out of the box. However you can configure fortifications if they don't work the way you like. These attributes are available:

// Attribute	Default Value	Explanation
// canCollide	0	(1/0) - Can this fortification be placed while colliding with other objects?
// canDemolish	1	(1/0) - Can this fortification be demolished?
// canPackUp	1	(1/0) - Can this fortification be packed up and reused?
// canFloat	0	(1/0) - Can this fortification be placed while floating?
// canPlaceOnRoad	1	(1/0) - Can this fortification be placed on roads?
// surfaceNormal	1	(1/0) - Default setting for surface normal up-vector.
// surfaceNormalForced	0	(1/0) - If forced, user will be unable to change from default setting.
// boundingBoxSizeFactor	1	Number - Size factor of bounding box for this fortification - smaller means collision detection is less strict - is factored into global boundingBoxSize
// boundingBoxOffset	[0,0,0]	Array - Offset for bounding box, vector [x,y,z].
// buildTime	dependent on actual object size	Number - Sets building time in seconds for this type of fortification. Is affected by buildTimeFactor.
// demolitionTime	dependent on actual object size	Number - Sets demolishing time in seconds for this type of fortification. Is affected by demolishTimeFactor.
// packUpTime	dependent on actual object size	Number - Sets pack up time in seconds for this type of fortification. Is affected by packUpTimeFactor.
// size	dependent on actual object size	Number - The size that this fortification takes up in the virtual inventory.
// condition	"true"	String - Custom condition that will be evaluated during placement. Arguments passed are [fortification object, unit that is placing].
// conditionHint	"CAN'T PLACE!"	String - Status that will be displayed in GUI when fotification can not be placed because of custom condition.
// onPlaceStart	""	String - Code that is executed when unit starts placement. Local to unit. Passed: [unit,fort class name,local fort object]. Overwrites general code.
// onPlaceCancel	""	String - Code that is executed when unit cancels placement. Local to unit. Passed: [unit,fort class name,local fort object]. Overwrites general code.
// onBuildStart	""	String - Code that is executed when unit starts building. Local to unit. Passed: [unit,fort class name,local fort object]. Overwrites general code.
// onBuildComplete	""	String - Code that is executed when unit completes building and server spawns the actual object. Local to server. Passed: [unit,fort object]. Overwrites general code.

// == Vehicles ==============================================================================================================
// Create the class Vehicles inside CfgGradFortifications. Inside that class, create classes for all vehicles that you want to configure. Just like the Fortifications configuration, this is entirely optional. These attributes are available:

// Attribute	Default Value	Explanation
// isStorage	1	(1/0) - Can this type of vehicle store fortifications?
// vehicleInventorySize	-1	Number - Sets inventory size of this type of vehicle. If this is set to -1, inventory size is dependent on ace_cargo_space value of vehicle.