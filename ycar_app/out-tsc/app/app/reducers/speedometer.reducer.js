export var UPDATE_SPEEDOMETER_SPEED = "UPDATE_SPEEDOMETER_SPEED";
export var initialSpeedoMeter = {
    speed: 0
};
export var speedometerReducer = function (state, action) {
    if (state === void 0) { state = initialSpeedoMeter; }
    switch (action.type) {
        case UPDATE_SPEEDOMETER_SPEED:
            return Object.assign({}, action.payload);
        default:
            return state;
    }
};
