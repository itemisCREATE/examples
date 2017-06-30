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
export var YCallHandlerButtonComponent = (function () {
    function YCallHandlerButtonComponent() {
        this._caption = "Accept";
        this._active = false;
    }
    Object.defineProperty(YCallHandlerButtonComponent.prototype, "active", {
        set: function (a) {
            this._active = a;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(YCallHandlerButtonComponent.prototype, "caption", {
        set: function (c) {
            this._caption = c;
        },
        enumerable: true,
        configurable: true
    });
    YCallHandlerButtonComponent.prototype.ngOnInit = function () {
    };
    YCallHandlerButtonComponent = __decorate([
        Component({
            selector: 'y-call-handler-button',
            templateUrl: './y-call-handler-button.component.html',
            styleUrls: ['./y-call-handler-button.component.css'],
            inputs: ['caption', 'active']
        }), 
        __metadata('design:paramtypes', [])
    ], YCallHandlerButtonComponent);
    return YCallHandlerButtonComponent;
}());
