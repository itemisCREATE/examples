import {Injectable} from "@angular/core";
import {Subject} from "rxjs";
import {Store} from "@ngrx/store";
import {AppState} from "../../app.store";

@Injectable()
export class YMusicService {

  private audioSrc = undefined;
  selectedTrackIndex: number = 1;
  onSelectTrack: Subject<IPlaylist> = new Subject<IPlaylist>();
  onPlaystateChange: Subject<PlayState> = new Subject<PlayState>();
  playState: PlayState;

  playList: IPlaylist[] = [
    {
      title: "Remember",
      artist: "The Underdog Project",
      cover: "./assets/covers/cover.png",
      soundFile: "./assets/mp3/remember.mp3"
    },
    {
      title: "Freed from Desire",
      artist: "MoodBlast",
      cover: "./assets/covers/cover.png",
      soundFile: "./assets/mp3/freedfromdesire.mp3"
    },
    {
      title: "Infinity 2008",
      artist: "Guru Josh Project",
      cover: "./assets/covers/cover.png",
      soundFile: "./assets/mp3/infinity.mp3"
    }
  ];

  constructor( private store: Store<AppState>) {
    this.store.select(x=>x.player);
    this.playState = PlayState.STOP;
  }


  selectTrack(index: number): void {
    this.selectedTrackIndex = index;
    this.onSelectTrack.next(this.playList[index]);
  }

  nextTrack(): void {
    let n = this.selectedTrackIndex + 1;
    if (n <= this.playList.length - 1) {
      this.selectedTrackIndex = n;
      this.onSelectTrack.next(this.playList[n]);
      if (this.playState === PlayState.PLAY) {
        this.stopTrack();
        this.playTrack();
      }
    }
  }

  prevTrack(): void {
    let n = this.selectedTrackIndex - 1;
    if (n >= 0) {
      this.selectedTrackIndex = n;
      this.onSelectTrack.next(this.playList[n]);

      if (this.playState === PlayState.PLAY) {
        this.stopTrack();
        this.playTrack();
      }
    }
  }

  stopTrack(): void {
    this.playState = PlayState.STOP;
    this.onPlaystateChange.next(PlayState.STOP);
    if (this.audioSrc) {
      this.audioSrc.pause();
    }
  }

  playTrack(): void {
    this.playState = PlayState.PLAY;
    this.onPlaystateChange.next(PlayState.PLAY);

    this.audioSrc = document.createElement("audio");
    this.audioSrc.src = this.playList[this.selectedTrackIndex].soundFile;
    this.audioSrc.play();
  }
}


export interface IPlaylist {
  title: string;
  artist: string;
  cover: string;
  soundFile: string;
}

export enum PlayState {
  STOP, PLAY, PAUSE
}
