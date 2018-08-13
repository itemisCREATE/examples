import {Injectable} from '@angular/core';
import {Observable} from "rxjs";
import {Store} from "@ngrx/store";
import {AppState} from "./app.store";
import {Router} from "@angular/router";

@Injectable()
export class AppService {

    hmiState: Observable<HmiState>;

    constructor(public store: Store<AppState>, router: Router) {
        this.hmiState = store.select(appState => appState.hmiState);

        this.hmiState.subscribe(hmiState => {
            switch (hmiState) {
                case HmiState.OFF:
                    console.log('off');
                    break;
                case HmiState.ON:
                    console.log('on');
            }
        })
    }

    turnOn():void {
        this.setHmiState(HmiState.ON);
    }

    turnOff():void {
        this.setHmiState(HmiState.OFF);
    }


    setHmiState(hmiState: HmiState): void {
        switch (hmiState) {
            case HmiState.OFF:
                this.store.dispatch({type: "SET_HMI_STATE_OFF", payload: hmiState});
                break;
            case HmiState.ON:
                this.store.dispatch({type: "SET_HMI_STATE_ON", payload: hmiState});
                break;
        }
    }

    getHmiState(): Observable<HmiState> {
        return this.hmiState;
    }
}

export enum HmiState {
    ON, OFF
};

