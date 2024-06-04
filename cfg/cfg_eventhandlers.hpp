class Extended_PreStart_EventHandlers
{
    class CGQC
    {
        // This will be executed once before entering the main menu.
        // init = QUOTE(call COMPILE_FILE(XEH_preStart));
        //clientInit = "call CGQC_fnc_preStart_client";
        //init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};
class Extended_PreInit_EventHandlers
{
    class CGQC
    {
        // This will be executed once in 3DEN, main menu and before briefing has started for every mission
        init = "[] spawn CGQC_fnc_preInit";
        serverInit = "[] spawn CGQC_fnc_preInitServer";
        clientInit = "[] spawn CGQC_fnc_preInitClient";
    };
};
class Extended_PostInit_EventHandlers
{
    class CGQC
    {
        // This will be executed once for each mission, once the mission has started
        init = "[] spawn CGQC_fnc_postInit";
        serverInit = "[] spawn CGQC_fnc_postInitServer";
        clientInit = "[] spawn CGQC_fnc_postInitClient";

    };
};