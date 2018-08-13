import {Action} from "@ngrx/store";
import {HmiState} from "../app.service";


export const SET_HMI_STATE_OFF = "SET_HMI_STATE_OFF";
export const SET_HMI_STATE_ON = "SET_HMI_STATE_ON";

var hmiStateDefault:HmiState =  HmiState.OFF;

export function hmiStateReducer (state:HmiState = hmiStateDefault, action:Action) {

    switch (action.type) {
        case SET_HMI_STATE_OFF:
            return action.payload;

        case SET_HMI_STATE_ON:
            return action.payload;

        default: return state;
    }
};