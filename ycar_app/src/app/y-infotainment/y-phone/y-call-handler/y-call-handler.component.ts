import {animate, Component, OnInit, state, style, transition, trigger} from "@angular/core";
import {PhoneState, YPhoneService} from "../y-phone.service";
import {ActivatedRoute} from "@angular/router";

@Component({
  selector: 'y-call-handler',
  templateUrl: './y-call-handler.component.html',
  styleUrls: ['./y-call-handler.component.css'],
  animations: [
    trigger('flyInOut', [
      state('in', style({transform: 'translateX(0)'})),
      transition('void => *', [
        style({transform: 'translateX(100%)'}),
        animate(500)
      ]),
      transition('* => void', [
        animate(500, style({transform: 'translateX(-100%)'}))
      ])
    ])
  ]
})
export class YCallHandlerComponent implements OnInit {

  phoneState = PhoneState;


  private registerKeyBinding(): void {
    window.addEventListener('keydown', this.keyDownHandler);
  }

  private keyDownHandler(keyEvent) {
    if (keyEvent.key === 'ArrowLeft') {
      this.phoneService.selectPrevIncomingCallButton();

    } else if (keyEvent.key === 'ArrowRight') {
      this.phoneService.selectNextIncomingCallButton();

    } else if (keyEvent.key === 'Enter') {
      this.phoneService.enterIncomingCallButton();
    }

  }

  private unregisterKeyBinding(): void {
    window.removeEventListener('keydown', this.keyDownHandler);
  }


  constructor(public phoneService: YPhoneService, private route: ActivatedRoute) {

    this.route.queryParams.subscribe(
      params => {
      }
    )
  }

  ngOnInit() {
    this.keyDownHandler = this.keyDownHandler.bind(this);
    this.registerKeyBinding();
  }

  ngOnDestroy() {
    this.unregisterKeyBinding();
  }

}
