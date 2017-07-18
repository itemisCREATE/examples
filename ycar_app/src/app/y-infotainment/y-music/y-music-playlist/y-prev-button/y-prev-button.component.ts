import {Component, OnInit} from '@angular/core';
import {YMusicService} from "../../y-music.service";

@Component({
  selector: 'y-prev-button',
  templateUrl: './y-prev-button.component.html',
  styleUrls: ['./y-prev-button.component.css']
})
export class YPrevButtonComponent implements OnInit {

  constructor(public musicService?: YMusicService) {
  }


  ngOnInit() {
  }


}
