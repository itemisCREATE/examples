import {BrowserModule} from "@angular/platform-browser";
import {NgModule} from "@angular/core";
import {FormsModule} from "@angular/forms";
import {HttpModule} from "@angular/http";
import {AppComponent} from "./app.component";
import {YBlankScreenModule} from "./y-blank-screen/y-blank-screen.module";
import {YStartScreenModule} from "./y-start-screen/y-start-screen.module";
import {YCarHMIAPPRoutingModule} from "./app-routing.module";
import {YMainScreenModule} from "./y-main-screen/y-main-screen.module";
import {YShareModule} from "./shared/y-shared.module";
import {YInfotainmentModule} from "./y-infotainment/y-infotainment.module";
import {StatemachineEventHandlerService} from "./gen/stateutils/statemachineEventHandler.service";
import {RouterService} from "./shared/services/router.service";
import {StoreModule} from "@ngrx/store";
import {appStore} from "./app.store";
import {AppService} from "./app.service";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";
import {ScreenService} from "./gen/statemachine/screenService.statemachine";
@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
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
    providers: [AppService,  StatemachineEventHandlerService, RouterService, ScreenService],

    bootstrap: [AppComponent]
})
export class AppModule {}


