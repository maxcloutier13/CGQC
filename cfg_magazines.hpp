class CfgMagazines {
	class acex_intelitems_base;
	class cgqc_intel_laptop : acex_intelitems_base {
		author = "silent1";
		scope = 2;
		displayName = "Intel Laptop";
		descriptionShort = CSTRING(Notepad_Description);
        picture = "ace\intelitems\ui\notepad_ca.paa";
       	model = "\a3\Props_F_Enoch\Military\Equipment\Laptop_03_F.p3d";
		acex_intelitems_control = cgqc_rsc_laptop;
	};
};

class acex_intelitems_RscNotepad;
class cgqc_rsc_laptop : acex_intelitems_RscNotepad {
    /*class controls: controls {
        class Border: Border {};
        class Background: Background {
            colorBackground[] = {0.97, 0.91, 0.77, 1};
        };
        class Header: Header {
            text = CSTRING(Notepad_DisplayName);
        };
        class Close: Close {};
        class Content: ctrlEditMulti {
            idc = IDC_CONTENT;
            style = ST_MULTI + ST_NO_RECT;
            font = "EtelkaMonospaceProBold";
            x = pixelW;
            y = POS_H(0.7);
            w = POS_W(15) - 2 * pixelW;
            h = POS_H(17.3) - pixelH;
            sizeEx = POS_H(0.9);
            shadow = 0;
            colorText[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
        };
    };*/
};