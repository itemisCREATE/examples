import { HmiState } from "../app.service";
export var SET_HMI_STATE_OFF = "SET_HMI_STATE_OFF";
export var SET_HMI_STATE_ON = "SET_HMI_STATE_ON";
var hmiStateDefault = HmiState.OFF;
export var hmiStateReducer = function (state, action) {
    if (state === void 0) { state = hmiStateDefault; }
    switch (action.type) {
        case SET_HMI_STATE_OFF:
            return action.payload;
        case SET_HMI_STATE_ON:
            return action.payload;
        default: return state;
    }
};
