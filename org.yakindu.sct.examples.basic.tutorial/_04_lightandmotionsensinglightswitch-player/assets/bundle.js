var com;
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            /**
             * Instances represent state machine trace events.
             * @param {com.yakindu.core.TraceEventType} type
             * @param {*} machine
             * @param {*} state
             * @param {*} feature
             * @param {*} value
             * @class
             */
            class TraceEvent {
                constructor(type, machine, state, feature, value) {
                    if (((typeof type === 'number') || type === null) && ((machine != null) || machine === null) && ((state != null) || state === null) && ((feature != null) || feature === null) && ((value != null) || value === null)) {
                        let __args = arguments;
                        if (this.type === undefined) {
                            this.type = null;
                        }
                        if (this.machine === undefined) {
                            this.machine = null;
                        }
                        if (this.state === undefined) {
                            this.state = null;
                        }
                        if (this.feature === undefined) {
                            this.feature = null;
                        }
                        if (this.value === undefined) {
                            this.value = null;
                        }
                        this.type = type;
                        this.machine = machine;
                        this.state = state;
                        this.feature = feature;
                        this.value = value;
                    }
                    else if (((typeof type === 'number') || type === null) && ((machine != null) || machine === null) && state === undefined && feature === undefined && value === undefined) {
                        let __args = arguments;
                        {
                            let __args = arguments;
                            let state = null;
                            let feature = null;
                            let value = null;
                            if (this.type === undefined) {
                                this.type = null;
                            }
                            if (this.machine === undefined) {
                                this.machine = null;
                            }
                            if (this.state === undefined) {
                                this.state = null;
                            }
                            if (this.feature === undefined) {
                                this.feature = null;
                            }
                            if (this.value === undefined) {
                                this.value = null;
                            }
                            this.type = type;
                            this.machine = machine;
                            this.state = state;
                            this.feature = feature;
                            this.value = value;
                        }
                        if (this.type === undefined) {
                            this.type = null;
                        }
                        if (this.machine === undefined) {
                            this.machine = null;
                        }
                        if (this.state === undefined) {
                            this.state = null;
                        }
                        if (this.feature === undefined) {
                            this.feature = null;
                        }
                        if (this.value === undefined) {
                            this.value = null;
                        }
                    }
                    else
                        throw new Error('invalid overload');
                }
                getType() {
                    return this.type;
                }
                getMachine() {
                    return this.machine;
                }
                getState() {
                    return this.state;
                }
                getFeature() {
                    return this.feature;
                }
                getValue() {
                    return this.value;
                }
            }
            core.TraceEvent = TraceEvent;
            TraceEvent["__class"] = "com.yakindu.core.TraceEvent";
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            /**
             * Trace event type enumeration.
             * @enum
             * @property {com.yakindu.core.TraceEventType} MACHINE_ENTER
             * @property {com.yakindu.core.TraceEventType} MACHINE_EXIT
             * @property {com.yakindu.core.TraceEventType} MACHINE_RTS_START
             * @property {com.yakindu.core.TraceEventType} MACHINE_RTS_STOP
             * @property {com.yakindu.core.TraceEventType} STATE_ENTERED
             * @property {com.yakindu.core.TraceEventType} STATE_EXITED
             * @property {com.yakindu.core.TraceEventType} STATE_TRANSITION
             * @property {com.yakindu.core.TraceEventType} EVENT_RAISED
             * @property {com.yakindu.core.TraceEventType} VARIABLE_SET
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_RAISED
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_SET
             * @property {com.yakindu.core.TraceEventType} TIME_EVENT_UNSET
             * @class
             */
            let TraceEventType;
            (function (TraceEventType) {
                TraceEventType[TraceEventType["MACHINE_ENTER"] = 0] = "MACHINE_ENTER";
                TraceEventType[TraceEventType["MACHINE_EXIT"] = 1] = "MACHINE_EXIT";
                TraceEventType[TraceEventType["MACHINE_RTS_START"] = 2] = "MACHINE_RTS_START";
                TraceEventType[TraceEventType["MACHINE_RTS_STOP"] = 3] = "MACHINE_RTS_STOP";
                TraceEventType[TraceEventType["STATE_ENTERED"] = 4] = "STATE_ENTERED";
                TraceEventType[TraceEventType["STATE_EXITED"] = 5] = "STATE_EXITED";
                TraceEventType[TraceEventType["STATE_TRANSITION"] = 6] = "STATE_TRANSITION";
                TraceEventType[TraceEventType["EVENT_RAISED"] = 7] = "EVENT_RAISED";
                TraceEventType[TraceEventType["VARIABLE_SET"] = 8] = "VARIABLE_SET";
                TraceEventType[TraceEventType["TIME_EVENT_RAISED"] = 9] = "TIME_EVENT_RAISED";
                TraceEventType[TraceEventType["TIME_EVENT_SET"] = 10] = "TIME_EVENT_SET";
                TraceEventType[TraceEventType["TIME_EVENT_UNSET"] = 11] = "TIME_EVENT_UNSET";
            })(TraceEventType = core.TraceEventType || (core.TraceEventType = {}));
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
(function (com) {
    var yakindu;
    (function (yakindu) {
        var core;
        (function (core) {
            var rx;
            (function (rx) {
                class Observable {
                    constructor() {
                        this.observers = ([]);
                    }
                    next(value) {
                        for (let index = 0; index < this.observers.length; index++) {
                            let observer = this.observers[index];
                            {
                                observer.next(value);
                            }
                        }
                    }
                    subscribe(observer) {
                        return observer != null ? /* add */ (this.observers.push(observer) > 0) : false;
                    }
                    unsubscribe(observer) {
                        return observer != null ? /* remove */ (a => { let index = a.indexOf(observer); if (index >= 0) {
                            a.splice(index, 1);
                            return true;
                        }
                        else {
                            return false;
                        } })(this.observers) : false;
                    }
                }
                rx.Observable = Observable;
                Observable["__class"] = "com.yakindu.core.rx.Observable";
            })(rx = core.rx || (core.rx = {}));
        })(core = yakindu.core || (yakindu.core = {}));
    })(yakindu = com.yakindu || (com.yakindu = {}));
})(com || (com = {}));
var sct;
(function (sct) {
    var yakindu;
    (function (yakindu) {
        var io;
        (function (io) {
            class Statemachine {
                constructor() {
                    if (this.__hmi === undefined) {
                        this.__hmi = null;
                    }
                    if (this.__motion === undefined) {
                        this.__motion = null;
                    }
                    if (this.__luminosity === undefined) {
                        this.__luminosity = null;
                    }
                    this.historyVector = [null, null, null, null];
                    this.stateVector = [null];
                    this.trace = (new com.yakindu.core.rx.Observable());
                    if (this.timerService === undefined) {
                        this.timerService = null;
                    }
                    this.timeEvents = [false, false, false];
                    this.inEventQueue = ([]);
                    if (this.isExecuting === undefined) {
                        this.isExecuting = false;
                    }
                    if (this.brightness === undefined) {
                        this.brightness = 0;
                    }
                    this.__hmi = new Statemachine.Hmi(this);
                    this.__motion = new Statemachine.Motion(this);
                    this.__luminosity = new Statemachine.Luminosity(this);
                    for (let i = 0; i < 1; i++) {
                        {
                            this.stateVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    for (let i = 0; i < 4; i++) {
                        {
                            this.historyVector[i] = Statemachine.State.$NULLSTATE$;
                        }
                        ;
                    }
                    this.clearInEvents();
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                    this.isExecuting = false;
                }
                getIsExecuting() {
                    return this.isExecuting;
                }
                setIsExecuting(value) {
                    this.isExecuting = value;
                }
                enter() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_ENTER, this)));
                    this.enterSequence_modes_default();
                    this.isExecuting = false;
                }
                exit() {
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_EXIT, this)));
                    this.exitSequence_modes();
                    this.isExecuting = false;
                }
                /**
                 * @see IStatemachine#isActive()
                 * @return {boolean}
                 */
                isActive() {
                    return this.stateVector[0] !== Statemachine.State.$NULLSTATE$;
                }
                /**
                 *
                 * Always returns 'false' since this state machine can never become final.
                 *
                 * @see IStatemachine#isFinal()
                 * @return {boolean}
                 */
                isFinal() {
                    return false;
                }
                clearInEvents() {
                    this.__hmi.switchEvent = false;
                    this.__hmi.toggleMode = false;
                    this.__hmi.changeBrightness = false;
                    this.__motion.detected = false;
                    this.__luminosity.bright = false;
                    this.__luminosity.dark = false;
                    this.timeEvents[0] = false;
                    this.timeEvents[1] = false;
                    this.timeEvents[2] = false;
                }
                microStep() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.modes_Automatic_modes_Motion_Sensing_r1_Still_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.modes_Automatic_modes_Motion_Sensing_r1_Motion_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.modes_Automatic_modes_Light_Sensing_r1_Bright_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.modes_Automatic_modes_Light_Sensing_r1_Dark_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.modes_Automatic_modes_Light_Sensing_r1_Getting_Dark_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.modes_Automatic_modes_Light_Sensing_r1_Getting_Bright_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_OFF:
                            this.modes_Manual_r1_Off_react(-1);
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_ON:
                            this.modes_Manual_r1_On_react(-1);
                            break;
                        default:
                            break;
                    }
                }
                runCycle() {
                    if (this.timerService == null) {
                        throw Object.defineProperty(new Error("Timer service must be set."), '__classes', { configurable: true, value: ['java.lang.Throwable', 'java.lang.IllegalStateException', 'java.lang.Object', 'java.lang.RuntimeException', 'java.lang.Exception'] });
                    }
                    if (this.getIsExecuting()) {
                        return;
                    }
                    this.isExecuting = true;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_RTS_START, this)));
                    this.nextEvent();
                    do {
                        {
                            this.microStep();
                            this.clearInEvents();
                            this.nextEvent();
                        }
                    } while ((((((((((this.__hmi.switchEvent || this.__hmi.toggleMode) || this.__hmi.changeBrightness) || this.__motion.detected) || this.__luminosity.bright) || this.__luminosity.dark) || this.timeEvents[0]) || this.timeEvents[1]) || this.timeEvents[2])));
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.MACHINE_RTS_STOP, this)));
                    this.isExecuting = false;
                }
                nextEvent() {
                    if (!(this.inEventQueue.length == 0)) {
                        (target => (typeof target === 'function') ? target() : target.run())(/* poll */ (a => a.length == 0 ? null : a.shift())(this.inEventQueue));
                        return;
                    }
                }
                /**
                 * Returns true if the given state is currently active otherwise false.
                 * @param {sct.yakindu.io.Statemachine.State} state
                 * @return {boolean}
                 */
                isStateActive(state) {
                    switch ((state)) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT]];
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION]];
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT]];
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            return this.stateVector[0] === Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL:
                            return /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] >= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_MANUAL]] && /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[this.stateVector[0]]] <= /* Enum.ordinal */ sct.yakindu.io.Statemachine.State[sct.yakindu.io.Statemachine.State[Statemachine.State.MODES_MANUAL_R1_ON]];
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_OFF:
                            return this.stateVector[0] === Statemachine.State.MODES_MANUAL_R1_OFF;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_ON:
                            return this.stateVector[0] === Statemachine.State.MODES_MANUAL_R1_ON;
                        default:
                            return false;
                    }
                }
                setTimerService(timerService) {
                    this.timerService = timerService;
                }
                getTimerService() {
                    return this.timerService;
                }
                raiseTimeEvent(eventID) {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_RAISED, this, null, null, eventID)));
                    /* add */ (this.inEventQueue.push(() => {
                        this.timeEvents[eventID] = true;
                    }) > 0);
                    this.runCycle();
                }
                hmi() {
                    return this.__hmi;
                }
                motion() {
                    return this.__motion;
                }
                luminosity() {
                    return this.__luminosity;
                }
                getTrace() {
                    return this.trace;
                }
                getBrightness() {
                    return this.brightness;
                }
                setBrightness(value) {
                    this.brightness = value;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_modes_Automatic_modes_Motion_Sensing_r1_Still() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_modes_Automatic_modes_Motion_Sensing_r1_Motion() {
                    this.timerService.setTimer(this, 0, (this.__motion.getTimeout() * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 0)));
                    this.setBrightness(10);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_modes_Automatic_modes_Light_Sensing_r1_Bright() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_modes_Automatic_modes_Light_Sensing_r1_Dark() {
                    this.setBrightness(10);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                entryAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark() {
                    this.timerService.setTimer(this, 1, (this.__luminosity.getDelay() * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 1)));
                }
                entryAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright() {
                    this.timerService.setTimer(this, 2, (this.__luminosity.getDelay() * 1000), false);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_SET, this, null, null, 2)));
                }
                entryAction_modes_Manual_r1_Off() {
                    this.setBrightness(0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                }
                exitAction_modes_Automatic_modes_Motion_Sensing_r1_Motion() {
                    this.timerService.unsetTimer(this, 0);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 0)));
                }
                exitAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark() {
                    this.timerService.unsetTimer(this, 1);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 1)));
                }
                exitAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright() {
                    this.timerService.unsetTimer(this, 2);
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.TIME_EVENT_UNSET, this, null, null, 2)));
                }
                enterSequence_modes_Automatic_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                    this.enterSequence_modes_Automatic_modes_default();
                }
                enterSequence_modes_Automatic_modes_Motion_Sensing_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                    this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_default();
                    this.historyVector[0] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Still_default() {
                    this.entryAction_modes_Automatic_modes_Motion_Sensing_r1_Still();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL;
                    this.historyVector[1] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion_default() {
                    this.entryAction_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION;
                    this.historyVector[1] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                    this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_default();
                    this.historyVector[0] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_r1_Bright_default() {
                    this.entryAction_modes_Automatic_modes_Light_Sensing_r1_Bright();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_r1_Dark_default() {
                    this.entryAction_modes_Automatic_modes_Light_Sensing_r1_Dark();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark_default() {
                    this.entryAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright_default() {
                    this.entryAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT;
                    this.historyVector[2] = this.stateVector[0];
                }
                enterSequence_modes_Manual_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_MANUAL, null, null)));
                    this.enterSequence_modes_Manual_r1_default();
                }
                enterSequence_modes_Manual_r1_Off_default() {
                    this.entryAction_modes_Manual_r1_Off();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_MANUAL_R1_OFF, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_MANUAL_R1_OFF;
                    this.historyVector[3] = this.stateVector[0];
                }
                enterSequence_modes_Manual_r1_On_default() {
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_ENTERED, this, Statemachine.State.MODES_MANUAL_R1_ON, null, null)));
                    this.stateVector[0] = Statemachine.State.MODES_MANUAL_R1_ON;
                    this.historyVector[3] = this.stateVector[0];
                }
                enterSequence_modes_default() {
                    this.react_modes__entry_Default();
                }
                enterSequence_modes_Automatic_modes_default() {
                    this.react_modes_Automatic_modes__entry_Default();
                }
                shallowEnterSequence_modes_Automatic_modes() {
                    switch ((this.historyVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_default();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_modes_Automatic_modes_Motion_Sensing_r1_default() {
                    this.react_modes_Automatic_modes_Motion_Sensing_r1__entry_Default();
                }
                shallowEnterSequence_modes_Automatic_modes_Motion_Sensing_r1() {
                    switch ((this.historyVector[1])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Still_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion_default();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_modes_Automatic_modes_Light_Sensing_r1_default() {
                    this.react_modes_Automatic_modes_Light_Sensing_r1__entry_Default();
                }
                shallowEnterSequence_modes_Automatic_modes_Light_Sensing_r1() {
                    switch ((this.historyVector[2])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Bright_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Dark_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright_default();
                            break;
                        default:
                            break;
                    }
                }
                enterSequence_modes_Manual_r1_default() {
                    this.react_modes_Manual_r1__entry_Default();
                }
                shallowEnterSequence_modes_Manual_r1() {
                    switch ((this.historyVector[3])) {
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_OFF:
                            this.enterSequence_modes_Manual_r1_Off_default();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_ON:
                            this.enterSequence_modes_Manual_r1_On_default();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_modes_Automatic() {
                    this.exitSequence_modes_Automatic_modes();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                }
                exitSequence_modes_Automatic_modes_Motion_Sensing() {
                    this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                }
                exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Still() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL, null, null)));
                }
                exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION, null, null)));
                }
                exitSequence_modes_Automatic_modes_Light_Sensing() {
                    this.exitSequence_modes_Automatic_modes_Light_Sensing_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                }
                exitSequence_modes_Automatic_modes_Light_Sensing_r1_Bright() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT, null, null)));
                }
                exitSequence_modes_Automatic_modes_Light_Sensing_r1_Dark() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK, null, null)));
                }
                exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK, null, null)));
                }
                exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.exitAction_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT, null, null)));
                }
                exitSequence_modes_Manual() {
                    this.exitSequence_modes_Manual_r1();
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_MANUAL, null, null)));
                }
                exitSequence_modes_Manual_r1_Off() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_MANUAL_R1_OFF, null, null)));
                }
                exitSequence_modes_Manual_r1_On() {
                    this.stateVector[0] = Statemachine.State.$NULLSTATE$;
                    this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_MANUAL_R1_ON, null, null)));
                }
                exitSequence_modes() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Still();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Bright();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Dark();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_OFF:
                            this.exitSequence_modes_Manual_r1_Off();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_MANUAL, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_ON:
                            this.exitSequence_modes_Manual_r1_On();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_MANUAL, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_modes_Automatic_modes() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Still();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Bright();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Dark();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_EXITED, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, null)));
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_modes_Automatic_modes_Motion_Sensing_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Still();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION:
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_modes_Automatic_modes_Light_Sensing_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Bright();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Dark();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT:
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                            break;
                        default:
                            break;
                    }
                }
                exitSequence_modes_Manual_r1() {
                    switch ((this.stateVector[0])) {
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_OFF:
                            this.exitSequence_modes_Manual_r1_Off();
                            break;
                        case sct.yakindu.io.Statemachine.State.MODES_MANUAL_R1_ON:
                            this.exitSequence_modes_Manual_r1_On();
                            break;
                        default:
                            break;
                    }
                }
                react_modes_Automatic_modes_Motion_Sensing_r1__entry_Default() {
                    if (this.historyVector[1] !== Statemachine.State.$NULLSTATE$) {
                        this.shallowEnterSequence_modes_Automatic_modes_Motion_Sensing_r1();
                    }
                    else {
                        this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Still_default();
                    }
                }
                react_modes_Automatic_modes_Light_Sensing_r1__entry_Default() {
                    if (this.historyVector[2] !== Statemachine.State.$NULLSTATE$) {
                        this.shallowEnterSequence_modes_Automatic_modes_Light_Sensing_r1();
                    }
                    else {
                        this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Bright_default();
                    }
                }
                react_modes_Automatic_modes__entry_Default() {
                    if (this.historyVector[0] !== Statemachine.State.$NULLSTATE$) {
                        this.shallowEnterSequence_modes_Automatic_modes();
                    }
                    else {
                        this.enterSequence_modes_Automatic_modes_Motion_Sensing_default();
                    }
                }
                react_modes_Manual_r1__entry_Default() {
                    if (this.historyVector[3] !== Statemachine.State.$NULLSTATE$) {
                        this.shallowEnterSequence_modes_Manual_r1();
                    }
                    else {
                        this.enterSequence_modes_Manual_r1_Off_default();
                    }
                }
                react_modes__entry_Default() {
                    this.enterSequence_modes_Manual_default();
                }
                react(transitioned_before) {
                    return transitioned_before;
                }
                modes_Automatic_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC, null, 0)));
                            this.exitSequence_modes_Automatic();
                            this.enterSequence_modes_Manual_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Motion_Sensing_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing();
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_default();
                            this.modes_Automatic_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Motion_Sensing_r1_Still_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__motion.detected) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Still();
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion_default();
                            this.modes_Automatic_modes_Motion_Sensing_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Motion_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Motion_Sensing_r1_Motion_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.timeEvents[0]) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                            this.timeEvents[0] = false;
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Still_default();
                            this.modes_Automatic_modes_Motion_Sensing_react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (this.__motion.detected) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION, null, 1)));
                                this.exitSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion();
                                this.enterSequence_modes_Automatic_modes_Motion_Sensing_r1_Motion_default();
                                this.modes_Automatic_modes_Motion_Sensing_react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Motion_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Light_Sensing_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Light_Sensing();
                            this.enterSequence_modes_Automatic_modes_Motion_Sensing_default();
                            this.modes_Automatic_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Light_Sensing_r1_Bright_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__luminosity.dark) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Bright();
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark_default();
                            this.modes_Automatic_modes_Light_Sensing_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Light_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Light_Sensing_r1_Dark_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__luminosity.bright) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Dark();
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright_default();
                            this.modes_Automatic_modes_Light_Sensing_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Light_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Light_Sensing_r1_Getting_Dark_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__luminosity.bright) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Bright_default();
                            this.modes_Automatic_modes_Light_Sensing_react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (this.timeEvents[1]) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK, null, 1)));
                                this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Dark();
                                this.timeEvents[1] = false;
                                this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Dark_default();
                                this.modes_Automatic_modes_Light_Sensing_react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Light_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Automatic_modes_Light_Sensing_r1_Getting_Bright_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__luminosity.dark) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT, null, 0)));
                            this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                            this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Dark_default();
                            this.modes_Automatic_modes_Light_Sensing_react(0);
                            transitioned_after = 0;
                        }
                        else {
                            if (this.timeEvents[2]) {
                                this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT, null, 1)));
                                this.exitSequence_modes_Automatic_modes_Light_Sensing_r1_Getting_Bright();
                                this.timeEvents[2] = false;
                                this.enterSequence_modes_Automatic_modes_Light_Sensing_r1_Bright_default();
                                this.modes_Automatic_modes_Light_Sensing_react(0);
                                transitioned_after = 0;
                            }
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Automatic_modes_Light_Sensing_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Manual_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.toggleMode) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_MANUAL, null, 0)));
                            this.exitSequence_modes_Manual();
                            this.enterSequence_modes_Automatic_default();
                            this.react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Manual_r1_Off_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_MANUAL_R1_OFF, null, 0)));
                            this.exitSequence_modes_Manual_r1_Off();
                            this.setBrightness(5);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                            this.enterSequence_modes_Manual_r1_On_default();
                            this.modes_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        transitioned_after = this.modes_Manual_react(transitioned_before);
                    }
                    return transitioned_after;
                }
                modes_Manual_r1_On_react(transitioned_before) {
                    let transitioned_after = transitioned_before;
                    if (transitioned_after < 0) {
                        if (this.__hmi.switchEvent) {
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.STATE_TRANSITION, this, Statemachine.State.MODES_MANUAL_R1_ON, null, 0)));
                            this.exitSequence_modes_Manual_r1_On();
                            this.enterSequence_modes_Manual_r1_Off_default();
                            this.modes_Manual_react(0);
                            transitioned_after = 0;
                        }
                    }
                    if (transitioned_after === transitioned_before) {
                        if (((this.__hmi.changeBrightness) && (this.getBrightness() > 1))) {
                            this.setBrightness(this.getBrightness() - 1);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                        }
                        if (((this.__hmi.changeBrightness) && (this.getBrightness() <= 1))) {
                            this.setBrightness(10);
                            this.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.VARIABLE_SET, this, null, Statemachine.Feature.BRIGHTNESS, this.brightness)));
                        }
                        transitioned_after = this.modes_Manual_react(transitioned_before);
                    }
                    return transitioned_after;
                }
            }
            io.Statemachine = Statemachine;
            Statemachine["__class"] = "sct.yakindu.io.Statemachine";
            Statemachine["__interfaces"] = ["com.yakindu.core.IStatemachine", "com.yakindu.core.ITimed"];
            (function (Statemachine) {
                class Hmi {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.switchEvent === undefined) {
                            this.switchEvent = false;
                        }
                        if (this.toggleMode === undefined) {
                            this.toggleMode = false;
                        }
                        if (this.changeBrightness === undefined) {
                            this.changeBrightness = false;
                        }
                        this.parent = parent;
                    }
                    raiseSwitch() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.switchEvent = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_SWITCH, null)));
                        this.parent.runCycle();
                    }
                    raiseToggleMode() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.toggleMode = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_TOGGLEMODE, null)));
                        this.parent.runCycle();
                    }
                    raiseChangeBrightness() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.changeBrightness = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.HMI_CHANGEBRIGHTNESS, null)));
                        this.parent.runCycle();
                    }
                }
                Statemachine.Hmi = Hmi;
                Hmi["__class"] = "sct.yakindu.io.Statemachine.Hmi";
                class Motion {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.detected === undefined) {
                            this.detected = false;
                        }
                        this.parent = parent;
                    }
                    raiseDetected() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.detected = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.MOTION_DETECTED, null)));
                        this.parent.runCycle();
                    }
                    getTimeout() {
                        return Motion.timeout;
                    }
                }
                Motion.timeout = 30;
                Statemachine.Motion = Motion;
                Motion["__class"] = "sct.yakindu.io.Statemachine.Motion";
                class Luminosity {
                    constructor(parent) {
                        if (this.parent === undefined) {
                            this.parent = null;
                        }
                        if (this.bright === undefined) {
                            this.bright = false;
                        }
                        if (this.dark === undefined) {
                            this.dark = false;
                        }
                        this.parent = parent;
                    }
                    raiseBright() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.bright = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.LUMINOSITY_BRIGHT, null)));
                        this.parent.runCycle();
                    }
                    raiseDark() {
                        /* add */ (this.parent.inEventQueue.push(() => {
                            this.dark = true;
                        }) > 0);
                        this.parent.trace.next((new com.yakindu.core.TraceEvent(com.yakindu.core.TraceEventType.EVENT_RAISED, this.parent, null, Statemachine.Feature.LUMINOSITY_DARK, null)));
                        this.parent.runCycle();
                    }
                    getDelay() {
                        return Luminosity.delay;
                    }
                }
                Luminosity.delay = 10;
                Statemachine.Luminosity = Luminosity;
                Luminosity["__class"] = "sct.yakindu.io.Statemachine.Luminosity";
                let State;
                (function (State) {
                    State[State["MODES_AUTOMATIC"] = 0] = "MODES_AUTOMATIC";
                    State[State["MODES_AUTOMATIC_MODES_MOTION_SENSING"] = 1] = "MODES_AUTOMATIC_MODES_MOTION_SENSING";
                    State[State["MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL"] = 2] = "MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_STILL";
                    State[State["MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION"] = 3] = "MODES_AUTOMATIC_MODES_MOTION_SENSING_R1_MOTION";
                    State[State["MODES_AUTOMATIC_MODES_LIGHT_SENSING"] = 4] = "MODES_AUTOMATIC_MODES_LIGHT_SENSING";
                    State[State["MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT"] = 5] = "MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_BRIGHT";
                    State[State["MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK"] = 6] = "MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_DARK";
                    State[State["MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK"] = 7] = "MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_DARK";
                    State[State["MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT"] = 8] = "MODES_AUTOMATIC_MODES_LIGHT_SENSING_R1_GETTING_BRIGHT";
                    State[State["MODES_MANUAL"] = 9] = "MODES_MANUAL";
                    State[State["MODES_MANUAL_R1_OFF"] = 10] = "MODES_MANUAL_R1_OFF";
                    State[State["MODES_MANUAL_R1_ON"] = 11] = "MODES_MANUAL_R1_ON";
                    State[State["$NULLSTATE$"] = 12] = "$NULLSTATE$";
                })(State = Statemachine.State || (Statemachine.State = {}));
                /**
                 * Enumeration of all features of the statechart
                 * @enum
                 * @property {sct.yakindu.io.Statemachine.Feature} NO_FEATURE
                 * @property {sct.yakindu.io.Statemachine.Feature} BRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_SWITCH
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_TOGGLEMODE
                 * @property {sct.yakindu.io.Statemachine.Feature} HMI_CHANGEBRIGHTNESS
                 * @property {sct.yakindu.io.Statemachine.Feature} MOTION_TIMEOUT
                 * @property {sct.yakindu.io.Statemachine.Feature} MOTION_DETECTED
                 * @property {sct.yakindu.io.Statemachine.Feature} LUMINOSITY_DELAY
                 * @property {sct.yakindu.io.Statemachine.Feature} LUMINOSITY_BRIGHT
                 * @property {sct.yakindu.io.Statemachine.Feature} LUMINOSITY_DARK
                 * @class
                 */
                let Feature;
                (function (Feature) {
                    Feature[Feature["NO_FEATURE"] = 0] = "NO_FEATURE";
                    Feature[Feature["BRIGHTNESS"] = 1] = "BRIGHTNESS";
                    Feature[Feature["HMI_SWITCH"] = 2] = "HMI_SWITCH";
                    Feature[Feature["HMI_TOGGLEMODE"] = 3] = "HMI_TOGGLEMODE";
                    Feature[Feature["HMI_CHANGEBRIGHTNESS"] = 4] = "HMI_CHANGEBRIGHTNESS";
                    Feature[Feature["MOTION_TIMEOUT"] = 5] = "MOTION_TIMEOUT";
                    Feature[Feature["MOTION_DETECTED"] = 6] = "MOTION_DETECTED";
                    Feature[Feature["LUMINOSITY_DELAY"] = 7] = "LUMINOSITY_DELAY";
                    Feature[Feature["LUMINOSITY_BRIGHT"] = 8] = "LUMINOSITY_BRIGHT";
                    Feature[Feature["LUMINOSITY_DARK"] = 9] = "LUMINOSITY_DARK";
                })(Feature = Statemachine.Feature || (Statemachine.Feature = {}));
            })(Statemachine = io.Statemachine || (io.Statemachine = {}));
        })(io = yakindu.io || (yakindu.io = {}));
    })(yakindu = sct.yakindu || (sct.yakindu = {}));
})(sct || (sct = {}));
