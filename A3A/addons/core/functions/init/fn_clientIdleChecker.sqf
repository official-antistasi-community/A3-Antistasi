/*  Persistent loop to check whether player is idle and pass that information to the server

Scope: Client
Environment: Spawned

Arguments:
    None
*/

private _titleStr = localize "STR_A3A_fn_init_clientidle_title";

A3A_lastActiveTime = time;
A3A_lastPlayerDir = getDir player;

// In case commander is just controlling HC squads on the map
addMissionEventHandler ["HCGroupSelectionChanged", {
    if (player getVariable ["isAFK", false]) then {
        player setVariable ["isAFK", nil, [2, clientOwner]];
        [] spawn A3A_fnc_statistics;
    };
    A3A_lastActiveTime = time;
}];

while {true} do {
    sleep 10;
    private _oldDir = A3A_lastPlayerDir;
    A3A_lastPlayerDir = getDir player;

    // "speed player" return zero for sideways walking/crawling
    if (A3A_lastPlayerDir != _oldDir or vectorMagnitude velocity player > 0.1) then {
        A3A_lastActiveTime = time;
        if (player getVariable ["isAFK", false]) then {
            player setVariable ["isAFK", nil, [2, clientOwner]];
            [] spawn A3A_fnc_statistics;
        };
        continue;
    };

    if (time - A3A_lastActiveTime > A3A_idleTimeout and !(player getVariable ["isAFK", false])) then { 
        player setVariable ["isAFK", true, [2, clientOwner]];
        [] spawn A3A_fnc_statistics;
        if (player == theBoss) then {
            [_titleStr, localize "STR_A3A_fn_init_clientidle_warning"] call A3A_fnc_customHint;
        };
    };
};
