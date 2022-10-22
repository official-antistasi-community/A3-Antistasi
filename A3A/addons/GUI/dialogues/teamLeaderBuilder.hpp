
#define CENTER_GRID_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_GRID_Y ((getResolution select 3) * 0.5 * pixelH)
#define BOTTOM safeZoneH + safeZoneY


class A3A_teamLeaderBuilder
{
  	idd = A3A_IDD_TEAMLEADERDIALOG;
  	onLoad = "[""onLoad""] spawn A3A_fnc_teamLeaderRTSPlacerDialog";
	movingenable = true;

	class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(160);
            y = BOTTOM - PX_H(41);
            w = PX_W(160);
            h = PX_H(5);
        };

        class Background : A3A_Background
        {
            x = CENTER_X(160);
            y = BOTTOM - PX_H(36);
            w = PX_W(160);
            h = PX_H(36);
        };
    };

    class Controls
    {
        class TitlebarText : A3A_TitlebarText
        {
            idc = -1;
            text = $STR_antistasi_teamleader_placer_title;
            x = CENTER_X(160);
            y = BOTTOM - PX_H(41);
            w = PX_W(160);
            h = PX_H(5);
        };

        // Main content
        class MainContent : A3A_DefaultControlsGroup
        {
      	    idc = A3A_IDC_TEAMLEADERBUILDERMAIN;
	  	    x = CENTER_X(160);
            y = BOTTOM - PX_H(36);
            w = PX_W(160);
            h = PX_H(36);

            class Controls
            {
                class BuildingControlsGroup : A3A_ControlsGroupNoHScrollbars
                {
                idc = A3A_IDC_TEAMLEADERBUILDINGGROUP;
                x = 0;
                y = PX_H(4);
                w = PX_W(160);
                h = PX_H(36);
                };
            };
        };
    // Used for preview renders. Has to be defined inline. Class inheritance incompatible. ctrlCreate incompatible.
    };

    class Objects
    {
        class VehiclePreview
        {
        idc = A3A_IDC_TEAMLEADERBUILDINGRENDER;

        type = 82;
        model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
        scale = 0.00001;  // Hide unless there is a mouse hover. This is overwritten by proper ctrlShow command on initialisation.

        direction[] = {0, -0.35, -0.65};
        up[] = {0, 0.65, -0.35};

        x = 0.5;
        y = 0.5;
        z = 0.2;

        xBack = 0.5;
        yBack = 0.5;
        zBack = 1.2;

        inBack = 1;
        enableZoom = 1;
        zoomDuration = 0.001;
        };
    };
};