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
import { UPDATE_FUELTANK, DEC_FUELTANK, FUELTANK_STATE } from "../../../reducers/fueltank.reducer";
export var YFueltankService = (function () {
    function YFueltankService(store) {
        var _this = this;
        this.store = store;
        this.fuelTank = {
            full: 100
        };
        this.fuelTank$ = store.select(function (x) { return x.fueltank; });
        this.fuelTank$.subscribe(function (f) {
            _this.fuelTank = f;
            if (_this.fuelTank.full <= 10) {
                _this.fuelState = FUELTANK_STATE.EMPTY;
            }
        });
        //this.fuelTank$.subscribe()
    }
    YFueltankService.prototype.UpdateFuelTank = function (f) {
        var fuelTank = {
            full: f
        };
        this.store.dispatch({ type: UPDATE_FUELTANK, payload: fuelTank });
    };
    YFueltankService.prototype.decFuelTank = function (v) {
        this.store.dispatch({ type: DEC_FUELTANK, payload: v });
    };
    YFueltankService.prototype.getFuelTankValue = function () {
        var v = 0;
        this.store.take(1).subscribe(function (s) { return v = s.fueltank.full; });
        return v;
    };
    Object.defineProperty(YFueltankService.prototype, "onFuelTank", {
        get: function () {
            return this.fuelTank$;
        },
        enumerable: true,
        configurable: true
    });
    YFueltankService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YFueltankService);
    return YFueltankService;
    var _a;
}());
