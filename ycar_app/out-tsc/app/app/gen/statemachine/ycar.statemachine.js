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
import { RouterService } from '../../shared/services/router.service';
export var Ycar = (function () {
    function Ycar(statemachineEventHandlerService, routerService) {
        var _this = this;
        this.statemachineEventHandlerService = statemachineEventHandlerService;
        this.routerService = routerService;
        this.timeEvents = new Array(2);
        this.initialized = false;
        this.eventQueue = new EventQueue();
        this.stateVector = new Array(1);
        this.statemachineEventHandlerService.onCall.subscribe(function (e) {
            _this.scEventHandler(e);
        });
    }
    Ycar.prototype.scEventHandler = function (event) {
    };
    Ycar.prototype.init = function () {
        var _this = this;
        for (var i = 0; i < 1; i++) {
            this.stateVector[i] = State.NullState;
        }
        this.clearEvents();
        this.clearOutEvents();
        this.eventQueue.onProcess.subscribe(function (id) {
            _this.runCycle();
        });
        this.routerService.getRouterChange().subscribe(function (v) {
            _this.eventQueue.trigger(new Event(_this.routerService, 'onRouterChange', v));
        });
        this.routerService.getRouterUrl().subscribe(function (v) {
            _this.eventQueue.trigger(new Event(_this.routerService, 'onRouterUrl', v));
        });
        this.initialized = true;
    };
    Ycar.prototype.enter = function () {
        if (!this.initialized) {
            throw 'statemachine is not initialized!';
        }
        this.enterSequence_main_region_default();
    };
    Ycar.prototype.exit = function () {
        this.exitSequence_main_region();
    };
    Ycar.prototype.runCycle = function () {
        this.clearOutEvents();
        for (this.nextStateIndex = 0; this.nextStateIndex < this.stateVector.length; this.nextStateIndex++) {
            switch (this.stateVector[this.nextStateIndex]) {
                case State.main_region_BlankScreen:
                    this.react_main_region_BlankScreen();
                    break;
                case State.main_region_StartScreen:
                    this.react_main_region_StartScreen();
                    break;
                case State.main_region_MainScreen:
                    this.react_main_region_MainScreen();
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
    Ycar.prototype.isActive = function () {
        return this.stateVector[0] !== State.NullState;
    };
    /**
    * Always returns 'false' since this state machine can never become final.
    *
     * @see IStatemachine#isFinal()
     */
    Ycar.prototype.isFinal = function () {
        return false;
    };
    /**
    * This method resets the incoming events (time events included).
    */
    Ycar.prototype.clearEvents = function () {
    };
    /**
    * This method resets the outgoing events.
    */
    Ycar.prototype.clearOutEvents = function () {
    };
    /**
    * Returns true if the given state is currently active otherwise false.
    */
    Ycar.prototype.isStateActive = function (state) {
        switch (state) {
            case State.main_region_BlankScreen:
                return this.stateVector[0] === State.main_region_BlankScreen;
            case State.main_region_StartScreen:
                return this.stateVector[0] === State.main_region_StartScreen;
            case State.main_region_MainScreen:
                return this.stateVector[0] === State.main_region_MainScreen;
            default: return false;
        }
    };
    Ycar.prototype.check_main_region_BlankScreen_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === 'time_event_0';
    };
    Ycar.prototype.check_main_region_StartScreen_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === 'time_event_1';
    };
    Ycar.prototype.effect_main_region_BlankScreen_tr0 = function () {
        this.exitSequence_main_region_BlankScreen();
        this.enterSequence_main_region_StartScreen_default();
    };
    Ycar.prototype.effect_main_region_StartScreen_tr0 = function () {
        this.exitSequence_main_region_StartScreen();
        this.enterSequence_main_region_MainScreen_default();
    };
    /* Entry action for state 'BlankScreen'. */
    Ycar.prototype.entryAction_main_region_BlankScreen = function () {
        var _this = this;
        this.timeEvents[0] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_0', null));
        }, 2 * 1000);
        this.routerService.navigate('/blankScreen');
    };
    /* Entry action for state 'StartScreen'. */
    Ycar.prototype.entryAction_main_region_StartScreen = function () {
        var _this = this;
        this.timeEvents[1] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_1', null));
        }, 3 * 1000);
        this.routerService.navigate('/startScreen');
    };
    /* Entry action for state 'MainScreen'. */
    Ycar.prototype.entryAction_main_region_MainScreen = function () {
        this.routerService.navigate('/mainScreen');
    };
    /* Exit action for state 'BlankScreen'. */
    Ycar.prototype.exitAction_main_region_BlankScreen = function () {
        clearInterval(this.timeEvents[0]);
    };
    /* Exit action for state 'StartScreen'. */
    Ycar.prototype.exitAction_main_region_StartScreen = function () {
        clearInterval(this.timeEvents[1]);
    };
    /* 'default' enter sequence for state BlankScreen */
    Ycar.prototype.enterSequence_main_region_BlankScreen_default = function () {
        this.entryAction_main_region_BlankScreen();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_BlankScreen;
    };
    /* 'default' enter sequence for state StartScreen */
    Ycar.prototype.enterSequence_main_region_StartScreen_default = function () {
        this.entryAction_main_region_StartScreen();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_StartScreen;
    };
    /* 'default' enter sequence for state MainScreen */
    Ycar.prototype.enterSequence_main_region_MainScreen_default = function () {
        this.entryAction_main_region_MainScreen();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_MainScreen;
    };
    /* 'default' enter sequence for region main region */
    Ycar.prototype.enterSequence_main_region_default = function () {
        this.react_main_region__entry_Default();
    };
    /* Default exit sequence for state BlankScreen */
    Ycar.prototype.exitSequence_main_region_BlankScreen = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_BlankScreen();
    };
    /* Default exit sequence for state StartScreen */
    Ycar.prototype.exitSequence_main_region_StartScreen = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_StartScreen();
    };
    /* Default exit sequence for state MainScreen */
    Ycar.prototype.exitSequence_main_region_MainScreen = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for region main region */
    Ycar.prototype.exitSequence_main_region = function () {
        switch (this.stateVector[0]) {
            case State.main_region_BlankScreen:
                this.exitSequence_main_region_BlankScreen();
                break;
            case State.main_region_StartScreen:
                this.exitSequence_main_region_StartScreen();
                break;
            case State.main_region_MainScreen:
                this.exitSequence_main_region_MainScreen();
                break;
            default:
                break;
        }
    };
    /* The reactions of state BlankScreen. */
    Ycar.prototype.react_main_region_BlankScreen = function () {
        if (this.check_main_region_BlankScreen_tr0_tr0()) {
            this.effect_main_region_BlankScreen_tr0();
        }
    };
    /* The reactions of state StartScreen. */
    Ycar.prototype.react_main_region_StartScreen = function () {
        if (this.check_main_region_StartScreen_tr0_tr0()) {
            this.effect_main_region_StartScreen_tr0();
        }
    };
    /* The reactions of state MainScreen. */
    Ycar.prototype.react_main_region_MainScreen = function () {
    };
    /* Default react sequence for initial entry  */
    Ycar.prototype.react_main_region__entry_Default = function () {
        this.enterSequence_main_region_BlankScreen_default();
    };
    Ycar = __decorate([
        Injectable(), 
        __metadata('design:paramtypes', [StatemachineEventHandlerService, RouterService])
    ], Ycar);
    return Ycar;
}());
export var State;
(function (State) {
    State[State["main_region_BlankScreen"] = 0] = "main_region_BlankScreen";
    State[State["main_region_StartScreen"] = 1] = "main_region_StartScreen";
    State[State["main_region_MainScreen"] = 2] = "main_region_MainScreen";
    State[State["NullState"] = 3] = "NullState";
})(State || (State = {}));
