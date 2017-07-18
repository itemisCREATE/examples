import {Component, OnInit} from '@angular/core';
import {YMenuWidgetService} from "./y-menu-widget.service";
import {YFueltankService} from "../../shared/widgets/y-fueltank-widget/y-fueltank.service";
import {AppState} from "../../app.store";
import {Store} from "@ngrx/store";
import {MenuState} from "../../reducers/menu.reducer";

@Component({
    selector: 'y-menu-widget',
    templateUrl: './y-menu-widget.component.html',
    styleUrls: ['./y-menu-widget.component.css'],
    providers: [YMenuWidgetService]
})
export class YMenuWidgetComponent implements OnInit {

    menuState = MenuState;

    constructor(private menuService: YMenuWidgetService, public fueltankService: YFueltankService,
                public store: Store<AppState>) {}

    navigateTo(n: string) {
        this.menuService.navigateTo(n);
    }

    onButtonClickedHandler(menuState: MenuState) {
        this.store.dispatch({type: "OPEN_MENU", payload:menuState});
    }

    ngOnInit() {}

}
