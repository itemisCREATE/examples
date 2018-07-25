import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YMainScreenComponent } from './y-main-screen.component';
import {mainScreenRoute} from "./y-main-screen.route";
import { YSpeedometerWidgetComponent } from './y-speedometer-widget/y-speedometer-widget.component';
import {YShareModule} from "../shared/y-shared.module";
import { YFueltankWidgetComponent } from '../shared/widgets/y-fueltank-widget/y-fueltank-widget.component';
import { YWaterTemperatureWidgetComponent } from './y-water-temperature-widget/y-water-temperature-widget.component';
import { YOilLightWidgetComponent } from './y-oil-light-widget/y-oil-light-widget.component';
import { YAbsLightWidgetComponent } from './y-abs-light-widget/y-abs-light-widget.component';
import { YHighbeamLightWidgetComponent } from './y-highbeam-light-widget/y-highbeam-light-widget.component';
import { YHeadlightWidgetComponent } from './y-headlight-widget/y-headlight-widget.component';
import {YInfotainmentModule} from "../y-infotainment/y-infotainment.module";
import {YWarningService} from "../shared/widgets/y-warning-widget/y-warning.service";
import {YMainScreenService} from "./y-main-screen.service";
import {MenuService} from "../gen/statemachine/menuService.statemachine";

@NgModule({
  imports: [
    CommonModule,
    YShareModule,
    mainScreenRoute,
    YInfotainmentModule
  ],
  providers: [YWarningService, YMainScreenService, MenuService],
  declarations: [YMainScreenComponent, YSpeedometerWidgetComponent, YSpeedometerWidgetComponent, YWaterTemperatureWidgetComponent, YOilLightWidgetComponent, YAbsLightWidgetComponent, YHighbeamLightWidgetComponent, YHeadlightWidgetComponent],
  exports: [YSpeedometerWidgetComponent]
})
export class YMainScreenModule { }
