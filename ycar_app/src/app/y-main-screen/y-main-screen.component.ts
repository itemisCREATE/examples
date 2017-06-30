import {Component, OnInit} from "@angular/core";
import {YMainScreenService} from "./y-main-screen.service";
import {PageAnimation} from "../shared/animations/page.animation";
import {RouterService} from "../shared/services/router.service";
import {IOperationCallback, MenuService} from "../gen/statemachine/menuService.statemachine";
import {MenuState} from "../reducers/menu.reducer";


@Component({
    selector: 'app-y-main-screen',
    templateUrl: './y-main-screen.component.html',
    styleUrls: ['./y-main-screen.component.css'],
    animations: PageAnimation.page
})
export class YMainScreenComponent implements OnInit {
    animationState: string = "scaleOut";
    main_vm = {
        speedometer: 0,
        fueltank: 100
    };

    constructor(public mainScreenService: YMainScreenService,
                public routerService: RouterService, private menuService: MenuService) {}


    ngOnInit(){}

    ngAfterViewInit() {
        setTimeout(() => {
            this.animationState = "scaleIn";
        }, 10);

        let menuOperationCallback: IOperationCallback = {
            showMenuScreen: () => {
                this.routerService.navigate("mainScreen/infotainment/menu");
            },
            showWeatherScreen: () => {
                this.routerService.navigate("mainScreen/infotainment/weather")
            },
            showMusicScreen: () => {
                this.routerService.navigate("mainScreen/infotainment/music")
            },
            showPhoneScreen: () => {
                this.routerService.navigate("mainScreen/infotainment/phone")
            }
        };

        this.menuService.defaultScope.setdefaultScopeOperationCallback(menuOperationCallback);
        this.mainScreenService.menuChanged.subscribe(menuState => {
            switch (menuState) {
                case MenuState.MENU:
                    console.log("menu state");
                    this.menuService.menuState = "menu";
                    break;
                case MenuState.WEATHER:
                    this.menuService.menuState = "weather";
                    break;
                case MenuState.PHONE:
                    this.menuService.menuState = "phone";
                    break;
                case MenuState.MUSIC:
                    this.menuService.menuState = "music";
                    break;
            }
        });

        this.menuService.subscribeOnMenuChanged(this.mainScreenService.menuChanged);
        this.menuService.init();
        this.menuService.enter();
    }
}
