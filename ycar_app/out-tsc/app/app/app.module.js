var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { BrowserModule } from "@angular/platform-browser";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { HttpModule } from "@angular/http";
import { AppComponent } from "./app.component";
import { YBlankScreenModule } from "./y-blank-screen/y-blank-screen.module";
import { YStartScreenModule } from "./y-start-screen/y-start-screen.module";
import { YCarHMIAPPRoutingModule } from "./app-routing.module";
import { YMainScreenModule } from "./y-main-screen/y-main-screen.module";
import { YShareModule } from "./shared/y-shared.module";
import { YInfotainmentModule } from "./y-infotainment/y-infotainment.module";
import { StatemachineEventHandlerService } from "./gen/stateutils/statemachineEventHandler.service";
import { RouterService } from "./shared/services/router.service";
import { StoreModule } from "@ngrx/store";
import { appStore } from "./app.store";
import { ScreenSct } from "./gen/statemachine/screenSct.statemachine";
import { AppService } from "./app.service";
import { ScreenService } from "./gen/statemachine/screenService.statemachine";
export var AppModule = (function () {
    function AppModule() {
    }
    AppModule = __decorate([
        NgModule({
            declarations: [
                AppComponent
            ],
            imports: [
                BrowserModule,
                FormsModule,
                HttpModule,
                YShareModule,
                YCarHMIAPPRoutingModule,
                YBlankScreenModule,
                YStartScreenModule,
                YMainScreenModule,
                YInfotainmentModule,
                StoreModule.provideStore(appStore),
            ],
            providers: [AppService, ScreenSct, StatemachineEventHandlerService, RouterService, ScreenService,
                { provide: "screenService", useClass: ScreenService }],
            bootstrap: [AppComponent]
        }), 
        __metadata('design:paramtypes', [])
    ], AppModule);
    return AppModule;
}());
