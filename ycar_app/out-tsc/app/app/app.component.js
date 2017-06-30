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
import { Component, Inject } from "@angular/core";
import { ScreenService } from "./gen/statemachine/screenService.statemachine";
import { Subject } from "rxjs";
import { RouterService } from "./shared/services/router.service";
import { AppService, HmiState } from "./app.service";
export var AppComponent = (function () {
    function AppComponent(screenService, routerService, appService) {
        var _this = this;
        this.screenService = screenService;
        this.routerService = routerService;
        this.appService = appService;
        this.turnOff$ = new Subject();
        this.turnOn$ = new Subject();
        this.appService.hmiState.subscribe(function (state) {
            switch (state) {
                case HmiState.OFF:
                    _this.turnOff$.next();
                    break;
                case HmiState.ON:
                    _this.turnOn$.next();
            }
        });
    }
    AppComponent.prototype.ngAfterViewInit = function () {
        var _this = this;
        this.screenService.subscribeOnTurnOff(this.turnOff$);
        this.screenService.subscribeOnTurnOn(this.turnOn$);
        var operationCallback = {
            navigateToWelcomeScreen: function () {
                console.log("welcome to WelcomeScreen");
                _this.routerService.navigate("welcomeScreen");
            },
            navigateToMainScreen: function () {
                console.log("navigate to mainScreen");
                _this.routerService.navigate("mainScreen");
            }
        };
        this.screenService.defaultScope.setdefaultScopeOperationCallback(operationCallback);
        this.screenService.init();
        this.screenService.enter();
    };
    AppComponent = __decorate([
        Component({
            selector: 'app-root',
            templateUrl: './app.component.html',
            styleUrls: ['./app.component.css']
        }),
        __param(0, Inject("screenService")), 
        __metadata('design:paramtypes', [ScreenService, RouterService, AppService])
    ], AppComponent);
    return AppComponent;
}());
