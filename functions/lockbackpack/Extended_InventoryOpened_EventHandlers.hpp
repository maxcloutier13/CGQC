class Extended_InventoryOpened_EventHandlers {
  class CAManBase {
    class diwako_lockbackpack_onOpenInventory {
      clientInventoryOpened = "if (_this select 0 == ACE_player) then {_this call diwako_lockbackpack_fnc_onOpenInventory};";
    };
  };
};