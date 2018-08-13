import {CommonModule} from "@angular/common";
import {NgModule} from "@angular/core";
import {YTrustStylePipe} from "./pipes/y-trust-style.pipe";
import {YMenuHeaderComponent} from "./y-menu-header/y-menu-header.component";
import { YWarningWidgetComponent } from './widgets/y-warning-widget/y-warning-widget.component';
import {YWarningService} from "./widgets/y-warning-widget/y-warning.service";
import {YFueltankWidgetComponent} from "./widgets/y-fueltank-widget/y-fueltank-widget.component";
import { YClockWidgetComponent } from './widgets/y-clock-widget/y-clock-widget.component';
import {YFueltankService} from "./widgets/y-fueltank-widget/y-fueltank.service";

@NgModule({
  imports: [CommonModule],
  declarations: [YTrustStylePipe, YMenuHeaderComponent, YWarningWidgetComponent, YWarningWidgetComponent, YFueltankWidgetComponent, YClockWidgetComponent],
  providers: [YWarningService, YFueltankService],
  exports: [YTrustStylePipe, YMenuHeaderComponent, YWarningWidgetComponent, YFueltankWidgetComponent, YClockWidgetComponent]
})
export class YShareModule {}
