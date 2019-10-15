#include "script_component.hpp"

params ["_range", "_azimuthBandwith", "_pulseWidth", "_height", "_psi"];

private _r = _range * tan (_azimuthBandwith / 2);
private _d = _pulseWidth * GVAR(speedOfLight) / 2;

if (abs _psi < 1) exitWith {if (_height < _r) then {2 * _d * sqrt ((_r ^ 2) - (_height ^ 2))} else {0}};
if (abs _psi > 89) exitWith {if (_height < (_d / 2)) then {pi * (_r ^ 2)} else {0}};

private _x0 = _height / sin _psi;
private _x1 = (_x0 - (_d / 2)) * tan _psi;
private _x2 = (_x0 + (_d / 2)) * tan _psi;

private _domainX1 = _r min abs _x1;
private _domainX2 = _r min abs _x2;

private _S1 = (_r ^ 2) * ((pi / 2) - 2 * rad acos (_domainX1 / _r)) + _domainX1 * sqrt ((_r ^ 2) - (_domainX1 ^ 2));
private _S2 = (_r ^ 2) * ((pi / 2) - 2 * rad acos (_domainX2 / _r)) + _domainX2 * sqrt ((_r ^ 2) - (_domainX2 ^ 2));

private _A = if ((_x1 * _x2) < 0) then {_S1 + _S2} else {_S1 - _S2};
private _area = ((sin _psi) / ((cos _psi) ^ 2)) * _A;

abs _area
