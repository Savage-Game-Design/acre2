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

/*
 *  This function is called when a radio transmission is closed.
 *  It handles the radios behavior depending of the remaining
 *  transmissions.
 *
 *  Type of Event:
 *      Transmission
 *  Event:
 *      handleEndTransmission
 *  Event raised by:
 *      - Remote Start Speaking Event
 *
 *  Parsed parameters:
 *      0:  Radio ID
 *      1:  Event (-> "handleBeginTransmission")
 *      2:  Eventdata
 *          2.0:    Radio ID of transmitting radio
 *      3:  Radiodata
 *      4:  Remote Call (-> false)
 *
 *  Returned parameters:
 *      true
*/

private ["_beeped", "_currentTransmissions", "_volume"];
params ["_radioId", "_eventKind", "_eventData"];

_eventData params["_txId"];
_currentTransmissions = SCRATCH_GET(_radioId, "currentTransmissions");
_currentTransmissions = _currentTransmissions - [_txId];

if((count _currentTransmissions) == 0) then {
    _beeped = SCRATCH_GET(_radioId, "hasBeeped");
    _pttDown = SCRATCH_GET_DEF(_radioId, "PTTDown", false);
    if(!_pttDown) then {
        if(!isNil "_beeped" && {_beeped}) then {
            _volume = [_radioId, "getVolume"] call EFUNC(sys_data,dataEvent);
            [_radioId, "Acre_GenericClickOff", [0,0,0], [0,1,0], _volume] call EFUNC(sys_radio,playRadioSound);
        };
    };
    SCRATCH_SET(_radioId, "hasBeeped", false);
};
SCRATCH_SET(_radioId, "cachedTransmissions", false);
true;
