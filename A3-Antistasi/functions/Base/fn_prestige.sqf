waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;
private _occupantAgressionChange = _this select 0;
private _invaderAgressionChange = _this select 1;

private _occupantCalculatedAggression = prestigeNATO + _occupantAgressionChange;
private _invaderCalculatedAggression = prestigeCSAT + _invaderAgressionChange;

if (_occupantCalculatedAggression < 0) then {_occupantCalculatedAggression = 0};
if (_occupantCalculatedAggression > 100) then {_occupantCalculatedAggression = 100};
	
if (_invaderCalculatedAggression < 0) then {_invaderCalculatedAggression = 0};
if (_invaderCalculatedAggression > 100) then {_invaderCalculatedAggression = 100};

if (_occupantCalculatedAggression > 25*(tierWar + difficultyCoef)) then {_occupantCalculatedAggression = 25*tierWar};
if (_invaderCalculatedAggression > 25*(tierWar + difficultyCoef)) then {_invaderCalculatedAggression = 25*tierWar};

if (_occupantAgressionChange != 0) then {prestigeNATO = _occupantCalculatedAggression; publicVariable "prestigeNATO"};
if (_invaderAgressionChange != 0) then {prestigeCSAT = _invaderCalculatedAggression; publicVariable "prestigeCSAT"};
prestigeIsChanging = false;

private _notificationText = "";
if ((_occupantAgressionChange > 0.25) and (_invaderAgressionChange > 0.25)) then
	{
	_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%3: ""+""%1<br/>%4: ""+""%2",_occupantAgressionChange,_invaderAgressionChange,nameOccupants,nameInvaders]
	}
else
	{
	if (_occupantAgressionChange > 0.25) then {_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%2: ""+""%1",_occupantAgressionChange,nameOccupants]} else {if (_invaderAgressionChange > 0.25) then {_notificationText = format ["<t size='0.6' color='#C1C0BB'>Aggression Change.<br/> <t size='0.5' color='#C1C0BB'><br/>%1: ""+""%2",nameInvaders,_invaderAgressionChange]}};
	};

if (_notificationText != "") then {[petros,"income",_notificationText] remoteExec ["A3A_fnc_commsMP",theBoss]};