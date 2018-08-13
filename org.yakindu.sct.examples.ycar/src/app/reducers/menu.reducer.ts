import {Action} from "@ngrx/store";

export const OPEN_MENU = "OPEN_MENU";

export function menuReducer  (state: MenuState = MenuState.MENU, action: Action)  {
    switch (action.type) {
        case OPEN_MENU:
            return action.payload;
        default:
            return state;
    }
};

export enum MenuState {
    MENU, WEATHER, PHONE, MUSIC
}


