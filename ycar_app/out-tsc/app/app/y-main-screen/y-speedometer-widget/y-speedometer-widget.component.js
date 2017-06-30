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
import { DomSanitizer } from "@angular/platform-browser";
import { Store } from "@ngrx/store";
export var YSpeedometerWidgetComponent = (function () {
    function YSpeedometerWidgetComponent(santizier, store) {
        this.santizier = santizier;
        this.store = store;
        this._speed = 0;
        this.s = 0;
        this.speed_label = 0;
        this.speed_label_pos_x = 30;
        this._height = '500px';
        this.sp = store.select(function (x) { return x.speedometer; });
    }
    Object.defineProperty(YSpeedometerWidgetComponent.prototype, "height", {
        set: function (h) {
            this._height = h;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(YSpeedometerWidgetComponent.prototype, "speed", {
        set: function (s) {
            this.speed_label = s;
            if (s >= 100) {
                this.speed_label_pos_x = 7;
            }
            else if ((s < 100) && (s >= 10)) {
                this.speed_label_pos_x = 30;
            }
            else if (s < 10) {
                this.speed_label_pos_x = 60;
            }
            this._speed = s / 0.6666666667;
        },
        enumerable: true,
        configurable: true
    });
    YSpeedometerWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.sp.subscribe(function (s) {
            _this.speed = s.speed;
        });
    };
    YSpeedometerWidgetComponent.prototype.ngAfterViewInit = function () {
        /* let stopTimer =  setInterval(() => {
            this.speed = this.s+1;
            this.s++;
           if (this.s>200)
             this.s = 0;
          }, 100); */
    };
    YSpeedometerWidgetComponent = __decorate([
        Component({
            selector: 'y-speedometer-widget',
            inputs: ['speed', 'height'],
            templateUrl: './y-speedometer-widget.component.html',
            styleUrls: ['./y-speedometer-widget.component.css']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof DomSanitizer !== 'undefined' && DomSanitizer) === 'function' && _a) || Object, (typeof (_b = typeof Store !== 'undefined' && Store) === 'function' && _b) || Object])
    ], YSpeedometerWidgetComponent);
    return YSpeedometerWidgetComponent;
    var _a, _b;
}());
