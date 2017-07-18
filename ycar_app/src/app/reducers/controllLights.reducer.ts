import {Action} from "@ngrx/store";


export enum CONTROLLIGHT_TYPE {
    ABS, OIL, HIGHBEAM, HEADLIGHT, NONE
}

export interface ControlLight {
    controlLightType: CONTROLLIGHT_TYPE,
    on: boolean
}

export interface ControlLightState {
    abs: ControlLight,
    oil: ControlLight,
    highBeam: ControlLight,
    headLight: ControlLight
}

export const controlLight: ControlLight = {
    controlLightType: CONTROLLIGHT_TYPE.NONE,
    on: false
};


export const UPDATE_LIGHT_ON = 'UPDATE_LIGHT_ON';
export const UPDATE_ABS = "UPDATE_ABS";

export function controlLightReducer  (state: ControlLight = controlLight, action: Action)  {
    switch (action.type) {

        case UPDATE_LIGHT_ON:
            return Object.assign({}, action.payload);

        default:
            return state;
    }
};


