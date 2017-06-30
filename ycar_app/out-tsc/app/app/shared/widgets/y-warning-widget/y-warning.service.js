var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Injectable } from "@angular/core";
import { Store } from "@ngrx/store";
import { UPDATE_VISIBLE, UPDATE_WARNING } from "../../../reducers/warning.reducer";
export var YWarningService = (function () {
    function YWarningService(store) {
        this.store = store;
        this.warning$ = store.select(function (x) { return x.warning; });
        this.warningVisible = store.select(function (x) { return x.warningVisible; });
    }
    YWarningService.prototype.show = function () {
        debugger;
        this.store.dispatch({ type: UPDATE_VISIBLE, payload: true });
    };
    YWarningService.prototype.hide = function () {
        this.store.dispatch({ type: UPDATE_VISIBLE, payload: false });
    };
    YWarningService.prototype.getWarningVisible = function () {
        return this.warningVisible;
    };
    YWarningService.prototype.setWarning = function (title, message) {
        var w = {
            title: title,
            message: message
        };
        this.store.dispatch({ type: UPDATE_WARNING, payload: w });
    };
    YWarningService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YWarningService);
    return YWarningService;
    var _a;
}());
