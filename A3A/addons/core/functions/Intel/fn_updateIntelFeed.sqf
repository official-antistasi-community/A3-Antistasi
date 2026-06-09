// This is a throwaway function. This needs to be replaced with a 
// better version of the intel system in some form so we can effectively
// display useful information through the feed.

// no saving, no nothing. This just processes intel

#define INTELCAP 50

if (isNil "A3A_clientIntelLog") then {A3A_clientIntelLog = [];};

params ["_type", ["_side", sideUnknown], ["_params", [[],[]]], ["_time", daytime]];

switch (toLowerANSI _type) do {
    case "def_resources": {
        private _resources = _params#2;
        if (_side == Occupants) then {
            A3A_resourcesLastOcc = [_resources, _time];
        } else {
            A3A_resourcesLastInv = [_resources, _time];
        };
    };
    default {};
};

_params params ["_shortParams","_descParams"];
private _title = localize (format ["STR_A3A_intelFeed_title_%1", _type]);
private _desc = localize (format ["STR_A3A_intelFeed_desc_%1", _type]);
_shortParams insert [0, [_title]];
_descParams insert [0, [_desc]];

A3A_clientIntelLog pushBack [format _shortParams, format _descParams, _time];
if (count A3A_clientIntelLog > INTELCAP) then {A3A_clientIntelLog deleteAt 0};