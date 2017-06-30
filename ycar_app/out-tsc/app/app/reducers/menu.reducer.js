export var OPEN_MENU = "OPEN_MENU";
export var menuReducer = function (state, action) {
    if (state === void 0) { state = MenuState.MENU; }
    switch (action.type) {
        case OPEN_MENU:
            return action.payload;
        default:
            return state;
    }
};
export var MenuState;
(function (MenuState) {
    MenuState[MenuState["MENU"] = 0] = "MENU";
    MenuState[MenuState["WEATHER"] = 1] = "WEATHER";
    MenuState[MenuState["PHONE"] = 2] = "PHONE";
    MenuState[MenuState["MUSIC"] = 3] = "MUSIC";
})(MenuState || (MenuState = {}));
