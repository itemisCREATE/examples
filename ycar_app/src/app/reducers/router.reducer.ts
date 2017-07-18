import {Action} from "@ngrx/store";

export const UPDATE_ROUTER_URL = "UPDATE_ROUTER_URL";

export function routerReducer (state:string = "", action:Action)  {

    switch (action.type) {
        case UPDATE_ROUTER_URL:

            return action.payload;

        default: return state;
    }

};