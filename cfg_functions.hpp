class CGQC {
    tag = "CGQC";
    class functions {
        // Initialisation ----------------------------------------------------------------------------
        class preInit {
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
            description = "Server-side stuff";
        };
        // Fonctions ----------------------------------------------------------------------------
        class setPatch {
            file = "\cgqc\functions\fnc_setPatch.sqf";
            description = "Set and keep player patch on";
        };
    };
};