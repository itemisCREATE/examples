import { Component, OnInit } from '@angular/core';
import {YMusicService} from "../../y-music.service";

@Component({
  selector: 'y-next-button',
  templateUrl: './y-next-button.component.html',
  styleUrls: ['./y-next-button.component.css']
})
export class YNextButtonComponent implements OnInit {

  constructor( public musicService:YMusicService) { }


  ngOnInit() {
  }


}
