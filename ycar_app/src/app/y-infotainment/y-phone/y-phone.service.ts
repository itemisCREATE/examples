import {Injectable} from '@angular/core';
import {Router, ActivatedRoute} from "@angular/router";
import {Subject} from "rxjs";

@Injectable()
export class YPhoneService {

  private selectedContactIndex: number = 0;

  contact: IContact;
  contacts: IContact[] = [
    {
      firstName: "Andreas",
      lastName: "Mülder",
      phoneNumber: "+49 170 123456",
      photo: "./assets/photos/andreas.png"
    },
    {
      firstName: "Axel",
      lastName: "Terfloth",
      phoneNumber: "+49 170 654321",
      photo: "./assets/photos/avatar.svg"
    }
  ];

  phoneState: PhoneState;

  buttons = {
    selected: {
      selectedOutgoingCallButton: 0,
      selectedIncomingCallButton: 0,
    },
    outgoingCall_buttons: [
      {
        caption: 'hang up',
        active: false
      }
    ],
    incomingCall_buttons: [
      {
        caption: 'accept',
        active: true
      },
      {
        caption: 'decline',
        active: false
      }
    ]
  };


  onIncomingCall: Subject<any> = new Subject<any>();
  onOutgoingCall:Subject<any> = new Subject<any>();
  onAcceptIncomingCall: Subject<any> = new Subject<any>();
  onDeclineIncomingCall: Subject<any> = new Subject<any>();
  onHangUp: Subject<any> = new Subject<any>();


  constructor(public router: Router, private route: ActivatedRoute) {
    this.contact = this.contacts[0];
    this.phoneState = PhoneState.INCOMING_CALL;
  }


  //region *** Contact ***
  selectNextContact(): void {
    let index = this.selectedContactIndex + 1;
    if (index <= this.contacts.length - 1) {
      this.contact = this.contacts[index];
      this.selectedContactIndex = index;
    }
  }

  selectPrevContact(): void {
    let index = this.selectedContactIndex - 1;
    if (index >= 0) {
      this.contact = this.contacts[index];
      this.selectedContactIndex = index;
    }
  }

  callContact(): void {
    this.router.navigate(['mainScreen/infotainment/phone//call'], {relativeTo: this.route});
  }

  //endregion

  //region *** Incoming Call ***
  selectNextIncomingCallButton(): void {
    if (this.buttons.selected.selectedIncomingCallButton < this.buttons.incomingCall_buttons.length - 1) {
      this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton].active = false;
      this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton + 1].active = true;
      this.buttons.selected.selectedIncomingCallButton = this.buttons.selected.selectedIncomingCallButton + 1;
    }
  }

  selectPrevIncomingCallButton(): void {
    if (this.buttons.selected.selectedIncomingCallButton > 0) {
      this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton].active = false;
      this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton - 1].active = true;
      this.buttons.selected.selectedIncomingCallButton = this.buttons.selected.selectedIncomingCallButton - 1;
    }
  }

  enterIncomingCallButton(): void {
    if (this.phoneState === PhoneState.INCOMING_CALL) {
      switch (this.buttons.selected.selectedIncomingCallButton) {
        case 0:
          this.phoneState = PhoneState.HANG_UP;
          this.onAcceptIncomingCall.next();
          break;

        case 1:
          this.onDeclineIncomingCall.next();
      }
    } else if (this.phoneState === PhoneState.OUTGOING_CALL) {
      this.onHangUp.next();
    } else if (this.phoneState === PhoneState.HANG_UP) {
      this.onHangUp.next();

    }
  }

  //endregion

  acceptIncomingCall(): void {
    this.onAcceptIncomingCall.next();
  }

  setPhoneState(state:string) {
    switch (state) {
      case 'incoming_call':
        this.phoneState = PhoneState.INCOMING_CALL;
        this.onIncomingCall.next();
        break;

      case 'outgoing_call':
        this.phoneState = PhoneState.OUTGOING_CALL;
        this.onOutgoingCall.next();
        break;
    }
  }
}

export interface IContact {
  firstName: string;
  lastName: string;
  phoneNumber: string;
  photo: string;
}

export enum PhoneState {
  INCOMING_CALL, OUTGOING_CALL, HANG_UP
}
