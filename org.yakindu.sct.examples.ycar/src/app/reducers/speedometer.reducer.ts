import {Action} from "@ngrx/store";

export const UPDATE_SPEEDOMETER_SPEED = "UPDATE_SPEEDOMETER_SPEED";

export interface SpeedometerState {
    speedometer: Speedometer
}

export interface Speedometer{
    speed: number;
}

export const initialSpeedoMeter:Speedometer = {
    speed: 0
};

export function speedometerReducer (state:Speedometer = initialSpeedoMeter, action:Action)  {
    switch (action.type) {
        case UPDATE_SPEEDOMETER_SPEED:
            return Object.assign({}, action.payload);
        default:
            return state;
    }
}