private _unit = _this select 0;

if (_unit getHitPointDamage "hitface" >= 0.9) exitWith {true};
//if (_unit getHit "body" >= 0.9) exitWith {true};
false
