/*
    Splits mission reward between nearby players and the commander
    Commander takes 1/5 of the total

Parameters:
    <NUMBER> Total reward
    <GROUP or BOOL> Group of player to reward, true for group of nearest player, false for all players
    <POSITION or OBJECT> Optional: Position to search from (applies for all modes)
    <NUMBER> Optional: Radius to search within (applies for all modes)

*/

params ["_totReward", "_group", ["_position", [0,0,0]], ["_radius", 1e7]];
if (_position isEqualType objNull) then { _position = getPosATL _position };

private _rewardPlayers = call {
    if (_group isEqualType grpNull) exitWith {
        units _group inAreaArray [_position, _radius, _radius] select { isPlayer _x };
    };
    private _allPlayers = playableUnits;        // probably don't want to reward corpses
    if (!_group) exitWith {
        _allPlayers inAreaArray [_position, _radius, _radius];
    };
    // _group == true, use nearest player to determine group
    private _distances = _allPlayers apply { _x distance2d _position };
    private _nearPlayer = _allPlayers select (_distances find selectMin _distances);
    units _nearPlayer inAreaArray [_position, _radius, _radius];
};

// Now have list of players to be rewarded, add in the commander

if (!isNull theBoss) then {
    private _bossReward = 0.2 * _totReward;
    _totReward = 0.8 * _totReward;
    if (theBoss in _rewardPlayers) then { _bossReward = _bossReward + _totReward / count _rewardPlayers };
    [round _bossReward, theBoss] call A3A_fnc_playerScoreAdd;
};

private _reward = round (_totReward / (count _rewardPlayers max 1));
{ [_reward, _x] call A3A_fnc_playerScoreAdd } forEach (_rewardPlayers - [theBoss]);
