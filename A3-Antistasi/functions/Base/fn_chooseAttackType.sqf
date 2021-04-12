params ["_posDestination", "_side", ["_supportName", "Small attack"]];

/*  Chooses the type of attack or QRF used against the destination position

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _posDestination: POSITION : The target destination
        _side: SIDE : The attacking side
        _supportName: STRING : The callname of the support (Optional: default is "Small attack")

    Returns:
        _typeOfAttack: STRING : The type of the attack, "" if no attack should happen
*/

private _fileName = "chooseAttackType";

//Check if unit count isnt reached
//There might be an exploit here with spawning alot of rebel units to prevent qrfs from happening
private _allAIUnits = {(alive _x) && {!(isPlayer _x)}} count allUnits;
private _allUnitsSide = 0;
private _maxUnitsSide = maxUnits;

if (gameMode <3) then
{
	_allUnitsSide = {(alive _x) && {(side group _x == _side) && {!(isPlayer _x)}}} count allUnits;
	_maxUnitsSide = round (maxUnits * 0.7);
};
if ((_allAIUnits + 4 > maxUnits) || (_allUnitsSide + 4 > _maxUnitsSide)) exitWith
{
    [2, format ["%1 to %2 cancelled because maximum unit count reached", _supportName, _posDestination], _filename] call A3A_fnc_log;
    ""
};

//If too foggy for anything abort here
if ([_posDestination,false] call A3A_fnc_fogCheck < 0.3) exitWith
{
    [2, format ["%1 to %1 cancelled due to heavy fog", _supportName, _posDestination], _filename] call A3A_fnc_log;
    ""
};

//Search for nearby enemies
private _enemyGroups = allGroups select
{
    (side _x != _side) &&
    {side _x != civilian &&
    {(getPos (leader _x) distance2D _posDestination) < distanceSPWN2}}
};
private _nearEnemies = [];
{
    _nearEnemies append ((units _x) select {alive _x});
} forEach _enemyGroups;

//Select the type of attack (or more precise against what the attack will fight)
private _typeOfAttack = "Normal";
{
	if !(isNull (objectParent _x)) then
	{
		private _enemyVehicle = objectParent _x;
		if (_enemyVehicle isKindOf "Plane") exitWith
        {
            _typeOfAttack = "Air"
        };
		if (_enemyVehicle isKindOf "Helicopter") then
		{
			_weapons = getArray (configfile >> "CfgVehicles" >> (typeOf _enemyVehicle) >> "weapons");
			if (_weapons isEqualType []) then
			{
				if (count _weapons > 1) then
                {
                    _typeOfAttack = "Air"
                };
			};
		}
		else
		{
			if (_enemyVehicle isKindOf "Tank") then
            {
                _typeOfAttack = "Tank"
            };
		};
	};
	if (_typeOfAttack != "Normal") exitWith {};
} forEach _nearEnemies;

_typeOfAttack;
