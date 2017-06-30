var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component, style, animate, transition, state, trigger } from '@angular/core';
import { YWarningService } from "./y-warning.service";
import { Store } from "@ngrx/store";
export var YWarningWidgetComponent = (function () {
    function YWarningWidgetComponent(warningService, store) {
        this.warningService = warningService;
        this.store = store;
        this.animationState = "invisible";
        this.warningVisible$ = this.store.select(function (x) { return x.warningVisible; });
    }
    YWarningWidgetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.warningVisible$.subscribe(function (v) {
            if (v) {
                _this.animationState = "visible";
            }
            else {
                _this.animationState = "invisible";
            }
        });
    };
    YWarningWidgetComponent = __decorate([
        Component({
            selector: 'y-warning-widget',
            templateUrl: './y-warning-widget.component.html',
            styleUrls: ['./y-warning-widget.component.css'],
            animations: [
                trigger('flyInOut', [
                    state('visible', style({ transform: 'translateX(0)' })),
                    state('invisible', style({ transform: 'translateX(100%)' })),
                    transition('invisible => visible', animate('1000ms ease-in')),
                    transition('visible => invisible', animate('1000ms ease-out'))
                ])
            ] // PageAnimation.boxslide
        }), 
        __metadata('design:paramtypes', [YWarningService, (typeof (_a = typeof Store !== 'undefined' && Store) === 'function' && _a) || Object])
    ], YWarningWidgetComponent);
    return YWarningWidgetComponent;
    var _a;
}());
