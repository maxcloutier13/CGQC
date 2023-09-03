// --- cfgContainers ----------------------------------------------------------
// Anything that contains shits

class Land_Ammobox_rounds_F;
class Land_CanisterFuel_F;
class Box_NATO_Equip_F;
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
// Mk1 Ressuply box
class Box_NATO_Wps_F;
class cgqc_box_mk1_supplies : Box_NATO_Wps_F
{
    scope = 2;
    author = "silent1";
    _generalMacro = "cgqc_box_mk1_supplies";
    displayName = "CGQC Infantry Supply box";
    maximumLoad = 3000;
    hiddenSelectionsTextures[] = {
        "\CGQC\containers\cgqc_box_mk1_supplies.paa",
        "\CGQC\containers\cgqc_box_mk1_ammobox.paa"
    };
    class EventHandlers
    {
        init = "[_this] call CGQC_fnc_loadSupplyBox";
    };
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
// Mk3 Arsenal
class B_supplyCrate_F;
class cgqc_box_mk2_arsenal : B_supplyCrate_F
{
    scope = 2;
    author = "silent1";
    _generalMacro = "cgqc_box_mk2_arsenal";
    displayName = "CGQC MK3 Arsenal";
    hiddenSelectionsTextures[] = {"\CGQC\containers\cgqc_box_mk3.paa"};
    editorPreview = "\A3\EditorPreviews_F_Orange\Data\CfgVehicles\C_IDAP_supplyCrate_F.jpg";
    ace_cargo_canLoad = 1;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 1;
    ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
    ace_dragging_dragPosition[] = {0, 1.5, 0};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1.5, 0])
    ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
    ace_dragging_carryPosition[] = {0, 1, 1};  // Offset of the model from the body while dragging (same as attachTo) (default: [0, 1, 1])
    ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo) (default: 0)
    //ace_refuel_fuelCargo = 10000; // Fuel cargo
    //ace_rearm_defaultSupply = 10000;
    //ace_refuel_hooks[] = {{0.38,-3.17,-.7},{-0.41,-3.17,-.7}}; // Nozzle hooks positions

    class EventHandlers
    {
        init = "[_this, 'arsenal'] call CGQC_fnc_loadMk3Menu";
    };
    class TransportMagazines{};
    class TransportWeapons{};
    class TransportItems{};
    class TransportBackpacks{};
};
// Parachute stuff
class cgqc_box_mk2_parachute : Box_NATO_Equip_F
{
    scope = 2;
    author = "silent1";
    _generalMacro = "cgqc_box_mk2_parachute";
    displayName = "CGQC MK2 Parachute Box";
    hiddenSelectionsTextures[] = {"\CGQC\containers\cgqc_box_mk2_red.paa",
                                  "\CGQC\containers\cgqc_box_mk2_parachutes.paa"};
    editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_NATO_Equip_F.jpg";
    ace_cargo_canLoad = 0;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 1;
    class SimpleObject
    {
        eden = 1;
        animate[] = {};
        hide[] = {};
        verticalOffset = 0.382;
        verticalOffsetWorld = 0;
        init = "''";
    };
    class TransportMagazines
    {
    };
    class TransportWeapons
    {
    };
    class TransportItems
    {
        class _xx_ACE_Altimeter
        {
            count = 30;
            name = "ACE_Altimeter";
        };
    };
    class TransportBackpacks
    {
        class _xx_B_Parachute
        {
            backpack = "B_Parachute";
            count = 30;
        };
    };
    class EventHandlers
    {
        init = "[_this, 'para'] call CGQC_fnc_loadMk3Menu";
    };
};
// Diving stuff
class cgqc_box_mk2_diving : Box_NATO_Equip_F
{
    scope = 2;
    author = "silent1";
    _generalMacro = "cgqc_box_mk2_diving";
    displayName = "CGQC MK2 Diving box";
    hiddenSelectionsTextures[] = {"\CGQC\containers\cgqc_box_mk2_blue.paa",
                                  "\CGQC\containers\cgqc_box_mk2_plongee.paa"};
    editorPreview = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_NATO_Equip_F.jpg";
    ace_cargo_canLoad = 0;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 1;
    class SimpleObject
    {
        eden = 1;
        animate[] = {};
        hide[] = {};
        verticalOffset = 0.382;
        verticalOffsetWorld = 0;
        init = "''";
    };
    class TransportMagazines
    {
    };
    class TransportWeapons
    {
    };
    class TransportItems
    {
        class _xx_cgqc_uniform_mk1_diver
        {
            count = 30;
            name = "cgqc_uniform_mk1_diver";
        };
        class _xx_cgqc_backpack_mk1_diver
        {
            count = 30;
            name = "cgqc_backpack_mk1_diver";
        };
        class _xx_cgqc_goggles_mk1_diver
        {
            count = 30;
            name = "cgqc_goggles_mk1_diver";
        };
    };
    class EventHandlers
    {
        init = "[_this, 'dive'] call CGQC_fnc_loadMk3Menu";
    };
};

// Mk2 Cargo container
class Land_Cargo10_military_green_F;
class cgqc_box_mk2_cargo : Land_Cargo10_military_green_F
{
    scope = 2;
    author = "silent1";
    _generalMacro = "cgqc_box_mk2_cargo";
    displayName = "CGQC MK2 Cargo Container";
    model = "\cgqc_2022\containers\cgqc_box_cargo.p3d";
    ace_cargo_canLoad = 0;  // Enables the object to be loaded (1-yes, 0-no)
    ace_cargo_noRename = 1;
    class EventHandlers
    {
        init = "[_this, 'cargo'] call CGQC_fnc_loadMk3Menu";
    };
};

class B_AssaultPack_rgr;
class cgqc_pack_mk1_magic : B_AssaultPack_rgr
{
    scope = 2;
    author = "silent1";
    displayName = "CGQC Backpack magique";
    hiddenSelectionsTextures[] = {""};
    model = "\A3\weapons_f\empty";
    class TransportMagazines
    {
        class _xx_SmokeShell
        {
            count = 2;
            magazine = "SmokeShell";
        };
    };
    class TransportItems
    {
        class _xx_ACE_EntrenchingTool
        {
            count = 1;
            name = "ACE_EntrenchingTool";
        };
         class _xx_ACE_Canteen
        {
            count = 1;
            name = "ACE_Canteen";
        };
    };
    class TransportWeapons
    {
    };
};

class cgqc_pack_mk1_magic_zeus : B_AssaultPack_rgr
{
    scope = 2;
    author = "silent1";
    displayName = "CGQC Backpack Zeus";
    hiddenSelectionsTextures[] = {""};
    model = "\A3\weapons_f\empty";
    maximumLoad = 800;
};

class B_SCBA_01_F;
//Diver Rebreather
class cgqc_backpack_mk1_diver : B_SCBA_01_F
{
    author = "silent1";
    _generalMacro = "cgqc_vest_mk1_diver";
    displayName = "CGQC Tank Plongeur";
	maximumLoad = 365;
    mass = 60;
};