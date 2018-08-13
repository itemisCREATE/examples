import { Component, OnInit } from '@angular/core';
import {YMusicService} from "../../y-music.service";

@Component({
  selector: 'y-stop-button',
  templateUrl: './y-stop-button.component.html',
  styleUrls: ['./y-stop-button.component.css'],

})
export class YStopButtonComponent implements OnInit {

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
