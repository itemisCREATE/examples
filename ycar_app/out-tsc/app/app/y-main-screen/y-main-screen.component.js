var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
import { Component, Inject } from '@angular/core';
import { YMainScreenService } from "./y-main-screen.service";
import { PageAnimation } from "../shared/animations/page.animation";
import { RouterService } from "../shared/services/router.service";
import { MenuService } from "../gen/statemachine/menuService.statemachine";
import { MenuState } from "../reducers/menu.reducer";
export var YMainScreenComponent = (function () {
    function YMainScreenComponent(mainScreenService, routerService, menuService) {
        this.mainScreenService = mainScreenService;
        this.routerService = routerService;
        this.menuService = menuService;
        this.animationState = "scaleOut";
        this.main_vm = {
            speedometer: 0,
            fueltank: 100
        };
    }
    YMainScreenComponent.prototype.ngOnInit = function () {
        var _this = this;
        setTimeout(function () {
            _this.animationState = "scaleIn";
        }, 10);
        //region  INITIALIZE menuService statemachine
        var menuOperationCallback = {
            showMenuScreen: function () {
                _this.routerService.navigate("mainScreen/infotainment/menu");
            },
            showWeatherScreen: function () {
                _this.routerService.navigate("mainScreen/infotainment/weather");
            },
            showMusicScreen: function () {
                _this.routerService.navigate("mainScreen/infotainment/music");
            },
            showPhoneScreen: function () {
                _this.routerService.navigate("mainScreen/infotainment/phone");
            },
            waitingMessage: function () {
                console.log("waiting");
            }
        };
        this.menuService.defaultScope.setdefaultScopeOperationCallback(menuOperationCallback);
        this.menuService.init();
        this.menuService.enter();
        this.mainScreenService.menuChanged.subscribe(function (menuState) {
            switch (menuState) {
                case MenuState.MENU:
                    console.log("menu state");
                    _this.menuService.menuState = "menu";
                    break;
                case MenuState.WEATHER:
                    _this.menuService.menuState = "weather";
                    break;
                case MenuState.PHONE:
                    _this.menuService.menuState = "phone";
                    break;
                case MenuState.MUSIC:
                    _this.menuService.menuState = "music";
                    break;
            }
        });
        this.menuService.subscribeOnMenuChanged(this.mainScreenService.menuChanged);
        //endregion
    };
    YMainScreenComponent = __decorate([
        Component({
            selector: 'app-y-main-screen',
            templateUrl: './y-main-screen.component.html',
            styleUrls: ['./y-main-screen.component.css'],
            animations: PageAnimation.page
        }),
        __param(2, Inject("menuService")), 
        __metadata('design:paramtypes', [YMainScreenService, RouterService, MenuService])
    ], YMainScreenComponent);
    return YMainScreenComponent;
}());
