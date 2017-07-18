import {NgModule} from "@angular/core";
import {CommonModule} from "@angular/common";
import {YPhoneComponent} from "./y-phone.component";
import {YShareModule} from "../../shared/y-shared.module";
import {YAddressBookComponent} from "./y-address-book/y-address-book.component";
import {YPhoneService} from "./y-phone.service";
import {YCallHandlerComponent} from "./y-call-handler/y-call-handler.component";
import {RouterModule} from "@angular/router";
import {YCallHandlerButtonComponent} from "./y-call-handler/y-call-handler-button/y-call-handler-button.component";

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    YShareModule
  ],
  declarations: [YPhoneComponent, YAddressBookComponent, YCallHandlerComponent, YCallHandlerButtonComponent],
  exports: [YPhoneComponent],
  providers: [YPhoneService]
})
export class YPhoneModule { }
