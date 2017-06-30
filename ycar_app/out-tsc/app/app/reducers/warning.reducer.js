export var UPDATE_WARNING = 'UPDATE_WARNING';
export var UPDATE_VISIBLE = 'UPDATE_VISIBLE';
export var initialWarningState = {
    title: "Achtung",
    message: "Reifendruck prüfen"
};
export var warningReducer = function (state, action) {
    if (state === void 0) { state = initialWarningState; }
    switch (action.type) {
        case UPDATE_WARNING:
            var obj = Object.assign({}, state);
            obj.title = action.payload.title;
            obj.message = action.payload.message;
            return obj;
        default:
            return state;
    }
};
export var warningVisibleReducer = function (state, action) {
    if (state === void 0) { state = false; }
    switch (action.type) {
        case UPDATE_VISIBLE:
            return action.payload;
        default:
            return state;
    }
};
