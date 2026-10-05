/*
    Returns the representative class of an item's variant group.
    The arsenal stores and counts all variants under this class.

Parameters:
    0. <STRING> Item classname

Returns:
    <STRING> Representative classname, or the input if the item has no variants

Environment:
    Any
*/

params ["_class"];

if (isNil "A3A_variantRep") exitWith { _class };
A3A_variantRep getOrDefault [toLower _class, _class];
