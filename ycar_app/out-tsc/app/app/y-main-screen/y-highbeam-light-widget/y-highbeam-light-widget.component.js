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
export var YHighbeamLightWidgetComponent = (function () {
    function YHighbeamLightWidgetComponent(store) {
        this.store = store;
        this._on = false;
        this.highBeamOn = store.select(function (x) { return x.highBeam; });
    }
    Object.defineProperty(YHighbeamLightWidgetComponent.prototype, "on", {
        get: function () {
            return this._on;
        },
        set: function (b) {
            this._on = b;
        },
        enumerable: true,
        configurable: true
    });
    YHighbeamLightWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.highBeamOn.subscribe(function (b) {
            if (b.controlLightType === CONTROLLIGHT_TYPE.HIGHBEAM)
                _this.on = b.on;
        });
    };
    YHighbeamLightWidgetComponent = __decorate([
        Component({
            selector: 'y-highbeam-light-widget',
            templateUrl: './y-highbeam-light-widget.component.html',
            styleUrls: ['./y-highbeam-light-widget.component.css'],
            inputs: ['on']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YHighbeamLightWidgetComponent);
    return YHighbeamLightWidgetComponent;
    var _a;
}());
