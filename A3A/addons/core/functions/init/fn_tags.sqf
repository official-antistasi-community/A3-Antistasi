//////////////////////////////////////////////////////////////////
// Function file for Armed Assault II
// Created by: Marker and Melbo
//////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

//#define _debug true   //UNCOMMENT TO RUN DEBUG, WILL SHOW TIME TAKEN AND ANY LOSS OF FRAMES
#define _refresh 0.34
#define _distance 300

private _layer = ["A3A_tags"] call BIS_fnc_rscLayer;

while{true}do{
        #ifdef _debug
                _initTime = diag_tickTime;
                _frameNo = diag_frameNo;
        #endif

   _blank = " ";

   // PLAYER NAME CHECK AND DISPLAY
        _target = cursorTarget;
        if (_target isKindOf "CAManBase" && player == vehicle player) then{
                if((side group _target == playerSide) && ((player distance _target) < _distance))then
                	{
					_weaponsplayer = weapons _target;
					_name = name _target;
                    _nameString = "";
                    _rank = [_target,"displayNameShort"] call BIS_fnc_rankParams;
                    if (count _weaponsPlayer > 0) then
                    	{
						_weaponsplayer =  _weaponsplayer select 0;
						_weaponsplayername = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "displayname");
						_weaponspic = getText (configFile >> "CfgWeapons" >> _weaponsplayer >> "picture");


	// PRINT THE RANK/NAME/WEAPON ONSCREEN

						_nameString = format ["<t size='0.5' color='#f0e68c'>%4. </t><t size='0.5' color='#f0e68c'>%1</t><br/><t size='0.5' color='#f0e68c'>%2</t><br/><img size='0.8' image='%3'/><br/>",_name, _weaponsplayername,_weaponspic,_rank];
						}
					else
						{
						_nameString = format ["<t size='0.5' color='#f0e68c'>%2. </t><t size='0.5' color='#f0e68c'>%1</t>",_name,_rank];
						};
					[_nameString,0.5,0.9,_refresh,0,0,_layer] spawn bis_fnc_dynamicText;
                };
        };
/*
	// VEHICLE DISPLAY TARGETS

        if ((_target isKindOf "Car" || _target isKindOf "Motorcycle" ||  _target isKindOf "boat" || _target isKindOf "air" || _target isKindOf "Tank") && player == vehicle player) then{
                if((side _target == playerSide) && (player distance _target) < _distance && ((count crew _target) > 0))then{

						_label = getText (configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName");
						_picture = getText (configFile >> "cfgVehicles" >> typeOf _target >> "picture");
						_driver = driver _target;
						_gunner =  gunner _target;
						_commander = commander _target;


	// Main Driver / GUNNER / COMMANDER Check


											if (Alive _driver) then
											{

											_driver = name _driver;
											_driver = format ["%1 %2 <img size='0.35' color='#7FFF70' image='images\crew_driver.paa'/><br/>",_blank, _driver];
											}
											else
											{
											_driver = "No Driver<br/>";
											};


											if (Alive _gunner) then
											{

											_gunner = name _gunner;
											_gunner = format ["%1 %2 <img size='0.35' color='#7FFF70' image='images\crew_gunner.paa'/><br/>",_blank,_gunner];
											}
											else
											{
											_gunner = "No gunner<br/>";
											};


											if (Alive _commander) then
											{

											_commander = name _commander;
											_commander = format ["%1 %2 <img size='0.35' color='#7FFF70' image='images\crew_commander.paa'/><br/>",_blank,_commander];
											}
											else
											{
											_commander = "No Commander<br/>";
											};
	// PASSENGER/CARGO COUNT

				_freePassengerSpaces = _target emptyPositions "cargo";

				_passengerSpaces = getNumber (configFile >> "CfgVehicles" >>(typeOf _target) >> "transportSoldier");


	// SETTING UP THE NAME AND IMAGE FORMATION

								_cargo = format ["%1 / %2 <img size='0.35' color='#7FFF70' image='images\crew_cargo.paa'/><br/>",_freePassengerSpaces, _passengerSpaces];

	// PRINTING OUT ON SCREEN. TO MOVE POSITION, CHANGE THE X,Y CORODINATES AFTER _printname WITHIN THE DYNAMICTEXT
						_printname = format ["<t size='0.5' color='#f0e68c'>%1 / </t><img size='0.45' image='%5'/><br/><t size='0.5' color='#f0e68c'>%2</t><t size='0.5' color='#f0e68c'>%3</t><t size='0.5' color='#f0e68c'>%6</t><t size='0.5' color='#f0e68c'>%4</t>", _label, _driver, _gunner, _cargo,_picture,_commander];

                        [_printname,0.5,0.9,_refresh,0,0,3] spawn bis_fnc_dynamicText;

                };
        };
*/
        #ifdef _debug
        player sidechat format["time: %1, frames: %2",_initTime - diag_tickTime,_frameNo - diag_frameNo];
        #endif
        sleep _refresh;

};
