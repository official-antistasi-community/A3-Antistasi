class RadioIntercepted
{
    // Title displayed as text on black background.
    title = "Radio communication intercepted";
    // Small icon displayed in left part. Colored by "color".
    iconPicture = "\A3\ui_f\data\igui\cfg\simpleTasks\types\radio_ca.paa";
    // Brief description displayed as structured text. Colored by "color", filled by arguments.
    description = "%1";
    // Icon and text color (copied from taskSucceeded)
    color[] = {1,1,1,1};
    // How many seconds will the notification be displayed
    duration = 5;
    // Priority; higher number = more important; tasks in queue are selected by priority
    priority = 10;
    //Sound played when notification pops up
    sound = "taskSucceeded";
}
