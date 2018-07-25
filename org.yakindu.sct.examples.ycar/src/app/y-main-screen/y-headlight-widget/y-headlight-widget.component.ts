import {Component, OnInit} from '@angular/core';
import {ControlLightState, ControlLight, CONTROLLIGHT_TYPE} from "../../reducers/controllLights.reducer";
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";

@Component({
    selector: 'y-headlight-widget',
    templateUrl: './y-headlight-widget.component.html',
    styleUrls: ['./y-headlight-widget.component.css'],
    inputs: ['on']
})
export class YHeadlightWidgetComponent implements OnInit {

    private _on: boolean;
    private headLightOn: Observable<ControlLight>;


    set on(b: boolean) {
        this._on = b;
    }

    get on(): boolean {
        return this._on;
    }

    constructor(private store: Store<ControlLightState>) {
        this.headLightOn = store.select(x => x.headLight);
    }

    ngOnInit() {
        this.headLightOn.subscribe(b => {
            if (b.controlLightType === CONTROLLIGHT_TYPE.HEADLIGHT)
                this.on = b.on;
        })
    }
}
