import {Injectable} from "@angular/core";
import {Observable, Subject} from "rxjs";
import {Store} from "@ngrx/store";
import {ControlLight, CONTROLLIGHT_TYPE, UPDATE_LIGHT_ON} from "../reducers/controllLights.reducer";
import {Speedometer, UPDATE_SPEEDOMETER_SPEED} from "../reducers/speedometer.reducer";
import {FuelTank, UPDATE_FUELTANK} from "../reducers/fueltank.reducer";
import {AppState} from "../app.store";
import {MenuState} from "../reducers/menu.reducer";

@Injectable()
export class YMainScreenService {

    onChangeFuelTank: Subject<number> = new Subject<number>();
    routerState$: Observable<string>;
    menuChanged: Observable<MenuState>;

    constructor(public store: Store<AppState>) {
        this.routerState$ = store.select(appState=>appState.routerState);
        this.menuChanged = store.select(appState => appState.menu);
        this.menuChanged.subscribe(state => {
            console.log(state)
        })
    }

    message():void {
        console.log("Waiting");
    }

    getMenuChanged(): Observable<MenuState> {
        return this.menuChanged;
    }

    changeSpeedometer(s: number) {
        let sp:Speedometer = {
            speed: s
        };
        this.store.dispatch({type:UPDATE_SPEEDOMETER_SPEED, payload:sp});
    }

    changeOilOn(b: boolean) {
        let c: ControlLight = {
            controlLightType: CONTROLLIGHT_TYPE.OIL,
            on: b
        };
        this.store.dispatch({type: UPDATE_LIGHT_ON, payload: c});
    }

    changeAbsOn(b: boolean) {
        let c: ControlLight = {
            controlLightType: CONTROLLIGHT_TYPE.ABS,
            on: b
        };
        this.store.dispatch({type: UPDATE_LIGHT_ON, payload: c});
    }

    changeHeadLightOn(b: boolean) {
        let c: ControlLight = {
            controlLightType: CONTROLLIGHT_TYPE.HEADLIGHT,
            on: b
        };
        this.store.dispatch({type: UPDATE_LIGHT_ON, payload: c});
    }

    changeHighBeamOn(b: boolean) {
        let c: ControlLight = {
            controlLightType: CONTROLLIGHT_TYPE.HIGHBEAM,
            on: b
        };

        this.store.dispatch({type: UPDATE_LIGHT_ON, payload: c});
    }

    changeFuelTank(n: number) {
        let fuelTank: FuelTank = {
            full: n
        };
        this.store.dispatch({type: UPDATE_FUELTANK, payload:fuelTank});
    }

    onChangeRouterState(): Observable<string> {
        return this.routerState$;
    }
}
