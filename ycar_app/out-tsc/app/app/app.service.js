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
import { Store } from "@ngrx/store";
import { Router } from "@angular/router";
export var AppService = (function () {
    function AppService(store, router) {
        this.store = store;
        this.hmiState = store.select(function (appState) { return appState.hmiState; });
        this.hmiState.subscribe(function (hmiState) {
            switch (hmiState) {
                case HmiState.OFF:
                    console.log('off');
                    break;
                case HmiState.ON:
                    console.log('on');
            }
        });
    }
    AppService.prototype.turnOn = function () {
        this.setHmiState(HmiState.ON);
    };
    AppService.prototype.turnOff = function () {
        this.setHmiState(HmiState.OFF);
    };
    AppService.prototype.setHmiState = function (hmiState) {
        switch (hmiState) {
            case HmiState.OFF:
                this.store.dispatch({ type: "SET_HMI_STATE_OFF", payload: hmiState });
                break;
            case HmiState.ON:
                this.store.dispatch({ type: "SET_HMI_STATE_ON", payload: hmiState });
                break;
        }
    };
    AppService.prototype.getHmiState = function () {
        return this.hmiState;
    };
    AppService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object, (typeof (_b = typeof Router !== 'undefined' && Router) === 'function' && _b) || Object])
    ], AppService);
    return AppService;
    var _a, _b;
}());
export var HmiState;
(function (HmiState) {
    HmiState[HmiState["ON"] = 0] = "ON";
    HmiState[HmiState["OFF"] = 1] = "OFF";
})(HmiState || (HmiState = {}));
;
