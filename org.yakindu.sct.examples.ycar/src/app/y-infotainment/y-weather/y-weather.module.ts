import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YWeatherComponent } from './y-weather.component';
import {YWeatherService} from "./y-weather.service";
import {YShareModule} from "../../shared/y-shared.module";


@NgModule({
  imports: [
    CommonModule,
    YShareModule
  ],
  declarations: [YWeatherComponent],
  providers: [YWeatherService],
  exports: [
    YWeatherComponent
  ]
})
export class YWeatherModule { }
