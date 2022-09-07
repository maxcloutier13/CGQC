//Sling helmet
_helmet = headgear player;
[player, _helmet] call GRAD_slingHelmet_fnc_addSlungHelmet;
// Send facestuff to backpack
_face =  Goggles player;
player addItemToBackpack _face;
//Wait a sec
sleep 1;
// Set beanie
player addHeadgear "UK3CB_H_Woolhat_BLK";
// Set glasses 
player addGoggles "G_Aviator";

