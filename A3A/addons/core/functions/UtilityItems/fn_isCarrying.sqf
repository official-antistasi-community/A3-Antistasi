/*
    Check if player is carrying an Antistasi or ACE object

    Environment: Any

    Arguments:
        None

    Return Value:
        <bool> True if the player is carrying an Antistasi or ACE object

*/

// could early-out if player has no attached objects?

// Carrying an Antistasi object
if (player getVariable ["A3A_carryingObject", false]) exitWith { true };

// Currently holding a tow rope attached to live vehicle
if (!isNull (player getVariable ["SA_Tow_Ropes_Vehicle", objNull])) exitWith { true };

// ACE item carry and drag cases. Check medical?
if (player getVariable ["ace_dragging_isCarrying", false] or player getVariable ["ace_dragging_isDragging", false]) exitWith { true };

false;
