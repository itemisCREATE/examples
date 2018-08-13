import {animate, Component, OnInit, state, style, transition, trigger} from "@angular/core";
import {YWarningService} from "./y-warning.service";
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";
import {WarningState} from "../../../reducers/warning.reducer";

@Component({
  selector: 'y-warning-widget',
  templateUrl: './y-warning-widget.component.html',
  styleUrls: ['./y-warning-widget.component.css'],
  animations: [
    trigger('flyInOut', [
      state('visible', style({transform: 'translateX(0)'})),
      state('invisible', style({transform: 'translateX(100%)'})),
      transition('invisible => visible', animate('1000ms ease-in')),
      transition('visible => invisible', animate('1000ms ease-out'))
    ])
  ]
})
export class YWarningWidgetComponent implements OnInit {

  private  animationState:string = "invisible";
  private warningVisible$: Observable<boolean>;


  constructor(public warningService: YWarningService, private store: Store<WarningState>) {
    this.warningVisible$ = this.store.select(x => x.warningVisible);
  }


  ngOnInit() {
    this.warningVisible$.subscribe(v => {
      if (v) {
        this.animationState = "visible";
      } else {
        this.animationState = "invisible"
      }
    });
  }
}
