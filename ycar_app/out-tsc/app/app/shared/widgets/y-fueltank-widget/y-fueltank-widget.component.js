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
export var YFueltankWidgetComponent = (function () {
    function YFueltankWidgetComponent(store) {
        this.store = store;
        this._full = 100;
        this.fueltank = store.select(function (x) { return x.fueltank; });
    }
    Object.defineProperty(YFueltankWidgetComponent.prototype, "full", {
        get: function () {
            return this._full;
        },
        set: function (f) {
            if (f > 100) {
                this._full = 100;
            }
            else if (f < 0) {
                this._full = 0;
            }
            else {
                this._full = f;
            }
        },
        enumerable: true,
        configurable: true
    });
    YFueltankWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.fueltank.subscribe(function (f) {
            _this.full = f.full;
        });
    };
    YFueltankWidgetComponent = __decorate([
        Component({
            selector: 'y-fueltank-widget',
            inputs: ['full'],
            templateUrl: './y-fueltank-widget.component.html',
            styleUrls: ['./y-fueltank-widget.component.css']
        }), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YFueltankWidgetComponent);
    return YFueltankWidgetComponent;
    var _a;
}());
