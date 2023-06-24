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
        containerClass = "Supply60";
        mass = 20;
    };
};

class cgqc_uniform_mk1_rolled : U_B_CombatUniform_mcam_vest
{
    author = "silent1";
    _generalMacro = "cgqc_uniform_mk1";
    displayName = "CGQC Uniforme mk1 - Rolled";
    hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
    class ItemInfo: UniformItem
    {
        uniformModel = "-";
        uniformClass = "CGQC_Officer_Base";
        containerClass = "Supply60";
        mass = 20;
    };
};
