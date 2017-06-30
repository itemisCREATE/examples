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
import { EventQueue, Event } from '../stateutils/eventQueue';
import { StatemachineEventHandlerService } from '../stateutils/statemachineEventHandler.service';
import { YWarningService } from '../../shared/widgets/y-warning-widget/y-warning.service';
import { RouterService } from '../../shared/services/router.service';
export var ScreenSct = (function () {
    function ScreenSct(statemachineEventHandlerService, routerService, warningService) {
        var _this = this;
        this.statemachineEventHandlerService = statemachineEventHandlerService;
        this.routerService = routerService;
        this.warningService = warningService;
        this.timeEvents = new Array(3);
        this.initialized = false;
        this.eventQueue = new EventQueue();
        this.stateVector = new Array(1);
        this.statemachineEventHandlerService.onCall.subscribe(function (e) {
            _this.scEventHandler(e);
        });
    }
    ScreenSct.prototype.scEventHandler = function (event) {
    };
    ScreenSct.prototype.init = function () {
        var _this = this;
        for (var i = 0; i < 1; i++) {
            this.stateVector[i] = State.NullState;
        }
        this.clearEvents();
        this.clearOutEvents();
        this.eventQueue.onProcess.subscribe(function (id) {
            _this.runCycle();
        });
        this.initialized = true;
    };
    ScreenSct.prototype.enter = function () {
        if (!this.initialized) {
            throw 'statemachine is not initialized!';
        }
        this.enterSequence_main_region_default();
    };
    ScreenSct.prototype.exit = function () {
        this.exitSequence_main_region();
    };
    ScreenSct.prototype.runCycle = function () {
        this.clearOutEvents();
        for (this.nextStateIndex = 0; this.nextStateIndex < this.stateVector.length; this.nextStateIndex++) {
            switch (this.stateVector[this.nextStateIndex]) {
                case State.main_region_blankScreen:
                    this.react_main_region_blankScreen();
                    break;
                case State.main_region_mainScreen__region0_warning:
                    this.react_main_region_mainScreen__region0_warning();
                    break;
                case State.main_region_mainScreen__region0_music:
                    this.react_main_region_mainScreen__region0_music();
                    break;
                default:
                    // NullState
                    break;
            }
        }
        this.clearEvents();
    };
    /**
     * @see IStatemachine#isActive()
     */
    ScreenSct.prototype.isActive = function () {
        return this.stateVector[0] !== State.NullState;
    };
    /**
    * Always returns 'false' since this state machine can never become final.
    *
     * @see IStatemachine#isFinal()
     */
    ScreenSct.prototype.isFinal = function () {
        return false;
    };
    /**
    * This method resets the incoming events (time events included).
    */
    ScreenSct.prototype.clearEvents = function () {
    };
    /**
    * This method resets the outgoing events.
    */
    ScreenSct.prototype.clearOutEvents = function () {
    };
    /**
    * Returns true if the given state is currently active otherwise false.
    */
    ScreenSct.prototype.isStateActive = function (state) {
        switch (state) {
            case State.main_region_blankScreen:
                return this.stateVector[0] === State.main_region_blankScreen;
            case State.main_region_mainScreen:
                return this.stateVector[0] >= State.main_region_mainScreen
                    && this.stateVector[0] <= State.main_region_mainScreen__region0_music;
            case State.main_region_mainScreen__region0_warning:
                return this.stateVector[0] === State.main_region_mainScreen__region0_warning;
            case State.main_region_mainScreen__region0_music:
                return this.stateVector[0] === State.main_region_mainScreen__region0_music;
            default: return false;
        }
    };
    ScreenSct.prototype.check_main_region_blankScreen_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === 'time_event_0';
    };
    ScreenSct.prototype.check_main_region_mainScreen__region0_warning_lr0_lr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === 'time_event_1';
    };
    ScreenSct.prototype.check_main_region_mainScreen__region0_warning_lr1_lr1 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === 'time_event_2';
    };
    ScreenSct.prototype.effect_main_region_blankScreen_tr0 = function () {
        this.exitSequence_main_region_blankScreen();
        this.enterSequence_main_region_mainScreen_default();
    };
    ScreenSct.prototype.effect_main_region_mainScreen__region0_warning_lr0_lr0 = function () {
        this.warningService.setWarning('Warning', 'Test');
        this.warningService.show();
    };
    ScreenSct.prototype.effect_main_region_mainScreen__region0_warning_lr1_lr1 = function () {
        this.warningService.hide();
    };
    /* Entry action for state 'blankScreen'. */
    ScreenSct.prototype.entryAction_main_region_blankScreen = function () {
        var _this = this;
        this.timeEvents[0] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_0', null));
        }, 3 * 1000);
    };
    /* Entry action for state 'mainScreen'. */
    ScreenSct.prototype.entryAction_main_region_mainScreen = function () {
        this.routerService.navigate('/mainScreen');
    };
    /* Entry action for state 'warning'. */
    ScreenSct.prototype.entryAction_main_region_mainScreen__region0_warning = function () {
        var _this = this;
        this.timeEvents[1] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_1', null));
        }, 2 * 1000);
        this.timeEvents[2] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_2', null));
        }, 7 * 1000);
    };
    /* Exit action for state 'blankScreen'. */
    ScreenSct.prototype.exitAction_main_region_blankScreen = function () {
        clearInterval(this.timeEvents[0]);
    };
    /* Exit action for state 'warning'. */
    ScreenSct.prototype.exitAction_main_region_mainScreen__region0_warning = function () {
        clearInterval(this.timeEvents[1]);
        clearInterval(this.timeEvents[2]);
    };
    /* 'default' enter sequence for state blankScreen */
    ScreenSct.prototype.enterSequence_main_region_blankScreen_default = function () {
        this.entryAction_main_region_blankScreen();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_blankScreen;
    };
    /* 'default' enter sequence for state mainScreen */
    ScreenSct.prototype.enterSequence_main_region_mainScreen_default = function () {
        this.entryAction_main_region_mainScreen();
        this.enterSequence_main_region_mainScreen__region0_default();
    };
    /* 'default' enter sequence for state warning */
    ScreenSct.prototype.enterSequence_main_region_mainScreen__region0_warning_default = function () {
        this.entryAction_main_region_mainScreen__region0_warning();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_mainScreen__region0_warning;
    };
    /* 'default' enter sequence for state music */
    ScreenSct.prototype.enterSequence_main_region_mainScreen__region0_music_default = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_mainScreen__region0_music;
    };
    /* 'default' enter sequence for region main region */
    ScreenSct.prototype.enterSequence_main_region_default = function () {
        this.react_main_region__entry_Default();
    };
    /* 'default' enter sequence for region null */
    ScreenSct.prototype.enterSequence_main_region_mainScreen__region0_default = function () {
        this.react_main_region_mainScreen__region0__entry_Default();
    };
    /* Default exit sequence for state blankScreen */
    ScreenSct.prototype.exitSequence_main_region_blankScreen = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_blankScreen();
    };
    /* Default exit sequence for state warning */
    ScreenSct.prototype.exitSequence_main_region_mainScreen__region0_warning = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_mainScreen__region0_warning();
    };
    /* Default exit sequence for state music */
    ScreenSct.prototype.exitSequence_main_region_mainScreen__region0_music = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for region main region */
    ScreenSct.prototype.exitSequence_main_region = function () {
        switch (this.stateVector[0]) {
            case State.main_region_blankScreen:
                this.exitSequence_main_region_blankScreen();
                break;
            case State.main_region_mainScreen__region0_warning:
                this.exitSequence_main_region_mainScreen__region0_warning();
                break;
            case State.main_region_mainScreen__region0_music:
                this.exitSequence_main_region_mainScreen__region0_music();
                break;
            default:
                break;
        }
    };
    /* Default exit sequence for region null */
    ScreenSct.prototype.exitSequence_main_region_mainScreen__region0 = function () {
        switch (this.stateVector[0]) {
            case State.main_region_mainScreen__region0_warning:
                this.exitSequence_main_region_mainScreen__region0_warning();
                break;
            case State.main_region_mainScreen__region0_music:
                this.exitSequence_main_region_mainScreen__region0_music();
                break;
            default:
                break;
        }
    };
    /* The reactions of state blankScreen. */
    ScreenSct.prototype.react_main_region_blankScreen = function () {
        if (this.check_main_region_blankScreen_tr0_tr0()) {
            this.effect_main_region_blankScreen_tr0();
        }
    };
    /* The reactions of state warning. */
    ScreenSct.prototype.react_main_region_mainScreen__region0_warning = function () {
        if (this.check_main_region_mainScreen__region0_warning_lr0_lr0()) {
            this.effect_main_region_mainScreen__region0_warning_lr0_lr0();
        }
        if (this.check_main_region_mainScreen__region0_warning_lr1_lr1()) {
            this.effect_main_region_mainScreen__region0_warning_lr1_lr1();
        }
    };
    /* The reactions of state music. */
    ScreenSct.prototype.react_main_region_mainScreen__region0_music = function () {
    };
    /* Default react sequence for initial entry  */
    ScreenSct.prototype.react_main_region__entry_Default = function () {
        this.enterSequence_main_region_blankScreen_default();
    };
    /* Default react sequence for initial entry  */
    ScreenSct.prototype.react_main_region_mainScreen__region0__entry_Default = function () {
        this.enterSequence_main_region_mainScreen__region0_warning_default();
    };
    ScreenSct = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [StatemachineEventHandlerService, RouterService, YWarningService])
    ], ScreenSct);
    return ScreenSct;
}());
export var State;
(function (State) {
    State[State["main_region_blankScreen"] = 0] = "main_region_blankScreen";
    State[State["main_region_mainScreen"] = 1] = "main_region_mainScreen";
    State[State["main_region_mainScreen__region0_warning"] = 2] = "main_region_mainScreen__region0_warning";
    State[State["main_region_mainScreen__region0_music"] = 3] = "main_region_mainScreen__region0_music";
    State[State["NullState"] = 4] = "NullState";
})(State || (State = {}));
