#include "script_component.hpp"

params ["_blue", "_red"];
_blue params ["_circleBlue", "_posBlue", "_vehicleBlue"];
_red params ["_circleRed", "_posRed", "_vehicleRed"];

private _position = (_posRed vectorAdd _posBlue) vectorMultiply 0.5;
private _vector = _posRed vectorDiff _posBlue;
private _lenght = vectorMagnitude _vector;
private _bearing = _vector call CBA_fnc_vectDir;

private _radialSpeed = (velocity _vehicleRed vectorDiff velocity _vehicleBlue) vectorDotProduct vectorNormalized _vector;
private _altDiff = (getPosASL _vehicleRed select 2) - (getPosASL _vehicleBlue select 2);
private _vRelSpeed = (velocity _vehicleRed select 2) - (velocity _vehicleBlue select 2);

private _markerIndexGCI = missionNameSpace getVariable [QGVAR(markerIndexGCI), 0];
missionNameSpace setVariable [QGVAR(markerIndexGCI), _markerIndexGCI + 1];

private _line = createMarkerLocal [format ["orbis_gci_%1_0", _markerIndexGCI], _position];
_line setMarkerShapeLocal "RECTANGLE";
_line setMarkerColorLocal "ColorWEST";
_line setMarkerSizeLocal [10, _lenght / 2];
_line setMarkerDirLocal _bearing;

private _marker1 = createMarkerLocal [format ["orbis_gci_%1_1", _markerIndex], _position];
_marker1 setMarkerTypeLocal _type;
_marker1 setMarkerColorLocal "ColorWEST";
_marker1 setMarkerSizeLocal [0, 0];
_marker1 setMarkerTextLocal _bearing;

private _marker2 = createMarkerLocal [format ["orbis_gci_%1_2", _markerIndex], _position];
_marker2 setMarkerTypeLocal _type;
_marker2 setMarkerColorLocal "ColorWEST";
_marker2 setMarkerSizeLocal [0, 0];
_marker2 setMarkerTextLocal format ["%1m %2m/s", _lenght, _radialSpeed];

private _marker3 = createMarkerLocal [format ["orbis_gci_%1_3", _markerIndex], _position];
_marker3 setMarkerTypeLocal _type;
_marker3 setMarkerColorLocal "ColorWEST";
_marker3 setMarkerSizeLocal [0, 0];
_marker3 setMarkerTextLocal format ["%1m %2m/s", _altDiff, _vRelSpeed];

[[_line, _marker1, _marker2, _marker3, _marker4], _position, [_vehicleBlue, _vehicleRed]]