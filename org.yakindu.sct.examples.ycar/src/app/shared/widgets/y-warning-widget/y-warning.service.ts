import {Injectable} from "@angular/core";
import {Observable} from "rxjs";
import {Store} from "@ngrx/store";
import {UPDATE_VISIBLE, UPDATE_WARNING, Warning, WarningState} from "../../../reducers/warning.reducer";

@Injectable()
export class YWarningService {
    warning$: Observable<Warning>;
    warningVisible: Observable<boolean>;

    constructor(public store: Store<WarningState>) {
        this.warning$ = store.select(x => x.warning);
        this.warningVisible = store.select(x => x.warningVisible);
    }


    show(): void {
        debugger;
        this.store.dispatch({type: UPDATE_VISIBLE, payload: true});
    }

    hide(): void {
        this.store.dispatch({type: UPDATE_VISIBLE, payload: false});
    }

    getWarningVisible(): Observable<boolean> {
        return this.warningVisible;
    }

    setWarning(title: string, message: string): void {
        let w: Warning = {
            title: title,
            message: message
        };
        this.store.dispatch({type: UPDATE_WARNING, payload: w});
    }
}
