/*  This loop updates the aggression and various balance parameters every minute, and generates attacks

Environment: Server, spawned

Arguments:
    None
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
while {true} do
{
    A3A_activePlayerCount = count ((allPlayers - entities "HeadlessClient_F") select { !(_x getVariable ["isAFK", false]) });
    publicVariable "A3A_activePlayerCount";

    //Sleep if no player is online
    if (A3A_activePlayerCount == 0) then { sleep 60; continue };

    waitUntil {!prestigeIsChanging};
    prestigeIsChanging = true;

    //Calculate new values for each element
    aggressionStackOccupants = aggressionStackOccupants apply {[(_x select 0) + (_x select 1), (_x select 1)]};
    //Filter out all elements which have passed the 0 value
    aggressionStackOccupants = aggressionStackOccupants select {(_x select 0) * (_x select 1) < 0};

    //Calculate new values for each element
    aggressionStackInvaders = aggressionStackInvaders apply {[(_x select 0) + (_x select 1), (_x select 1)]};
    //Filter out all elements which have passed the 0 value
    aggressionStackInvaders = aggressionStackInvaders select {(_x select 0) * (_x select 1) < 0};

    prestigeIsChanging = false;
    [] call A3A_fnc_calculateAggression;

    // Update the recent kill lists, clear out expired entries
    { _x set [2, _x#2 - 1000] } forEach A3A_recentDamageOcc;
    { _x set [2, _x#2 - 1000] } forEach A3A_recentDamageInv;
    A3A_recentDamageOcc = A3A_recentDamageOcc select { _x#2 > 0 };
    A3A_recentDamageInv = A3A_recentDamageInv select { _x#2 > 0 };

    // Key balance numbers!
    // players ^ 0.8 because we have some enemy skill scaling, plus proportionally lower activity with higher player counts
    private _lastScale = A3A_balancePlayerScale;
    A3A_balancePlayerScale = (A3A_activePlayerCount ^ 0.8 + 1 + tierWar / 4) / 6;           // Normalized to 1 == 5 players @ war tier 6
    A3A_balancePlayerScale = A3A_balancePlayerScale * (A3A_enemyBalanceMul / 10);
    A3A_balanceVehicleCost = 100 + tierWar * 10;
    A3A_balanceResourceRate = A3A_balancePlayerScale * ([A3A_balanceVehicleCost, 140] select (gameMode == 1));          // base resources gained per 10 minutes
    publicVariable "A3A_balancePlayerScale";            // needed for determining enemy skill on headless clients

    // Rescale defence resources when player count or difficulty changes
    A3A_resourcesDefenceOcc = A3A_resourcesDefenceOcc * A3A_balancePlayerScale / _lastScale;
    A3A_resourcesDefenceInv = A3A_resourcesDefenceInv * A3A_balancePlayerScale / _lastScale;

    // Old balance param still used for marker spawning decisions at the moment
	difficultyCoef = floor (A3A_activePlayerCount / 5);
	publicVariable "difficultyCoef";

    if(gameMode != 4) then
    {
        private _aggroMul = [1.0 + aggressionOccupants/200, 0.5 + aggressionOccupants/200] select (gameMode != 1);
        private _resRateDef = _aggroMul * A3A_balanceResourceRate / 10;
        private _resRateAtk = _aggroMul * A3A_balanceResourceRate * (A3A_enemyAttackMul / 10) / 12;       // Attack rate is a bit lower than defence

        private _noAirport = -1 == airportsX findIf { sidesX getVariable _x == Occupants };
        if (_noAirport) then { _resRateDef = _resRateDef * 0.6; _resRateAtk = _resRateAtk * 0.6 };

        // Move some attack resources to or from defence depending on defence resource level
        private _maxDef = _resRateDef*100;
        private _shift = linearConversion [0, _maxDef, A3A_resourcesDefenceOcc, -0.5, 0.5, true];
        _resRateDef = _resRateDef - _resRateAtk * _shift;
        _resRateAtk = _resRateAtk + _resRateAtk * _shift;

        Debug_4("Adding %1 def resources to %2 and %3 atk resources to %4", _resRateDef, A3A_resourcesDefenceOcc, _resRateAtk, A3A_resourcesAttackOcc);
        A3A_resourcesDefenceOcc = (A3A_resourcesDefenceOcc + _resRateDef) min _maxDef;
        A3A_resourcesAttackOcc = A3A_resourcesAttackOcc + _resRateAtk;

        if (A3A_resourcesAttackOcc > 0 && !bigAttackInProgress) then
        {
            private _success = [Occupants] call A3A_fnc_chooseAttack;
            if (!_success) then {
                // something went wrong, don't spam
                A3A_resourcesAttackOcc = A3A_resourcesAttackOcc - _resRateAtk*10;
            };
        };
    };

    if (gameMode != 3) then
    {
        private _aggroMul = [1.0 + aggressionInvaders/200, 0.5 + aggressionInvaders/200] select (gameMode != 1);
        private _resRateDef = _aggroMul * (A3A_invaderBalanceMul / 10) * A3A_balanceResourceRate / 10;
        private _resRateAtk = _aggroMul * (A3A_invaderBalanceMul / 10) * A3A_balanceResourceRate * (A3A_enemyAttackMul / 10) / 15;

        private _noAirport = -1 == airportsX findIf { sidesX getVariable _x == Invaders };
        if (_noAirport) then { _resRateDef = _resRateDef * 0.2 };               // Invaders continue attacking but stop defending

        // Move some attack resources to or from defence depending on defence resource level
        private _maxDef = _resRateDef*100;
        private _shift = linearConversion [0, _maxDef, A3A_resourcesDefenceInv, -0.5, 0.5, true];
        _resRateDef = _resRateDef - _resRateAtk * _shift;
        _resRateAtk = _resRateAtk + _resRateAtk * _shift;

        Debug_4("Adding %1 def resources to %2 and %3 atk resources to %4", _resRateDef, A3A_resourcesDefenceInv, _resRateAtk, A3A_resourcesAttackInv);
        A3A_resourcesDefenceInv = (A3A_resourcesDefenceInv + _resRateDef) min _maxDef;
        A3A_resourcesAttackInv = A3A_resourcesAttackInv + _resRateAtk;

        if (A3A_resourcesAttackInv > 0 && !bigAttackInProgress) then
        {
            private _success = [Invaders] call A3A_fnc_chooseAttack;
            if (!_success) then {
                // something went wrong, don't spam
                A3A_resourcesAttackInv = A3A_resourcesAttackInv - _resRateAtk*10;
            };
        };
    };

    sleep 60;
};

