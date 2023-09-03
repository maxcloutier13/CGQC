class Extended_PreInit_EventHandlers
{
    class CGQC
    {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission
        //init = "call CGQC_fnc_preInit";
        init = "[] spawn CGQC_fnc_preInit";
        //init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class CGQC
    {
        // This will be executed once for each mission, once the mission has started
        init = "[] spawn CGQC_fnc_postInit";
        serverInit = "execVM '\cgqc\functions\fnc_postInitServer.sqf'";
        clientInit = "[] spawn CGQC_fnc_postInitClient";
        //serverInit = "call CGQC_fnc_postInitServer";
        //clientInit = "call CGQC_fnc_postInit_client";
        //init = "call CGQC_fnc_postInit";
    };
};

class Extended_PreStart_EventHandlers
{
    class CGQC
    {
        // This will be executed once before entering the main menu.
        // init = QUOTE(call COMPILE_FILE(XEH_preStart));
        //clientInit = "call CGQC_fnc_preStart_client";
    };
};