import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YInfotainmentComponent } from './y-infotainment.component';
import {YWeatherModule} from "./y-weather/y-weather.module";
import {YWeatherComponent} from "./y-weather/y-weather.component";
import { YMenuWidgetComponent } from './y-menu-widget/y-menu-widget.component';
import {YInfotainmentRoutingModule} from "./y-infotainment.routes";
import {YMusicModule} from "./y-music/y-music.module";
import { YMenuButtonComponent } from './y-menu-widget/y-menu-button/y-menu-button.component';

import {YShareModule} from "../shared/y-shared.module";
import {YPhoneModule} from "./y-phone/y-phone.module";

@NgModule({
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

})
export class YInfotainmentModule { }
