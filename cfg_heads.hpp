class Default
{
	class Custom; // External class reference
};
class Man_A3 : Default
{
	class WhiteHead_01; // External class reference
	class CGQCHead_13 : WhiteHead_01
	{
		author = "silent1";
		displayName = "CGQC Cloutier";
		texture = "\CGQC\heads\cloutier\cgqc_cloutier_co.paa";
		material = "\CGQC\heads\cloutier\cgqc_cloutier.rvmat";
		head = "GreekHead_A3";
		identityTypes[] = {"Head_NATO", "Head_Euro"};
		materialWounded1 = "\CGQC\heads\cloutier\cgqc_cloutier_injury.rvmat";
		materialWounded2 = "\CGQC\heads\cloutier\cgqc_cloutier_injury.rvmat";
		textureHL = "\CGQC\heads\cloutier\cgqc_cloutier_arms.paa";
		textureHL2 = "\CGQC\heads\cloutier\cgqc_cloutier_arms.paa";
		materialHL = "\A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat";
		materialHL2 = "\A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat";
		disabled = 0;
	};
	class CGQCHead_13_0 : CGQCHead_13
	{
		author = "silent1";
		displayName = "CGQC Cloutier 0";
		texture = "\CGQC\heads\cloutier\cgqc_cloutier_co_0.paa";
		material = "\CGQC\heads\cloutier\cgqc_cloutier_0.rvmat";
		disabled = 0;
	};
	class CGQCHead_13_1 : CGQCHead_13
	{
		author = "silent1";
		displayName = "CGQC Cloutier 1";
		texture = "\CGQC\heads\cloutier\cgqc_cloutier_co_1.paa";
		material = "\CGQC\heads\cloutier\cgqc_cloutier_1.rvmat";
		disabled = 0;
	};
};