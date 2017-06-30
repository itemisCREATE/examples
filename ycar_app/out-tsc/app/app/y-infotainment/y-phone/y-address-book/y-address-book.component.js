var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Component } from '@angular/core';
import { YPhoneService } from "../y-phone.service";
export var YAddressBookComponent = (function () {
    function YAddressBookComponent(phoneService) {
        this.phoneService = phoneService;
    }
    YAddressBookComponent.prototype.registerKeyBinding = function () {
        window.addEventListener('keydown', this.keyDownHandler);
    };
    YAddressBookComponent.prototype.keyDownHandler = function (keyEvent) {
        console.log(keyEvent.key);
        if (keyEvent.key === 'ArrowDown') {
            this.phoneService.selectNextContact();
        }
        else if (keyEvent.key === 'ArrowUp') {
            this.phoneService.selectPrevContact();
        }
        else if (keyEvent.key === 'Enter') {
            this.callContact();
        }
    };
    YAddressBookComponent.prototype.unregisterKeyBinding = function () {
        window.removeEventListener('keydown', this.keyDownHandler);
    };
    YAddressBookComponent.prototype.callContact = function () {
        this.phoneService.callContact();
    };
    YAddressBookComponent.prototype.ngOnInit = function () {
        this.keyDownHandler = this.keyDownHandler.bind(this);
        this.registerKeyBinding();
    };
    YAddressBookComponent.prototype.ngOnDestroy = function () {
        this.unregisterKeyBinding();
    };
    YAddressBookComponent = __decorate([
        Component({
            selector: 'y-address-book',
            templateUrl: './y-address-book.component.html',
            styleUrls: ['./y-address-book.component.css']
        }), 
        __metadata('design:paramtypes', [YPhoneService])
    ], YAddressBookComponent);
    return YAddressBookComponent;
}());
