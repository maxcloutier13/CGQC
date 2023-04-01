class Land_Ammobox_rounds_F;
class Land_CanisterFuel_F;
class NATO_Box_Base;
// Vanilla vehicle items ===================================================================================================
// Mk1 Fuel can
class cgqc_box_vanilla_fuelcan : Land_CanisterFuel_F
{
    scope = 2;
    vehicleClass = "Ammo";
    displayName = "FuelCan (50L)";
    maximumLoad = 0; //Can't store inventory items

    ace_cargo_space = 0;  // Cargo space your vehicle has
    ace_cargo_hasCargo = 0;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
    
    ace_cargo_size = 1;  // Cargo space the object takes
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 0;  // Blocks renaming object (1-blocked, 0-allowed)
    ace_refuel_fuelCargo = 50; // Fuel cargo
    ace_refuel_hooks[] = {{0.38,-3.17,-.7},{-0.41,-3.17,-.7}}; // Nozzle hooks positions
    
    ace_refuel_canReceive = 1;

    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
};
// Mk1 Vehicle ammo can 
class cgqc_box_vanilla_ammocan :  Land_Ammobox_rounds_F
{
    scope = 2;
    vehicleClass = "Ammo";
    displayName = "Vehicle Ammo";
    maximumLoad = 0; //Can't store inventory items

    ace_cargo_space = 0;  // Cargo space your vehicle has
    ace_cargo_hasCargo = 0;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)


    ace_rearm_defaultSupply = 10;
    ace_cargo_size = 1;  // Cargo space the object takes
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 0;  // Blocks renaming object (1-blocked, 0-allowed)
    
    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
};
// CGQC vehicle items ===================================================================================================
// Mk1 Fuel can
class cgqc_box_mk1_fuelcan : NATO_Box_Base
{
    scope = 2;
    vehicleClass = "Ammo";
    displayName = "CGQC FuelCan (50L)";
    model = "\CGQC\containers\cgqc_box_vic_fuel";
    maximumLoad = 0; //Can't store inventory items

    ace_cargo_space = 0;  // Cargo space your vehicle has
    ace_cargo_hasCargo = 0;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
    
    ace_cargo_size = 1;  // Cargo space the object takes
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 0;  // Blocks renaming object (1-blocked, 0-allowed)
    ace_refuel_fuelCargo = 50; // Fuel cargo
    ace_refuel_hooks[] = {{0.38,-3.17,-.7},{-0.41,-3.17,-.7}}; // Nozzle hooks positions
    
    ace_refuel_canReceive = 1;

    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
};
// Mk1 Vehicle ammo can 
class cgqc_box_mk1_ammocan :  NATO_Box_Base
{
    scope = 2;
    vehicleClass = "Ammo";
    displayName = "CGQC Vehicle Ammo ";
    model = "\CGQC\containers\cgqc_box_vic_ammo";
    icon = "iconCrateAmmo";
    maximumLoad = 0; //Can't store inventory items

    ace_cargo_space = 0;  // Cargo space your vehicle has
    ace_cargo_hasCargo = 0;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)


    ace_rearm_defaultSupply = 10;
    ace_cargo_size = 1;  // Cargo space the object takes
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 0;  // Blocks renaming object (1-blocked, 0-allowed)
    
    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
};
// Mk2 personal stash
class cgqc_box_mk2_stash :  NATO_Box_Base
{
    scope = 2;
    vehicleClass = "Ammo";
    displayName = "CGQC Logistics Stash";
    model = "\CGQC\containers\cgqc_box_vic_ammo";
    icon = "iconCrateAmmo";
    maximumLoad = 400; //Can't store inventory items

    ace_cargo_space = 0;  // Cargo space your vehicle has
    ace_cargo_hasCargo = 0;  // Enables cargo to be loaded inside the vehicle (1-yes, 0-no)
    ace_cargo_size = 1;  // Cargo space the object takes
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 0;  // Blocks renaming object (1-blocked, 0-allowed)
    
    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
};


