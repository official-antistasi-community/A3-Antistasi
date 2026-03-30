#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"


if(isNil "A3A_shoppingCart") then {
	A3A_shoppingCart = createHashMap;
};

{
	private _key = _x;
	private _map = _y;

	private _position = _map get "_position";

	if (_position isNotEqualTo 0) then 
	{
		_position = _position - 1;
		private _itemYPos =  _position * (25 * GRID_H);

		private _control = _map get "_control";
		_control ctrlSetPositionY _itemYPos;
		_control ctrlCommit 0;
		_control ctrlCommit 0.1;

		_map set ["_position", _position];

		A3A_shoppingCart set [_key, _map];
	};

} forEach A3A_shoppingCart;
