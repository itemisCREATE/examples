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
import { Router, ActivatedRoute } from "@angular/router";
export var YMenuWidgetService = (function () {
    function YMenuWidgetService(router, route) {
        this.router = router;
        this.route = route;
    }
    YMenuWidgetService.prototype.navigateTo = function (menuItem) {
        console.log(menuItem);
        this.router.navigate(['../' + menuItem], { relativeTo: this.route });
    };
    YMenuWidgetService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Router !== 'undefined' && Router) === 'function' && _a) || Object, (typeof (_b = typeof ActivatedRoute !== 'undefined' && ActivatedRoute) === 'function' && _b) || Object])
    ], YMenuWidgetService);
    return YMenuWidgetService;
    var _a, _b;
}());
