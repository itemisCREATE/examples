/**
 * Created by Dennis on 07.11.16.
 */
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { YTrustStylePipe } from "./pipes/y-trust-style.pipe";
import { YMenuHeaderComponent } from "./y-menu-header/y-menu-header.component";
import { YWarningWidgetComponent } from './widgets/y-warning-widget/y-warning-widget.component';
import { YWarningService } from "./widgets/y-warning-widget/y-warning.service";
import { YFueltankWidgetComponent } from "./widgets/y-fueltank-widget/y-fueltank-widget.component";
import { YClockWidgetComponent } from './widgets/y-clock-widget/y-clock-widget.component';
import { YFueltankService } from "./widgets/y-fueltank-widget/y-fueltank.service";
export var YShareModule = (function () {
    function YShareModule() {
    }
    YShareModule = __decorate([
        NgModule({
            imports: [CommonModule],
            declarations: [YTrustStylePipe, YMenuHeaderComponent, YWarningWidgetComponent, YWarningWidgetComponent, YFueltankWidgetComponent, YClockWidgetComponent],
            providers: [YWarningService, YFueltankService],
            exports: [YTrustStylePipe, YMenuHeaderComponent, YWarningWidgetComponent, YFueltankWidgetComponent, YClockWidgetComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], YShareModule);
    return YShareModule;
}());
