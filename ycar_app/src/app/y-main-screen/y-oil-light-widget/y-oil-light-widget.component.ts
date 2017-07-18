import {Component, OnInit} from '@angular/core';
import {ControlLightState, ControlLight, CONTROLLIGHT_TYPE} from "../../reducers/controllLights.reducer";
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";

@Component({
    selector: 'y-oil-light-widget',
    templateUrl: './y-oil-light-widget.component.html',
    inputs: ['on'],
    styleUrls: ['./y-oil-light-widget.component.css']
})
export class YOilLightWidgetComponent implements OnInit {

    private _on: boolean;
    private oilLightOn: Observable<ControlLight>;

    private _color: string;

    private colorOn: string = '#ed1c24';
    private colorOff: string = '#1a1a1a';

    private color;

    set on(b: boolean) {
        this._on = b;
        (b === true) ? this.color = this.colorOn : this.color = this.colorOff;
    }

    constructor(private store: Store<ControlLightState>) {
        this.oilLightOn = this.store.select(x => x.oil);
    }

    getOilLightOn(): Observable<ControlLight> {
        return this.oilLightOn;
    }

    ngOnInit() {
        this.oilLightOn.subscribe(b => {
            if (b.controlLightType === CONTROLLIGHT_TYPE.OIL)
                this.on = b.on;
        })
    }
}
