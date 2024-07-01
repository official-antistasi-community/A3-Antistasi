/*
 * File: fn_adminData.sqf
 * Function: adminData
 * Author: <killerswin2>
 * Function description
 * provides admin data for the admin tab 
 * Arguments:
 * NONE
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call A3A_fnc_adminData
 *
 * Public: No
 */

private _admin = [] call A3A_fnc_getAdmin;
if (isNull _admin) exitWith {};

// are they in the admin tab?
if(isNil "A3A_DoSendAdminData") exitWith {};
if(!A3A_DoSendAdminData) exitWith {};



[] spawn 
{
    while {true} do 
    {
        if (A3A_DoSendAdminData) then 
        {
            private _countGroups = 0;
            private _countRebels = 0;
            private _countInvaders = 0;
            private _countOccupants = 0;
            private _countCiv = 0;

            {
                _countGroups = _countGroups + 1;
                switch(side _x) do {
                    case teamPlayer:
                        {
                            _countRebels = _countRebels + 1;
                        };
                    case Occupants:
                        {
                            _countOccupants = _countOccupants +	1;
                        };
                    case Invaders:
                        {
                            _countInvaders =	_countInvaders + 1;
                        };
                    case civilian:
                        {
                            _countCiv = _countCiv + 1;
                        };
                };
            } forEach allGroups;

            A3A_AdminData = [
                diag_fps                        // #0 server fps
                ,(count alldead)                // #1 deadunits
                ,count allunits                 // #2 allunits
                ,count vehicles                 // #3 AllVehicles
                ,_countRebels                   // #4 GroupsRebels
                ,_countInvaders                 // #5 GroupsInvaders
                ,_countOccupants                // #6 GroupsOccupants
                ,_countCiv                      // #7 GroupsCiv
                ,_countGroups                   // #8 GroupsTotal
                ,count (allPlayers)             // #9 Players
                ,{!alive _x} count vehicles     //#10 WreckedVehicles
                ,count entities ""              //#11 Entities
                , count hcArray                 //#12 headless client count
            ];

            private _admin = [] call A3A_fnc_getAdmin;
            if (isNull _admin) exitWith { terminate _thisScript; };

            (owner _admin) publicVariableClient "A3A_AdminData";
        } 
        else
        {
            terminate _thisScript;
        };

        sleep 0.25;
    }; 
};

