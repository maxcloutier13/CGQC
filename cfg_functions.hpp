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
        class loadTrainingMenu{
            file = "\cgqc\functions\fnc_trainingMenu.sqf";
            description = "Load training ace-interaction menu";
        };
        class perkGoggles{
            file = "\cgqc\functions\fnc_perksGoggles.sqf";
            description = "Change goggles";
        };
        class isDaytime {
            file = "\cgqc\functions\fnc_isDaytime.sqf";
            description = "Check if Daytime Operation";
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
        class welcome {
            file = "\cgqc\functions\fnc_welcome.sqf";
            description = "Prep un message de bienvenue semi-random";
        }; 
        class briefing {
            file = "\cgqc\functions\fnc_briefing.sqf";
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