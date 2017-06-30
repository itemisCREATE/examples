export var initialFuelTank = {
    full: 100
};
export var UPDATE_FUELTANK = "UPDATE_FUELTANK";
export var DEC_FUELTANK = "DEC_FUELTANK";
export var fuelTankReducer = function (state, action) {
    if (state === void 0) { state = initialFuelTank; }
    switch (action.type) {
        case UPDATE_FUELTANK:
            return Object.assign({}, action.payload);
        case DEC_FUELTANK:
            var f = Object.assign({}, state);
            f.full -= action.payload;
            return f;
        default:
            return state;
    }
};
export var FUELTANK_STATE;
(function (FUELTANK_STATE) {
    FUELTANK_STATE[FUELTANK_STATE["FULL"] = 0] = "FULL";
    FUELTANK_STATE[FUELTANK_STATE["LOW"] = 1] = "LOW";
    FUELTANK_STATE[FUELTANK_STATE["EMPTY"] = 2] = "EMPTY";
})(FUELTANK_STATE || (FUELTANK_STATE = {}));
export var fueltankState;
(function (fueltankState) {
})(fueltankState || (fueltankState = {}));
