class RscMapControl
{
	ShowCountourInterval = 1;
	class Legend
	{
		x = "SafeZoneX + SafeZoneW - (10 * (((safezoneW / safezoneH) min 1.2) / 40))";
		y = "SafeZoneY + SafeZoneH - (3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
	};
	//fontGrid = "EtelkaNarrowMediumPro";
	sizeExGrid = 0.04; // Grid text size
	//sizeExLevel = 0.03; // Contour text size
	//sizeExLabel = 0.08; // Adjust the value to control marker label size
	//sizeExNames = 0.08;  // Adjust the value to control location name size
	//sizeExInfo = 0.03;   // Adjust the value to control information text size
};

class CfgLocationTypes
{
	class Mount
	{
		textSize = 0.06;
	};
	class Name
	{
		textSize = 1;
	};
	class Strategic: Name
	{
		textSize = 0.07;
	};
	class NameMarine: Name
	{
		textSize = 0.07;
	};
	class NameCityCapital: Name
	{
		textSize = 0.09;
	};
	class NameCity: Name
	{
		textSize = 0.08;
	};
	class NameVillage: Name
	{
		textSize = 0.07;
	};
	class NameLocal: Name
	{
		textSize = 0.07;
	};
	class Hill: Name
	{
		textSize = 0.06;
	};
	class ViewPoint: Hill
	{
		textSize = 0.06;
	};
	class Area
	{
		textSize = 0.07;
	};
};
class RscWatch: RscObject
{
	scale = 1.8;
};

class RscDisplayMainMap
{
	class objects
	{
		class Compass: RscObject
		{
			scale = 0.9;
		};
	};
};
class CfgInGameUI
{
	class IslandMap
	{
		class meCircle
		{
			color[] = {1,1,1,0};
			size = 0;
			refreshDelay = 10000;
		};
	};
};