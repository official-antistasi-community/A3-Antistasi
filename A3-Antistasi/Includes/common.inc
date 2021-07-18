//includes commonly included files to clean up includes in other files
/*
Line number

Macros:
    FIX_LINE_NUMBERS2
        Internal only dont worry about it

    FIX_LINE_NUMBERS
    Corrects the linenumber of the file after includes
    Syntax: FIX_LINE_NUMBERS()
    Return: <LineNumber> Mostly correct linenumber, off by two
*/
#define FIX_LINE_NUMBERS2(sharp) sharp##line __LINE__ __FILE__
#define FIX_LINE_NUMBERS() FIX_LINE_NUMBERS2(#)

/*
Call stack
Adds the private variable __CALLSTACK__, inheriting the callstack from the parent function

Macros:
    currentScript
        Returns the current function name
        Syntax: currentScript
        Return: <String> the current function name

    dumpCallStackMSG
        Dumps the call stack to the log with a custom message
        Syntax: dumpCallStackMSG(message)
            message: <String> Message to add to the call stack dump
        Return: <Nil>

    dumpCallStack
        Dumps the call stack to the log
        Syntax: dumpCallStack()
        Return: <Nil>
*/
#define currentScript if (isNil "_fnc_scriptName") then {__FILE__ select [count __FILE__ - (reverse __FILE__ find '\'), 1e6]} else {_fnc_scriptName}
#define dumpCallStackMSG(MSG) diag_log text ( (systemTimeUTC call A3A_fnc_systemTime_format_S) + " | Antistasi | Callstack: " + MSG + endl + (__CALLSTACK__ apply {"    " + _x} joinString endl) );
#define dumpCallStack() dumpCallStackMSG("")
private __CALLSTACK__ = if (isNil "__CALLSTACK__") then { [currentScript] } else { [currentScript] + __CALLSTACK__ };

//includes
#include "LogMacros.inc"
