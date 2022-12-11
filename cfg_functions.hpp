class CGQC {
    tag = "CGQC";
    class functions {
        // Initialisation ----------------------------------------------------------------------------
        /*class preInit {
            file = "\cgqc\functions\fnc_preInit.sqf";
            description = "Set everything that needs to be there before editor/menu/briefing";
        };
        class postInit {
            file = "\cgqc\functions\fnc_postInit.sqf";
            description = "Start everything player related";
        };
        class postInit_server {
            file = "\cgqc\functions\fnc_postInit_server.sqf";
            description = "Server-side stuff";
        };
        class postInit_client {
            file = "\cgqc\functions\fnc_postInit_client.sqf";
            description = "Client-side stuff";
        };*/
        // Fonctions ----------------------------------------------------------------------------
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
        /*  
        class setRadios {
            file = "\cgqc\functions\fnc_setRadios.sqf";
            description = "Set radio setups depending on role";
        };*/
        class lockChannels {
            file = "\cgqc\functions\fnc_lockChannels.sqf";
            description = "Lock some of the comms channels";
        };  
        class nameRadios {
            file = "\cgqc\functions\fnc_nameRadios.sqf";
            description = "Set radio channel names";
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
        class initCloutier {
            file = "\cgqc\functions\fnc_initCloutier.sqf";
            description = "It's a Cloutier thang";
        };
        class stuffCloutier {
            file = "\cgqc\functions\fnc_stuffCloutier.sqf";
            description = "It's a Cloutier thang";
        };
        class perksBasic {
            file = "\cgqc\functions\fnc_perksBasic.sqf";
            description = "Perks for the everyman";
        };
        class perksRecon {
            file = "\cgqc\functions\fnc_perksRecon.sqf";
            description = "Perks for the camoman";
        };
        class checkZeus {
            file = "\cgqc\functions\fnc_checkZeus.sqf";
            description = "Check if player is zeus";
        };
    };
};