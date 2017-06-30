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
export var YWeatherService = (function () {
    function YWeatherService() {
        this.temperature = 0;
        this.onChangedTemperature = new Subject();
        this.onChangedWeather = new Subject();
        this.onChangeSunrise = new Subject();
        this.onChangeSunset = new Subject();
    }
    YWeatherService.prototype.changeTemperature = function (t) {
        this.onChangedTemperature.next(t);
    };
    YWeatherService.prototype.changeWeather = function (w) {
        this.onChangedWeather.next(w);
    };
    YWeatherService.prototype.changeSunrise = function (s) {
        this.onChangeSunrise.next(s);
    };
    YWeatherService.prototype.changeSunset = function (s) {
        this.onChangeSunset.next(s);
    };
    YWeatherService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [])
    ], YWeatherService);
    return YWeatherService;
}());
export var WEATHER_SYMBOL;
(function (WEATHER_SYMBOL) {
    WEATHER_SYMBOL[WEATHER_SYMBOL["PARTLY_CLOUDY"] = 0] = "PARTLY_CLOUDY";
    WEATHER_SYMBOL[WEATHER_SYMBOL["CLOUDY"] = 1] = "CLOUDY";
    WEATHER_SYMBOL[WEATHER_SYMBOL["SUNNY"] = 2] = "SUNNY";
})(WEATHER_SYMBOL || (WEATHER_SYMBOL = {}));
