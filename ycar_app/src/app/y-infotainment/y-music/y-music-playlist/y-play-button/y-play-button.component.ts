import { Component, OnInit } from '@angular/core';
import {YMusicService} from "../../y-music.service";

@Component({
  selector: 'y-play-button',
  templateUrl: './y-play-button.component.html',
  styleUrls: ['./y-play-button.component.css']
})
export class YPlayButtonComponent implements OnInit {

  constructor(public musicService:YMusicService) { }

  private _hover:boolean = false;

  ngOnInit() {
  }

  onMouseEnter():void {
    this._hover = true;
  }

  onMouseLeave():void {
    this._hover = false;

  }

}
