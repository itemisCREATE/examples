var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YInfotainmentComponent } from './y-infotainment.component';
import { YWeatherModule } from "./y-weather/y-weather.module";
import { YWeatherComponent } from "./y-weather/y-weather.component";
import { YMenuWidgetComponent } from './y-menu-widget/y-menu-widget.component';
import { YInfotainmentRoutingModule } from "./y-infotainment.routes";
import { YMusicModule } from "./y-music/y-music.module";
import { YMenuButtonComponent } from './y-menu-widget/y-menu-button/y-menu-button.component';
import { YShareModule } from "../shared/y-shared.module";
import { YPhoneModule } from "./y-phone/y-phone.module";
export var YInfotainmentModule = (function () {
    function YInfotainmentModule() {
    }
    YInfotainmentModule = __decorate([
        NgModule({
            imports: [
                CommonModule,
                YShareModule,
                YInfotainmentRoutingModule,
                YWeatherModule,
                YMusicModule,
                YPhoneModule
            ],
            declarations: [YInfotainmentComponent, YMenuWidgetComponent, YMenuWidgetComponent, YMenuButtonComponent],
            exports: [YWeatherComponent, YInfotainmentComponent, YMenuWidgetComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], YInfotainmentModule);
    return YInfotainmentModule;
}());
