import {Component, OnInit} from '@angular/core';
import {Observable} from "rxjs";

@Component({
    selector: 'y-clock-widget',
    templateUrl: './y-clock-widget.component.html',
    styleUrls: ['./y-clock-widget.component.css']
})
export class YClockWidgetComponent implements OnInit {

    hour: number;
    minute: number;
    second: number;

    private today;

    private checkTime(i) {
        if (i < 10) {
            i = "0" + i
        };
        return i;
    }

    constructor() {}

    ngOnInit() {
        let timer = Observable.timer(10, 1000);
        timer.subscribe(t => {
            this.today = new Date();
            this.hour = this.today.getHours();
            this.minute = this.checkTime(this.today.getMinutes());
            this.second = this.checkTime(this.today.getSeconds());
        });
    }
}
