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
import { YMainScreenComponent } from './y-main-screen.component';
import { mainScreenRoute } from "./y-main-screen.route";
import { YSpeedometerWidgetComponent } from './y-speedometer-widget/y-speedometer-widget.component';
import { YShareModule } from "../shared/y-shared.module";
import { YWaterTemperatureWidgetComponent } from './y-water-temperature-widget/y-water-temperature-widget.component';
import { YOilLightWidgetComponent } from './y-oil-light-widget/y-oil-light-widget.component';
import { YAbsLightWidgetComponent } from './y-abs-light-widget/y-abs-light-widget.component';
import { YHighbeamLightWidgetComponent } from './y-highbeam-light-widget/y-highbeam-light-widget.component';
import { YHeadlightWidgetComponent } from './y-headlight-widget/y-headlight-widget.component';
import { YInfotainmentModule } from "../y-infotainment/y-infotainment.module";
import { YWarningService } from "../shared/widgets/y-warning-widget/y-warning.service";
import { YMainScreenService } from "./y-main-screen.service";
import { MenuService } from "../gen/statemachine/menuService.statemachine";
export var YMainScreenModule = (function () {
    function YMainScreenModule() {
    }
    YMainScreenModule = __decorate([
        NgModule({
            imports: [
                CommonModule,
                YShareModule,
                mainScreenRoute,
                YInfotainmentModule
            ],
            providers: [YWarningService, YMainScreenService, { provide: "menuService", useClass: MenuService }],
            declarations: [YMainScreenComponent, YSpeedometerWidgetComponent, YSpeedometerWidgetComponent, YWaterTemperatureWidgetComponent, YOilLightWidgetComponent, YAbsLightWidgetComponent, YHighbeamLightWidgetComponent, YHeadlightWidgetComponent],
            exports: [YSpeedometerWidgetComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], YMainScreenModule);
    return YMainScreenModule;
}());
