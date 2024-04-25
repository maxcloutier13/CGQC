class CfgMainMenuSpotlight // RscDisplayMain >> Spotlight works but is considered obsolete since SPOTREP #00064
{
	class CGQC_spotlight
	{
		text = ""; // Text displayed on the square button, converted to upper-case
		textIsQuote = 0; // 1 to add quotation marks around the text
		//picture = "\CGQC\textures\CGQC_512_synth.paa"; // Square picture, ideally 512x512
		//video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv"; // Video played on mouse hover
		action = "connectToServer ['arma3.cgqc.ca', 2302, '']";
		actionText = "Join CGQC server"; // Text displayed in top left corner of on-hover white frame
		condition = "true"; // Condition for showing the spotlight
	};
	class CGQC_dance : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_dance.paa";
	};
	class CGQC_flag : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_flag.paa";
	};
	class CGQC_nvg : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_nvg.paa";
	};
	class CGQC_swat : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_swat.paa";
	};
	class CGQC_swat2 : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_swat2.paa";
	};
	class CGQC_group : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_group.paa";
	};
	class CGQC_synthwave : CGQC_spotlight
	{
		picture = "\CGQC\textures\CGQC_512_synth.paa";
	};
};