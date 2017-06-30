var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { YPhoneComponent } from './y-phone.component';
import { YShareModule } from "../../shared/y-shared.module";
import { YAddressBookComponent } from './y-address-book/y-address-book.component';
import { YPhoneService } from "./y-phone.service";
import { YCallHandlerComponent } from './y-call-handler/y-call-handler.component';
import { RouterModule } from "@angular/router";
import { YCallHandlerButtonComponent } from './y-call-handler/y-call-handler-button/y-call-handler-button.component';
export var YPhoneModule = (function () {
    function YPhoneModule() {
    }
    YPhoneModule = __decorate([
        NgModule({
            imports: [
                CommonModule,
                RouterModule,
                YShareModule
            ],
            declarations: [YPhoneComponent, YAddressBookComponent, YCallHandlerComponent, YCallHandlerButtonComponent],
            exports: [YPhoneComponent],
            providers: [YPhoneService]
        }), 
        __metadata('design:paramtypes', [])
    ], YPhoneModule);
    return YPhoneModule;
}());
