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
import { YMusicService, PlayState } from "../y-music.service";
export var YMusicPlaylistComponent = (function () {
    function YMusicPlaylistComponent(musicService) {
        var _this = this;
        this.musicService = musicService;
        this.coverSrc = "";
        this.audioSrc = "";
        this.playState = PlayState;
        this.onSelectTrack = musicService.onSelectTrack
            .subscribe(function (selectedTrack) {
            console.log("track selected");
            _this.onSelectedTrackHandler(selectedTrack);
        });
    }
    YMusicPlaylistComponent.prototype.onSelectedTrackHandler = function (selectedTrack) {
        this.coverSrc = selectedTrack.cover;
        this.audioSrc = selectedTrack.soundFile;
    };
    YMusicPlaylistComponent.prototype.selectTrack = function (trackIndex) {
        this.musicService.selectTrack(trackIndex);
    };
    YMusicPlaylistComponent.prototype.ngOnInit = function () {
        this.musicService.selectTrack(0);
    };
    YMusicPlaylistComponent.prototype.ngOnDestroy = function () {
        this.onSelectTrack.unsubscribe();
    };
    YMusicPlaylistComponent = __decorate([
        Component({
            selector: 'y-music-playlist',
            templateUrl: './y-music-playlist.component.html',
            styleUrls: ['./y-music-playlist.component.css']
        }), 
        __metadata('design:paramtypes', [YMusicService])
    ], YMusicPlaylistComponent);
    return YMusicPlaylistComponent;
}());
