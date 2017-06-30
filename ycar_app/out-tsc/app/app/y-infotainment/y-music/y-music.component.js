var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from '@angular/core';
import { YMusicService, PlayState } from "./y-music.service";
import { PageAnimation } from "../../shared/animations/page.animation";
export var YMusicComponent = (function () {
    function YMusicComponent(musicService) {
        var _this = this;
        this.musicService = musicService;
        this.coverSrc = "";
        this.state = "scaleOut";
        this.onPlayStateChange = musicService.onPlaystateChange
            .subscribe(function (playState) {
            _this.onChangePlaystateHandler(playState);
        });
        this.onSelectTrack = musicService.onSelectTrack
            .subscribe(function (selectedTrack) {
            _this.onSelectedTrackHandler(selectedTrack);
        });
    }
    YMusicComponent.prototype.keyDownHandler = function (keyEvent) {
        console.log(keyEvent.key);
        if (keyEvent.key === 'ArrowDown') {
            this.musicService.nextTrack();
        }
        else if (keyEvent.key === 'ArrowUp') {
            this.musicService.prevTrack();
        }
        else if (keyEvent.key === 'Enter') {
            if (this.musicService.playState === PlayState.PLAY) {
                this.musicService.stopTrack();
            }
            else {
                this.musicService.playTrack();
            }
        }
    };
    YMusicComponent.prototype.registerKeyBinding = function () {
        window.addEventListener('keydown', this.keyDownHandler);
    };
    YMusicComponent.prototype.unregisterKeyBinding = function () {
        window.removeEventListener('keydown', this.keyDownHandler);
    };
    YMusicComponent.prototype.onChangePlaystateHandler = function (playState) {
        console.log(playState);
    };
    YMusicComponent.prototype.onSelectedTrackHandler = function (selectedTrack) {
        console.log(selectedTrack);
        this.coverSrc = selectedTrack.cover;
    };
    YMusicComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.keyDownHandler = this.keyDownHandler.bind(this);
        this.registerKeyBinding();
        setTimeout(function () {
            _this.state = "scaleIn";
            console.log(_this.state);
        }, 10);
    };
    YMusicComponent.prototype.ngOnDestroy = function () {
        this.onPlayStateChange.unsubscribe();
        this.onSelectTrack.unsubscribe();
        this.unregisterKeyBinding();
    };
    YMusicComponent = __decorate([
        Component({
            selector: 'y-music',
            templateUrl: './y-music.component.html',
            styleUrls: ['./y-music.component.css'],
            animations: PageAnimation.page
        }), 
        __metadata('design:paramtypes', [YMusicService])
    ], YMusicComponent);
    return YMusicComponent;
}());
