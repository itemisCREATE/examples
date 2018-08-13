import {Component, OnInit, EventEmitter} from '@angular/core';

@Component({
  selector: 'y-menu-button',
  templateUrl: './y-menu-button.component.html',
  outputs: ['onButtonClicked'],
  inputs:['buttonType'],
  styleUrls: ['./y-menu-button.component.css']
})
export class YMenuButtonComponent implements OnInit {



  onButtonClicked = new EventEmitter<string>();

  buttonType:string ;

  constructor() {

    this.buttonType = 'weather';
  }


  buttonClickHandler(button:string) {
    this.onButtonClicked.emit(button);
  }

  ngOnInit() {
  }

}
