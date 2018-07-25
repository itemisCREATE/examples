import {Component, OnInit, OnDestroy} from '@angular/core';
import {YMusicService, PlayState, IPlaylist} from "./y-music.service";
import {Subscription} from "rxjs";
import {PageAnimation} from "../../shared/animations/page.animation";

@Component({
  selector: 'y-music',
  templateUrl: './y-music.component.html',
  styleUrls: ['./y-music.component.css'],
  animations: PageAnimation.page
})
export class YMusicComponent implements OnInit, OnDestroy {

  private onPlayStateChange: Subscription;
  private onSelectTrack: Subscription;
  private coverSrc: string = "";
  private state: string = "scaleOut";

  constructor(public musicService: YMusicService) {
    this.onPlayStateChange = musicService.onPlaystateChange
      .subscribe(playState => {
        this.onChangePlaystateHandler(playState);
      });

    this.onSelectTrack = musicService.onSelectTrack
      .subscribe(selectedTrack => {
        this.onSelectedTrackHandler(selectedTrack);
      })
  }

  private keyDownHandler(keyEvent) {
    if (keyEvent.key === 'ArrowDown') {
      this.musicService.nextTrack();
    } else if (keyEvent.key === 'ArrowUp') {
      this.musicService.prevTrack();
    } else if (keyEvent.key === 'Enter') {
      if (this.musicService.playState === PlayState.PLAY) {
        this.musicService.stopTrack();
      } else {
        this.musicService.playTrack();
      }
    }
  }

  private registerKeyBinding(): void {
    window.addEventListener('keydown', this.keyDownHandler);
  }

  private unregisterKeyBinding(): void {
    window.removeEventListener('keydown', this.keyDownHandler);
  }


  onChangePlaystateHandler(playState: PlayState) {}

  onSelectedTrackHandler(selectedTrack: IPlaylist) {
    this.coverSrc = selectedTrack.cover;
  }

  ngOnInit() {
    this.keyDownHandler = this.keyDownHandler.bind(this);
    this.registerKeyBinding();

    setTimeout(() => {
      this.state = "scaleIn";
    }, 10)
  }


  ngOnDestroy() {
    this.onPlayStateChange.unsubscribe();
    this.onSelectTrack.unsubscribe();
    this.unregisterKeyBinding();

  }

}
