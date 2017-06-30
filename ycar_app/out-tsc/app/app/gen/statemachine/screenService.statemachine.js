import { EventQueue, Event } from '../stateutils/eventQueue';
import { Subject } from 'rxjs';
export var ScreenService = (function () {
    function ScreenService() {
        // state machine members
        this.initialized = false;
        this.stateVector = new Array(1);
        // member for each interface scope
        this.defaultScope = new SCIDefault();
        // members of internal scope
        // members for default scope access
        this.eventQueue = new EventQueue();
    }
    ScreenService.prototype.init = function () {
        var _this = this;
        for (var i = 0; i < 1; i++) {
            this.stateVector[i] = State.NullState;
        }
        this.clearEvents();
        this.clearOutEvents();
        this.eventQueue.onProcess.subscribe(function (id) {
            _this.runCycle();
        });
        // IN EVENT SUBSCRIPTIONS
        this.defaultScope.onTurnOff$.subscribe(function () {
            _this.eventQueue.trigger(new Event(_this, 'onTurnOff', null));
        });
        this.defaultScope.onTurnOn$.subscribe(function () {
            _this.eventQueue.trigger(new Event(_this, 'onTurnOn', null));
        });
        // OUT EVENT SUBSCRIPTIONS
        this.initialized = true;
    };
    ScreenService.prototype.enter = function () {
        if (!this.initialized) {
            throw 'statemachine is not initialized!';
        }
        this.enterSequence_main_region_default();
    };
    ScreenService.prototype.exit = function () {
        this.exitSequence_main_region();
    };
    ScreenService.prototype.runCycle = function () {
        this.clearOutEvents();
        for (this.nextStateIndex = 0; this.nextStateIndex < this.stateVector.length; this.nextStateIndex++) {
            switch (this.stateVector[this.nextStateIndex]) {
                case State.main_region_off:
                    this.react_main_region_off();
                    break;
                case State.main_region_on:
                    this.react_main_region_on();
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
    ScreenService.prototype.isActive = function () {
        return this.stateVector[0] !== State.NullState;
    };
    /**
    * Always returns 'false' since this state machine can never become final.
    *
     * @see IStatemachine#isFinal()
     */
    ScreenService.prototype.isFinal = function () {
        return false;
    };
    /**
    * This method resets the incoming events (time events included).
    */
    ScreenService.prototype.clearEvents = function () {
        //this.eventQueue.queue = [];
        this.defaultScope.clearEvents();
    };
    /**
    * This method resets the outgoing events.
    */
    ScreenService.prototype.clearOutEvents = function () {
    };
    /**
    * Returns true if the given state is currently active otherwise false.
    */
    ScreenService.prototype.isStateActive = function (state) {
        switch (state) {
            case State.main_region_off:
                return this.stateVector[0] === State.main_region_off;
            case State.main_region_on:
                return this.stateVector[0] === State.main_region_on;
            default: return false;
        }
    };
    ScreenService.prototype.raiseOnTurnOff = function () {
        this.defaultScope.raiseOnTurnOff();
    };
    ScreenService.prototype.getOnTurnOff = function () {
        return this.defaultScope.onTurnOff$;
    };
    ScreenService.prototype.subscribeOnTurnOff = function (ev) {
        return this.defaultScope.subscribeOnTurnOff(ev);
    };
    ScreenService.prototype.raiseOnTurnOn = function () {
        this.defaultScope.raiseOnTurnOn();
    };
    ScreenService.prototype.getOnTurnOn = function () {
        return this.defaultScope.onTurnOn$;
    };
    ScreenService.prototype.subscribeOnTurnOn = function (ev) {
        return this.defaultScope.subscribeOnTurnOn(ev);
    };
    ScreenService.prototype.check_main_region_off_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onTurnOn";
    };
    ScreenService.prototype.check_main_region_on_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onTurnOff";
    };
    ScreenService.prototype.effect_main_region_off_tr0 = function () {
        this.exitSequence_main_region_off();
        this.enterSequence_main_region_on_default();
    };
    ScreenService.prototype.effect_main_region_on_tr0 = function () {
        this.exitSequence_main_region_on();
        this.enterSequence_main_region_off_default();
    };
    /* Entry action for state 'off'. */
    ScreenService.prototype.entryAction_main_region_off = function () {
        this.defaultScope.operationCallback.navigateToWelcomeScreen();
    };
    /* Entry action for state 'on'. */
    ScreenService.prototype.entryAction_main_region_on = function () {
        this.defaultScope.operationCallback.navigateToMainScreen();
    };
    /* 'default' enter sequence for state off */
    ScreenService.prototype.enterSequence_main_region_off_default = function () {
        this.entryAction_main_region_off();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_off;
    };
    /* 'default' enter sequence for state on */
    ScreenService.prototype.enterSequence_main_region_on_default = function () {
        this.entryAction_main_region_on();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_on;
    };
    /* 'default' enter sequence for region main region */
    ScreenService.prototype.enterSequence_main_region_default = function () {
        this.react_main_region__entry_Default();
    };
    /* Default exit sequence for state off */
    ScreenService.prototype.exitSequence_main_region_off = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for state on */
    ScreenService.prototype.exitSequence_main_region_on = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for region main region */
    ScreenService.prototype.exitSequence_main_region = function () {
        switch (this.stateVector[0]) {
            case State.main_region_off:
                this.exitSequence_main_region_off();
                break;
            case State.main_region_on:
                this.exitSequence_main_region_on();
                break;
            default:
                break;
        }
    };
    /* The reactions of state off. */
    ScreenService.prototype.react_main_region_off = function () {
        if (this.check_main_region_off_tr0_tr0()) {
            this.effect_main_region_off_tr0();
        }
    };
    /* The reactions of state on. */
    ScreenService.prototype.react_main_region_on = function () {
        if (this.check_main_region_on_tr0_tr0()) {
            this.effect_main_region_on_tr0();
        }
    };
    /* Default react sequence for initial entry  */
    ScreenService.prototype.react_main_region__entry_Default = function () {
        this.enterSequence_main_region_off_default();
    };
    return ScreenService;
}());
export var SCIDefault = (function () {
    function SCIDefault() {
        //onTurnOff:boolean;
        this.onTurnOff$ = new Subject();
        //onTurnOn:boolean;
        this.onTurnOn$ = new Subject();
    }
    SCIDefault.prototype.setdefaultScopeOperationCallback = function (operationCallback) {
        this.operationCallback = operationCallback;
    };
    SCIDefault.prototype.raiseOnTurnOff = function () {
        //this.onTurnOff = true;
        this.onTurnOff$.next();
    };
    SCIDefault.prototype.subscribeOnTurnOff = function (ev) {
        var _this = this;
        return ev.subscribe(function () {
            _this.raiseOnTurnOff();
        });
    };
    SCIDefault.prototype.raiseOnTurnOn = function () {
        //this.onTurnOn = true;
        this.onTurnOn$.next();
    };
    SCIDefault.prototype.subscribeOnTurnOn = function (ev) {
        var _this = this;
        return ev.subscribe(function () {
            _this.raiseOnTurnOn();
        });
    };
    SCIDefault.prototype.clearEvents = function () {
        //this.onTurnOff = false;
        //this.onTurnOn = false;
    };
    return SCIDefault;
}());
export var State;
(function (State) {
    State[State["main_region_off"] = 0] = "main_region_off";
    State[State["main_region_on"] = 1] = "main_region_on";
    State[State["NullState"] = 2] = "NullState";
})(State || (State = {}));
