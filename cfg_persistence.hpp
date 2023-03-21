class CfgGradPersistence {
    missionTag = missionName; //String - The tag that everything in this mission will be saved under. Two missions with the same tag will overwrite each other when saving, even on different terrains. One mission can load the data of a different mission, if they are both saved under the same tag.
    loadOnMissionStart = 0;  //0/1 - Toggles automatic loading on start of mission.
    missionWaitCondition = "true"; //Statement - Condition before data will be automatically loaded. Also applies to automatic loading of JIP players.
    playerWaitCondition = "true"; // Statment - Condition before a player will be loaded. Passed parameters are [unit,side of unit,unit classname,unit roleDescription].

	// == Objects ==========================================================================================================
	// * 0-Disable * 1-editor-placed objects only * 2-AllObjects * 3-only objects that were created during the mission (either user placed or by script/module/Zeus)
    saveUnits = 2; //AI units.
    saveVehicles = 3; //Vehicles, static weapons, certain objects.
    saveContainers = 2; //Containers such as ammo boxes.
    saveStatics = 2; //Static objects such as houses, walls, trees, etc. excluding those created with grad-fortifications.
    saveGradFortificationsStatics = 3; //Static objects that were created with grad-fortifications during mission runtime.

	// == Players ==========================================================================================================
    // * 0/1 = Off/On
	// Every player is saved. Players who disconnect will be saved before his unit is deleted.
	savePlayerInventory = 1; //Toggles saving of player inventories.
    savePlayerDamage = 1; //Toggles saving of player health.
    savePlayerPosition = 1; //Toggles saving of player position.
    savePlayerMoney = 0; //Toggles saving of player money. Needs GRAD ListBuymenu or GRAD Moneymenu

	// == Others ==========================================================================================================
	saveMarkers = 2; // 0/1/2/3 - like units. Only global channel is saved
    saveTasks = 1; // 0/1 - Only global tasks and tasks with a side as owner will be saved.
    saveTriggers = 1; // 2 = re-execute. 
    saveTeamAccounts = 0; // Team money
	saveTimeAndDate = 1; // Time and date

    blacklist[] = {}; // Does what it says on the tin

    class customVariables { //Can save custom variables here
        class var1 {
            varName = "mcd_myVariable_test";
            varNamespace = "mission";
            public = 0;
        };
        class var2 {
            varName = "mcd_myPublicVariableOnAUnit_test";
            varNamespace = "unit";
            public = 1;
        };
    };
};

/*
Chat commands
#gradPersistenceLoad
Loads the mission manually, excluding players (which are typically loaded on connect).

#gradPersistenceLoadPlayers
Loads all connected players. Reloads players that were already loaded.

#gradPersistenceLoadPlayer
Load a single player by their name. Do not use quotes. Name is not case sensitive. Example: #gradPersistenceLoadPlayer mcdiod

#gradPersistenceLoadPlayer
Load a single player by their UID. Do not use quotes. Example: #gradPersistenceLoadPlayer 76564218044320063

#gradPersistenceSave
Manually saves the entire mission, including players, according to configuration.
*/