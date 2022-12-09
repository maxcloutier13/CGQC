class Extended_PreInit_EventHandlers
{
    class cgqc_init_settings_event
    {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission
        //init = "execVM '\cgqc\factions\init_settings.sqf'";
        init = "call compile preprocessFileLineNumbers '\cgqc\factions\init_settings.sqf'";
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        // This will be executed once for each mission, once the mission has started
        init = "execVM '\cgqc\factions\init_player.sqf'";
        // init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        // This will be executed once before entering the main menu.
        // init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};