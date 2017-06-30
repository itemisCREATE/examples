import { controlLightReducer } from "./reducers/controllLights.reducer";
import { warningVisibleReducer, warningReducer } from "./reducers/warning.reducer";
import { speedometerReducer } from "./reducers/speedometer.reducer";
import { fuelTankReducer } from "./reducers/fueltank.reducer";
import { playerReducer } from "./reducers/music.reducer";
import { routerReducer } from "./reducers/router.reducer";
import { hmiStateReducer } from "./reducers/hmiState.reducer";
import { menuReducer } from "./reducers/menu.reducer";
export var appStore = {
    warning: warningReducer,
    warningVisible: warningVisibleReducer,
    abs: controlLightReducer,
    oil: controlLightReducer,
    highBeam: controlLightReducer,
    headLight: controlLightReducer,
    speedometer: speedometerReducer,
    fueltank: fuelTankReducer,
    player: playerReducer,
    routerState: routerReducer,
    hmiState: hmiStateReducer,
    menu: menuReducer
};
