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
import { YWeatherService, WEATHER_SYMBOL } from "./y-weather.service";
import { PageAnimation } from "../../shared/animations/page.animation";
export var YWeatherComponent = (function () {
    //endregion
    function YWeatherComponent(weatherService) {
        var _this = this;
        this.weatherService = weatherService;
        this.state = "scaleOut";
        //region *** Weather ***
        this.weathersymbol = WEATHER_SYMBOL;
        this.temperature = 26;
        this.sunrise = '6:35';
        this.sunset = '8:20';
        this.weather = WEATHER_SYMBOL.SUNNY;
        weatherService.onChangedTemperature
            .subscribe(function (t) { return _this.temperature = t; });
        weatherService.onChangedWeather
            .subscribe(function (w) { return _this.weather = w; });
        weatherService.onChangeSunset
            .subscribe(function (s) { return _this.sunset = s; });
        weatherService.onChangeSunrise
            .subscribe(function (s) { return _this.sunrise = s; });
    }
    Object.defineProperty(YWeatherComponent.prototype, "weather", {
        get: function () {
            return this._weather;
        },
        set: function (w) {
            this._weather = w;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(YWeatherComponent.prototype, "temperature", {
        get: function () {
            return this._temperature;
        },
        set: function (t) {
            this._temperature = t;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(YWeatherComponent.prototype, "sunrise", {
        get: function () {
            return this._sunrise;
        },
        set: function (s) {
            this._sunrise = s;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(YWeatherComponent.prototype, "sunset", {
        get: function () {
            return this._sunset;
        },
        set: function (s) {
            this._sunset = s;
        },
        enumerable: true,
        configurable: true
    });
    YWeatherComponent.prototype.ngOnInit = function () {
        var _this = this;
        setTimeout(function () {
            _this.state = "scaleIn";
            console.log(_this.state);
        }, 10);
    };
    YWeatherComponent = __decorate([
        Component({
            selector: 'y-weather',
            inputs: ['temperature', 'sunrise', 'sunset', 'weather'],
            templateUrl: './y-weather.component.html',
            styleUrls: ['./y-weather.component.css'],
            animations: PageAnimation.page
        }), 
        __metadata('design:paramtypes', [YWeatherService])
    ], YWeatherComponent);
    return YWeatherComponent;
}());
