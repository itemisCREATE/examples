import {Routes, RouterModule} from "@angular/router";
import {ModuleWithProviders} from "@angular/core";
import {YMainScreenComponent} from "./y-main-screen.component";
import {YInfotainmentComponent} from "../y-infotainment/y-infotainment.component";
import {YWeatherComponent} from "../y-infotainment/y-weather/y-weather.component";
import {YMusicComponent} from "../y-infotainment/y-music/y-music.component";
import {YMenuWidgetComponent} from "../y-infotainment/y-menu-widget/y-menu-widget.component";
import {YPhoneComponent} from "../y-infotainment/y-phone/y-phone.component";
import {YCallHandlerComponent} from "../y-infotainment/y-phone/y-call-handler/y-call-handler.component";
import {YAddressBookComponent} from "../y-infotainment/y-phone/y-address-book/y-address-book.component";

const routes: Routes = [
  {
    path: 'mainScreen', component: YMainScreenComponent,
    children: [
      {path: '', redirectTo: 'infotainment', pathMatch: 'full'},
      {
        path: 'infotainment', component: YInfotainmentComponent,
        children: [
          {path: '', redirectTo: 'menu', pathMatch: 'full'},
          {path: 'menu', component: YMenuWidgetComponent},
          {path: 'weather', component: YWeatherComponent},
          {path: 'music', component: YMusicComponent},
          {
            path: 'phone', component: YPhoneComponent,
            children: [
              {path: '', redirectTo:'addressbook', pathMatch: 'full'},
              {path: 'addressbook', component: YAddressBookComponent},
              {path: 'call', component: YCallHandlerComponent}
            ],
          }
        ]
      }
    ]
  }
];

export var mainScreenRoute: ModuleWithProviders = RouterModule.forRoot(routes);
