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

params["_position", "_radius"];

private _return = [];
{
    private _radioId = _x;
    private _object = HASH_GET(acre_sys_server_objectIdRelationTable, _radioId);

    if((getPosASL (_object select 0)) distance _position <= _radius) then {
        PUSH(_return, _radioId);
    };
} forEach HASH_KEYS(acre_sys_server_objectIdRelationTable);

_return;
