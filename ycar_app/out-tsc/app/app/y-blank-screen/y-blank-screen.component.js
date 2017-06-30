var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from "@angular/core";
import { AppService } from "../app.service";
import { PageAnimation } from "../shared/animations/page.animation";
export var YBlankScreenComponent = (function () {
    function YBlankScreenComponent(appService) {
        this.appService = appService;
        this.animationState = "scaleOut";
    }
    YBlankScreenComponent.prototype.ngOnInit = function () {
        var _this = this;
        setTimeout(function () {
            _this.animationState = "scaleIn";
        }, 10);
    };
    YBlankScreenComponent = __decorate([
        Component({
            selector: 'app-y-blank-screen',
            templateUrl: './y-blank-screen.component.html',
            styleUrls: ['./y-blank-screen.component.css'],
            animations: PageAnimation.page
        }), 
        __metadata('design:paramtypes', [AppService])
    ], YBlankScreenComponent);
    return YBlankScreenComponent;
}());
