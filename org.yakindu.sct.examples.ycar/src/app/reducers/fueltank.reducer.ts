import {Action} from "@ngrx/store";

export interface FuelTank {
    full: number
}

export const initialFuelTank: FuelTank = {
    full: 100
};


export const UPDATE_FUELTANK = "UPDATE_FUELTANK";
export const DEC_FUELTANK = "DEC_FUELTANK";

export function fuelTankReducer(state: FuelTank = initialFuelTank, action: Action) {


    switch (action.type) {

        case UPDATE_FUELTANK:
            return Object.assign({}, action.payload);

        case DEC_FUELTANK:

            let f: FuelTank = Object.assign({}, state);
            f.full -= action.payload;
            return f;

        default:
            return state;
    }

};


export enum FUELTANK_STATE {
    FULL, LOW, EMPTY
}


export enum fueltankState {

}