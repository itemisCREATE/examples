import {Component, OnInit} from "@angular/core";
import {FuelTank} from "../../../reducers/fueltank.reducer";
import {Store} from "@ngrx/store";
import {Observable} from "rxjs";
import {AppState} from "../../../app.store";

@Component({
    selector: 'y-fueltank-widget',
    inputs: ['full'],
    templateUrl: './y-fueltank-widget.component.html',
    styleUrls: ['./y-fueltank-widget.component.css']
})
export class YFueltankWidgetComponent implements OnInit {
    private _full: number = 100;
    private fueltank: Observable<FuelTank>;

    set full(f: number) {
        if (f > 100) {
            this._full = 100;
        } else if (f < 0) {
            this._full = 0;
        } else {
            this._full = f;
        }
    }

    get full(): number {
        return this._full;
    }

    constructor(private store: Store<AppState>) {
        this.fueltank = store.select(x => x.fueltank);
    }

    ngOnInit() {
        this.fueltank.subscribe(f => {
            this.full = f.full;
        })
    }
}
