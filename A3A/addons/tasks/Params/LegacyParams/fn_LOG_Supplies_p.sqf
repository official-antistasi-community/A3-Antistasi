
private _possibleMarkers = [];
private _weightedMarkers = [];
{
	private _dist = getMarkerPos _x distance2D getMarkerPos respawnTeamPlayer;
	private _supportReb = (server getVariable _x) select 3;
	if (_dist < distanceMission && _supportReb < 90) then {
		private _weight = (100 - _supportReb) * ((distanceMission - _dist) ^ 2);
		_possibleMarkers pushBack _x;
		_weightedMarkers append [_x, _weight];
	};
}forEach (citiesX - destroyedSites);

if ( _possibleMarkers isEqualTo []) exitWith {false};
selectRandomWeighted _weightedMarkers;
