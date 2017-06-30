var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Injectable } from '@angular/core';
import { Router } from "@angular/router";
import { Store } from "@ngrx/store";
import { UPDATE_ROUTER_URL } from "../../reducers/router.reducer";
import { Subject } from "rxjs";
export var RouterService = (function () {
    function RouterService(router, store) {
        this.router = router;
        this.store = store;
        this.onRouterChange = new Subject();
        this.routerUrl = store.select(function (x) { return x.routerState; });
    }
    RouterService.prototype.getRouterChange = function () {
        return this.onRouterChange;
    };
    RouterService.prototype.getRouterUrl = function () {
        return this.routerUrl;
    };
    RouterService.prototype.navigate = function (url) {
        var _this = this;
        this.router.navigateByUrl(url)
            .then(function (succes) {
            _this.onRouterChange.next();
        });
        this.updateRouterUrl(url);
    };
    RouterService.prototype.updateRouterUrl = function (url) {
        this.store.dispatch({ type: UPDATE_ROUTER_URL, payload: url });
    };
    RouterService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Router !== 'undefined' && Router) === 'function' && _a) || Object, (typeof (_b = typeof Store !== 'undefined' && Store) === 'function' && _b) || Object])
    ], RouterService);
    return RouterService;
    var _a, _b;
}());
