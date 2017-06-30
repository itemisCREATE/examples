export var CONTROLLIGHT_TYPE;
(function (CONTROLLIGHT_TYPE) {
    CONTROLLIGHT_TYPE[CONTROLLIGHT_TYPE["ABS"] = 0] = "ABS";
    CONTROLLIGHT_TYPE[CONTROLLIGHT_TYPE["OIL"] = 1] = "OIL";
    CONTROLLIGHT_TYPE[CONTROLLIGHT_TYPE["HIGHBEAM"] = 2] = "HIGHBEAM";
    CONTROLLIGHT_TYPE[CONTROLLIGHT_TYPE["HEADLIGHT"] = 3] = "HEADLIGHT";
    CONTROLLIGHT_TYPE[CONTROLLIGHT_TYPE["NONE"] = 4] = "NONE";
})(CONTROLLIGHT_TYPE || (CONTROLLIGHT_TYPE = {}));
export var controlLight = {
    controlLightType: CONTROLLIGHT_TYPE.NONE,
    on: false
};
export var UPDATE_LIGHT_ON = 'UPDATE_LIGHT_ON';
export var UPDATE_ABS = "UPDATE_ABS";
export var controlLightReducer = function (state, action) {
    if (state === void 0) { state = controlLight; }
    switch (action.type) {
        case UPDATE_LIGHT_ON:
            return Object.assign({}, action.payload);
        default:
            return state;
    }
};
