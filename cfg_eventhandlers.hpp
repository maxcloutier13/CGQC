class Extended_PreInit_EventHandlers
{
    class cgqc_init_settings_event
    {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission
        //init = "call CGQC_fnc_preInit";
        init = "execVM '\cgqc\functions\fnc_preInit.sqf'";
        //init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        // This will be executed once for each mission, once the mission has started
        //init = QUOTE(call COMPILE_FILE(XEH_postInit));
        serverInit = "execVM '\cgqc\functions\fnc_postInit_server.sqf'";
        clientInit = "execVM '\cgqc\functions\fnc_postInit_client.sqf'";
        //serverInit = "call CGQC_fnc_postInit_server";
        //clientInit = "call CGQC_fnc_postInit_client";
        //init = "call CGQC_fnc_postInit";
    };
};

class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        // This will be executed once before entering the main menu.
        // init = QUOTE(call COMPILE_FILE(XEH_preStart));
        //clientInit = "call CGQC_fnc_preStart_client";
    };
};