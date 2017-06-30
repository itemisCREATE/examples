var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Injectable } from '@angular/core';
import { Subject } from "rxjs";
import { Store } from "@ngrx/store";
export var YMusicService = (function () {
    function YMusicService(store) {
        this.store = store;
        this.audioSrc = undefined;
        this.selectedTrackIndex = 1;
        this.onSelectTrack = new Subject();
        this.onPlaystateChange = new Subject();
        this.playList = [
            {
                title: "Remember",
                artist: "The Underdog Project",
                cover: "./assets/covers/remember.png",
                soundFile: "./assets/mp3/remember.mp3"
            },
            {
                title: "Freed from Desire",
                artist: "MoodBlast",
                cover: "./assets/covers/freedfromdesire.png",
                soundFile: "./assets/mp3/freedfromdesire.mp3"
            },
            {
                title: "Infinity 2008",
                artist: "Guru Josh Project",
                cover: "./assets/covers/infinity.png",
                soundFile: "./assets/mp3/infinity.mp3"
            }
        ];
        this.store.select(function (x) { return x.player; });
        this.playState = PlayState.STOP;
    }
    YMusicService.prototype.selectTrack = function (index) {
        this.selectedTrackIndex = index;
        this.onSelectTrack.next(this.playList[index]);
    };
    YMusicService.prototype.nextTrack = function () {
        var n = this.selectedTrackIndex + 1;
        if (n <= this.playList.length - 1) {
            this.selectedTrackIndex = n;
            this.onSelectTrack.next(this.playList[n]);
            if (this.playState === PlayState.PLAY) {
                this.stopTrack();
                this.playTrack();
            }
        }
    };
    YMusicService.prototype.prevTrack = function () {
        var n = this.selectedTrackIndex - 1;
        if (n >= 0) {
            this.selectedTrackIndex = n;
            this.onSelectTrack.next(this.playList[n]);
            if (this.playState === PlayState.PLAY) {
                this.stopTrack();
                this.playTrack();
            }
        }
    };
    YMusicService.prototype.stopTrack = function () {
        this.playState = PlayState.STOP;
        this.onPlaystateChange.next(PlayState.STOP);
        if (this.audioSrc) {
            this.audioSrc.pause();
        }
    };
    YMusicService.prototype.playTrack = function () {
        this.playState = PlayState.PLAY;
        this.onPlaystateChange.next(PlayState.PLAY);
        this.audioSrc = document.createElement("audio");
        this.audioSrc.src = this.playList[this.selectedTrackIndex].soundFile;
        this.audioSrc.play();
    };
    YMusicService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YMusicService);
    return YMusicService;
    var _a;
}());
export var PlayState;
(function (PlayState) {
    PlayState[PlayState["STOP"] = 0] = "STOP";
    PlayState[PlayState["PLAY"] = 1] = "PLAY";
    PlayState[PlayState["PAUSE"] = 2] = "PAUSE";
})(PlayState || (PlayState = {}));
