/*
    Collection of async macros

    these macros can only be used in scheduled environment ie. when suspension is allowed
*/

//generates a unique varname for variable transmision between machines
#define genVarName(VARNAME) ((systemTimeUTC + [VARNAME, str clientOwner]) joinString "");

/*
Async
    Execute function async

Syntax: argument async(function, callback)
    argument: <Any>  Arguments passed to function, can not be nil
    function: <code> Function to execute
    callback: <code> callback with return of function after its done

Examples:
    [] async(someFunction,someCallbackFunction);
    someArg async(someFunction, {some callback code});
    someArg async({some async code}, someCallbackFunction);
    [] async({some async code}, {some callback code});

Note: arguments passed to function is accasible in callback as _asyncArguments
*/
#define async(FUNCTION, CALLBACK) spawn {private _asyncArguments = _this; private _return = _asyncArguments call FUNCTION; _return call CALLBACK};
