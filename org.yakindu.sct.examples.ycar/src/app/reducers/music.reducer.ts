import {Action} from "@ngrx/store";
export enum PlayState {
    STOP, PLAY, PAUSE
}

export interface Track {
    title: string,
    artist: string,
    cover: string,
    soundFile: string
}

export interface PlayerState {
    playState: PlayState,
    track: Track,
    selectedTrackIndex: number
}

let initialPlayState: PlayerState = {
    playState: PlayState.STOP,
    track: {
        title: "",
        artist: "",
        cover: "",
        soundFile: ""
    },
    selectedTrackIndex: -1
};


export function playerReducer (state: PlayerState = initialPlayState, action: Action)  {
    switch (action.type) {
        default:
            return state;
    }
};



