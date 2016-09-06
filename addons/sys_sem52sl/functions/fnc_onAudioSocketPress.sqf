/*
 * Author: AUTHOR
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_COMPONENT_fnc_FUNCTIONNAME
 *
 * Public: No
 */
 
#include "script_component.hpp"

params ["","_key"];

private _audioPath = GET_STATE(audioPath);

if (_audioPath == "HEADSET") then {
    [GVAR(currentRadioId), "setState", ["audioPath", "INTSPEAKER"]] call EFUNC(sys_data,dataEvent);
} else {
    [GVAR(currentRadioId), "setState", ["audioPath", "HEADSET"]] call EFUNC(sys_data,dataEvent);
};

[MAIN_DISPLAY] call FUNC(render);
