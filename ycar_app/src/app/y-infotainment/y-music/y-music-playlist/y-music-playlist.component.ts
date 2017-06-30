import {Component, OnInit, OnDestroy} from '@angular/core';
import {YMusicService, IPlaylist, PlayState} from "../y-music.service";
import {Subscription} from "rxjs";

@Component({
  selector: 'y-music-playlist',
  templateUrl: './y-music-playlist.component.html',
  styleUrls: ['./y-music-playlist.component.css']
})
export class YMusicPlaylistComponent implements OnInit, OnDestroy {

  private onSelectTrack: Subscription;
  private coverSrc: string = "";
  private audioSrc: string = "";
  private playState =  PlayState;


  constructor(public musicService: YMusicService) {

    this.onSelectTrack = musicService.onSelectTrack
      .subscribe(selectedTrack => {
        console.log("track selected");
        this.onSelectedTrackHandler(selectedTrack);
      });
  }


  onSelectedTrackHandler(selectedTrack: IPlaylist): void {
    this.coverSrc = selectedTrack.cover;
    this.audioSrc = selectedTrack.soundFile;
  }


  selectTrack(trackIndex:number) {
     this.musicService.selectTrack(trackIndex);
  }

  ngOnInit() {
    this.musicService.selectTrack(0);
  }

  ngOnDestroy() {
    this.onSelectTrack.unsubscribe();
  }

}
