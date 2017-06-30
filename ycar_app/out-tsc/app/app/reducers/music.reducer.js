/**
 * Created by dennisvandervlugt on 15.12.16.
 */
export var PlayState;
(function (PlayState) {
    PlayState[PlayState["STOP"] = 0] = "STOP";
    PlayState[PlayState["PLAY"] = 1] = "PLAY";
    PlayState[PlayState["PAUSE"] = 2] = "PAUSE";
})(PlayState || (PlayState = {}));
var initialPlayState = {
    playState: PlayState.STOP,
    track: {
        title: "",
        artist: "",
        cover: "",
        soundFile: ""
    },
    selectedTrackIndex: -1
};
export var playerReducer = function (state, action) {
    if (state === void 0) { state = initialPlayState; }
    switch (action.type) {
        default:
            return state;
    }
};
