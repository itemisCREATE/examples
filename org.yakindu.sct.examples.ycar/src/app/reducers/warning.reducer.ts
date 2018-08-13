import {Action} from "@ngrx/store";

export const UPDATE_WARNING = 'UPDATE_WARNING';
export const UPDATE_VISIBLE = 'UPDATE_VISIBLE';

export interface WarningState {
    warning: Warning,
    warningVisible: boolean
}

export interface Warning {
    title: string;
    message: string;
}

export const initialWarningState: Warning = {
    title: "Achtung",
    message: "Reifendruck prüfen"
};

export function warningReducer(state: Warning = initialWarningState, action: Action) {
    switch (action.type) {
        case UPDATE_WARNING:
            let obj = Object.assign({}, state);
            obj.title = action.payload.title;
            obj.message = action.payload.message;
            return obj;
        default:
            return state;
    }
};

export function warningVisibleReducer(state: boolean = false, action: Action) {
    switch (action.type) {
        case UPDATE_VISIBLE:
            return action.payload;
        default:
            return state;
    }
}