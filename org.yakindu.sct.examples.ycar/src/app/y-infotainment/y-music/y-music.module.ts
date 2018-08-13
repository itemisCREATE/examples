import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YMusicComponent } from './y-music.component';
import {YShareModule} from "../../shared/y-shared.module";
import {YMusicService} from "./y-music.service";
import { YMusicPlaylistComponent } from './y-music-playlist/y-music-playlist.component';
import { YPrevButtonComponent } from './y-music-playlist/y-prev-button/y-prev-button.component';
import { YNextButtonComponent } from './y-music-playlist/y-next-button/y-next-button.component';
import { YPlayButtonComponent } from './y-music-playlist/y-play-button/y-play-button.component';
import { YStopButtonComponent } from './y-music-playlist/y-stop-button/y-stop-button.component';

@NgModule({
  imports: [
    CommonModule,
    YShareModule
  ],
  declarations: [YMusicComponent, YMusicPlaylistComponent, YPrevButtonComponent, YNextButtonComponent, YPlayButtonComponent, YStopButtonComponent],
  providers: [YMusicService]
})
export class YMusicModule { }
