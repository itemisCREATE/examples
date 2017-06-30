export var UPDATE_ROUTER_URL = "UPDATE_ROUTER_URL";
export var routerReducer = function (state, action) {
    if (state === void 0) { state = ""; }
    switch (action.type) {
        case UPDATE_ROUTER_URL:
            return action.payload;
        default: return state;
    }
};
