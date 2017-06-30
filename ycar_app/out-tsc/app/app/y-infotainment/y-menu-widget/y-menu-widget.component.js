var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from '@angular/core';
import { YMenuWidgetService } from "./y-menu-widget.service";
import { YFueltankService } from "../../shared/widgets/y-fueltank-widget/y-fueltank.service";
import { Store } from "@ngrx/store";
import { MenuState } from "../../reducers/menu.reducer";
export var YMenuWidgetComponent = (function () {
    function YMenuWidgetComponent(menuService, fueltankService, store) {
        this.menuService = menuService;
        this.fueltankService = fueltankService;
        this.store = store;
        this.menuState = MenuState;
    }
    YMenuWidgetComponent.prototype.ngOnInit = function () {
    };
    YMenuWidgetComponent.prototype.navigateTo = function (n) {
        this.menuService.navigateTo(n);
    };
    YMenuWidgetComponent.prototype.onButtonClickedHandler = function (menuState) {
        this.store.dispatch({ type: "OPEN_MENU", payload: menuState });
        //   this.navigateTo(button);
        console.log(menuState);
    };
    YMenuWidgetComponent = __decorate([
        Component({
            selector: 'y-menu-widget',
            templateUrl: './y-menu-widget.component.html',
            styleUrls: ['./y-menu-widget.component.css'],
            providers: [YMenuWidgetService]
        }), 
        __metadata('design:paramtypes', [YMenuWidgetService, YFueltankService, (typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YMenuWidgetComponent);
    return YMenuWidgetComponent;
    var _a;
}());
