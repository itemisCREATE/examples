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
import { Router, ActivatedRoute } from "@angular/router";
import { Store } from "@ngrx/store";
import { MenuState } from "../../reducers/menu.reducer";
export var YMenuHeaderComponent = (function () {
    function YMenuHeaderComponent(router, route, store) {
        this.router = router;
        this.route = route;
        this.store = store;
    }
    Object.defineProperty(YMenuHeaderComponent.prototype, "title", {
        get: function () {
            return this._title;
        },
        set: function (t) {
            this._title = t;
        },
        enumerable: true,
        configurable: true
    });
    YMenuHeaderComponent.prototype.goToMenu = function () {
        this.store.dispatch({ type: "OPEN_MENU", payload: MenuState.MENU });
        //  this.router.navigate(['../'], {relativeTo: this.route});
    };
    YMenuHeaderComponent.prototype.ngOnInit = function () {
    };
    YMenuHeaderComponent = __decorate([
        Component({
            selector: 'y-menu-header',
            templateUrl: './y-menu-header.component.html',
            styleUrls: ['./y-menu-header.component.css'],
            inputs: ['title']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Router !== 'undefined' && Router) === 'function' && _a) || Object, (typeof (_b = typeof ActivatedRoute !== 'undefined' && ActivatedRoute) === 'function' && _b) || Object, (typeof (_c = typeof Store !== 'undefined' && Store) === 'function' && _c) || Object])
    ], YMenuHeaderComponent);
    return YMenuHeaderComponent;
    var _a, _b, _c;
}());
