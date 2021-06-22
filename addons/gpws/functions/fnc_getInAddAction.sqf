#include "script_component.hpp"

params ["_unit", "_position", "_vehicle", "_turret"];

private _hasAction = _vehicle getVariable [QGVAR(hasAction), false];
if (_hasAction || !(_vehicle isKindOf "Plane")) exitWith {};

_vehicle addAction [localize LSTRING(turnOff), {(_this select 0) setVariable [QGVAR(GPWSmode), "off", true]}, nil, 1.0111, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'off')", 100];
_vehicle addAction [localize LSTRING(actionB747), {(_this select 0) setVariable [QGVAR(GPWSmode), "b747", true]}, nil, 1.01121, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'b747')", 100];
_vehicle addAction [localize LSTRING(actionF16), {(_this select 0) setVariable [QGVAR(GPWSmode), "f16", true]}, nil, 1.01122, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'f16')", 100];
_vehicle addAction [localize LSTRING(actionRita), {(_this select 0) setVariable [QGVAR(GPWSmode), "rita", true]}, nil, 1.01123, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'rita')", 100];
_vehicle addAction [localize LSTRING(testB747), {[_this select 0] spawn FUNC(b747GPWStest)}, nil, 1.01131, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'b747') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction [localize LSTRING(testF16), {[_this select 0] spawn FUNC(f16GPWStest)}, nil, 1.01132, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'f16') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction [localize LSTRING(testRita), {[_this select 0] spawn FUNC(ritaGPWStest)}, nil, 1.01133, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'rita') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction [localize LSTRING(testStop), {(_this select 0) setVariable [QGVAR(GPWStestStop), true, true]}, nil, 1.01134, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'off') && !(_target getVariable ['orbis_gpws_GPWStestReady', true]) && !(_target getVariable ['orbis_gpws_GPWStestStop', false])", 100];
_vehicle addAction [localize LSTRING(volumeLow), {(_this select 0) setVariable [QGVAR(GPWSvolumeLow), true, true]}, nil, 1.01141, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && !(_target getVariable ['orbis_gpws_GPWSvolumeLow', false])", 100];
_vehicle addAction [localize LSTRING(volumeHigh), {(_this select 0) setVariable [QGVAR(GPWSvolumeLow), false, true]}, nil, 1.01142, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_isGPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSvolumeLow', false])", 100];
_vehicle addAction [localize LSTRING(modeTARA), {(_this select 0) setVariable [QGVAR(tcasMode), 2, true]}, nil, 1.0121, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_tcasMode', 0] != 2)", 100];
_vehicle addAction [localize LSTRING(modeTA), {(_this select 0) setVariable [QGVAR(tcasMode), 1, true]}, nil, 1.0122, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_tcasMode', 0] != 1)", 100];
_vehicle addAction [localize LSTRING(modeSTBY), {(_this select 0) setVariable [QGVAR(tcasMode), 0, true]}, nil, 1.0123, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_tcasMode', 0] != 0)", 100];
_vehicle addAction [localize LSTRING(transponderModeC), {(_this select 0) setVariable [QGVAR(transponderMode), 2, true]}, nil, 1.0131, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_transponderMode', 0] != 2)", 100];
_vehicle addAction [localize LSTRING(transponderSTBY), {(_this select 0) setVariable [QGVAR(transponderMode), 1, true]}, nil, 1.0132, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_transponderMode', 0] != 1)", 100];
_vehicle addAction [localize LSTRING(transponderOff), {(_this select 0) setVariable [QGVAR(transponderMode), 0, true]}, nil, 1.0133, false, true, "", "([nil, _target, 1] call orbis_main_fnc_isCrew) && (_target getVariable ['orbis_gpws_transponderMode', 0] != 0)", 100];

_vehicle setVariable [QGVAR(hasAction), true];
