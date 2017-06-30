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
import { Observable } from "rxjs";
export var YClockWidgetComponent = (function () {
    function YClockWidgetComponent() {
    }
    YClockWidgetComponent.prototype.checkTime = function (i) {
        if (i < 10) {
            i = "0" + i;
        }
        ; // add zero in front of numbers < 10
        return i;
    };
    YClockWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        var timer = Observable.timer(10, 1000);
        timer.subscribe(function (t) {
            _this.today = new Date();
            _this.hour = _this.today.getHours();
            _this.minute = _this.checkTime(_this.today.getMinutes());
            _this.second = _this.checkTime(_this.today.getSeconds());
        });
    };
    YClockWidgetComponent = __decorate([
        Component({
            selector: 'y-clock-widget',
            templateUrl: './y-clock-widget.component.html',
            styleUrls: ['./y-clock-widget.component.css']
        }), 
        __metadata('design:paramtypes', [])
    ], YClockWidgetComponent);
    return YClockWidgetComponent;
}());
