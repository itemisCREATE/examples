import {Component, OnInit} from "@angular/core";
import {DomSanitizer} from "@angular/platform-browser";
import {Store} from "@ngrx/store";
import {Speedometer, SpeedometerState} from "../../reducers/speedometer.reducer";
import {Observable} from "rxjs";

@Component({
  selector: 'y-speedometer-widget',
  inputs: ['speed', 'height'],
  templateUrl: './y-speedometer-widget.component.html',
  styleUrls: ['./y-speedometer-widget.component.css']
})
export class YSpeedometerWidgetComponent implements OnInit {
  private sp:Observable<Speedometer>;
  private _speed: number = 0;
  private s = 0;
  private speed_label = 0;
  private speed_label_pos_x:number = 30;
  private _height:string = '500px';

  set height(h:string) {
    this._height = h;
  }

  set speed(s: number) {
    this.speed_label = s;

    if (s >= 100) {
      this.speed_label_pos_x = 7;
    } else if ((s < 100) && (s >= 10)) {
      this.speed_label_pos_x = 30;
    }
    else if (s < 10) {
      this.speed_label_pos_x = 60;
    }
    this._speed = s / 0.6666666667;
  }


  constructor(private santizier: DomSanitizer,  private store: Store<SpeedometerState>) {
    this.sp = store.select(x=>x.speedometer)
  }

  ngOnInit() {

    this.sp.subscribe(s => {
      this.speed = s.speed
    })

  }

  ngAfterViewInit() {
  /* let stopTimer =  setInterval(() => {
      this.speed = this.s+1;
      this.s++;
     if (this.s>200)
       this.s = 0;
    }, 100); */
  }


}

