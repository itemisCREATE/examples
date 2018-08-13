import {controlLightReducer, ControlLight} from "./reducers/controllLights.reducer";
import {warningVisibleReducer, warningReducer, Warning} from "./reducers/warning.reducer";
import {speedometerReducer, Speedometer} from "./reducers/speedometer.reducer";
import {fuelTankReducer, FuelTank} from "./reducers/fueltank.reducer";
import {playerReducer, PlayerState} from "./reducers/music.reducer";
import {routerReducer} from "./reducers/router.reducer";
import {hmiStateReducer} from "./reducers/hmiState.reducer";
import {HmiState} from "./app.service";
import {menuReducer, MenuState} from "./reducers/menu.reducer";

export const appStore = {
    warning: warningReducer,
    warningVisible: warningVisibleReducer,
    abs: controlLightReducer,
    oil: controlLightReducer,
    highBeam:controlLightReducer,
    headLight: controlLightReducer,
    speedometer: speedometerReducer,
    fueltank: fuelTankReducer,
    player: playerReducer,
    routerState: routerReducer,
    hmiState: hmiStateReducer,
    menu:menuReducer
};


export interface AppState {
    warning: Warning,
    warningVisible: boolean,
    abs: ControlLight,
    oil: ControlLight,
    highBeam: ControlLight,
    headLight: ControlLight,
    speedometer: Speedometer,
    fueltank: FuelTank,
    player: PlayerState,
    routerState: string,
    hmiState: HmiState,
    menu:MenuState
}
