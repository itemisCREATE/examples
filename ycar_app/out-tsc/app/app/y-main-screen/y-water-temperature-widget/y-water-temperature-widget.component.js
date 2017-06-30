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
export var YWaterTemperatureWidgetComponent = (function () {
    function YWaterTemperatureWidgetComponent() {
        this._temperature = 0;
    }
    Object.defineProperty(YWaterTemperatureWidgetComponent.prototype, "temperature", {
        set: function (t) {
            this._temperature = t;
        },
        enumerable: true,
        configurable: true
    });
    YWaterTemperatureWidgetComponent.prototype.ngOnInit = function () {
    };
    YWaterTemperatureWidgetComponent = __decorate([
        Component({
            selector: 'y-water-temperature-widget',
            templateUrl: './y-water-temperature-widget.component.html',
            styleUrls: ['./y-water-temperature-widget.component.css']
        }), 
        __metadata('design:paramtypes', [])
    ], YWaterTemperatureWidgetComponent);
    return YWaterTemperatureWidgetComponent;
}());
