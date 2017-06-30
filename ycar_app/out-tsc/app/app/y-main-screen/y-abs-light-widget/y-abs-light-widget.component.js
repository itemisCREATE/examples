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
import { Store } from "@ngrx/store";
import { CONTROLLIGHT_TYPE } from "../../reducers/controllLights.reducer";
export var YAbsLightWidgetComponent = (function () {
    function YAbsLightWidgetComponent(store) {
        this.store = store;
        this.absLightOn = store.select(function (x) { return x.abs; });
    }
    YAbsLightWidgetComponent.prototype.getAbsLightOn = function () {
        return this.absLightOn;
    };
    YAbsLightWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.absLightOn.subscribe(function (b) {
            if (b.controlLightType === CONTROLLIGHT_TYPE.ABS)
                _this._on = b.on;
        });
    };
    YAbsLightWidgetComponent = __decorate([
        Component({
            selector: 'y-abs-light-widget',
            templateUrl: './y-abs-light-widget.component.html',
            inputs: ['on'],
            styleUrls: ['./y-abs-light-widget.component.css']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YAbsLightWidgetComponent);
    return YAbsLightWidgetComponent;
    var _a;
}());
