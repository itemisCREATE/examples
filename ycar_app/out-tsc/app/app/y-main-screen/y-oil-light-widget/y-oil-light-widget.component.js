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
import { CONTROLLIGHT_TYPE } from "../../reducers/controllLights.reducer";
import { Store } from "@ngrx/store";
export var YOilLightWidgetComponent = (function () {
    function YOilLightWidgetComponent(store) {
        this.store = store;
        this.colorOn = '#ed1c24';
        this.colorOff = '#1a1a1a';
        this.oilLightOn = this.store.select(function (x) { return x.oil; });
    }
    Object.defineProperty(YOilLightWidgetComponent.prototype, "on", {
        set: function (b) {
            this._on = b;
            (b === true) ? this.color = this.colorOn : this.color = this.colorOff;
        },
        enumerable: true,
        configurable: true
    });
    YOilLightWidgetComponent.prototype.getOilLightOn = function () {
        return this.oilLightOn;
    };
    YOilLightWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.oilLightOn.subscribe(function (b) {
            if (b.controlLightType === CONTROLLIGHT_TYPE.OIL)
                _this.on = b.on;
        });
    };
    YOilLightWidgetComponent = __decorate([
        Component({
            selector: 'y-oil-light-widget',
            templateUrl: './y-oil-light-widget.component.html',
            inputs: ['on'],
            styleUrls: ['./y-oil-light-widget.component.css']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YOilLightWidgetComponent);
    return YOilLightWidgetComponent;
    var _a;
}());
