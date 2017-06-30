import {Component, OnInit} from '@angular/core';
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";
import {ControlLightState, ControlLight, CONTROLLIGHT_TYPE} from "../../reducers/controllLights.reducer";

@Component({
    selector: 'y-abs-light-widget',
    templateUrl: './y-abs-light-widget.component.html',
    inputs: ['on'],
    styleUrls: ['./y-abs-light-widget.component.css']
})
export class YAbsLightWidgetComponent implements OnInit {

    private _on: boolean;
    private absLightOn: Observable<ControlLight>;

    constructor(private store: Store<ControlLightState>) {
        this.absLightOn = store.select(x => x.abs);
    }

    getAbsLightOn(): Observable<ControlLight> {
        return this.absLightOn;
    }

    ngOnInit() {
        this.absLightOn.subscribe(b => {
            if (b.controlLightType === CONTROLLIGHT_TYPE.ABS)
                this._on = b.on;
        })
    }
}
