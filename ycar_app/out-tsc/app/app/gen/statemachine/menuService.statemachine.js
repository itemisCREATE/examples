import { EventQueue, Event } from '../stateutils/eventQueue';
import { Subject } from 'rxjs';
export var MenuService = (function () {
    function MenuService() {
        // state machine members
        this.timeEvents = new Array(2);
        this.initialized = false;
        this.stateVector = new Array(1);
        // member for each interface scope
        this.defaultScope = new SCIDefault();
        this.eventQueue = new EventQueue();
    }
    Object.defineProperty(MenuService.prototype, "menuState", {
        // members of internal scope
        // members for default scope access
        get: function () {
            return this.defaultScope.menuState;
        },
        set: function (value) {
            this.defaultScope.menuState = value;
        },
        enumerable: true,
        configurable: true
    });
    MenuService.prototype.init = function () {
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
        this.defaultScope.onMenuChanged$.subscribe(function () {
            _this.eventQueue.trigger(new Event(_this, 'onMenuChanged', null));
        });
        // OUT EVENT SUBSCRIPTIONS
        this.defaultScope.menuState = '';
        this.initialized = true;
    };
    MenuService.prototype.enter = function () {
        if (!this.initialized) {
            throw 'statemachine is not initialized!';
        }
        this.enterSequence_main_region_default();
    };
    MenuService.prototype.exit = function () {
        this.exitSequence_main_region();
    };
    MenuService.prototype.runCycle = function () {
        this.clearOutEvents();
        for (this.nextStateIndex = 0; this.nextStateIndex < this.stateVector.length; this.nextStateIndex++) {
            switch (this.stateVector[this.nextStateIndex]) {
                case State.main_region_menu:
                    this.react_main_region_menu();
                    break;
                case State.main_region_waiting_for_user_interaction:
                    this.react_main_region_waiting_for_user_interaction();
                    break;
                case State.main_region_weather:
                    this.react_main_region_weather();
                    break;
                case State.main_region_music:
                    this.react_main_region_music();
                    break;
                case State.main_region_phone:
                    this.react_main_region_phone();
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
    MenuService.prototype.isActive = function () {
        return this.stateVector[0] !== State.NullState;
    };
    /**
    * Always returns 'false' since this state machine can never become final.
    *
     * @see IStatemachine#isFinal()
     */
    MenuService.prototype.isFinal = function () {
        return false;
    };
    /**
    * This method resets the incoming events (time events included).
    */
    MenuService.prototype.clearEvents = function () {
        //this.eventQueue.queue = [];
        this.defaultScope.clearEvents();
    };
    /**
    * This method resets the outgoing events.
    */
    MenuService.prototype.clearOutEvents = function () {
    };
    /**
    * Returns true if the given state is currently active otherwise false.
    */
    MenuService.prototype.isStateActive = function (state) {
        switch (state) {
            case State.main_region_menu:
                return this.stateVector[0] === State.main_region_menu;
            case State.main_region_waiting_for_user_interaction:
                return this.stateVector[0] === State.main_region_waiting_for_user_interaction;
            case State.main_region_weather:
                return this.stateVector[0] === State.main_region_weather;
            case State.main_region_music:
                return this.stateVector[0] === State.main_region_music;
            case State.main_region_phone:
                return this.stateVector[0] === State.main_region_phone;
            default: return false;
        }
    };
    MenuService.prototype.raiseOnMenuChanged = function () {
        this.defaultScope.raiseOnMenuChanged();
    };
    MenuService.prototype.getOnMenuChanged = function () {
        return this.defaultScope.onMenuChanged$;
    };
    MenuService.prototype.subscribeOnMenuChanged = function (ev) {
        return this.defaultScope.subscribeOnMenuChanged(ev);
    };
    MenuService.prototype.check_main_region_menu_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "time_event_0";
    };
    MenuService.prototype.check_main_region_waiting_for_user_interaction_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "time_event_1";
    };
    MenuService.prototype.check_main_region_waiting_for_user_interaction_tr1_tr1 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onMenuChanged";
    };
    MenuService.prototype.check_main_region_weather_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onMenuChanged";
    };
    MenuService.prototype.check_main_region_music_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onMenuChanged";
    };
    MenuService.prototype.check_main_region_phone_tr0_tr0 = function () {
        return this.eventQueue.head.source === this && this.eventQueue.head.identifier === "onMenuChanged";
    };
    MenuService.prototype.check_main_region__choice_0_tr0_tr0 = function () {
        return this.defaultScope.menuState === 'music';
    };
    MenuService.prototype.check_main_region__choice_0_tr1_tr1 = function () {
        return this.defaultScope.menuState === 'phone';
    };
    MenuService.prototype.check_main_region__choice_0_tr3_tr3 = function () {
        return this.defaultScope.menuState === 'weather';
    };
    MenuService.prototype.check_main_region__choice_0_tr2_tr2 = function () {
        return true;
    };
    MenuService.prototype.effect_main_region_menu_tr0 = function () {
        this.exitSequence_main_region_menu();
        this.enterSequence_main_region_waiting_for_user_interaction_default();
    };
    MenuService.prototype.effect_main_region_waiting_for_user_interaction_tr0 = function () {
        this.exitSequence_main_region_waiting_for_user_interaction();
        this.enterSequence_main_region_waiting_for_user_interaction_default();
    };
    MenuService.prototype.effect_main_region_waiting_for_user_interaction_tr1 = function () {
        this.exitSequence_main_region_waiting_for_user_interaction();
        this.react_main_region__choice_0();
    };
    MenuService.prototype.effect_main_region_weather_tr0 = function () {
        this.exitSequence_main_region_weather();
        this.react_main_region__choice_0();
    };
    MenuService.prototype.effect_main_region_music_tr0 = function () {
        this.exitSequence_main_region_music();
        this.react_main_region__choice_0();
    };
    MenuService.prototype.effect_main_region_phone_tr0 = function () {
        this.exitSequence_main_region_phone();
        this.react_main_region__choice_0();
    };
    MenuService.prototype.effect_main_region__choice_0_tr0 = function () {
        this.enterSequence_main_region_music_default();
    };
    MenuService.prototype.effect_main_region__choice_0_tr1 = function () {
        this.enterSequence_main_region_phone_default();
    };
    MenuService.prototype.effect_main_region__choice_0_tr3 = function () {
        this.enterSequence_main_region_weather_default();
    };
    MenuService.prototype.effect_main_region__choice_0_tr2 = function () {
        this.enterSequence_main_region_menu_default();
    };
    /* Entry action for state 'menu'. */
    MenuService.prototype.entryAction_main_region_menu = function () {
        var _this = this;
        this.timeEvents[0] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_0', null));
        }, 500);
        this.defaultScope.operationCallback.showMenuScreen();
    };
    /* Entry action for state 'waiting for user interaction'. */
    MenuService.prototype.entryAction_main_region_waiting_for_user_interaction = function () {
        var _this = this;
        this.timeEvents[1] = setTimeout(function () {
            _this.eventQueue.trigger(new Event(_this, 'time_event_1', null));
        }, 200);
        this.defaultScope.operationCallback.waitingMessage();
    };
    /* Entry action for state 'weather'. */
    MenuService.prototype.entryAction_main_region_weather = function () {
        this.defaultScope.operationCallback.showWeatherScreen();
    };
    /* Entry action for state 'music'. */
    MenuService.prototype.entryAction_main_region_music = function () {
        this.defaultScope.operationCallback.showMusicScreen();
    };
    /* Entry action for state 'phone'. */
    MenuService.prototype.entryAction_main_region_phone = function () {
        this.defaultScope.operationCallback.showPhoneScreen();
    };
    /* Exit action for state 'menu'. */
    MenuService.prototype.exitAction_main_region_menu = function () {
        clearInterval(this.timeEvents[0]);
    };
    /* Exit action for state 'waiting for user interaction'. */
    MenuService.prototype.exitAction_main_region_waiting_for_user_interaction = function () {
        clearInterval(this.timeEvents[1]);
    };
    /* 'default' enter sequence for state menu */
    MenuService.prototype.enterSequence_main_region_menu_default = function () {
        this.entryAction_main_region_menu();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_menu;
    };
    /* 'default' enter sequence for state waiting for user interaction */
    MenuService.prototype.enterSequence_main_region_waiting_for_user_interaction_default = function () {
        this.entryAction_main_region_waiting_for_user_interaction();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_waiting_for_user_interaction;
    };
    /* 'default' enter sequence for state weather */
    MenuService.prototype.enterSequence_main_region_weather_default = function () {
        this.entryAction_main_region_weather();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_weather;
    };
    /* 'default' enter sequence for state music */
    MenuService.prototype.enterSequence_main_region_music_default = function () {
        this.entryAction_main_region_music();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_music;
    };
    /* 'default' enter sequence for state phone */
    MenuService.prototype.enterSequence_main_region_phone_default = function () {
        this.entryAction_main_region_phone();
        this.nextStateIndex = 0;
        this.stateVector[0] = State.main_region_phone;
    };
    /* 'default' enter sequence for region main region */
    MenuService.prototype.enterSequence_main_region_default = function () {
        this.react_main_region__entry_Default();
    };
    /* Default exit sequence for state menu */
    MenuService.prototype.exitSequence_main_region_menu = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_menu();
    };
    /* Default exit sequence for state waiting for user interaction */
    MenuService.prototype.exitSequence_main_region_waiting_for_user_interaction = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
        this.exitAction_main_region_waiting_for_user_interaction();
    };
    /* Default exit sequence for state weather */
    MenuService.prototype.exitSequence_main_region_weather = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for state music */
    MenuService.prototype.exitSequence_main_region_music = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for state phone */
    MenuService.prototype.exitSequence_main_region_phone = function () {
        this.nextStateIndex = 0;
        this.stateVector[0] = State.NullState;
    };
    /* Default exit sequence for region main region */
    MenuService.prototype.exitSequence_main_region = function () {
        switch (this.stateVector[0]) {
            case State.main_region_menu:
                this.exitSequence_main_region_menu();
                break;
            case State.main_region_waiting_for_user_interaction:
                this.exitSequence_main_region_waiting_for_user_interaction();
                break;
            case State.main_region_weather:
                this.exitSequence_main_region_weather();
                break;
            case State.main_region_music:
                this.exitSequence_main_region_music();
                break;
            case State.main_region_phone:
                this.exitSequence_main_region_phone();
                break;
            default:
                break;
        }
    };
    /* The reactions of state menu. */
    MenuService.prototype.react_main_region_menu = function () {
        if (this.check_main_region_menu_tr0_tr0()) {
            this.effect_main_region_menu_tr0();
        }
    };
    /* The reactions of state waiting for user interaction. */
    MenuService.prototype.react_main_region_waiting_for_user_interaction = function () {
        if (this.check_main_region_waiting_for_user_interaction_tr0_tr0()) {
            this.effect_main_region_waiting_for_user_interaction_tr0();
        }
        else {
            if (this.check_main_region_waiting_for_user_interaction_tr1_tr1()) {
                this.effect_main_region_waiting_for_user_interaction_tr1();
            }
        }
    };
    /* The reactions of state weather. */
    MenuService.prototype.react_main_region_weather = function () {
        if (this.check_main_region_weather_tr0_tr0()) {
            this.effect_main_region_weather_tr0();
        }
    };
    /* The reactions of state music. */
    MenuService.prototype.react_main_region_music = function () {
        if (this.check_main_region_music_tr0_tr0()) {
            this.effect_main_region_music_tr0();
        }
    };
    /* The reactions of state phone. */
    MenuService.prototype.react_main_region_phone = function () {
        if (this.check_main_region_phone_tr0_tr0()) {
            this.effect_main_region_phone_tr0();
        }
    };
    /* The reactions of state null. */
    MenuService.prototype.react_main_region__choice_0 = function () {
        if (this.check_main_region__choice_0_tr0_tr0()) {
            this.effect_main_region__choice_0_tr0();
        }
        else {
            if (this.check_main_region__choice_0_tr1_tr1()) {
                this.effect_main_region__choice_0_tr1();
            }
            else {
                if (this.check_main_region__choice_0_tr3_tr3()) {
                    this.effect_main_region__choice_0_tr3();
                }
                else {
                    this.effect_main_region__choice_0_tr2();
                }
            }
        }
    };
    /* Default react sequence for initial entry  */
    MenuService.prototype.react_main_region__entry_Default = function () {
        this.enterSequence_main_region_menu_default();
    };
    return MenuService;
}());
export var SCIDefault = (function () {
    function SCIDefault() {
        //onMenuChanged:boolean;
        this.onMenuChanged$ = new Subject();
    }
    SCIDefault.prototype.setdefaultScopeOperationCallback = function (operationCallback) {
        this.operationCallback = operationCallback;
    };
    SCIDefault.prototype.raiseOnMenuChanged = function () {
        //this.onMenuChanged = true;
        this.onMenuChanged$.next();
    };
    SCIDefault.prototype.subscribeOnMenuChanged = function (ev) {
        var _this = this;
        return ev.subscribe(function () {
            _this.raiseOnMenuChanged();
        });
    };
    Object.defineProperty(SCIDefault.prototype, "menuState", {
        get: function () {
            return this._menuState;
        },
        set: function (value) {
            this._menuState = value;
        },
        enumerable: true,
        configurable: true
    });
    SCIDefault.prototype.clearEvents = function () {
        //this.onMenuChanged = false;
    };
    return SCIDefault;
}());
export var State;
(function (State) {
    State[State["main_region_menu"] = 0] = "main_region_menu";
    State[State["main_region_waiting_for_user_interaction"] = 1] = "main_region_waiting_for_user_interaction";
    State[State["main_region_weather"] = 2] = "main_region_weather";
    State[State["main_region_music"] = 3] = "main_region_music";
    State[State["main_region_phone"] = 4] = "main_region_phone";
    State[State["NullState"] = 5] = "NullState";
})(State || (State = {}));
