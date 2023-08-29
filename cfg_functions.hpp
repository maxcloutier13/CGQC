class diwako_lockbackpack {
	tag="diwako_lockbackpack";
	class functions {
		file = "\cgqc\functions\lockbackpack";
		class init{postInit = 1;};
		class onOpenInventory{};
		class checkUnlockBP{};
	};
};

class CGQC {
    tag = "CGQC";
    class functions {
        // Fonctions ----------------------------------------------------------------------------
        
        class postInitServer{
            file = "\cgqc\functions\fnc_postInitServer.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class preInit{
            file = "\cgqc\functions\fnc_preInit.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class postInitClient{
            file = "\cgqc\functions\fnc_postInitClient.sqf";
            description = "Start everything player related";
        };
        class postInit{
            file = "\cgqc\functions\fnc_postInit.sqf";
            description = "Start everything before everything";
        };
        class trainingCqb{
            file = "\cgqc\functions\fnc_trainingCqb.sqf";
            description = "Cqb shenanigans";
        };
        class trainingDefense{
            file = "\cgqc\functions\fnc_trainingDefense.sqf";
            description = "Wave defense mission";
        };        
        class trainingHeli{
            file = "\cgqc\functions\fnc_trainingHeli.sqf";
            description = "Helicopter training";
        };
        class trainingKOTH{
            file = "\cgqc\functions\fnc_trainingKOTH.sqf";
            description = "King of the hill stuff";
        };
        class trainingMedical{
            file = "\cgqc\functions\fnc_trainingMedical.sqf";
            description = "Medical training";
        };
        class trainingPara{
            file = "\cgqc\functions\fnc_trainingPara.sqf";
            description = "Paradrop shenanigans";
        };
        class trainingSniping{
            file = "\cgqc\functions\fnc_trainingSniping.sqf";
            description = "Sniping shenanigans";
        };
        class trainingTime{
            file = "\cgqc\functions\fnc_trainingTime.sqf";
            description = "Sets time to current real-life date but sunrise and with nice clear weather";
        };
        class loadoutToClipboard{
            file = "\cgqc\functions\fnc_loadoutToClipboard.sqf";
            description = "Send cursorTarget's loadout to clipboard with everything to create new role";
        };
        class refuel{
            file = "\cgqc\functions\fnc_refuel.sqf";
            description = "Refuel/Repair/Ressupply";
        };
        class refuelSetup{
            file = "\cgqc\functions\fnc_refuelSetup.sqf";
            description = "Set up dynamic ressuply";
        };
        class loadoutConstructionVic{
            file = "\cgqc\functions\fnc_loadoutConstructionVic.sqf";
            description = "Add ADS to cgqc vehicles";
        };
        class addADS{
            file = "\cgqc\functions\fnc_addADS.sqf";
            description = "Add ADS to cgqc vehicles";
        };
        class inspect{
            file = "\cgqc\functions\fnc_inspect.sqf";
            description = "Inspect loadout of self or others";
        };
        class loadSupplyBox{
            file = "\cgqc\functions\fnc_loadSupplyBox.sqf";
            description = "Fill up dynamic supply box";
        };
        class loadMk3Menu{
            file = "\cgqc\functions\fnc_loadMk3Menu.sqf";
            description = " Ace menu for mk3 sheeits";
        };
        class showTransition{
            file = "\cgqc\functions\fnc_showTransition.sqf";
            description = "Black fadout/in with some information in some cases";
        };
        class switchStuff{
            file = "\cgqc\functions\fnc_switchStuff.sqf";
            description = "Switch vest/backpack for another version";
        };
        class dropChem{
            file = "\cgqc\functions\fnc_dropChem.sqf";
            description = "Drop various signals, not just chems";
        };
        class addMags{
            file = "\cgqc\functions\fnc_addMags.sqf";
            description = "Fill player with maximum mags according to settings";
        };
        class holsterWeapons{
            file = "\cgqc\functions\fnc_holsterWeapons.sqf";
            description = "Holster all weapons";
        };
        class getCustomGun{
            file = "\cgqc\functions\fnc_getCustomGun.sqf";
            description = "Get custom gun if it exists";
        };
        class switchUniform{
            file = "\cgqc\functions\fnc_switchUniform.sqf";
            description = "Switch player uniform";
        };
        class addSpares{
            file = "\cgqc\functions\fnc_addSpares.sqf";
            description = "Add spare tires/tracks to vehicles";
        };
        class addPerksSwitch{
            file = "\cgqc\functions\fnc_addPerksSwitch.sqf";
            description = "Add zeus perks on unit when Zeus takes control";
        };
        class mapShareList{
            file = "\cgqc\functions\fnc_mapShareList.sqf";
            description = "Show list of players that see your markers";
        };        
        class addItemWithOverflow{
            file = "\cgqc\functions\fnc_addItemWithOverflow.sqf";
            description = "Add items to uniform/vest/backpack/ground";
        };
        class openBandolier{
            file = "\cgqc\functions\fnc_openBandolier.sqf";
            description = "Open ammo bandoliers";
        };
        class openMedical{
            file = "\cgqc\functions\fnc_openMedical.sqf";
            description = "Open the medical pouches";
        };
        class training{
            file = "\cgqc\functions\fnc_training.sqf";
            description = "Various training related shenanigans";
        };
        class checkLoadout{
            file = "\cgqc\functions\fnc_checkLoadout.sqf";
            description = "Check if a loadout exist for that unit type";
        };
        class switchRole{
            file = "\cgqc\functions\fnc_switchRole.sqf";
            description = "Switch player role";
        };
        class getStuff{
            file = "\cgqc\functions\fnc_getStuff.sqf";
            description = "Get various items and things";
        };
        class getRadioPresets{
            file = "\cgqc\functions\fnc_getRadioPresets.sqf";
            description = "Get and set radios ";
        };
        class setRadios{
            file = "\cgqc\functions\fnc_setRadios.sqf";
            description = "Setup radios according to preset";
        };
        class addRadios{
            file = "\cgqc\functions\fnc_addRadios.sqf";
            description = "Add some specific radios to player";
        };
        class removeRadios{
            file = "\cgqc\functions\fnc_removeRadios.sqf";
            description = "Remove all radios on player";
        };
        class nameRadios {
            file = "\cgqc\functions\fnc_nameRadios.sqf";
            description = "Set radio channel names";
        };      
        class switchPrimary{
            file = "\cgqc\functions\fnc_switchPrimary.sqf";
            description = "Switch primary weapon";
        };
        class switchPerks{
            file = "\cgqc\functions\fnc_switchPerks.sqf";
            description = "Switch role perks";
        };
        class trainingLoadMenu{
            file = "\cgqc\functions\fnc_trainingLoadMenu.sqf";
            description = "Load training ace-interaction menu";
        };
        class trainingMortar{
            file = "\cgqc\functions\fnc_trainingMortar.sqf";
            description = "Manual mortar training ";
        };
        class perkGoggles{
            file = "\cgqc\functions\fnc_perksGoggles.sqf";
            description = "Change goggles";
        };
        class isDaytime {
            file = "\cgqc\functions\fnc_isDaytime.sqf";
            description = "Check if Daytime Operation";
        };
        class keepPatch {
            file = "\cgqc\functions\fnc_keepPatch.sqf";
            description = "Make sure the player patch stays";
        };
        class setPatch {
            file = "\cgqc\functions\fnc_setPatch.sqf";
            description = "Set and keep player patch on";
        };
        class findPatch {
            file = "\cgqc\functions\fnc_findPatch.sqf";
            description = "Match steam ID of known players and find patchs";
        };
        class findRank {
            file = "\cgqc\functions\fnc_findRank.sqf";
            description = "Match name prefix with rank";
        };
        class showWelcome {
            file = "\cgqc\functions\fnc_showWelcome.sqf";
            description = "Prep un message de bienvenue semi-random";
        }; 
        class loadDiary {
            file = "\cgqc\functions\fnc_loadDiary.sqf";
            description = "Post group info in default briefing";
        };  
        class addPerks {
            file = "\cgqc\functions\fnc_addPerks.sqf";
            description = "Add all perks to player";
        };
        class setZeus {
            file = "\cgqc\functions\fnc_setZeus.sqf";
            description = "Set zeus and keeps them there";
        };        
        class maxMags {
            file = "\cgqc\functions\fnc_maxMags.sqf";
            description = "Limit maximum mags on player";
        };  
        class playerKilled {
            file = "\cgqc\functions\fnc_playerKilled.sqf";
            description = "Code in the event a player gets dead";
        }; 
        class playerRespawned {
            file = "\cgqc\functions\fnc_playerRespawned.sqf";
            description = "Code in the event a player respawns";
        }; 
        class showIntro {
            file = "\cgqc\functions\fnc_showIntro.sqf";
            description = "Show intro on load";
        };
        class perksBasic {
            file = "\cgqc\functions\fnc_perksBasic.sqf";
            description = "Perks for the everyman";
        };
        class perksRecon {
            file = "\cgqc\functions\fnc_perksRecon.sqf";
            description = "Perks for the camoman";
        };
        class perksPilot {
            file = "\cgqc\functions\fnc_perksPilot.sqf";
            description = "Perks for the flyingman";
        };
        class perksZeus {
            file = "\cgqc\functions\fnc_perksZeus.sqf";
            description = "Perks for the gods";
        };
        class checkZeus {
            file = "\cgqc\functions\fnc_checkZeus.sqf";
            description = "Check if player is zeus";
        };
        class getRankedBeret {
            file = "\cgqc\functions\fnc_getRankedBeret.sqf";
            description = "Find beret for current rank";
        };
        class initTraining {
            file = "\cgqc\functions\fnc_initTraining.sqf";
            description = "Init for training units";
        };
        class zeusUnit {
            file = "\cgqc\functions\fnc_zeusUnit.sqf";
            description = "Unit double-clicked by Zeus";
        };
    };
};