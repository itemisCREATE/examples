import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YBlankScreenComponent } from './y-blank-screen.component';
import {blankScreenRoute} from "./y-blank.route";

@NgModule({
  imports: [
    CommonModule,
    blankScreenRoute
  ],
  declarations: [YBlankScreenComponent],
  exports: [YBlankScreenComponent]
})
export class YBlankScreenModule { }
