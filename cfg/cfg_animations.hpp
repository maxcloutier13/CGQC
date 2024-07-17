class CfgMovesBasic;
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class TransAnimBase;
        // Swtich from rifle to handgun
		class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon: TransAnimBase
		{
			speed = 3;
		};
        // Pull out handgun
		class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon
		{
			speed = 4;
		};
    };
};