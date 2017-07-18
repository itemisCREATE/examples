import {Component, OnInit} from "@angular/core";
import {ActivatedRoute, Router} from "@angular/router";
import {AppState} from "../../app.store";
import {Store} from "@ngrx/store";
import {MenuState} from "../../reducers/menu.reducer";

@Component({
    selector: 'y-menu-header',
    templateUrl: './y-menu-header.component.html',
    styleUrls: ['./y-menu-header.component.css'],
    inputs: ['title']
})
export class YMenuHeaderComponent implements OnInit {
    _title: string;

    set title(t: string) {
        this._title = t;
    }

    get title(): string {
        return this._title;
    }

    constructor(private store: Store<AppState>) {}

    goToMenu() {
        this.store.dispatch({type: "OPEN_MENU", payload: MenuState.MENU})
    }

    ngOnInit() {}

}
