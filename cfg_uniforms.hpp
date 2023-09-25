class U_B_CombatUniform_mcam;
class U_B_CombatUniform_mcam_vest;
class U_I_Wetsuit;
class UniformItem;

// Diver
class cgqc_uniform_mk1_diver : U_I_Wetsuit
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_diver";
    displayName = "CGQC Wetsuit Plongeur";
};

// Base/training
class cgqc_uniform_mk1 : U_B_CombatUniform_mcam
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1";
    displayName = "CGQC Uniforme mk1";
    hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_Soldat_Base";
        containerClass = "Supply80";
        mass = 20;
    };
};

// Desert
class cgqc_uniform_mk1_desert : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_desert";
    displayName = "CGQC Uniforme mk1 - Desert";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_Soldat_Desert";
        containerClass = "Supply80";
        mass = 20;
    };
};
// Multicam
class cgqc_uniform_mk1_mcam : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_mcam";
    displayName = "CGQC Uniforme mk1 - Multicam";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_Soldat_Mcam";
        containerClass = "Supply80";
        mass = 20;
    };
};
// Woodland
class cgqc_uniform_mk1_cadpat : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_cadpat";
    displayName = "CGQC Uniforme mk1 - Cadpat";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_soldat_cadpat";
        containerClass = "Supply80";
        mass = 20;
    };
};
class cgqc_uniform_mk1_cadpat_2 : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_cadpat";
    displayName = "CGQC Uniforme mk1 - Cadpat 2";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_soldat_cadpat_2";
        containerClass = "Supply80";
        mass = 20;
    };
};
// Black
class cgqc_uniform_mk1_black : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_black";
    displayName = "CGQC Uniforme mk1 - Black";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_soldat_black";
        containerClass = "Supply80";
        mass = 20;
    };
};

class cgqc_uniform_mk1_allBlack : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_jetpilot";
    displayName = "CGQC Pilote Hélicoptère mk1";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_soldat_black_all";
        containerClass = "Supply80";
        mass = 20;
    };
};

// Winter
class cgqc_uniform_mk1_white : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1_winter";
    displayName = "CGQC Uniforme mk1 - Winter";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_soldat_white";
        containerClass = "Supply80";
        mass = 20;
    };
};

// Pilots
class cgqc_uniform_mk1_jetpilot : cgqc_uniform_mk1
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_jetpilot";
    displayName = "CGQC Pilote de jet mk1";
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "cgqc_soldat_moderne";
        containerClass = "Supply80";
        mass = 20;
    };
};

