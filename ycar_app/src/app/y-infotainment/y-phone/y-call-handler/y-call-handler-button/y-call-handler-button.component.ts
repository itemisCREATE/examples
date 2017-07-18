import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'y-call-handler-button',
  templateUrl: './y-call-handler-button.component.html',
  styleUrls: ['./y-call-handler-button.component.css'],
  inputs: ['caption', 'active']
})
export class YCallHandlerButtonComponent implements OnInit {

  private _caption: string = "Accept";
  private _active: boolean = false;

  set active(a: boolean) {
    this._active = a;
  }

  set caption(c: string) {
    this._caption = c;
  }


  constructor() {
  }

  ngOnInit() {
  }

}
