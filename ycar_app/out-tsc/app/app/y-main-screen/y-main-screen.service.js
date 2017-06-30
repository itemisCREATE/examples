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
import { Subject } from "rxjs";
import { Store } from "@ngrx/store";
import { UPDATE_LIGHT_ON, CONTROLLIGHT_TYPE } from "../reducers/controllLights.reducer";
import { UPDATE_SPEEDOMETER_SPEED } from "../reducers/speedometer.reducer";
import { UPDATE_FUELTANK } from "../reducers/fueltank.reducer";
export var YMainScreenService = (function () {
    function YMainScreenService(store) {
        this.store = store;
        this.onChangeFuelTank = new Subject();
        this.routerState$ = store.select(function (appState) { return appState.routerState; });
        this.menuChanged = store.select(function (appState) { return appState.menu; });
        this.menuChanged.subscribe(function (state) {
            console.log(state);
        });
    }
    YMainScreenService.prototype.message = function () {
        console.log("Waiting");
    };
    YMainScreenService.prototype.getMenuChanged = function () {
        return this.menuChanged;
    };
    YMainScreenService.prototype.changeSpeedometer = function (s) {
        var sp = {
            speed: s
        };
        this.store.dispatch({ type: UPDATE_SPEEDOMETER_SPEED, payload: sp });
    };
    YMainScreenService.prototype.changeOilOn = function (b) {
        var c = {
            controlLightType: CONTROLLIGHT_TYPE.OIL,
            on: b
        };
        this.store.dispatch({ type: UPDATE_LIGHT_ON, payload: c });
    };
    YMainScreenService.prototype.changeAbsOn = function (b) {
        var c = {
            controlLightType: CONTROLLIGHT_TYPE.ABS,
            on: b
        };
        this.store.dispatch({ type: UPDATE_LIGHT_ON, payload: c });
    };
    YMainScreenService.prototype.changeHeadLightOn = function (b) {
        var c = {
            controlLightType: CONTROLLIGHT_TYPE.HEADLIGHT,
            on: b
        };
        this.store.dispatch({ type: UPDATE_LIGHT_ON, payload: c });
    };
    YMainScreenService.prototype.changeHighBeamOn = function (b) {
        var c = {
            controlLightType: CONTROLLIGHT_TYPE.HIGHBEAM,
            on: b
        };
        this.store.dispatch({ type: UPDATE_LIGHT_ON, payload: c });
    };
    YMainScreenService.prototype.changeFuelTank = function (n) {
        var fuelTank = {
            full: n
        };
        this.store.dispatch({ type: UPDATE_FUELTANK, payload: fuelTank });
        // this.onChangeFuelTank.next(n);
    };
    YMainScreenService.prototype.onChangeRouterState = function () {
        return this.routerState$;
    };
    YMainScreenService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YMainScreenService);
    return YMainScreenService;
    var _a;
}());
