import {Component, OnInit} from '@angular/core';
import {ControlLightState, ControlLight, CONTROLLIGHT_TYPE} from "../../reducers/controllLights.reducer";
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";

@Component({
    selector: 'y-highbeam-light-widget',
    templateUrl: './y-highbeam-light-widget.component.html',
    styleUrls: ['./y-highbeam-light-widget.component.css'],
    inputs: ['on']
})
export class YHighbeamLightWidgetComponent implements OnInit {

    private _on: boolean = false;
    private highBeamOn: Observable<ControlLight>;

    set on(b: boolean) {
        this._on = b;
    }

    get on(): boolean {
        return this._on;
    }

    constructor(private store: Store<ControlLightState>) {
        this.highBeamOn = store.select(x => x.highBeam);
    }

    ngOnInit() {
        this.highBeamOn.subscribe(b => {
            if (b.controlLightType === CONTROLLIGHT_TYPE.HIGHBEAM)
                this.on = b.on;
        })
    }

}
