import {Injectable} from "@angular/core";
import {Observable} from "rxjs";
import {Store} from "@ngrx/store";
import {DEC_FUELTANK, FuelTank, FUELTANK_STATE, UPDATE_FUELTANK} from "../../../reducers/fueltank.reducer";
import {AppState} from "../../../app.store";

@Injectable()
export class YFueltankService {
    fuelTank: FuelTank;
    fuelState:FUELTANK_STATE;

    private fuelTank$: Observable<FuelTank>;

    constructor(private store: Store<AppState>) {
        this.fuelTank = {
            full: 100
        };


        this.fuelTank$ = store.select(x => x.fueltank);
        this.fuelTank$.subscribe(f => {
            this.fuelTank = f;
            if (this.fuelTank.full <= 10) {
                this.fuelState = FUELTANK_STATE.EMPTY;
            }
        });
    }

    UpdateFuelTank(f: number): void {
        let fuelTank: FuelTank = {
            full: f
        };

        this.store.dispatch({type: UPDATE_FUELTANK, payload: fuelTank});
    }

    decFuelTank(v:number) {
        this.store.dispatch({type:DEC_FUELTANK, payload: v})
    }

    getFuelTankValue(): number {
        let v: number = 0;
        this.store.take(1).subscribe(s => v = s.fueltank.full);
        return v;
    }

    get onFuelTank(): Observable<FuelTank> {
        return this.fuelTank$;
    }


}
