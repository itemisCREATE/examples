var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { Injectable } from '@angular/core';
import { Router, ActivatedRoute } from "@angular/router";
import { Subject } from "rxjs";
export var YPhoneService = (function () {
    function YPhoneService(router, route) {
        this.router = router;
        this.route = route;
        this.selectedContactIndex = 0;
        this.contacts = [
            {
                firstName: "Andreas",
                lastName: "Mülder",
                phoneNumber: "+49 170 123456",
                photo: "./assets/photos/andreas.png"
            },
            {
                firstName: "Axel",
                lastName: "Terfloth",
                phoneNumber: "+49 170 654321",
                photo: "./assets/photos/avatar.svg"
            }
        ];
        this.buttons = {
            selected: {
                selectedOutgoingCallButton: 0,
                selectedIncomingCallButton: 0
            },
            outgoingCall_buttons: [
                {
                    caption: 'hang up',
                    active: false
                }
            ],
            incomingCall_buttons: [
                {
                    caption: 'accept',
                    active: true
                },
                {
                    caption: 'decline',
                    active: false
                }
            ]
        };
        this.onIncomingCall = new Subject();
        this.onOutgoingCall = new Subject();
        this.onAcceptIncomingCall = new Subject();
        this.onDeclineIncomingCall = new Subject();
        this.onHangUp = new Subject();
        this.contact = this.contacts[0];
        this.phoneState = PhoneState.INCOMING_CALL;
    }
    //region *** Contact ***
    YPhoneService.prototype.selectNextContact = function () {
        var index = this.selectedContactIndex + 1;
        if (index <= this.contacts.length - 1) {
            this.contact = this.contacts[index];
            this.selectedContactIndex = index;
        }
    };
    YPhoneService.prototype.selectPrevContact = function () {
        var index = this.selectedContactIndex - 1;
        if (index >= 0) {
            this.contact = this.contacts[index];
            this.selectedContactIndex = index;
        }
    };
    YPhoneService.prototype.callContact = function () {
        this.router.navigate(['mainScreen/infotainment/phone//call'], { relativeTo: this.route });
    };
    //endregion
    //region *** Incoming Call ***
    YPhoneService.prototype.selectNextIncomingCallButton = function () {
        if (this.buttons.selected.selectedIncomingCallButton < this.buttons.incomingCall_buttons.length - 1) {
            this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton].active = false;
            this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton + 1].active = true;
            this.buttons.selected.selectedIncomingCallButton = this.buttons.selected.selectedIncomingCallButton + 1;
        }
    };
    YPhoneService.prototype.selectPrevIncomingCallButton = function () {
        if (this.buttons.selected.selectedIncomingCallButton > 0) {
            this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton].active = false;
            this.buttons.incomingCall_buttons[this.buttons.selected.selectedIncomingCallButton - 1].active = true;
            this.buttons.selected.selectedIncomingCallButton = this.buttons.selected.selectedIncomingCallButton - 1;
        }
    };
    YPhoneService.prototype.enterIncomingCallButton = function () {
        if (this.phoneState === PhoneState.INCOMING_CALL) {
            switch (this.buttons.selected.selectedIncomingCallButton) {
                case 0:
                    this.phoneState = PhoneState.HANG_UP;
                    this.onAcceptIncomingCall.next();
                    break;
                case 1:
                    this.onDeclineIncomingCall.next();
            }
        }
        else if (this.phoneState === PhoneState.OUTGOING_CALL) {
            this.onHangUp.next();
        }
        else if (this.phoneState === PhoneState.HANG_UP) {
            this.onHangUp.next();
            console.log('hang up');
        }
    };
    //endregion
    YPhoneService.prototype.acceptIncomingCall = function () {
        this.onAcceptIncomingCall.next();
    };
    YPhoneService.prototype.setPhoneState = function (state) {
        switch (state) {
            case 'incoming_call':
                this.phoneState = PhoneState.INCOMING_CALL;
                this.onIncomingCall.next();
                break;
            case 'outgoing_call':
                this.phoneState = PhoneState.OUTGOING_CALL;
                this.onOutgoingCall.next();
                break;
        }
    };
    YPhoneService = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [(typeof (_a = typeof Router !== 'undefined' && Router) === 'function' && _a) || Object, (typeof (_b = typeof ActivatedRoute !== 'undefined' && ActivatedRoute) === 'function' && _b) || Object])
    ], YPhoneService);
    return YPhoneService;
    var _a, _b;
}());
export var PhoneState;
(function (PhoneState) {
    PhoneState[PhoneState["INCOMING_CALL"] = 0] = "INCOMING_CALL";
    PhoneState[PhoneState["OUTGOING_CALL"] = 1] = "OUTGOING_CALL";
    PhoneState[PhoneState["HANG_UP"] = 2] = "HANG_UP";
})(PhoneState || (PhoneState = {}));
