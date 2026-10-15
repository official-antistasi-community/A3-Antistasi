/*
    Returns all functionally identical variants of an item, representative first.

Parameters:
    0. <STRING> Item classname, any member of the group

Returns:
    <ARRAY<STRING>> Variant classnames. Just the input if the item has no variants.

Environment:
    Any
*/

params ["_class"];

if (isNil "A3A_variantRep") exitWith { [_class] };
private _rep = A3A_variantRep get toLower _class;
if (isNil "_rep") exitWith { [_class] };
A3A_variantMembers get _rep;
