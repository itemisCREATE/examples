import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YStartScreenComponent } from './y-start-screen.component';
import {startScreenRoute} from "./y-start-screen.route";

@NgModule({
  imports: [
    CommonModule,
    startScreenRoute
  ],
  declarations: [YStartScreenComponent]
})
export class YStartScreenModule { }
