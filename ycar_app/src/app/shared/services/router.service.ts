import {Injectable} from '@angular/core';
import {Router} from "@angular/router";
import {AppState} from "../../app.store";
import {Store} from "@ngrx/store";
import {UPDATE_ROUTER_URL} from "../../reducers/router.reducer";
import {Observable, Subject} from "rxjs";

@Injectable()
export class RouterService {

    routerUrl: Observable<string>;

    onRouterChange: Subject<any> = new Subject<any>();

    constructor(public router: Router, public store: Store<AppState>) {
        this.routerUrl = store.select(x => x.routerState);

    }

    getRouterChange():Observable<any> {
        return this.onRouterChange;
    }

    getRouterUrl(): Observable<string> {
        return this.routerUrl;
    }


    navigate(url: string): void {
        this.router.navigateByUrl(url)
            .then(succes => {
                this.onRouterChange.next();
            });
        this.updateRouterUrl(url);
    }

    updateRouterUrl(url: string): void {
        this.store.dispatch({type: UPDATE_ROUTER_URL, payload: url});
    }

}
