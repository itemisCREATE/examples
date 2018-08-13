import {Component, OnInit, OnDestroy} from '@angular/core';
import {YPhoneService} from "../y-phone.service";

@Component({
  selector: 'y-address-book',
  templateUrl: './y-address-book.component.html',
  styleUrls: ['./y-address-book.component.css']
})
export class YAddressBookComponent implements OnInit, OnDestroy {


  constructor(public phoneService: YPhoneService) {
  }

  private registerKeyBinding(): void {
    window.addEventListener('keydown', this.keyDownHandler);
  }

  private keyDownHandler(keyEvent) {
    if (keyEvent.key === 'ArrowDown') {
      this.phoneService.selectNextContact();
    } else if (keyEvent.key === 'ArrowUp') {
      this.phoneService.selectPrevContact();
    } else if (keyEvent.key === 'Enter') {
      this.callContact();
    }
  }

  private unregisterKeyBinding(): void {
    window.removeEventListener('keydown', this.keyDownHandler);
  }

  callContact(): void {
    this.phoneService.callContact();
  }

  ngOnInit() {
    this.keyDownHandler = this.keyDownHandler.bind(this);
    this.registerKeyBinding();
  }

  ngOnDestroy() {
    this.unregisterKeyBinding();
  }
}
